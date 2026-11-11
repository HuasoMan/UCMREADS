const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const crypto = require('crypto');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json());

// Sirve el frontend (carpeta public/) desde el mismo servidor.
// Así en Railway la página y la API comparten dirección y no hay que escribir URLs a mano.
app.use(express.static(path.join(__dirname, 'public')));

// Conexión a la base de datos: usa variables de entorno en la nube
// (Railway entrega MYSQLHOST, MYSQLUSER, etc.) y los valores de XAMPP en tu PC.
const pool = mysql.createPool({
    host: process.env.DB_HOST || process.env.MYSQLHOST || 'localhost',
    port: Number(process.env.DB_PORT || process.env.MYSQLPORT || 3306),
    user: process.env.DB_USER || process.env.MYSQLUSER || 'root',
    password: process.env.DB_PASSWORD || process.env.MYSQLPASSWORD || '',
    database: process.env.DB_NAME || process.env.MYSQLDATABASE || 'ucmreads_db',
    waitForConnections: true,
    connectionLimit: 10
});

// ---------------------------------------------------------------------------
// Sesiones: al iniciar sesión se entrega un token; las acciones protegidas
// lo exigen en la cabecera "Authorization: Bearer <token>".
// (Se guardan en memoria: si reinicias el servidor, hay que volver a iniciar sesión.)
// ---------------------------------------------------------------------------
const sesiones = new Map(); // token -> { id, nombre, rol, carrera }

function requiereSesion(req, res, next) {
    const auth = req.headers.authorization || '';
    const token = auth.startsWith('Bearer ') ? auth.slice(7) : null;
    const usuario = token && sesiones.get(token);
    if (!usuario) return res.status(401).json({ error: 'Debes iniciar sesión nuevamente.' });
    req.usuario = usuario;
    req.token = token;
    next();
}

function requiereRol(rol) {
    return (req, res, next) => {
        if (req.usuario.rol !== rol) {
            return res.status(403).json({ error: `Esta acción es solo para el perfil ${rol}.` });
        }
        next();
    };
}

