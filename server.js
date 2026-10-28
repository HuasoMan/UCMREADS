const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ucmreads_db',
    waitForConnections: true,
    connectionLimit: 10
});

// 1. ENDPOINT: Autenticación
app.post('/api/login', async (req, res) => {
    const { correo, contrasenia } = req.body;
    if (!correo || !contrasenia) return res.status(400).json({ error: 'Faltan credenciales.' });

    try {
        const [rows] = await pool.query('SELECT * FROM usuarios WHERE correo = ? AND contrasenia = ?', [correo, contrasenia]);
        if (rows.length === 0) return res.status(401).json({ error: 'Credenciales inválidas.' });
        res.json({ success: true, usuario: rows[0] });
    } catch (e) { res.status(500).json({ error: e.message }); }
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

// 5. ENDPOINT: Indexar nueva lectura (Docentes)
app.post('/api/lecturas', async (req, res) => {
    const { titulo, autor, codigo_asignatura, id_profesor, es_obligatorio, enlace_descarga } = req.body;
    try {
        const [resLibro] = await pool.query('INSERT INTO libros (titulo, autor, enlace_descarga) VALUES (?, ?, ?)', [titulo, autor, enlace_descarga || null]);
        const id_libro = resLibro.insertId;
        await pool.query('INSERT INTO lecturas_ramo (codigo_asignatura, id_profesor, id_libro, es_obligatorio) VALUES (?, ?, ?, ?)', [codigo_asignatura, id_profesor, id_libro, es_obligatorio]);
        res.json({ success: true, message: 'Recomendación bibliográfica guardada con éxito.' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 6. ENDPOINT: Evaluar un texto con validación estricta de carrera para estudiantes
app.post('/api/votar', async (req, res) => {
    const { id_lectura_ramo, id_usuario, puntuacion, comentario } = req.body;
    try {
        const [userRows] = await pool.query('SELECT carrera, rol FROM usuarios WHERE id = ?', [id_usuario]);
        if (userRows.length === 0) return res.status(404).json({ error: 'Usuario no encontrado.' });
        
        const usuario = userRows[0];
        if (usuario.rol !== 'estudiante') {
            return res.status(403).json({ error: 'Solo los estudiantes pueden emitir calificaciones.' });
        }

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
        `, [id_lectura_ramo, id_usuario, puntuacion, comentario, puntuacion, comentario]);
        
        res.json({ success: true, message: '¡Voto registrado con éxito!' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// 7. ENDPOINT: Eliminar lectura recomendada (Docentes)
app.delete('/api/lecturas/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await pool.query('DELETE FROM lecturas_ramo WHERE id = ?', [id]);
        res.json({ success: true, message: '¡Lectura removida del repositorio curricular con éxito!' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

app.listen(3000, () => console.log('Servidor UCMREADS corriendo en http://localhost:3000'));