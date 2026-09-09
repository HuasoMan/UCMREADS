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

// Login con validación de credenciales
app.post('/api/login', async (req, res) => {
    const { correo, contrasenia } = req.body;
    if (!correo || !contrasenia) return res.status(400).json({ error: 'Faltan credenciales.' });

    try {
        const [rows] = await pool.query('SELECT * FROM usuarios WHERE correo = ? AND contrasenia = ?', [correo, contrasenia]);
        if (rows.length === 0) return res.status(401).json({ error: 'Credenciales inválidas.' });
        res.json({ success: true, usuario: rows[0] });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// Cargar asignaturas para el select del docente
app.get('/api/asignaturas', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM asignaturas ORDER BY nombre ASC');
        res.json(rows);
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// Catálogo con filtros por Semestre, Asignatura y Docente
app.get('/api/lecturas', async (req, res) => {
    const { semestre, asignatura, profesor } = req.query;
    let query = `
        SELECT lr.id, l.titulo AS libro, l.autor, u.nombre AS profesor, 
               a.nombre AS asignatura, a.codigo, a.semestre, lr.es_obligatorio, l.enlace_descarga,
               IFNULL(AVG(v.puntuacion), 0) AS promedio_votos, COUNT(v.id) AS total_votos
        FROM lecturas_ramo lr
        JOIN libros l ON lr.id_libro = l.id
        JOIN asignaturas a ON lr.codigo_asignatura = a.codigo
        JOIN usuarios u ON lr.id_profesor = u.id
        LEFT JOIN votaciones v ON lr.id = v.id_lectura_ramo
        WHERE 1=1
    `;
    const params = [];
    if (semestre) { query += " AND a.semestre = ?"; params.push(semestre); }
    if (asignatura) { query += " AND (a.nombre LIKE ? OR a.codigo LIKE ?)"; params.push(`%${asignatura}%`, `%${asignatura}%`); }
    if (profesor) { query += " AND u.nombre LIKE ?"; params.push(`%${profesor}%`); }

    query += " GROUP BY lr.id ORDER BY lr.id DESC";
    try {
        const [rows] = await pool.query(query, params);
        res.json(rows);
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// Publicar lectura (Docente)
app.post('/api/lecturas', async (req, res) => {
    const { titulo, autor, codigo_asignatura, id_profesor, es_obligatorio, enlace_descarga } = req.body;
    try {
        const [resLibro] = await pool.query('INSERT INTO libros (titulo, autor, enlace_descarga) VALUES (?, ?, ?)', [titulo, autor, enlace_descarga || null]);
        const id_libro = resLibro.insertId;
        await pool.query('INSERT INTO lecturas_ramo (codigo_asignatura, id_profesor, id_libro, es_obligatorio) VALUES (?, ?, ?, ?)', [codigo_asignatura, id_profesor, id_libro, es_obligatorio]);
        res.json({ success: true, message: 'Recomendación bibliográfica guardada con éxito.' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// Votar texto (Estudiante)
app.post('/api/votar', async (req, res) => {
    const { id_lectura_ramo, id_usuario, puntuacion, comentario } = req.body;
    try {
        await pool.query('INSERT INTO votaciones (id_lectura_ramo, id_usuario, puntuacion, comentario) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE puntuacion=?, comentario=?', [id_lectura_ramo, id_usuario, puntuacion, comentario, puntuacion, comentario]);
        res.json({ success: true });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

// Eliminar lectura (Docente)
app.delete('/api/lecturas/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await pool.query('DELETE FROM lecturas_ramo WHERE id = ?', [id]);
        res.json({ success: true, message: '¡Lectura removida del repositorio curricular con éxito!' });
    } catch (e) { res.status(500).json({ error: e.message }); }
});

app.listen(3000, () => console.log('Servidor UCMREADS corriendo en http://localhost:3000'));