// 1. ENDPOINT: Autenticación (ya no devuelve la contraseña)
app.post('/api/login', async (req, res) => {
    const { correo, contrasenia } = req.body;
    if (!correo || !contrasenia) return res.status(400).json({ error: 'Faltan credenciales.' });

    try {
        const [rows] = await pool.query(
            'SELECT id, nombre, correo, rol, carrera FROM usuarios WHERE correo = ? AND contrasenia = ?',
            [correo, contrasenia]
        );
        if (rows.length === 0) return res.status(401).json({ error: 'Credenciales inválidas.' });

        const usuario = rows[0];
        const token = crypto.randomUUID();
        sesiones.set(token, usuario);
        res.json({ success: true, token, usuario });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 1b. ENDPOINT: Cerrar sesión
app.post('/api/logout', requiereSesion, (req, res) => {
    sesiones.delete(req.token);
    res.json({ success: true });
});

// 2. ENDPOINT: Obtener Carreras disponibles
app.get('/api/carreras', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT DISTINCT carrera FROM asignaturas WHERE carrera IS NOT NULL AND carrera != "" ORDER BY carrera ASC');
        res.json(rows);
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 3. ENDPOINT: Obtener Asignaturas (filtradas opcionalmente por carrera)
app.get('/api/asignaturas', async (req, res) => {
    const { carrera } = req.query;
    let query = 'SELECT * FROM asignaturas WHERE 1=1';
    const params = [];
    if (carrera && carrera.trim() !== "") { query += ' AND carrera = ?'; params.push(carrera); }
    query += ' ORDER BY nombre ASC';
    try {
        const [rows] = await pool.query(query, params);
        res.json(rows);
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 4. ENDPOINT: Catálogo público con filtros avanzados flexibles
app.get('/api/lecturas', async (req, res) => {
    let { carrera, semestre, asignatura, profesor } = req.query;

    let query = `
        SELECT lr.id, l.titulo AS libro, l.autor, u.nombre AS profesor,
               a.nombre AS asignatura, a.codigo, a.semestre, a.carrera, lr.es_obligatorio, l.enlace_descarga,
               IFNULL(AVG(v.puntuacion), 0) AS promedio_votos, COUNT(v.id) AS total_votos
        FROM lecturas_ramo lr
        JOIN libros l ON lr.id_libro = l.id
        JOIN asignaturas a ON lr.codigo_asignatura = a.codigo
        JOIN usuarios u ON lr.id_profesor = u.id
        LEFT JOIN votaciones v ON lr.id = v.id_lectura_ramo
        WHERE 1=1
    `;
    const params = [];

    if (carrera && carrera.trim() !== "" && carrera !== "undefined") {
        query += " AND a.carrera = ?";
        params.push(carrera);
    }
    if (semestre && semestre.trim() !== "" && semestre !== "undefined") {
        query += " AND a.semestre = ?";
        params.push(semestre);
    }
    if (asignatura && asignatura.trim() !== "") {
        query += " AND (a.nombre LIKE ? OR a.codigo LIKE ?)";
        params.push(`%${asignatura}%`, `%${asignatura}%`);
    }
    if (profesor && profesor.trim() !== "") {
        query += " AND u.nombre LIKE ?";
        params.push(`%${profesor}%`);
    }

    query += " GROUP BY lr.id ORDER BY lr.id DESC";
    try {
        const [rows] = await pool.query(query, params);
        res.setHeader('Cache-Control', 'no-store');
        res.json(rows);
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 5. ENDPOINT: Indexar nueva lectura (solo profesores con sesión iniciada)
app.post('/api/lecturas', requiereSesion, requiereRol('profesor'), async (req, res) => {
    const { titulo, autor, codigo_asignatura, es_obligatorio, enlace_descarga } = req.body;
    if (!titulo || !autor || !codigo_asignatura) {
        return res.status(400).json({ error: 'Faltan título, autor o asignatura.' });
    }
    const id_profesor = req.usuario.id; // se toma de la sesión, no de lo que envía el navegador
    try {
        const [resLibro] = await pool.query('INSERT INTO libros (titulo, autor, enlace_descarga) VALUES (?, ?, ?)', [titulo, autor, enlace_descarga || null]);
        const id_libro = resLibro.insertId;
        await pool.query('INSERT INTO lecturas_ramo (codigo_asignatura, id_profesor, id_libro, es_obligatorio) VALUES (?, ?, ?, ?)', [codigo_asignatura, id_profesor, id_libro, es_obligatorio ? 1 : 0]);
        res.json({ success: true, message: 'Recomendación bibliográfica guardada con éxito.' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 6. ENDPOINT: Evaluar un texto (solo estudiantes, y solo de su carrera)
app.post('/api/votar', requiereSesion, requiereRol('estudiante'), async (req, res) => {
    const { id_lectura_ramo, puntuacion, comentario } = req.body;
    const usuario = req.usuario; // el votante es quien inició sesión
    const pts = parseInt(puntuacion, 10);
    if (!id_lectura_ramo || !(pts >= 1 && pts <= 5)) {
        return res.status(400).json({ error: 'La puntuación debe ser un número entre 1 y 5.' });
    }

    try {
        const [lecturaRows] = await pool.query(`
            SELECT a.carrera
            FROM lecturas_ramo lr
            JOIN asignaturas a ON lr.codigo_asignatura = a.codigo
            WHERE lr.id = ?
        `, [id_lectura_ramo]);

        if (lecturaRows.length === 0) return res.status(404).json({ error: 'Lectura no encontrada.' });
        const carreraLectura = lecturaRows[0].carrera;

        if (usuario.carrera && usuario.carrera.trim() !== "" && usuario.carrera !== carreraLectura) {
            return res.status(403).json({ error: `Solo puedes calificar lecturas correspondientes a tu carrera (${usuario.carrera}).` });
        }

        await pool.query(`
            INSERT INTO votaciones (id_lectura_ramo, id_usuario, puntuacion, comentario)
            VALUES (?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE puntuacion = ?, comentario = ?
        `, [id_lectura_ramo, usuario.id, pts, comentario || null, pts, comentario || null]);

        res.json({ success: true, message: '¡Voto registrado con éxito!' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 7. ENDPOINT: Eliminar lectura recomendada (solo profesores con sesión iniciada)
app.delete('/api/lecturas/:id', requiereSesion, requiereRol('profesor'), async (req, res) => {
    const { id } = req.params;
    try {
        const [resultado] = await pool.query('DELETE FROM lecturas_ramo WHERE id = ?', [id]);
        if (resultado.affectedRows === 0) return res.status(404).json({ error: 'La lectura no existe.' });
        res.json({ success: true, message: '¡Lectura removida del repositorio curricular con éxito!' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// Puerto: Railway asigna uno en la variable PORT; en tu PC se usa 3000.
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Servidor UCMREADS corriendo en http://localhost:${PORT}`));
