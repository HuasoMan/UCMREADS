-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2026 a las 05:01:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ucmreads_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `codigo` varchar(15) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `semestre` varchar(5) NOT NULL,
  `carrera` varchar(100) DEFAULT 'Ingeniería Civil Informática'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`codigo`, `nombre`, `semestre`, `carrera`) VALUES
('CFG-1', 'Certificación I', 'VIII', 'Ingeniería Civil Informática'),
('CFG-2', 'Certificación II', 'IX', 'Ingeniería Civil Informática'),
('CFG-3', 'Certificación III', 'X', 'Ingeniería Civil Informática'),
('ICE111', 'Álgebra', 'I', 'Ingeniería Civil Electrónica'),
('ICE112', 'Cálculo I', 'I', 'Ingeniería Civil Electrónica'),
('ICE113', 'Comunicación en Ingeniería', 'I', 'Ingeniería Civil Electrónica'),
('ICE114', 'Introducción a la Ingeniería', 'I', 'Ingeniería Civil Electrónica'),
('ICE115', 'Inglés I', 'I', 'Ingeniería Civil Electrónica'),
('ICE121', 'Álgebra Lineal', 'II', 'Ingeniería Civil Electrónica'),
('ICE122', 'Cálculo II', 'II', 'Ingeniería Civil Electrónica'),
('ICE123', 'Química', 'II', 'Ingeniería Civil Electrónica'),
('ICE124', 'Programación Aplicada a la Resolución de Problemas de Ingeniería Civil Electrónica', 'II', 'Ingeniería Civil Electrónica'),
('ICE125', 'Inglés II', 'II', 'Ingeniería Civil Electrónica'),
('ICE211', 'Cálculo III', 'III', 'Ingeniería Civil Electrónica'),
('ICE212', 'Física I', 'III', 'Ingeniería Civil Electrónica'),
('ICE213', 'Probabilidades y Estadística', 'III', 'Ingeniería Civil Electrónica'),
('ICE214', 'Programación', 'III', 'Ingeniería Civil Electrónica'),
('ICE215', 'Inglés III', 'III', 'Ingeniería Civil Electrónica'),
('ICE221', 'Ecuaciones Diferenciales', 'IV', 'Ingeniería Civil Electrónica'),
('ICE222', 'Física II', 'IV', 'Ingeniería Civil Electrónica'),
('ICE223', 'Comportamiento en la Ingeniería Civil Electrónica', 'IV', 'Ingeniería Civil Electrónica'),
('ICE224', 'Módulo Integrador de Ciencias Básicas', 'IV', 'Ingeniería Civil Electrónica'),
('ICE311', 'Termodinámica', 'V', 'Ingeniería Civil Electrónica'),
('ICE312', 'Electromagnetismo', 'V', 'Ingeniería Civil Electrónica'),
('ICE313', 'Teoría de Circuitos I', 'V', 'Ingeniería Civil Electrónica'),
('ICE314', 'Dispositivos Semiconductores', 'V', 'Ingeniería Civil Electrónica'),
('ICE315', 'Introducción a la Fe', 'V', 'Ingeniería Civil Electrónica'),
('ICE321', 'Sistemas Lineales Dinámicos', 'VI', 'Ingeniería Civil Electrónica'),
('ICE322', 'Teoría de Circuitos II', 'VI', 'Ingeniería Civil Electrónica'),
('ICE323', 'Circuitos Digitales', 'VI', 'Ingeniería Civil Electrónica'),
('ICE324', 'Optimización', 'VI', 'Ingeniería Civil Electrónica'),
('ICE325', 'Cálculo Numérico', 'VI', 'Ingeniería Civil Electrónica'),
('ICE326', 'Ética Cristiana', 'VI', 'Ingeniería Civil Electrónica'),
('ICE411', 'Sistemas de Control I', 'VII', 'Ingeniería Civil Electrónica'),
('ICE412', 'Laboratorio de Circuitos', 'VII', 'Ingeniería Civil Electrónica'),
('ICE413', 'Procesamiento Digital de Señales', 'VII', 'Ingeniería Civil Electrónica'),
('ICE414', 'Sistemas de Comunicaciones', 'VII', 'Ingeniería Civil Electrónica'),
('ICE415', 'Metodología de la Investigación', 'VII', 'Ingeniería Civil Electrónica'),
('ICE421', 'Sistemas de Control II', 'VIII', 'Ingeniería Civil Electrónica'),
('ICE422', 'Laboratorio de Circuitos Digitales', 'VIII', 'Ingeniería Civil Electrónica'),
('ICE423', 'Arquitectura de Computadores', 'VIII', 'Ingeniería Civil Electrónica'),
('ICE424', 'Networking I', 'VIII', 'Ingeniería Civil Electrónica'),
('ICE425', 'Módulo Integrador Licenciatura (Práctica 1: Inicial)', 'VIII', 'Ingeniería Civil Electrónica'),
('ICE426', 'Certificación I', 'VIII', 'Ingeniería Civil Electrónica'),
('ICE511', 'Laboratorio de Control de Procesos', 'IX', 'Ingeniería Civil Electrónica'),
('ICE512', 'Circuitos Microcomputarizados', 'IX', 'Ingeniería Civil Electrónica'),
('ICE513', 'Economía', 'IX', 'Ingeniería Civil Electrónica'),
('ICE514', 'Networking II', 'IX', 'Ingeniería Civil Electrónica'),
('ICE515', 'Sistemas Operativos', 'IX', 'Ingeniería Civil Electrónica'),
('ICE516', 'Certificación II', 'IX', 'Ingeniería Civil Electrónica'),
('ICE521', 'Electrónica de Potencia', 'X', 'Ingeniería Civil Electrónica'),
('ICE522', 'Electivo', 'X', 'Ingeniería Civil Electrónica'),
('ICE523', 'Electivo', 'X', 'Ingeniería Civil Electrónica'),
('ICE524', 'Formulación y Evaluación de Proyectos', 'X', 'Ingeniería Civil Electrónica'),
('ICE525', 'Seguridad en Telecomunicaciones', 'X', 'Ingeniería Civil Electrónica'),
('ICE526', 'Certificación III', 'X', 'Ingeniería Civil Electrónica'),
('ICE611', 'Electivo', 'XI', 'Ingeniería Civil Electrónica'),
('ICE612', 'Electivo', 'XI', 'Ingeniería Civil Electrónica'),
('ICE613', 'Módulo Integrador Formación Profesional (Práctica 2: Profesional)', 'XI', 'Ingeniería Civil Electrónica'),
('IFG-100', 'Inglés I', 'I', 'Ingeniería Civil Informática'),
('IFG-200', 'Inglés II', 'II', 'Ingeniería Civil Informática'),
('IFG-300', 'Inglés III', 'III', 'Ingeniería Civil Informática'),
('INF-111', 'Álgebra I', 'I', 'Ingeniería Civil Informática'),
('INF-112', 'Cálculo I', 'I', 'Ingeniería Civil Informática'),
('INF-113', 'Int a la Computación', 'I', 'Ingeniería Civil Informática'),
('INF-114', 'Int a la Ingeniería', 'I', 'Ingeniería Civil Informática'),
('INF-121', 'Álgebra II', 'II', 'Ingeniería Civil Informática'),
('INF-122', 'Cálculo II', 'II', 'Ingeniería Civil Informática'),
('INF-123', 'Programación', 'II', 'Ingeniería Civil Informática'),
('INF-124', 'Compr. Lect y Prod. Texto', 'II', 'Ingeniería Civil Informática'),
('INF-211', 'Física I', 'III', 'Ingeniería Civil Informática'),
('INF-212', 'Cálculo III', 'III', 'Ingeniería Civil Informática'),
('INF-213', 'Estructuras de Datos', 'III', 'Ingeniería Civil Informática'),
('INF-214', 'Expr. Oral en Ingeniería', 'III', 'Ingeniería Civil Informática'),
('INF-215', 'Circuitos Digitales', 'III', 'Ingeniería Civil Informática'),
('INF-221', 'Física II', 'IV', 'Ingeniería Civil Informática'),
('INF-222', 'Ecuaciones Diferenciales', 'IV', 'Ingeniería Civil Informática'),
('INF-223', 'Programación Avanzada', 'IV', 'Ingeniería Civil Informática'),
('INF-224', 'Lógica para Cs de la Comp.', 'IV', 'Ingeniería Civil Informática'),
('INF-225', 'Arquitectura de Computadores', 'IV', 'Ingeniería Civil Informática'),
('INF-226', 'Módulo Int. Cs. Básicas', 'IV', 'Ingeniería Civil Informática'),
('INF-311', 'Física III', 'V', 'Ingeniería Civil Informática'),
('INF-312', 'Inferencia Estadística', 'V', 'Ingeniería Civil Informática'),
('INF-313', 'Estructuras Discretas', 'V', 'Ingeniería Civil Informática'),
('INF-314', 'Modelamiento de Datos', 'V', 'Ingeniería Civil Informática'),
('INF-315', 'Taller de Circuitos Dig.', 'V', 'Ingeniería Civil Informática'),
('INF-321', 'Computación Numérica', 'VI', 'Ingeniería Civil Informática'),
('INF-322', 'Investigación de Operaciones', 'VI', 'Ingeniería Civil Informática'),
('INF-323', 'Teoría de la Computación', 'VI', 'Ingeniería Civil Informática'),
('INF-324', 'Base de Datos', 'VI', 'Ingeniería Civil Informática'),
('INF-325', 'Sistemas Operativos', 'VI', 'Ingeniería Civil Informática'),
('INF-411', 'Metodología de la Investigación', 'VII', 'Ingeniería Civil Informática'),
('INF-412', 'Economía', 'VII', 'Ingeniería Civil Informática'),
('INF-413', 'Diseño y Análisis de Algoritmos', 'VII', 'Ingeniería Civil Informática'),
('INF-414', 'Sistemas de Información', 'VII', 'Ingeniería Civil Informática'),
('INF-415', 'Comunicación de Datos y Redes', 'VII', 'Ingeniería Civil Informática'),
('INF-421', 'Mód. Int. de Licenciatura', 'VIII', 'Ingeniería Civil Informática'),
('INF-422', 'Contabilidad y Finanzas', 'VIII', 'Ingeniería Civil Informática'),
('INF-423', 'Inteligencia Artificial', 'VIII', 'Ingeniería Civil Informática'),
('INF-424', 'Ingeniería de SW I', 'VIII', 'Ingeniería Civil Informática'),
('INF-425', 'Redes Avanzadas', 'VIII', 'Ingeniería Civil Informática'),
('INF-511', 'Form. y Eval. de Proy. Informáticos', 'IX', 'Ingeniería Civil Informática'),
('INF-512', 'Gestión Informática I', 'IX', 'Ingeniería Civil Informática'),
('INF-513', 'Calidad y Prod. de Software', 'IX', 'Ingeniería Civil Informática'),
('INF-514', 'Ingeniería de SW II', 'IX', 'Ingeniería Civil Informática'),
('INF-515', 'Sistemas Distribuidos', 'IX', 'Ingeniería Civil Informática'),
('INF-521', 'Recursos Humanos y Legislación', 'X', 'Ingeniería Civil Informática'),
('INF-522', 'Gestión Informática II', 'X', 'Ingeniería Civil Informática'),
('INF-523', 'Electivo I', 'X', 'Ingeniería Civil Informática'),
('INF-524', 'Taller de Des. de Software', 'X', 'Ingeniería Civil Informática'),
('INF-525', 'Seguridad de la Inf.', 'X', 'Ingeniería Civil Informática'),
('INF-611', 'Electivo II', 'XI', 'Ingeniería Civil Informática'),
('INF-612', 'Electivo III', 'XI', 'Ingeniería Civil Informática'),
('INF-613', 'Módulo Integrador Formación Profesional', 'XI', 'Ingeniería Civil Informática'),
('MFG-114', 'Introducción a la Fe', 'V', 'Ingeniería Civil Informática'),
('MFG-216', 'Ética Cristiana', 'VI', 'Ingeniería Civil Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lecturas_ramo`
--

CREATE TABLE `lecturas_ramo` (
  `id` int(11) NOT NULL,
  `codigo_asignatura` varchar(15) DEFAULT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `es_obligatorio` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lecturas_ramo`
--

INSERT INTO `lecturas_ramo` (`id`, `codigo_asignatura`, `id_profesor`, `id_libro`, `es_obligatorio`) VALUES
(1, 'INF-113', 3, 1, 1),
(2, 'INF-123', 3, 2, 1),
(3, 'INF-213', 3, 3, 1),
(4, 'INF-223', 3, 4, 1),
(5, 'INF-225', 3, 5, 0),
(6, 'INF-325', 3, 6, 1),
(7, 'INF-424', 3, 7, 1),
(8, 'INF-514', 3, 8, 1),
(9, 'INF-524', 3, 9, 1),
(10, 'INF-525', 3, 10, 1),
(11, 'INF-226', 4, 11, 1),
(12, 'INF-312', 4, 12, 1),
(13, 'INF-314', 4, 13, 1),
(14, 'INF-324', 4, 14, 1),
(15, 'INF-414', 4, 15, 0),
(16, 'INF-423', 4, 16, 1),
(17, 'INF-512', 4, 17, 1),
(18, 'INF-513', 4, 18, 0),
(19, 'INF-515', 4, 19, 1),
(20, 'INF-522', 4, 20, 1),
(23, 'INF-111', 6, 23, 0),
(24, 'INF-111', 3, 24, 1),
(25, 'ICE111', 101, 6, 1),
(26, 'ICE112', 102, 7, 1),
(27, 'ICE113', 101, 8, 0),
(28, 'ICE114', 102, 9, 1),
(29, 'ICE115', 101, 10, 0),
(30, 'ICE121', 102, 11, 1),
(31, 'ICE122', 101, 12, 1),
(32, 'ICE123', 102, 13, 1),
(33, 'ICE124', 101, 14, 1),
(34, 'ICE125', 102, 15, 0),
(35, 'ICE211', 101, 16, 1),
(36, 'ICE212', 102, 17, 1),
(37, 'ICE213', 101, 18, 1),
(38, 'ICE214', 102, 19, 1),
(39, 'ICE215', 101, 20, 0),
(40, 'ICE221', 102, 21, 1),
(41, 'ICE222', 101, 22, 1),
(42, 'ICE223', 102, 23, 0),
(43, 'ICE224', 101, 24, 1),
(44, 'ICE311', 102, 25, 1),
(45, 'ICE312', 101, 26, 1),
(46, 'ICE313', 102, 27, 1),
(47, 'ICE314', 101, 28, 1),
(48, 'ICE315', 102, 29, 0),
(49, 'ICE321', 101, 30, 1),
(50, 'ICE322', 102, 31, 1),
(51, 'ICE323', 101, 32, 1),
(52, 'ICE324', 102, 33, 1),
(53, 'ICE325', 101, 34, 1),
(54, 'ICE326', 102, 35, 0),
(55, 'ICE411', 101, 36, 1),
(56, 'ICE412', 102, 37, 1),
(57, 'ICE413', 101, 38, 1),
(58, 'ICE414', 102, 39, 1),
(59, 'ICE415', 101, 40, 1),
(60, 'ICE421', 102, 41, 1),
(61, 'ICE422', 101, 42, 1),
(62, 'ICE423', 102, 43, 1),
(63, 'ICE424', 101, 44, 1),
(64, 'ICE425', 102, 45, 1),
(65, 'ICE426', 101, 46, 0),
(66, 'ICE511', 102, 47, 1),
(67, 'ICE512', 101, 48, 1),
(68, 'ICE513', 102, 49, 1),
(69, 'ICE514', 101, 50, 1),
(70, 'ICE515', 102, 51, 1),
(71, 'ICE516', 101, 52, 0),
(72, 'ICE521', 102, 53, 1),
(73, 'ICE522', 101, 54, 0),
(74, 'ICE523', 102, 55, 0),
(75, 'ICE524', 101, 56, 1),
(76, 'ICE525', 102, 57, 1),
(77, 'ICE526', 101, 58, 0),
(78, 'ICE611', 102, 59, 0),
(79, 'ICE612', 101, 60, 0),
(80, 'ICE613', 102, 61, 1),
(81, 'ICE111', 101, 62, 0),
(82, 'ICE112', 102, 63, 0),
(83, 'ICE211', 101, 64, 0),
(84, 'ICE212', 102, 65, 0),
(85, 'ICE221', 101, 66, 0),
(86, 'ICE222', 102, 67, 0),
(87, 'ICE311', 101, 68, 0),
(88, 'ICE312', 102, 69, 0),
(89, 'ICE313', 101, 70, 0),
(90, 'ICE314', 102, 71, 0),
(91, 'ICE321', 101, 72, 0),
(92, 'ICE322', 102, 73, 0),
(93, 'ICE323', 101, 74, 0),
(94, 'ICE324', 102, 75, 0),
(95, 'ICE411', 101, 76, 0),
(96, 'ICE412', 102, 77, 0),
(97, 'ICE413', 101, 78, 0),
(98, 'ICE414', 102, 79, 0),
(99, 'ICE421', 101, 80, 0),
(100, 'ICE422', 102, 81, 0),
(101, 'ICE511', 101, 82, 0),
(102, 'ICE512', 102, 83, 0),
(103, 'ICE521', 101, 84, 0),
(104, 'ICE522', 102, 85, 0),
(105, 'ICE113', 101, 86, 0),
(106, 'ICE123', 102, 87, 0),
(107, 'ICE213', 101, 88, 0),
(108, 'ICE223', 102, 89, 0),
(109, 'ICE313', 101, 90, 0),
(110, 'ICE323', 102, 91, 0),
(111, 'ICE413', 101, 92, 0),
(112, 'ICE423', 102, 93, 0),
(113, 'ICE513', 101, 94, 0),
(114, 'ICE523', 102, 95, 0),
(115, 'ICE114', 101, 96, 0),
(116, 'ICE124', 102, 97, 0),
(117, 'ICE214', 101, 98, 0),
(118, 'ICE224', 102, 99, 0),
(119, 'ICE314', 101, 100, 0),
(120, 'ICE324', 102, 101, 0),
(121, 'ICE414', 101, 102, 0),
(122, 'ICE424', 102, 103, 0),
(123, 'ICE514', 101, 104, 0),
(124, 'ICE611', 102, 105, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(150) NOT NULL,
  `enlace_descarga` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `enlace_descarga`) VALUES
(1, 'Introduction to the Theory of Computation', 'Michael Sipser', 'https://sibib.ucm.cl/ejemplos/sipser.pdf'),
(2, 'Cómo Programar en C++', 'Harvey Deitel & Paul Deitel', NULL),
(3, 'Data Structures and Algorithms in Java', 'Robert Lafore', 'https://sibib.ucm.cl/ejemplos/lafore.pdf'),
(4, 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma & Gang of Four', 'https://sibib.ucm.cl/ejemplos/designpatterns.pdf'),
(5, 'Organización y Arquitectura de Computadores', 'William Stallings', NULL),
(6, 'Sistemas Operativos Modernos', 'Andrew S. Tanenbaum', 'https://sibib.ucm.cl/ejemplos/tanenbaum_os.pdf'),
(7, 'Software Engineering', 'Ian Sommerville', NULL),
(8, 'Agile Software Development, Principles, Patterns, and Practices', 'Robert C. Martin', 'https://sibib.ucm.cl/ejemplos/unclebob.pdf'),
(9, 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', NULL),
(10, 'Cryptography and Network Security', 'William Stallings', 'https://sibib.ucm.cl/ejemplos/stallings_crypto.pdf'),
(11, 'Física para Ciencias e Ingeniería', 'Raymond Serway', NULL),
(12, 'Probabilidad y Estadística para Ingeniería y Ciencias', 'Ronald Walpole', 'https://sibib.ucm.cl/ejemplos/walpole.pdf'),
(13, 'El Modelo Enidad-Relación y Normalización', 'Thomas Connolly', NULL),
(14, 'Fundamentos de Sistemas de Bases de Datos', 'Ramez Elmasri & Shamkant Navathe', 'https://sibib.ucm.cl/ejemplos/elmasri.pdf'),
(15, 'Sistemas de Información Gerencial', 'Kenneth C. Laudon', NULL),
(16, 'Machine Learning', 'Tom Mitchell', 'https://sibib.ucm.cl/ejemplos/mitchell_ml.pdf'),
(17, 'ITIL Foundation: ITIL 4 Edition', 'AXELOS', NULL),
(18, 'CMMI: Guidelines for Process Integration and Product Improvement', 'Mary Beth Chrissis', 'https://sibib.ucm.cl/ejemplos/cmmi.pdf'),
(19, 'Distributed Systems: Principles and Paradigms', 'Andrew S. Tanenbaum & Maarten Van Steen', 'https://sibib.ucm.cl/ejemplos/tanenbaum_distributed.pdf'),
(20, 'COBIT 2019 Framework: Governance and Management Objectives', 'ISACA', NULL),
(21, 'Introducción al Amarillismo', 'Loco Pepe', NULL),
(22, 'Libro de Ejemplo', 'Autor Ejemplo', 'http:linkejemplo.cl'),
(23, 'Movió los hilos', 'Crazy Pepe', NULL),
(24, 'Libro de ejemplo', 'Autor de ejemplo', NULL),
(25, 'Fundamentos de Álgebra Superior', 'A. Rojo', 'https://sibib.ucm.cl'),
(26, 'Cálculo de Una Variable (Ed. 12)', 'George B. Thomas', 'https://sibib.ucm.cl'),
(27, 'Comunicación Efectiva para Ingenieros', 'M. Cisneros', NULL),
(28, 'Introducción a la Ingeniería Electrónica', 'J. Dorf', 'https://sibib.ucm.cl'),
(29, 'English for Engineering Students', 'T. F. Riley', NULL),
(30, 'Álgebra Lineal y sus Aplicaciones', 'David C. Lay', 'https://sibib.ucm.cl'),
(31, 'Cálculo Vectorial', 'Jerrold E. Marsden', 'https://sibib.ucm.cl'),
(32, 'Química la Ciencia Central', 'Theodore L. Brown', NULL),
(33, 'Programación en C y C++', 'Harvey M. Deitel', 'https://sibib.ucm.cl'),
(34, 'Technical English Grammar', 'R. Murphy', NULL),
(35, 'Cálculo Trascendentes Tempranas', 'James Stewart', 'https://sibib.ucm.cl'),
(36, 'Física Universitaria Vol. 1', 'Sears y Zemansky', 'https://sibib.ucm.cl'),
(37, 'Estadística y Probabilidad para Ingeniería', 'Douglas C. Montgomery', NULL),
(38, 'Estructuras de Datos y Algoritmos', 'Mark Allen Weiss', 'https://sibib.ucm.cl'),
(39, 'Advanced Engineering English', 'J. Smith', NULL),
(40, 'Ecuaciones Diferenciales con Aplicaciones', 'Dennis G. Zill', 'https://sibib.ucm.cl'),
(41, 'Física Universitaria Vol. 2 Electromagnetismo', 'Sears y Zemansky', 'https://sibib.ucm.cl'),
(42, 'Ética y Responsabilidad Profesional en Ingeniería', 'P. Valenzuela', NULL),
(43, 'Ciencias Básicas Aplicadas', 'R. Soto', 'https://sibib.ucm.cl'),
(44, 'Termodinámica Cengel 8Ed', 'Yunus A. Cengel', 'https://sibib.ucm.cl'),
(45, 'Electromagnetismo y Ondas', 'David K. Cheng', 'https://sibib.ucm.cl'),
(46, 'Análisis de Circuitos en Ingeniería', 'William H. Hayt', 'https://sibib.ucm.cl'),
(47, 'Dispositivos Electrónicos y Teoría de Circuitos', 'Robert L. Boylestad', 'https://sibib.ucm.cl'),
(48, 'Fe y Razón en la Universidad', 'Juan Pablo II', NULL),
(49, 'Sistemas Lineales y Señales', 'B. P. Lathi', 'https://sibib.ucm.cl'),
(50, 'Circuitos Eléctricos II', 'James W. Nilsson', 'https://sibib.ucm.cl'),
(51, 'Sistemas Digitales Principios y Aplicaciones', 'Ronald J. Tocci', 'https://sibib.ucm.cl'),
(52, 'Investigación de Operaciones y Optimización', 'Hamdy A. Taha', NULL),
(53, 'Métodos Numéricos para Ingenieros', 'Steven C. Chapra', 'https://sibib.ucm.cl'),
(54, 'Teología y Vida Cristiana', 'C. S. Lewis', NULL),
(55, 'Ingeniería de Control Moderna', 'Katsuhiko Ogata', 'https://sibib.ucm.cl'),
(56, 'Laboratorio de Mediciones Eléctricas', 'H. Cooper', NULL),
(57, 'Procesamiento Digital de Señales', 'John G. Proakis', 'https://sibib.ucm.cl'),
(58, 'Sistemas de Comunicaciones Electrónicas', 'Wayne Tomasi', 'https://sibib.ucm.cl'),
(59, 'Metodología de la Investigación Científica', 'Roberto Hernández Sampieri', NULL),
(60, 'Control Automático de Procesos', 'Carlos A. Smith', 'https://sibib.ucm.cl'),
(61, 'Diseño de Circuitos Lógicos Digitales', 'M. Morris Mano', 'https://sibib.ucm.cl'),
(62, 'Organización y Arquitectura de Computadores', 'William Stallings', 'https://sibib.ucm.cl'),
(63, 'Redes de Computadoras', 'Andrew S. Tanenbaum', 'https://sibib.ucm.cl'),
(64, 'Práctica y Formación Inicial en Ingeniería', 'UCM SIBIB', NULL),
(65, 'Certificación Profesional en Redes', 'Cisco Press', NULL),
(66, 'Instrumentación Industrial y Control', 'Antonio Creus Sole', 'https://sibib.ucm.cl'),
(67, 'Microcontroladores PIC y AVR', 'S. Franco', 'https://sibib.ucm.cl'),
(68, 'Economía para Ingenieros', 'G. Blank', NULL),
(69, 'Networking Avanzado y Enrutamiento', 'J. Kurose', 'https://sibib.ucm.cl'),
(70, 'Sistemas Operativos Modernos', 'Silberschatz Galvin', 'https://sibib.ucm.cl'),
(71, 'Certificaciones en TI y Telecom', 'CompTIA', NULL),
(72, 'Electrónica de Potencia: Circuitos y Aplicaciones', 'Muhammad H. Rashid', 'https://sibib.ucm.cl'),
(73, 'Sistemas Embebidos Avanzados', 'E. Lee', 'https://sibib.ucm.cl'),
(74, 'Robótica Industrial y Control', 'Alcérreca', 'https://sibib.ucm.cl'),
(75, 'Formulación y Evaluación de Proyectos de Inversión', 'Nassir Sapag Chain', NULL),
(76, 'Seguridad en Redes y Ciberseguridad', 'William Stallings', 'https://sibib.ucm.cl'),
(77, 'Gestión de Proyectos Tecnológicos', 'PMBOK Guide', NULL),
(78, 'Electivo Avanzado de Sistemas I', 'Autor Varios', 'https://sibib.ucm.cl'),
(79, 'Electivo Avanzado de Sistemas II', 'Autor Varios', 'https://sibib.ucm.cl'),
(80, 'Práctica Profesional de Ingeniería Electrónica', 'Comité UCM', NULL),
(81, 'Tópicos Avanzados de Microelectrónica', 'R. Jaeger', 'https://sibib.ucm.cl'),
(82, 'Diseño de Sistemas en Chip (SoC)', 'J. Bhasker', 'https://sibib.ucm.cl'),
(83, 'Comunicaciones Inalámbricas y Móviles', 'Theodore S. Rappaport', 'https://sibib.ucm.cl'),
(84, 'Antenas y Propagación de Ondas', 'John D. Kraus', 'https://sibib.ucm.cl'),
(85, 'Dispositivos Ópticos y Fotónica', 'B. Saleh', 'https://sibib.ucm.cl'),
(86, 'Ingeniería de la Energía Solar', 'S. Kalogirou', 'https://sibib.ucm.cl'),
(87, 'Convertidores Estáticos de Potencia', 'N. Mohan', 'https://sibib.ucm.cl'),
(88, 'Sistemas de Automatización Industrial', 'P. Sen', 'https://sibib.ucm.cl'),
(89, 'Sensores y Transductores en la Industria', 'R. Pallás', 'https://sibib.ucm.cl'),
(90, 'Inteligencia Artificial Aplicada a la Electrónica', 'Stuart Russell', 'https://sibib.ucm.cl'),
(91, 'Redes de Sensores Inalámbricos', 'F. Zhao', 'https://sibib.ucm.cl'),
(92, 'Procesadores de Señal Digital Avanzados', 'S. Mitra', 'https://sibib.ucm.cl'),
(93, 'Tecnología de Semiconductores de Potencia', 'B. J. Baliga', 'https://sibib.ucm.cl'),
(94, 'Compatibilidad Electromagnética en Circuitos', 'Henry W. Ott', 'https://sibib.ucm.cl'),
(95, 'Fiabilidad y Mantenimiento de Sistemas', 'C. Ebeling', NULL),
(96, 'Sistemas de Alta Tensión y Protecciones', 'E. Kuffel', 'https://sibib.ucm.cl'),
(97, 'Diseño de Circuitos Impresos (PCB)', 'C. Coombs', 'https://sibib.ucm.cl'),
(98, 'Control de Movimiento y Servosistemas', 'A. Hughes', 'https://sibib.ucm.cl'),
(99, 'Teoría de la Información y Codificación', 'Thomas M. Cover', 'https://sibib.ucm.cl'),
(100, 'Propagación Guiada y Fibras Ópticas', 'G. Keiser', 'https://sibib.ucm.cl'),
(101, 'Acústica y Electroacústica Aplicada', 'F. Everest', 'https://sibib.ucm.cl'),
(102, 'Bioingeniería y Electromedicina', 'John G. Webster', 'https://sibib.ucm.cl'),
(103, 'Sistemas Fotovoltaicos y Eólicos', 'J. Twidell', 'https://sibib.ucm.cl'),
(104, 'Automatización con PLC y SCADA', 'J. Boltons', 'https://sibib.ucm.cl'),
(105, 'Diseño de Filtros Activos y Pasivos', 'M. Van Valkenburg', 'https://sibib.ucm.cl'),
(106, 'Instrumentación Biomédica Básica', 'L. Cromwell', 'https://sibib.ucm.cl'),
(107, 'Tecnología RFID y Sistemas de Identificación', 'D. Dobkin', 'https://sibib.ucm.cl'),
(108, 'Redes de Área Local Industrial (Fieldbus)', 'B. Vogel', 'https://sibib.ucm.cl'),
(109, 'Simulación de Circuitos con SPICE', 'P. Tuinenga', 'https://sibib.ucm.cl'),
(110, 'VHDL y Verilog para Diseño Digital', 'J. Bhasker', 'https://sibib.ucm.cl'),
(111, 'Nanotecnología y Nanoelectrónica', 'W. Fahrner', 'https://sibib.ucm.cl'),
(112, 'Sistemas de Navegación por Satélite (GPS/GNSS)', 'B. Hofmann', 'https://sibib.ucm.cl'),
(113, 'Ingeniería de Audio y Sonido Digital', 'R. Rumsey', 'https://sibib.ucm.cl'),
(114, 'Metrología y Calidad en Instrumentación', 'J. Bentley', 'https://sibib.ucm.cl'),
(115, 'Diseño de Sistemas Tolerantes a Fallas', 'D. Pradhan', 'https://sibib.ucm.cl'),
(116, 'Seguridad Eléctrica en Laboratorios de Alta Potencia', 'NFPA 70E', NULL),
(117, 'Sistemas de Control Inteligente y Difuso', 'Kevin J. Passino', 'https://sibib.ucm.cl'),
(118, 'Redes Ópticas de Próxima Generación', 'P. Mukherjee', 'https://sibib.ucm.cl'),
(119, 'Eficiencia Energética en Procesos Industriales', 'J. Thome', 'https://sibib.ucm.cl'),
(120, 'Microelectrónica Analógica', 'Paul R. Gray', 'https://sibib.ucm.cl'),
(121, 'Dispositivos Optoelectrónicos', 'S. Kasap', 'https://sibib.ucm.cl'),
(122, 'Teoría de Redes de Computadores Avanzada', 'L. Peterson', 'https://sibib.ucm.cl'),
(123, 'Sistemas Híbridos de Generación Eléctrica', 'M. Godoy', 'https://sibib.ucm.cl'),
(124, 'Seminario de Título e Innovación Tecnológica', 'Comité ICE UCM', 'https://sibib.ucm.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `rol` varchar(20) DEFAULT 'estudiante',
  `contrasenia` varchar(100) NOT NULL DEFAULT 'ucm123',
  `carrera` varchar(100) DEFAULT 'Ingeniería Civil Informática'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `rol`, `contrasenia`, `carrera`) VALUES
(1, 'Cristian Canales', 'cristian.canales@alumnos.ucm.cl', 'estudiante', 'felipe123', 'Ingeniería Civil Informática'),
(2, 'Gonzalo Arancibia', 'gonzalo.arancibia@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(3, 'Jerman Espindola Sandoval', 'jespindola@ucm.cl', 'profesor', 'jerman123', 'Ingeniería Civil Informática'),
(4, 'Francisco Phillip Vásquez Iglesias', 'Fvasquez@ucm.cl', 'profesor', 'ucm123', 'Ingeniería Civil Informática'),
(5, 'Nicolas Montecino', 'nmontecino@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(6, 'Rodrigo Sepúlveda', 'locopepe@ucm.cl', 'profesor', 'ucm123', 'Ingeniería Civil Informática'),
(7, 'Valentina Rojas', 'vrojas@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(8, 'Lucas Contreras', 'lcontreras@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(9, 'Sofía Alarcón', 'salarcon@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(10, 'Benjamín Muñoz', 'bmunoz@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(11, 'María José Fuentes', 'mfuentes@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(12, 'Joaquín Castro', 'jcastro@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(13, 'Charlie Kirk', 'ckirk@ucm.cl', 'profesor', 'kirk123', 'Ingeniería Civil Informática'),
(14, 'Tomás Espinosa', 'tespinosa@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(15, 'Florencia Herrera', 'fherrera@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(16, 'Matías Valenzuela', 'mvalenzuela@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(17, 'Isidora Sepúlveda', 'isepulveda@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(18, 'Agustín Gutiérrez', 'agutierrez@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(19, 'Antonia Morales', 'amorales@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(20, 'Gaspar Cáceres', 'gcaceres@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(21, 'Catalina Núñez', 'cnunez@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(22, 'Alonso Carrasco', 'acarrasco@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(23, 'Martina Troncoso', 'mtroncoso@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(24, 'Vicente Donoso', 'vdonoso@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(25, 'Francisca Cerda', 'fcerda@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(26, 'Maximiliano Loyola', 'mloyola@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(27, 'Constanza Maturana', 'cmaturana@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(28, 'Sebastián Bravo', 'sbravo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(29, 'Javiera Opazo', 'jopazo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(30, 'Diego Henríquez', 'dhenriquez@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(31, 'Ignacia Vergara', 'ivergara@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(32, 'Felipe Saavedra', 'fsaavedra@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(33, 'Fernanda Poblete', 'fpoblete@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(34, 'Bastián Navarro', 'bnavarro@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(35, 'Pía Soto', 'psoto@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(36, 'Renato Pardo', 'rpardo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(37, 'Daniela Farías', 'dfarias@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(38, 'Gabriel Letelier', 'gletelier@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(39, 'Paulina Orellana', 'porellana@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(40, 'Ignacio Gajardo', 'igajardo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(41, 'Rocío Baeza', 'rbaeza@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(42, 'Julián Iturra', 'jiturra@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(43, 'Bárbara Palma', 'bpalma@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(44, 'Álvaro Díaz', 'adiaz@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(45, 'Aylin Garrido', 'agarrido@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(46, 'Cristóbal Vivanco', 'cvivanco@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(47, 'Amanda Jara', 'ajara@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(48, 'Esteban Valdés', 'evaldes@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(49, 'Montserrat Campos', 'mcampos@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(50, 'Jorge Retamal', 'jretamal@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(51, 'Natalia Corvalán', 'ncorvalan@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(52, 'Rodrigo Ahumada', 'rahumada@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(53, 'Gabriela Loyola', 'gloyola@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(54, 'Luis Arriagada', 'larriagada@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(55, 'Carolina Salgado', 'csalgado@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(56, 'Andrés Rebolledo', 'arebolledo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(57, 'Esperanza Pinochet', 'epinochet@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(58, 'Kevin Soto', 'ksoto@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(59, 'Belén Sanhueza', 'bsanhueza@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(60, 'Mauricio Vidal', 'mvidal@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(61, 'Constanza Garcés', 'cgarces@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(62, 'Claudio Godoy', 'cgodoy@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(63, 'Macarena Inostroza', 'minostroza@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(64, 'Juan Pablo Meléndez', 'jmelendez@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(65, 'Laura Riquelme', 'lriquelme@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(66, 'Ricardo Ormazábal', 'rormazabal@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(67, 'Tatiana Venegas', 'tvenegas@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(68, 'Manuel Arenas', 'marenas@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(69, 'Nicole Segura', 'nsegura@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(70, 'Alejandro Toledo', 'atoledo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(71, 'Karla Lobos', 'klobos@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(72, 'Gerónimo Benavides', 'gbenavides@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(73, 'Paula Lagos', 'plagos@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(74, 'Patricio Miranda', 'pmiranda@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(75, 'Viviana Lagos', 'vlagos@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(76, 'Camilo Ubilla', 'cubilla@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(77, 'Carla Maldonado', 'cmaldonado@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(78, 'Eduardo Chandía', 'echandia@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(79, 'Verónica Bascuñán', 'vbascunan@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(80, 'Hugo Meneses', 'hmeneses@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(81, 'Andrea Villalobos', 'avillalobos@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(82, 'Fabián Pacheco', 'fpacheco@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(83, 'Gisselle Chamorro', 'gchamorro@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(84, 'Javier Avendaño', 'javendano@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(85, 'Claudia Espinoza', 'cespinoza@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(86, 'Marcelo Rozas', 'mrozas@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(87, 'Katalina Becerra', 'kbecerra@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(88, 'Leonardo Ortega', 'lortega@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(89, 'Paola Leiva', 'pleiva@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(90, 'Christian Astudillo', 'castudillo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(91, 'Denisse Bustamante', 'dbustamante@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(92, 'Héctor Rozas', 'hrozas@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(93, 'Romina Zamorano', 'rzamorano@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(94, 'Sergio Marín', 'smarin@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(95, 'Alexandra Sandoval', 'asandoval@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(96, 'Óscar Céspedes', 'ocespedes@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(97, 'Bárbara Quiroz', 'bquiroz@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(98, 'César Guajardo', 'cguajardo@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(99, 'Evelyn Osses', 'eosses@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(100, 'Víctor Quintana', 'vquintana@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(101, 'Rodrigo Sepúlveda', 'turra@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(102, 'Charlie Kirk', 'dconcha@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(103, 'Gonzalo Becerra', 'gbecerra@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática'),
(104, 'Isabel Carter', 'icarter@alumnos.ucm.cl', 'estudiante', 'ucm123', 'Ingeniería Civil Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votaciones`
--

CREATE TABLE `votaciones` (
  `id` int(11) NOT NULL,
  `id_lectura_ramo` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL CHECK (`puntuacion` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `fecha_voto` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votaciones`
--

INSERT INTO `votaciones` (`id`, `id_lectura_ramo`, `id_usuario`, `puntuacion`, `comentario`, `fecha_voto`) VALUES
(1, 20, 72, 4, 'garbage', '2026-07-08 01:04:25'),
(2, 20, 1, 5, 'siks seben', '2026-07-08 02:37:23'),
(4, 23, 1, 1, '', '2026-09-09 00:23:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `lecturas_ramo`
--
ALTER TABLE `lecturas_ramo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_asignatura` (`codigo_asignatura`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `votaciones`
--
ALTER TABLE `votaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voto_unico` (`id_lectura_ramo`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lecturas_ramo`
--
ALTER TABLE `lecturas_ramo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `votaciones`
--
ALTER TABLE `votaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lecturas_ramo`
--
ALTER TABLE `lecturas_ramo`
  ADD CONSTRAINT `lecturas_ramo_ibfk_1` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignaturas` (`codigo`) ON DELETE CASCADE,
  ADD CONSTRAINT `lecturas_ramo_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lecturas_ramo_ibfk_3` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `votaciones`
--
ALTER TABLE `votaciones`
  ADD CONSTRAINT `votaciones_ibfk_1` FOREIGN KEY (`id_lectura_ramo`) REFERENCES `lecturas_ramo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votaciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
