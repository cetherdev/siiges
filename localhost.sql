-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-06-2019 a las 15:51:43
-- Versión del servidor: 5.6.43-cll-lve
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siiges_jalisco`
--
CREATE DATABASE IF NOT EXISTS `siiges_jalisco` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siiges_jalisco`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academias`
--

CREATE TABLE `academias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `situacion_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `matricula` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adeudo_materias` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL,
  `descripcion_estatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_certificado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_nacimiento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_curp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus_certificado` int(1) DEFAULT NULL,
  `estatus_nacimiento` int(1) DEFAULT NULL,
  `estatus_curp` int(1) DEFAULT NULL,
  `observaciones1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_grupos`
--

CREATE TABLE `alumnos_grupos` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `periodo_fecha_inicio` date NOT NULL,
  `periodo_fecha_fin` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_observaciones`
--

CREATE TABLE `alumno_observaciones` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `observacion` text COLLATE utf8_unicode_ci NOT NULL,
  `etapa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL,
  `infraestructura_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `academia` varchar(255) COLLATE utf8_unicode_ci ,
  `programa_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seriacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `temas` text COLLATE utf8_unicode_ci,
  `actividades` text COLLATE utf8_unicode_ci,
  `modelo_instruccional` text COLLATE utf8_unicode_ci,
  `horas_docente` int(11) NOT NULL,
  `horas_independiente` int(11) NOT NULL,
  `minimo_horas` int(11) DEFAULT NULL,
  `minimo_creditos` int(11) DEFAULT NULL,
  `creditos` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `grado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_autorizacion` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `infraestructura_id`, `docente_id`, `academia`, `programa_id`, `nombre`, `clave`, `seriacion`, `objetivo`, `temas`, `actividades`, `modelo_instruccional`, `horas_docente`, `horas_independiente`, `minimo_horas`, `minimo_creditos`, `creditos`, `tipo`, `grado`, `fecha_autorizacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 'ciencia de la vida', 2, 'materiax', '1234', NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 10, 1, 'Primer semestre', NULL, '2019-01-16 22:01:55', '2019-01-16 22:11:18', NULL),
(2, 2, 4, 'ACADEMIA DE DISCIPLINAS JURÍDICAS AUXILIARES Y METODOLOGÍA DE LA INVESTIGACIÓN', 3, 'NOCIONES DE DERECHO', 'LDE101', NULL, NULL, NULL, NULL, NULL, 45, 67, NULL, NULL, 7, 1, 'Primer cuatrimestre', NULL, '2019-03-06 20:36:08', '2019-03-06 20:55:51', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas_hemerobibliograficas`
--

CREATE TABLE `asignaturas_hemerobibliograficas` (
  `asignatura_id` int(11) NOT NULL,
  `hemerobibliografica_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociaciones`
--

CREATE TABLE `asociaciones` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_membresia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoras`
--

CREATE TABLE `bitacoras` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `entidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lugar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `bitacoras`
--

INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 02:50:24', NULL, NULL),
(2, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-15 02:50:25', NULL, NULL),
(3, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 02:57:26', NULL, NULL),
(4, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-15 02:57:26', NULL, NULL),
(5, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:12:27', NULL, NULL),
(6, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:12:35', NULL, NULL),
(7, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:19:31', NULL, NULL),
(8, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:32:36', NULL, NULL),
(9, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:33:42', NULL, NULL),
(10, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:35:25', NULL, NULL),
(11, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 04:48:05', NULL, NULL),
(12, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-15 04:48:06', NULL, NULL),
(13, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 22:42:55', NULL, NULL),
(14, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-15 22:42:55', NULL, NULL),
(15, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 22:44:32', NULL, NULL),
(16, -1, 'usuarios', 'guardar', 'control-usuario', '2018-12-15 22:44:32', NULL, NULL),
(17, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 22:44:33', NULL, NULL),
(18, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 22:44:36', NULL, NULL),
(19, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 22:46:53', NULL, NULL),
(20, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 22:57:41', NULL, NULL),
(21, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-15 22:57:42', NULL, NULL),
(22, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-15 22:57:47', NULL, NULL),
(23, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-15 22:57:47', NULL, NULL),
(24, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:03:23', NULL, NULL),
(25, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:03:26', NULL, NULL),
(26, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:03:37', NULL, NULL),
(27, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:05:15', NULL, NULL),
(28, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:05:16', NULL, NULL),
(29, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:08:59', NULL, NULL),
(30, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:09:09', NULL, NULL),
(31, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2018-12-15 23:09:18', NULL, NULL),
(32, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:09:20', NULL, NULL),
(33, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2018-12-15 23:09:22', NULL, NULL),
(34, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2018-12-15 23:09:23', NULL, NULL),
(35, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:09:25', NULL, NULL),
(36, -1, 'usuarios', 'guardar', 'control-usuario', '2018-12-15 23:09:45', NULL, NULL),
(37, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:10:09', NULL, NULL),
(38, -1, 'usuarios', 'guardar', 'control-usuario', '2018-12-15 23:10:09', NULL, NULL),
(39, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:10:10', NULL, NULL),
(40, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:10:11', NULL, NULL),
(41, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:11:36', NULL, NULL),
(42, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:15:43', NULL, NULL),
(43, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:15:44', NULL, NULL),
(44, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:16:37', NULL, NULL),
(45, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:16:38', NULL, NULL),
(46, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:17:41', NULL, NULL),
(47, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:17:43', NULL, NULL),
(48, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:17:45', NULL, NULL),
(49, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2018-12-15 23:17:48', NULL, NULL),
(50, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:17:49', NULL, NULL),
(51, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:19:40', NULL, NULL),
(52, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:19:42', NULL, NULL),
(53, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:19:46', NULL, NULL),
(54, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:21:40', NULL, NULL),
(55, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:21:42', NULL, NULL),
(56, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:22:37', NULL, NULL),
(57, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2018-12-15 23:22:57', NULL, NULL),
(58, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2018-12-15 23:22:59', NULL, NULL),
(59, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2018-12-15 23:23:01', NULL, NULL),
(60, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2018-12-15 23:23:02', NULL, NULL),
(61, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2018-12-15 23:23:04', NULL, NULL),
(62, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-15 23:23:05', NULL, NULL),
(63, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:23:06', NULL, NULL),
(64, -1, 'noticias', 'guardar', 'control-noticia', '2018-12-15 23:23:29', NULL, NULL),
(65, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:23:31', NULL, NULL),
(66, -1, 'noticias', 'consultarTodos', 'control-noticia', '2018-12-15 23:24:53', NULL, NULL),
(67, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2018-12-18 16:30:38', NULL, NULL),
(68, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-19 05:14:41', NULL, NULL),
(69, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-19 05:14:42', NULL, NULL),
(70, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-19 05:14:52', NULL, NULL),
(71, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-19 05:14:52', NULL, NULL),
(72, -1, 'personas', 'consultarId', 'control-persona', '2018-12-19 05:14:52', NULL, NULL),
(73, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-19 05:15:09', NULL, NULL),
(74, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-19 05:15:09', NULL, NULL),
(75, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-19 05:15:17', NULL, NULL),
(76, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-19 05:19:34', NULL, NULL),
(77, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-19 05:19:35', NULL, NULL),
(78, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-19 05:19:50', NULL, NULL),
(79, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-24 23:45:21', NULL, NULL),
(80, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:45:22', NULL, NULL),
(81, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:45:36', NULL, NULL),
(82, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-24 23:45:36', NULL, NULL),
(83, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:45:56', NULL, NULL),
(84, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2018-12-24 23:47:28', NULL, NULL),
(85, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:47:39', NULL, NULL),
(86, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-24 23:47:39', NULL, NULL),
(87, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:47:48', NULL, NULL),
(88, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:47:48', NULL, NULL),
(89, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:47:55', NULL, NULL),
(90, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-24 23:47:55', NULL, NULL),
(91, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:48:06', NULL, NULL),
(92, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:48:09', NULL, NULL),
(93, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:48:09', NULL, NULL),
(94, -1, 'personas', 'consultarId', 'control-persona', '2018-12-24 23:48:09', NULL, NULL),
(95, -1, 'personas', 'guardar', 'control-persona', '2018-12-24 23:49:40', NULL, NULL),
(96, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:49:40', NULL, NULL),
(97, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:49:44', NULL, NULL),
(98, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:49:44', NULL, NULL),
(99, -1, 'personas', 'consultarId', 'control-persona', '2018-12-24 23:49:44', NULL, NULL),
(100, -1, 'personas', 'guardar', 'control-persona', '2018-12-24 23:49:47', NULL, NULL),
(101, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:49:48', NULL, NULL),
(102, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-24 23:51:14', NULL, NULL),
(103, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-24 23:54:17', NULL, NULL),
(104, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-24 23:54:26', NULL, NULL),
(105, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-24 23:54:27', NULL, NULL),
(106, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:56:04', NULL, NULL),
(107, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-24 23:56:04', NULL, NULL),
(108, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-24 23:56:09', NULL, NULL),
(109, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:01:45', NULL, NULL),
(110, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:01:50', NULL, NULL),
(111, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:01:50', NULL, NULL),
(112, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:01:56', NULL, NULL),
(113, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:01:57', NULL, NULL),
(114, 2, 'usuarios', 'registro', 'control-usuario', '2018-12-25 00:02:01', NULL, NULL),
(115, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:02:02', NULL, NULL),
(116, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:02:02', NULL, NULL),
(117, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:02:04', NULL, NULL),
(118, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:02:04', NULL, NULL),
(119, 2, 'usuarios', 'registro', 'control-usuario', '2018-12-25 00:02:09', NULL, NULL),
(120, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:02:09', NULL, NULL),
(121, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:02:09', NULL, NULL),
(122, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:02:18', NULL, NULL),
(123, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:02:18', NULL, NULL),
(124, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:03:00', NULL, NULL),
(125, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:03:10', NULL, NULL),
(126, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2018-12-25 00:03:26', NULL, NULL),
(127, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:05:45', NULL, NULL),
(128, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:05:56', NULL, NULL),
(129, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:05:56', NULL, NULL),
(130, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:06:03', NULL, NULL),
(131, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:06:03', NULL, NULL),
(132, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:06:05', NULL, NULL),
(133, 2, 'usuarios', 'registro', 'control-usuario', '2018-12-25 00:13:38', NULL, NULL),
(134, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:13:38', NULL, NULL),
(135, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:13:38', NULL, NULL),
(136, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:13:44', NULL, NULL),
(137, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:13:45', NULL, NULL),
(138, 2, 'usuarios', 'registro', 'control-usuario', '2018-12-25 00:13:48', NULL, NULL),
(139, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:13:48', NULL, NULL),
(140, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:13:48', NULL, NULL),
(141, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:16:21', NULL, NULL),
(142, 3, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:16:22', NULL, NULL),
(143, 3, 'usuarios', 'guardar', 'control-usuario', '2018-12-25 00:16:22', NULL, NULL),
(144, 3, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:16:22', NULL, NULL),
(145, 3, 'instituciones', 'consultarTodos', 'control-institucion', '2018-12-25 00:16:31', NULL, NULL),
(146, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:17:30', NULL, NULL),
(147, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 00:18:26', NULL, NULL),
(148, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:18:26', NULL, NULL),
(149, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:18:29', NULL, NULL),
(150, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:18:29', NULL, NULL),
(151, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:18:32', NULL, NULL),
(152, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 00:18:32', NULL, NULL),
(153, 2, 'usuarios', 'registro', 'control-usuario', '2018-12-25 00:18:52', NULL, NULL),
(154, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 00:18:53', NULL, NULL),
(155, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 00:18:53', NULL, NULL),
(156, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2018-12-25 02:34:50', NULL, NULL),
(157, 2, 'usuarios', 'consultarId', 'control-usuario', '2018-12-25 02:34:51', NULL, NULL),
(158, -1, 'roles', 'consultarTodos', 'control-rol', '2018-12-25 02:34:58', NULL, NULL),
(159, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2018-12-25 02:34:58', NULL, NULL),
(160, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-05 02:23:41', NULL, NULL),
(161, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-05 02:23:44', NULL, NULL),
(162, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-01-05 02:23:53', NULL, NULL),
(163, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-01-05 02:23:55', NULL, NULL),
(164, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2019-01-05 02:23:57', NULL, NULL),
(165, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-01-05 02:23:59', NULL, NULL),
(166, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-08 03:38:38', NULL, NULL),
(167, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 03:38:38', NULL, NULL),
(168, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-08 03:38:50', NULL, NULL),
(169, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-08 03:38:51', NULL, NULL),
(170, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-08 03:49:50', NULL, NULL),
(171, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-08 03:51:26', NULL, NULL),
(172, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-08 03:51:26', NULL, NULL),
(173, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-08 03:51:26', NULL, NULL),
(174, 4, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-08 03:53:18', NULL, NULL),
(175, 4, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 03:53:19', NULL, NULL),
(176, 4, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 03:53:19', NULL, NULL),
(177, 4, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 03:53:35', NULL, NULL),
(178, 4, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 03:53:35', NULL, NULL),
(179, 4, 'usuarios', 'guardar', 'control-usuario', '2019-01-08 03:53:38', NULL, NULL),
(180, 4, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 03:53:38', NULL, NULL),
(181, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-08 03:53:44', NULL, NULL),
(182, 4, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-08 03:53:44', NULL, NULL),
(183, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-08 03:53:48', NULL, NULL),
(184, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-08 04:55:27', NULL, NULL),
(185, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 04:55:28', NULL, NULL),
(186, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-08 04:55:58', NULL, NULL),
(187, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-08 04:55:58', NULL, NULL),
(188, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-01-08 04:56:09', NULL, NULL),
(189, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-08 04:56:09', NULL, NULL),
(190, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-08 13:06:35', NULL, NULL),
(191, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-08 13:07:01', NULL, NULL),
(192, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-01-08 13:07:22', NULL, NULL),
(193, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-01-08 13:07:25', NULL, NULL),
(194, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2019-01-08 13:07:27', NULL, NULL),
(195, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-01-08 13:07:29', NULL, NULL),
(196, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-08 13:07:31', NULL, NULL),
(197, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-08 23:57:25', NULL, NULL),
(198, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-08 23:57:38', NULL, NULL),
(199, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-08 23:57:38', NULL, NULL),
(200, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 00:04:02', NULL, NULL),
(201, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 00:04:03', NULL, NULL),
(202, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 01:54:45', NULL, NULL),
(203, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 01:54:46', NULL, NULL),
(204, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 01:54:52', NULL, NULL),
(205, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-09 01:54:52', NULL, NULL),
(206, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 01:55:03', NULL, NULL),
(207, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 01:55:03', NULL, NULL),
(208, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 01:55:27', NULL, NULL),
(209, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 01:55:28', NULL, NULL),
(210, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 01:55:31', NULL, NULL),
(211, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-09 01:55:31', NULL, NULL),
(212, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 01:57:00', NULL, NULL),
(213, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-09 02:09:37', NULL, NULL),
(214, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 02:09:38', NULL, NULL),
(215, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-09 02:09:38', NULL, NULL),
(216, 5, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 02:10:06', NULL, NULL),
(217, 5, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:10:06', NULL, NULL),
(218, 5, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:10:07', NULL, NULL),
(219, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 02:15:24', NULL, NULL),
(220, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:15:25', NULL, NULL),
(221, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 02:15:29', NULL, NULL),
(222, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-09 02:15:29', NULL, NULL),
(223, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-01-09 02:15:37', NULL, NULL),
(224, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-09 02:15:37', NULL, NULL),
(225, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 02:15:39', NULL, NULL),
(226, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-09 02:16:31', NULL, NULL),
(227, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 02:16:32', NULL, NULL),
(228, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-09 02:16:32', NULL, NULL),
(229, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 02:16:45', NULL, NULL),
(230, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:16:45', NULL, NULL),
(231, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:16:45', NULL, NULL),
(232, 6, 'usuarios', 'guardar', 'control-usuario', '2019-01-09 02:16:51', NULL, NULL),
(233, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:16:52', NULL, NULL),
(234, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:16:56', NULL, NULL),
(235, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:17:04', NULL, NULL),
(236, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:17:06', NULL, NULL),
(237, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:17:23', NULL, NULL),
(238, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:17:25', NULL, NULL),
(239, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-09 02:17:26', NULL, NULL),
(240, -1, 'personas', 'consultarId', 'control-persona', '2019-01-09 02:17:26', NULL, NULL),
(241, -1, 'personas', 'guardar', 'control-persona', '2019-01-09 02:18:16', NULL, NULL),
(242, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 02:18:17', NULL, NULL),
(243, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-09 02:18:23', NULL, NULL),
(244, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-09 02:18:24', NULL, NULL),
(245, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-09 02:18:24', NULL, NULL),
(246, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-09 02:18:24', NULL, NULL),
(247, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:18:33', NULL, NULL),
(248, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:18:36', NULL, NULL),
(249, 6, 'instituciones', 'guardar', 'control-institucion', '2019-01-09 02:19:49', NULL, NULL),
(250, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:19:49', NULL, NULL),
(251, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:20:06', NULL, NULL),
(252, 6, 'instituciones', 'guardar', 'control-institucion', '2019-01-09 02:20:09', NULL, NULL),
(253, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-09 02:20:10', NULL, NULL),
(254, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-09 02:20:19', NULL, NULL),
(255, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-09 02:20:19', NULL, NULL),
(256, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-09 02:20:19', NULL, NULL),
(257, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-09 02:20:19', NULL, NULL),
(258, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-09 02:20:27', NULL, NULL),
(259, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-09 02:20:27', NULL, NULL),
(260, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-09 02:20:27', NULL, NULL),
(261, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-09 02:20:27', NULL, NULL),
(262, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-09 02:20:27', NULL, NULL),
(263, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-09 02:20:27', NULL, NULL),
(264, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 23:13:59', NULL, NULL),
(265, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 23:14:21', NULL, NULL),
(266, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-09 23:14:44', NULL, NULL),
(267, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-01-09 23:14:45', NULL, NULL),
(268, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 00:17:44', NULL, NULL),
(269, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 00:17:45', NULL, NULL),
(270, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-01-12 00:18:00', NULL, NULL),
(271, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 00:18:10', NULL, NULL),
(272, -1, 'modulos', 'consultarTodos', 'control-modulo', '2019-01-12 00:18:10', NULL, NULL),
(273, 2, 'modulos_roles', 'consultarTodosTabla', 'control-modulo-rol', '2019-01-12 00:18:10', NULL, NULL),
(274, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 00:18:43', NULL, NULL),
(275, -1, 'modulos', 'consultarTodos', 'control-modulo', '2019-01-12 00:18:43', NULL, NULL),
(276, 2, 'modulos_roles', 'consultarTodosTabla', 'control-modulo-rol', '2019-01-12 00:18:43', NULL, NULL),
(277, 2, 'modulos_roles', 'guardar', 'control-modulo-rol', '2019-01-12 00:19:00', NULL, NULL),
(278, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 00:19:00', NULL, NULL),
(279, -1, 'modulos', 'consultarTodos', 'control-modulo', '2019-01-12 00:19:00', NULL, NULL),
(280, 2, 'modulos_roles', 'consultarTodosTabla', 'control-modulo-rol', '2019-01-12 00:19:00', NULL, NULL),
(281, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 00:20:19', NULL, NULL),
(282, -1, 'modulos', 'consultarTodos', 'control-modulo', '2019-01-12 00:20:19', NULL, NULL),
(283, 2, 'modulos_roles', 'consultarTodosTabla', 'control-modulo-rol', '2019-01-12 00:20:19', NULL, NULL),
(284, 2, 'planteles', 'plantelesActivos', 'control-plantel', '2019-01-12 00:20:25', NULL, NULL),
(285, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 02:50:45', NULL, NULL),
(286, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 02:51:00', NULL, NULL),
(287, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 02:51:09', NULL, NULL),
(288, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 02:51:22', NULL, NULL),
(289, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 02:51:34', NULL, NULL),
(290, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 02:52:03', NULL, NULL),
(291, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:00:22', NULL, NULL),
(292, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:00:22', NULL, NULL),
(293, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:00:26', NULL, NULL),
(294, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-12 03:00:26', NULL, NULL),
(295, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:00:36', NULL, NULL),
(296, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:00:36', NULL, NULL),
(297, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:00:41', NULL, NULL),
(298, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-12 03:00:41', NULL, NULL),
(299, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:00:47', NULL, NULL),
(300, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:00:47', NULL, NULL),
(301, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-12 03:00:53', NULL, NULL),
(302, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:00:53', NULL, NULL),
(303, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-12 03:00:53', NULL, NULL),
(304, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:01:02', NULL, NULL),
(305, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:01:09', NULL, NULL),
(306, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:01:18', NULL, NULL),
(307, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:01:19', NULL, NULL),
(308, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:01:23', NULL, NULL),
(309, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:01:23', NULL, NULL),
(310, -1, 'personas', 'consultarId', 'control-persona', '2019-01-12 03:01:24', NULL, NULL),
(311, -1, 'personas', 'guardar', 'control-persona', '2019-01-12 03:01:27', NULL, NULL),
(312, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:01:28', NULL, NULL),
(313, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:01:41', NULL, NULL),
(314, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:01:47', NULL, NULL),
(315, 6, 'instituciones', 'guardar', 'control-institucion', '2019-01-12 03:01:49', NULL, NULL),
(316, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:01:49', NULL, NULL),
(317, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:01:53', NULL, NULL),
(318, 6, 'instituciones', 'guardar', 'control-institucion', '2019-01-12 03:02:39', NULL, NULL),
(319, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:02:40', NULL, NULL),
(320, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:03:52', NULL, NULL),
(321, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:23:39', NULL, NULL),
(322, 6, 'instituciones', 'guardar', 'control-institucion', '2019-01-12 03:23:42', NULL, NULL),
(323, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:23:42', NULL, NULL),
(324, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:28:25', NULL, NULL),
(325, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:28:43', NULL, NULL),
(326, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:28:44', NULL, NULL),
(327, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:28:49', NULL, NULL),
(328, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-12 03:28:49', NULL, NULL),
(329, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:28:57', NULL, NULL),
(330, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:28:57', NULL, NULL),
(331, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:29:03', NULL, NULL),
(332, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-12 03:29:03', NULL, NULL),
(333, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-12 03:29:08', NULL, NULL),
(334, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:29:08', NULL, NULL),
(335, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:29:46', NULL, NULL),
(336, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:29:47', NULL, NULL),
(337, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:30:10', NULL, NULL),
(338, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:30:18', NULL, NULL),
(339, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:30:27', NULL, NULL),
(340, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:30:42', NULL, NULL),
(341, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:30:51', NULL, NULL),
(342, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:31:02', NULL, NULL),
(343, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:31:10', NULL, NULL),
(344, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:31:19', NULL, NULL),
(345, 3, 'instituciones', 'consultarTodos', 'control-institucion', '2019-01-12 03:31:29', NULL, NULL),
(346, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:31:49', NULL, NULL),
(347, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:32:02', NULL, NULL),
(348, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-01-12 03:32:11', NULL, NULL),
(349, 3, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-01-12 03:34:14', NULL, NULL),
(350, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:34:15', NULL, NULL),
(351, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 03:34:56', NULL, NULL),
(352, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 03:34:57', NULL, NULL),
(353, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-12 03:35:05', NULL, NULL),
(354, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-12 03:35:05', NULL, NULL),
(355, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 03:35:05', NULL, NULL),
(356, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 03:35:05', NULL, NULL),
(357, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-12 03:35:19', NULL, NULL),
(358, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-12 03:35:19', NULL, NULL),
(359, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 03:35:19', NULL, NULL),
(360, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 03:35:19', NULL, NULL),
(361, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:35:22', NULL, NULL),
(362, 6, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-01-12 03:35:23', NULL, NULL),
(363, 6, 'planteles', 'guardarInformacion', 'control-plantel', '2019-01-12 03:47:16', NULL, NULL),
(364, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:47:17', NULL, NULL),
(365, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:47:27', NULL, NULL),
(366, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-12 03:47:37', NULL, NULL),
(367, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-12 03:47:45', NULL, NULL),
(368, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-12 03:47:45', NULL, NULL),
(369, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 03:47:45', NULL, NULL),
(370, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 03:47:45', NULL, NULL),
(371, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-12 03:48:07', NULL, NULL),
(372, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 03:48:07', NULL, NULL),
(373, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-12 03:48:07', NULL, NULL),
(374, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-12 03:48:07', NULL, NULL),
(375, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-12 03:48:07', NULL, NULL),
(376, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 03:48:07', NULL, NULL),
(377, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-01-12 03:48:08', NULL, NULL),
(378, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 05:22:32', NULL, NULL),
(379, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 05:22:33', NULL, NULL),
(380, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-12 05:22:57', NULL, NULL),
(381, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-12 05:22:57', NULL, NULL),
(382, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 05:22:57', NULL, NULL),
(383, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 05:22:57', NULL, NULL),
(384, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 05:23:10', NULL, NULL),
(385, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-12 05:23:10', NULL, NULL),
(386, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-12 05:23:10', NULL, NULL),
(387, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-12 05:23:10', NULL, NULL),
(388, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 05:23:10', NULL, NULL),
(389, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-12 05:23:10', NULL, NULL),
(390, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-01-12 05:23:11', NULL, NULL),
(391, -1, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-12 06:04:06', NULL, NULL),
(392, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 06:04:29', NULL, NULL),
(393, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-12 06:04:51', NULL, NULL),
(394, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-12 06:04:52', NULL, NULL),
(395, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-12 06:05:29', NULL, NULL),
(396, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-12 06:05:29', NULL, NULL),
(397, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 06:05:29', NULL, NULL),
(398, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 06:05:29', NULL, NULL),
(399, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-12 06:05:42', NULL, NULL),
(400, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-12 06:05:42', NULL, NULL),
(401, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-12 06:05:42', NULL, NULL),
(402, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-12 06:05:42', NULL, NULL),
(403, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-12 06:05:42', NULL, NULL),
(404, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-12 06:05:42', NULL, NULL),
(405, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-01-12 06:05:42', NULL, NULL),
(406, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-15 04:14:42', NULL, NULL),
(407, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-15 04:14:49', NULL, NULL),
(408, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-15 04:14:52', NULL, NULL),
(409, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-15 04:15:00', NULL, NULL),
(410, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-15 04:15:00', NULL, NULL),
(411, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-15 04:15:00', NULL, NULL),
(412, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-15 04:15:00', NULL, NULL),
(413, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-15 04:17:48', NULL, NULL),
(414, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-15 04:17:48', NULL, NULL),
(415, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-15 04:17:48', NULL, NULL),
(416, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-15 04:17:48', NULL, NULL),
(417, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-15 04:17:48', NULL, NULL),
(418, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-15 04:17:48', NULL, NULL),
(419, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-01-15 04:17:49', NULL, NULL),
(420, -1, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-15 06:21:50', NULL, NULL),
(421, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 00:09:02', NULL, NULL),
(422, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 00:09:02', NULL, NULL),
(423, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-16 00:10:06', NULL, NULL),
(424, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-16 00:10:11', NULL, NULL),
(425, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 00:10:19', NULL, NULL),
(426, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-16 00:10:19', NULL, NULL),
(427, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:10:19', NULL, NULL),
(428, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:10:20', NULL, NULL),
(429, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:10:22', NULL, NULL),
(430, 6, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 00:10:22', NULL, NULL),
(431, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:10:29', NULL, NULL),
(432, 6, 'usuarios', 'registro', 'control-usuario', '2019-01-16 00:12:45', NULL, NULL),
(433, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:12:46', NULL, NULL),
(434, 6, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 00:12:46', NULL, NULL),
(435, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 00:12:55', NULL, NULL),
(436, 6, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-16 00:12:55', NULL, NULL),
(437, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:12:55', NULL, NULL),
(438, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:12:55', NULL, NULL),
(439, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 00:13:10', NULL, NULL),
(440, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 00:13:11', NULL, NULL),
(441, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 00:13:11', NULL, NULL),
(442, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:13:11', NULL, NULL),
(443, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 00:13:11', NULL, NULL),
(444, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:13:11', NULL, NULL),
(445, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-01-16 00:13:11', NULL, NULL),
(446, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 00:29:47', NULL, NULL),
(447, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 00:29:47', NULL, NULL),
(448, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:29:51', NULL, NULL),
(449, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 00:29:51', NULL, NULL),
(450, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:30:12', NULL, NULL),
(451, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 00:30:12', NULL, NULL),
(452, 6, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-16 00:30:19', NULL, NULL),
(453, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 00:30:20', NULL, NULL),
(454, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:30:20', NULL, NULL),
(455, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:30:20', NULL, NULL),
(456, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 00:30:40', NULL, NULL),
(457, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:30:40', NULL, NULL),
(458, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 00:30:40', NULL, NULL),
(459, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 00:30:40', NULL, NULL),
(460, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 00:30:40', NULL, NULL),
(461, 6, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 00:30:40', NULL, NULL),
(462, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:30:40', NULL, NULL),
(463, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:48:49', NULL, NULL),
(464, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:48:56', NULL, NULL),
(465, 6, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 00:48:56', NULL, NULL),
(466, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 00:49:03', NULL, NULL),
(467, 6, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 00:49:03', NULL, NULL),
(468, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 00:49:06', NULL, NULL),
(469, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:49:06', NULL, NULL),
(470, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:49:07', NULL, NULL),
(471, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 00:49:11', NULL, NULL),
(472, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:49:11', NULL, NULL),
(473, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 00:49:11', NULL, NULL),
(474, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 00:49:11', NULL, NULL),
(475, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 00:49:11', NULL, NULL),
(476, 6, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 00:49:11', NULL, NULL),
(477, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:49:11', NULL, NULL),
(478, 6, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-16 00:49:18', NULL, NULL),
(479, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 00:49:18', NULL, NULL),
(480, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:49:18', NULL, NULL),
(481, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:49:19', NULL, NULL),
(482, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:50:05', NULL, NULL),
(483, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 00:50:05', NULL, NULL),
(484, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 00:50:05', NULL, NULL),
(485, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 00:50:05', NULL, NULL),
(486, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 00:50:05', NULL, NULL),
(487, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 00:50:05', NULL, NULL),
(488, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 00:50:06', NULL, NULL),
(489, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:50:48', NULL, NULL),
(490, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 00:50:48', NULL, NULL),
(491, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 00:50:48', NULL, NULL),
(492, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 00:50:48', NULL, NULL),
(493, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:50:48', NULL, NULL),
(494, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 00:50:48', NULL, NULL),
(495, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 00:50:48', NULL, NULL),
(496, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 00:50:48', NULL, NULL),
(497, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 00:50:59', NULL, NULL),
(498, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 00:50:59', NULL, NULL),
(499, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 00:50:59', NULL, NULL),
(500, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 00:50:59', NULL, NULL),
(501, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 00:50:59', NULL, NULL),
(502, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 00:51:00', NULL, NULL),
(503, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 00:51:00', NULL, NULL),
(504, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 00:51:00', NULL, NULL),
(505, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:12:28', NULL, NULL),
(506, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:12:28', NULL, NULL),
(507, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:12:28', NULL, NULL),
(508, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:12:28', NULL, NULL),
(509, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:12:28', NULL, NULL),
(510, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:12:28', NULL, NULL),
(511, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 01:12:28', NULL, NULL),
(512, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:12:41', NULL, NULL),
(513, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:12:41', NULL, NULL),
(514, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:12:41', NULL, NULL),
(515, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:12:41', NULL, NULL),
(516, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:12:41', NULL, NULL),
(517, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:12:41', NULL, NULL),
(518, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:12:41', NULL, NULL),
(519, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:12:42', NULL, NULL),
(520, 2, 'planteles', 'plantelesActivos', 'control-plantel', '2019-01-16 01:13:01', NULL, NULL),
(521, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-01-16 01:13:19', NULL, NULL),
(522, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:15:15', NULL, NULL);
INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(523, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:15:16', NULL, NULL),
(524, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:15:16', NULL, NULL),
(525, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:15:19', NULL, NULL),
(526, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:15:19', NULL, NULL),
(527, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:15:19', NULL, NULL),
(528, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:15:19', NULL, NULL),
(529, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:15:19', NULL, NULL),
(530, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:15:19', NULL, NULL),
(531, 6, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 01:15:19', NULL, NULL),
(532, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:15:24', NULL, NULL),
(533, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:16:48', NULL, NULL),
(534, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:16:48', NULL, NULL),
(535, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:16:48', NULL, NULL),
(536, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:16:52', NULL, NULL),
(537, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:16:52', NULL, NULL),
(538, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:16:52', NULL, NULL),
(539, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:16:52', NULL, NULL),
(540, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:16:52', NULL, NULL),
(541, 6, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:16:52', NULL, NULL),
(542, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:16:52', NULL, NULL),
(543, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:19:13', NULL, NULL),
(544, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:19:13', NULL, NULL),
(545, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:19:13', NULL, NULL),
(546, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:19:13', NULL, NULL),
(547, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:19:13', NULL, NULL),
(548, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:19:13', NULL, NULL),
(549, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:19:13', NULL, NULL),
(550, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:19:14', NULL, NULL),
(551, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:19:20', NULL, NULL),
(552, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:19:20', NULL, NULL),
(553, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:19:20', NULL, NULL),
(554, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:19:20', NULL, NULL),
(555, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:19:20', NULL, NULL),
(556, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:19:20', NULL, NULL),
(557, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 01:19:20', NULL, NULL),
(558, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:19:25', NULL, NULL),
(559, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 01:22:36', NULL, NULL),
(560, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 01:22:36', NULL, NULL),
(561, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:22:47', NULL, NULL),
(562, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:22:47', NULL, NULL),
(563, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:22:47', NULL, NULL),
(564, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:22:47', NULL, NULL),
(565, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:22:47', NULL, NULL),
(566, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:22:47', NULL, NULL),
(567, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:22:48', NULL, NULL),
(568, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:22:48', NULL, NULL),
(569, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:24:36', NULL, NULL),
(570, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:24:36', NULL, NULL),
(571, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:24:36', NULL, NULL),
(572, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:24:36', NULL, NULL),
(573, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:24:36', NULL, NULL),
(574, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:24:36', NULL, NULL),
(575, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:24:36', NULL, NULL),
(576, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:24:36', NULL, NULL),
(577, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:24:44', NULL, NULL),
(578, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:24:44', NULL, NULL),
(579, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:24:44', NULL, NULL),
(580, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:24:44', NULL, NULL),
(581, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:24:44', NULL, NULL),
(582, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:24:44', NULL, NULL),
(583, 6, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:24:44', NULL, NULL),
(584, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-01-16 01:26:07', NULL, NULL),
(585, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:26:16', NULL, NULL),
(586, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:26:16', NULL, NULL),
(587, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:26:16', NULL, NULL),
(588, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:26:16', NULL, NULL),
(589, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:26:16', NULL, NULL),
(590, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:26:16', NULL, NULL),
(591, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:26:16', NULL, NULL),
(592, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:26:17', NULL, NULL),
(593, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 01:29:00', NULL, NULL),
(594, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 01:29:00', NULL, NULL),
(595, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:29:14', NULL, NULL),
(596, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:29:14', NULL, NULL),
(597, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:29:15', NULL, NULL),
(598, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:29:15', NULL, NULL),
(599, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:29:15', NULL, NULL),
(600, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:29:15', NULL, NULL),
(601, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:29:15', NULL, NULL),
(602, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:29:15', NULL, NULL),
(603, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:29:28', NULL, NULL),
(604, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:29:28', NULL, NULL),
(605, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:29:28', NULL, NULL),
(606, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:29:28', NULL, NULL),
(607, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:29:28', NULL, NULL),
(608, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:29:28', NULL, NULL),
(609, 6, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:29:28', NULL, NULL),
(610, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 01:30:55', NULL, NULL),
(611, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 01:30:55', NULL, NULL),
(612, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:31:22', NULL, NULL),
(613, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:31:22', NULL, NULL),
(614, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:31:27', NULL, NULL),
(615, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:31:27', NULL, NULL),
(616, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:31:27', NULL, NULL),
(617, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:31:31', NULL, NULL),
(618, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:31:31', NULL, NULL),
(619, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:31:31', NULL, NULL),
(620, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:31:31', NULL, NULL),
(621, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:31:31', NULL, NULL),
(622, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:31:31', NULL, NULL),
(623, 6, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:31:31', NULL, NULL),
(624, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:32:41', NULL, NULL),
(625, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:32:42', NULL, NULL),
(626, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:32:51', NULL, NULL),
(627, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:32:51', NULL, NULL),
(628, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:32:51', NULL, NULL),
(629, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:32:51', NULL, NULL),
(630, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:32:51', NULL, NULL),
(631, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:32:51', NULL, NULL),
(632, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 01:32:51', NULL, NULL),
(633, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:33:03', NULL, NULL),
(634, 3, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:33:03', NULL, NULL),
(635, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:33:03', NULL, NULL),
(636, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:33:03', NULL, NULL),
(637, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:33:03', NULL, NULL),
(638, 3, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:33:03', NULL, NULL),
(639, 3, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:33:03', NULL, NULL),
(640, 3, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:33:03', NULL, NULL),
(641, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:33:24', NULL, NULL),
(642, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:33:24', NULL, NULL),
(643, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 01:33:31', NULL, NULL),
(644, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 01:33:31', NULL, NULL),
(645, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 01:33:32', NULL, NULL),
(646, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-16 01:34:46', NULL, NULL),
(647, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 01:34:47', NULL, NULL),
(648, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 01:34:47', NULL, NULL),
(649, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:35:02', NULL, NULL),
(650, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:35:03', NULL, NULL),
(651, 8, 'usuarios', 'guardar', 'control-usuario', '2019-01-16 01:35:03', NULL, NULL),
(652, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:35:04', NULL, NULL),
(653, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:35:11', NULL, NULL),
(654, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:35:11', NULL, NULL),
(655, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:35:11', NULL, NULL),
(656, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:35:11', NULL, NULL),
(657, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:35:11', NULL, NULL),
(658, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:35:11', NULL, NULL),
(659, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-01-16 01:35:12', NULL, NULL),
(660, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:35:12', NULL, NULL),
(661, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:35:12', NULL, NULL),
(662, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-01-16 01:35:45', NULL, NULL),
(663, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:35:48', NULL, NULL),
(664, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:35:48', NULL, NULL),
(665, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:35:48', NULL, NULL),
(666, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:35:48', NULL, NULL),
(667, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:35:48', NULL, NULL),
(668, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:35:48', NULL, NULL),
(669, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-01-16 01:35:48', NULL, NULL),
(670, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:35:48', NULL, NULL),
(671, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-16 01:35:48', NULL, NULL),
(672, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-01-15 19:35:52', NULL, NULL),
(673, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:35:57', NULL, NULL),
(674, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:35:57', NULL, NULL),
(675, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:35:57', NULL, NULL),
(676, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:35:57', NULL, NULL),
(677, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:35:57', NULL, NULL),
(678, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:35:57', NULL, NULL),
(679, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 01:35:57', NULL, NULL),
(680, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:36:10', NULL, NULL),
(681, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:40:03', NULL, NULL),
(682, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:40:16', NULL, NULL),
(683, 7, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:40:24', NULL, NULL),
(684, 7, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:40:25', NULL, NULL),
(685, 7, 'usuarios', 'guardar', 'control-usuario', '2019-01-16 01:40:25', NULL, NULL),
(686, 7, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:40:25', NULL, NULL),
(687, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:40:29', NULL, NULL),
(688, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:40:29', NULL, NULL),
(689, 7, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:40:29', NULL, NULL),
(690, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:40:37', NULL, NULL),
(691, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-16 01:40:37', NULL, NULL),
(692, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:40:37', NULL, NULL),
(693, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:40:37', NULL, NULL),
(694, 7, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-16 01:40:37', NULL, NULL),
(695, 7, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:40:37', NULL, NULL),
(696, 7, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-16 01:40:37', NULL, NULL),
(697, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 01:40:56', NULL, NULL),
(698, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 01:40:57', NULL, NULL),
(699, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-16 01:41:15', NULL, NULL),
(700, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:41:23', NULL, NULL),
(701, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:41:23', NULL, NULL),
(702, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:41:23', NULL, NULL),
(703, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-16 01:41:29', NULL, NULL),
(704, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:41:29', NULL, NULL),
(705, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-16 01:41:29', NULL, NULL),
(706, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:41:29', NULL, NULL),
(707, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:41:29', NULL, NULL),
(708, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-16 01:41:29', NULL, NULL),
(709, 6, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-16 01:41:29', NULL, NULL),
(710, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-16 01:41:45', NULL, NULL),
(711, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-16 01:41:45', NULL, NULL),
(712, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-16 01:41:46', NULL, NULL),
(713, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 02:30:57', NULL, NULL),
(714, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 02:30:57', NULL, NULL),
(715, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 02:31:04', NULL, NULL),
(716, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 02:31:04', NULL, NULL),
(717, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 02:31:09', NULL, NULL),
(718, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-16 11:41:20', NULL, NULL),
(719, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 11:41:26', NULL, NULL),
(720, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-01-16 11:41:32', NULL, NULL),
(721, -1, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-01-16 11:41:32', NULL, NULL),
(722, -1, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-01-16 11:41:32', NULL, NULL),
(723, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-01-16 11:41:44', NULL, NULL),
(724, -1, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-01-16 11:41:45', NULL, NULL),
(725, -1, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-01-16 11:41:45', NULL, NULL),
(726, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-01-16 11:41:49', NULL, NULL),
(727, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2019-01-16 11:41:51', NULL, NULL),
(728, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-01-16 11:41:53', NULL, NULL),
(729, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-16 11:41:55', NULL, NULL),
(730, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-16 23:05:40', NULL, NULL),
(731, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-16 23:05:41', NULL, NULL),
(732, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 23:05:47', NULL, NULL),
(733, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 23:05:47', NULL, NULL),
(734, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 23:06:02', NULL, NULL),
(735, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-16 23:11:11', NULL, NULL),
(736, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 23:11:11', NULL, NULL),
(737, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 23:11:11', NULL, NULL),
(738, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 23:11:15', NULL, NULL),
(739, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-16 23:31:42', NULL, NULL),
(740, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 23:31:43', NULL, NULL),
(741, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-16 23:31:43', NULL, NULL),
(742, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-16 23:34:42', NULL, NULL),
(743, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 00:04:21', NULL, NULL),
(744, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:04:21', NULL, NULL),
(745, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:04:25', NULL, NULL),
(746, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:04:25', NULL, NULL),
(747, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:04:42', NULL, NULL),
(748, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-17 00:05:58', NULL, NULL),
(749, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:05:58', NULL, NULL),
(750, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:05:58', NULL, NULL),
(751, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:06:09', NULL, NULL),
(752, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-17 00:08:21', NULL, NULL),
(753, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:08:22', NULL, NULL),
(754, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:08:22', NULL, NULL),
(755, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:08:30', NULL, NULL),
(756, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:09:12', NULL, NULL),
(757, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:09:12', NULL, NULL),
(758, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:09:18', NULL, NULL),
(759, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-17 00:10:51', NULL, NULL),
(760, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:10:51', NULL, NULL),
(761, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:10:51', NULL, NULL),
(762, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:13:03', NULL, NULL),
(763, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-17 00:14:40', NULL, NULL),
(764, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:14:41', NULL, NULL),
(765, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:14:41', NULL, NULL),
(766, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 00:18:25', NULL, NULL),
(767, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:18:26', NULL, NULL),
(768, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 00:18:53', NULL, NULL),
(769, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:18:55', NULL, NULL),
(770, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-01-17 00:19:07', NULL, NULL),
(771, -1, 'pagos', 'consultarTodosTabla', 'control-pago', '2019-01-17 00:19:07', NULL, NULL),
(772, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 00:19:25', NULL, NULL),
(773, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 00:19:25', NULL, NULL),
(774, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 00:19:25', NULL, NULL),
(775, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 00:19:25', NULL, NULL),
(776, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 00:19:25', NULL, NULL),
(777, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 00:19:26', NULL, NULL),
(778, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 00:19:26', NULL, NULL),
(779, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:20:15', NULL, NULL),
(780, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:20:15', NULL, NULL),
(781, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 00:20:40', NULL, NULL),
(782, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:20:41', NULL, NULL),
(783, 12, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 00:20:41', NULL, NULL),
(784, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:20:42', NULL, NULL),
(785, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 00:23:45', NULL, NULL),
(786, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:23:46', NULL, NULL),
(787, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-01-17 00:23:51', NULL, NULL),
(788, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:24:19', NULL, NULL),
(789, -1, 'modulos', 'consultarTodos', 'control-modulo', '2019-01-17 00:24:19', NULL, NULL),
(790, 2, 'modulos_roles', 'consultarTodosTabla', 'control-modulo-rol', '2019-01-17 00:24:19', NULL, NULL),
(791, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 00:38:10', NULL, NULL),
(792, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 00:50:48', NULL, NULL),
(793, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 00:50:48', NULL, NULL),
(794, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 01:51:08', NULL, NULL),
(795, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 02:04:22', NULL, NULL),
(796, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 02:04:23', NULL, NULL),
(797, 9, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 02:04:23', NULL, NULL),
(798, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 02:04:24', NULL, NULL),
(799, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 04:35:57', NULL, NULL),
(800, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 04:36:14', NULL, NULL),
(801, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 04:36:15', NULL, NULL),
(802, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 04:36:21', NULL, NULL),
(803, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 04:36:21', NULL, NULL),
(804, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 04:36:24', NULL, NULL),
(805, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-17 04:40:10', NULL, NULL),
(806, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 04:40:11', NULL, NULL),
(807, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 04:40:11', NULL, NULL),
(808, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 04:40:54', NULL, NULL),
(809, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 04:40:55', NULL, NULL),
(810, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 04:40:55', NULL, NULL),
(811, 15, 'instituciones', 'guardarPrimeraVez', 'control-institucion', '2019-01-17 04:43:02', NULL, NULL),
(812, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 04:43:03', NULL, NULL),
(813, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 04:43:28', NULL, NULL),
(814, 15, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-17 04:43:28', NULL, NULL),
(815, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 04:43:28', NULL, NULL),
(816, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 04:43:29', NULL, NULL),
(817, 15, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-17 04:43:42', NULL, NULL),
(818, 15, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-01-17 04:43:50', NULL, NULL),
(819, 15, 'planteles', 'guardarInformacion', 'control-plantel', '2019-01-17 04:45:29', NULL, NULL),
(820, 15, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-01-17 04:45:30', NULL, NULL),
(821, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 04:45:35', NULL, NULL),
(822, 15, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-01-17 04:45:35', NULL, NULL),
(823, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 04:45:35', NULL, NULL),
(824, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 04:45:35', NULL, NULL),
(825, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 04:45:52', NULL, NULL),
(826, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 04:45:52', NULL, NULL),
(827, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 04:45:52', NULL, NULL),
(828, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 04:45:52', NULL, NULL),
(829, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 04:45:52', NULL, NULL),
(830, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 04:45:52', NULL, NULL),
(831, 15, 'planteles', 'plantelPorId', 'control-plantel', '2019-01-17 04:45:52', NULL, NULL),
(832, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-17 05:01:55', NULL, NULL),
(833, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:01:56', NULL, NULL),
(834, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:01:56', NULL, NULL),
(835, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:01:56', NULL, NULL),
(836, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:02:25', NULL, NULL),
(837, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:02:25', NULL, NULL),
(838, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:02:25', NULL, NULL),
(839, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 05:02:25', NULL, NULL),
(840, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:02:25', NULL, NULL),
(841, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:02:25', NULL, NULL),
(842, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-17 05:02:25', NULL, NULL),
(843, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-17 05:03:03', NULL, NULL),
(844, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:03:04', NULL, NULL),
(845, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:03:04', NULL, NULL),
(846, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:03:04', NULL, NULL),
(847, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:03:22', NULL, NULL),
(848, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:03:22', NULL, NULL),
(849, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 05:03:27', NULL, NULL),
(850, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 05:03:27', NULL, NULL),
(851, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:03:46', NULL, NULL),
(852, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:03:46', NULL, NULL),
(853, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:04:02', NULL, NULL),
(854, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:04:02', NULL, NULL),
(855, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:04:02', NULL, NULL),
(856, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 05:04:02', NULL, NULL),
(857, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-01-17 05:04:02', NULL, NULL),
(858, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:04:02', NULL, NULL),
(859, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:04:02', NULL, NULL),
(860, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-17 05:04:02', NULL, NULL),
(861, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-17 05:04:02', NULL, NULL),
(862, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-01-17 05:05:14', NULL, NULL),
(863, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:05:19', NULL, NULL),
(864, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:05:19', NULL, NULL),
(865, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:05:19', NULL, NULL),
(866, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 05:05:19', NULL, NULL),
(867, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:05:19', NULL, NULL),
(868, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-01-17 05:05:19', NULL, NULL),
(869, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:05:19', NULL, NULL),
(870, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-17 05:05:19', NULL, NULL),
(871, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-17 05:05:19', NULL, NULL),
(872, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-01-16 23:05:46', NULL, NULL),
(873, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:09:04', NULL, NULL),
(874, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:09:04', NULL, NULL),
(875, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:10:28', NULL, NULL),
(876, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:10:28', NULL, NULL),
(877, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:10:28', NULL, NULL),
(878, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:10:45', NULL, NULL),
(879, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:10:45', NULL, NULL),
(880, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:10:45', NULL, NULL),
(881, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:10:45', NULL, NULL),
(882, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 05:10:45', NULL, NULL),
(883, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:10:45', NULL, NULL),
(884, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-17 05:10:45', NULL, NULL),
(885, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:10:47', NULL, NULL),
(886, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:10:47', NULL, NULL),
(887, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:10:47', NULL, NULL),
(888, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:10:50', NULL, NULL),
(889, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:10:50', NULL, NULL),
(890, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:10:50', NULL, NULL),
(891, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:10:50', NULL, NULL),
(892, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:10:50', NULL, NULL),
(893, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:10:50', NULL, NULL),
(894, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 05:10:50', NULL, NULL),
(895, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:11:05', NULL, NULL),
(896, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:11:05', NULL, NULL),
(897, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:11:06', NULL, NULL),
(898, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:11:10', NULL, NULL),
(899, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:11:10', NULL, NULL),
(900, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:11:10', NULL, NULL),
(901, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:11:10', NULL, NULL),
(902, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 05:11:10', NULL, NULL),
(903, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:11:10', NULL, NULL),
(904, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-17 05:11:10', NULL, NULL),
(905, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-01-17 05:11:18', NULL, NULL),
(906, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:11:19', NULL, NULL),
(907, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:11:19', NULL, NULL),
(908, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:11:19', NULL, NULL),
(909, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:11:37', NULL, NULL),
(910, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:11:37', NULL, NULL),
(911, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:11:45', NULL, NULL),
(912, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:11:45', NULL, NULL),
(913, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:11:45', NULL, NULL),
(914, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-01-17 05:11:45', NULL, NULL),
(915, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-01-17 05:11:45', NULL, NULL),
(916, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:11:45', NULL, NULL),
(917, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-01-17 05:11:45', NULL, NULL),
(918, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-01-17 05:11:45', NULL, NULL),
(919, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-01-17 05:11:45', NULL, NULL),
(920, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-01-16 23:13:07', NULL, NULL),
(921, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:13:20', NULL, NULL),
(922, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:13:20', NULL, NULL),
(923, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:13:20', NULL, NULL),
(924, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:13:20', NULL, NULL),
(925, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:13:20', NULL, NULL),
(926, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:13:20', NULL, NULL),
(927, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 05:13:20', NULL, NULL),
(928, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:13:58', NULL, NULL),
(929, 8, 'solicitudes', 'agendarCita', 'control-solicitud', '2019-01-17 05:15:37', NULL, NULL),
(930, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:15:44', NULL, NULL),
(931, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:15:44', NULL, NULL),
(932, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:15:44', NULL, NULL),
(933, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:15:44', NULL, NULL),
(934, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:15:44', NULL, NULL),
(935, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:15:44', NULL, NULL),
(936, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 05:15:44', NULL, NULL),
(937, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:15:58', NULL, NULL),
(938, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:16:35', NULL, NULL),
(939, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:16:35', NULL, NULL),
(940, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:16:35', NULL, NULL),
(941, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:16:35', NULL, NULL),
(942, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:16:35', NULL, NULL),
(943, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:16:35', NULL, NULL),
(944, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 05:16:35', NULL, NULL),
(945, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:17:02', NULL, NULL),
(946, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:18:03', NULL, NULL),
(947, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:18:04', NULL, NULL),
(948, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:18:04', NULL, NULL),
(949, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:18:04', NULL, NULL),
(950, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:18:04', NULL, NULL),
(951, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:18:04', NULL, NULL),
(952, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 05:18:04', NULL, NULL),
(953, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:19:21', NULL, NULL),
(954, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 05:21:35', NULL, NULL),
(955, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 05:21:35', NULL, NULL),
(956, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:22:09', NULL, NULL),
(957, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:22:09', NULL, NULL),
(958, 12, 'programas', 'datosGenerales', 'control-programa', '2019-01-17 05:22:19', NULL, NULL),
(959, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 05:22:55', NULL, NULL),
(960, 2, 'usuarios', 'registro', 'control-usuario', '2019-01-17 05:24:04', NULL, NULL),
(961, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 05:24:05', NULL, NULL),
(962, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 05:24:05', NULL, NULL),
(963, 12, 'programas', 'datosGenerales', 'control-programa', '2019-01-17 05:24:08', NULL, NULL),
(964, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-01-17 05:25:46', NULL, NULL),
(965, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:26:11', NULL, NULL),
(966, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:26:12', NULL, NULL),
(967, 16, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 05:26:12', NULL, NULL),
(968, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:26:13', NULL, NULL),
(969, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:26:16', NULL, NULL),
(970, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-01-17 05:26:16', NULL, NULL),
(971, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-01-17 05:26:16', NULL, NULL),
(972, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-01-17 05:26:29', NULL, NULL),
(973, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-01-17 05:42:57', NULL, NULL),
(974, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-01-17 05:43:01', NULL, NULL),
(975, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-01-17 05:43:07', NULL, NULL),
(976, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:43:35', NULL, NULL),
(977, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:43:36', NULL, NULL),
(978, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 05:43:42', NULL, NULL),
(979, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 05:43:42', NULL, NULL),
(980, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 05:43:50', NULL, NULL),
(981, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 05:43:50', NULL, NULL),
(982, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 05:43:50', NULL, NULL),
(983, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 05:43:50', NULL, NULL),
(984, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:43:50', NULL, NULL),
(985, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 05:43:50', NULL, NULL),
(986, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 05:43:50', NULL, NULL),
(987, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 05:44:04', NULL, NULL),
(988, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 05:44:04', NULL, NULL),
(989, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:44:31', NULL, NULL),
(990, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:44:32', NULL, NULL),
(991, 9, 'programas', 'datosGenerales', 'control-programa', '2019-01-17 05:44:41', NULL, NULL),
(992, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:46:47', NULL, NULL),
(993, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:46:48', NULL, NULL),
(994, 10, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 05:46:48', NULL, NULL),
(995, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 05:46:49', NULL, NULL),
(996, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 05:46:50', NULL, NULL),
(997, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-01-17 05:47:00', NULL, NULL),
(998, -1, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-01-17 05:47:00', NULL, NULL),
(999, -1, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-01-17 05:47:00', NULL, NULL),
(1000, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 05:47:07', NULL, NULL),
(1001, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:47:55', NULL, NULL),
(1002, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 05:47:55', NULL, NULL),
(1003, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 05:47:56', NULL, NULL),
(1004, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-01-17 05:48:07', NULL, NULL),
(1005, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 05:48:10', NULL, NULL),
(1006, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 05:48:14', NULL, NULL),
(1007, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 05:48:30', NULL, NULL),
(1008, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-01-17 05:48:36', NULL, NULL),
(1009, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 05:48:58', NULL, NULL),
(1010, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 05:49:12', NULL, NULL),
(1011, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 05:57:22', NULL, NULL),
(1012, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 05:57:22', NULL, NULL),
(1013, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 05:57:23', NULL, NULL),
(1014, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 05:57:25', NULL, NULL),
(1015, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 05:57:32', NULL, NULL),
(1016, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 05:57:34', NULL, NULL),
(1017, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:01:48', NULL, NULL),
(1018, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:02:07', NULL, NULL),
(1019, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 06:04:24', NULL, NULL),
(1020, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:04:28', NULL, NULL),
(1021, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:04:47', NULL, NULL),
(1022, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 06:05:02', NULL, NULL),
(1023, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:05:17', NULL, NULL),
(1024, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:05:36', NULL, NULL),
(1025, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 06:05:37', NULL, NULL),
(1026, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 06:05:37', NULL, NULL),
(1027, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:05:39', NULL, NULL),
(1028, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 06:05:39', NULL, NULL),
(1029, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 06:05:40', NULL, NULL),
(1030, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:05:43', NULL, NULL),
(1031, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:05:46', NULL, NULL),
(1032, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 06:05:46', NULL, NULL),
(1033, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:14:57', NULL, NULL),
(1034, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:15:39', NULL, NULL);
INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1035, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 06:15:39', NULL, NULL),
(1036, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 06:15:40', NULL, NULL),
(1037, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:15:42', NULL, NULL),
(1038, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 06:20:39', NULL, NULL),
(1039, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:20:43', NULL, NULL),
(1040, -1, 'inspecciones', 'actulizarEstatus', 'control-inspeccion', '2019-01-17 06:21:24', NULL, NULL),
(1041, -1, 'inspecciones', 'informacionActaInspeccion', 'control-inspeccion', '2019-01-17 06:21:25', NULL, NULL),
(1042, -1, 'inspecciones', 'guiaInspeccion', 'control-inspeccion', '2019-01-17 06:21:25', NULL, NULL),
(1043, -1, 'inspecciones', 'actulizarEstatus', 'control-inspeccion', '2019-01-17 06:24:46', NULL, NULL),
(1044, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:24:47', NULL, NULL),
(1045, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-01-17 06:25:03', NULL, NULL),
(1046, -1, 'oficios', 'consultarOficio', 'control-oficio', '2019-01-17 06:25:11', NULL, NULL),
(1047, 10, 'oficios', 'guardar', 'ActaDeInspeccion', '2019-01-17 06:25:18', NULL, NULL),
(1048, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 06:25:49', NULL, NULL),
(1049, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 06:25:49', NULL, NULL),
(1050, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 06:25:49', NULL, NULL),
(1051, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 06:25:49', NULL, NULL),
(1052, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:25:49', NULL, NULL),
(1053, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:25:49', NULL, NULL),
(1054, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 06:25:50', NULL, NULL),
(1055, -1, 'inspecciones', 'guardarInspeccion', 'control-inspeccion', '2019-01-17 06:26:38', NULL, NULL),
(1056, -1, 'inspecciones', 'actulizarEstatus', 'control-inspeccion', '2019-01-17 06:26:38', NULL, NULL),
(1057, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-01-17 06:26:42', NULL, NULL),
(1058, 10, 'oficios', 'guardar', 'ActaDeCierre', '2019-01-17 06:26:50', NULL, NULL),
(1059, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:27:04', NULL, NULL),
(1060, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:27:31', NULL, NULL),
(1061, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 06:27:32', NULL, NULL),
(1062, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 06:27:34', NULL, NULL),
(1063, -1, 'roles', 'consultarTodos', 'control-rol', '2019-01-17 06:27:35', NULL, NULL),
(1064, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-01-17 06:27:35', NULL, NULL),
(1065, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 06:27:41', NULL, NULL),
(1066, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:28:34', NULL, NULL),
(1067, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 06:28:34', NULL, NULL),
(1068, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 06:28:55', NULL, NULL),
(1069, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 06:28:55', NULL, NULL),
(1070, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 06:28:55', NULL, NULL),
(1071, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 06:28:55', NULL, NULL),
(1072, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:28:55', NULL, NULL),
(1073, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:28:55', NULL, NULL),
(1074, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 06:28:55', NULL, NULL),
(1075, -1, 'oficios', 'consultarOficio', 'control-oficio', '2019-01-17 06:29:07', NULL, NULL),
(1076, 3, 'oficios', 'guardar', 'DictamenRVOE', '2019-01-17 06:29:16', NULL, NULL),
(1077, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 06:29:26', NULL, NULL),
(1078, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 06:29:26', NULL, NULL),
(1079, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 06:29:26', NULL, NULL),
(1080, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 06:29:26', NULL, NULL),
(1081, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:29:26', NULL, NULL),
(1082, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:29:26', NULL, NULL),
(1083, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 06:29:26', NULL, NULL),
(1084, -1, 'oficios', 'consultarOficio', 'control-oficio', '2019-01-17 06:29:57', NULL, NULL),
(1085, 3, 'oficios', 'guardar', 'AcuerdoRVOE', '2019-01-17 06:30:12', NULL, NULL),
(1086, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 06:30:24', NULL, NULL),
(1087, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 06:30:24', NULL, NULL),
(1088, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 06:30:24', NULL, NULL),
(1089, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 06:30:24', NULL, NULL),
(1090, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:30:24', NULL, NULL),
(1091, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:30:24', NULL, NULL),
(1092, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 06:30:24', NULL, NULL),
(1093, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:31:14', NULL, NULL),
(1094, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 06:31:14', NULL, NULL),
(1095, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 06:32:02', NULL, NULL),
(1096, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-01-17 06:32:03', NULL, NULL),
(1097, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-01-17 06:32:17', NULL, NULL),
(1098, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-01-17 06:32:17', NULL, NULL),
(1099, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-01-17 06:32:17', NULL, NULL),
(1100, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-01-17 06:32:17', NULL, NULL),
(1101, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:32:17', NULL, NULL),
(1102, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-01-17 06:32:17', NULL, NULL),
(1103, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-01-17 06:32:17', NULL, NULL),
(1104, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 12:14:42', NULL, NULL),
(1105, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:14:45', NULL, NULL),
(1106, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:15:07', NULL, NULL),
(1107, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 12:16:02', NULL, NULL),
(1108, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 12:16:45', NULL, NULL),
(1109, -1, 'usuarios', 'guardar', 'control-usuario', '2019-01-17 12:16:46', NULL, NULL),
(1110, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-17 12:16:46', NULL, NULL),
(1111, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:16:52', NULL, NULL),
(1112, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:21:25', NULL, NULL),
(1113, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-01-17 12:22:39', NULL, NULL),
(1114, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-17 12:22:42', NULL, NULL),
(1115, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:22:50', NULL, NULL),
(1116, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:23:42', NULL, NULL),
(1117, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:24:20', NULL, NULL),
(1118, -1, 'inspecciones', 'informacionActaInspeccion', 'control-inspeccion', '2019-01-17 12:24:30', NULL, NULL),
(1119, -1, 'inspecciones', 'guiaInspeccion', 'control-inspeccion', '2019-01-17 12:24:31', NULL, NULL),
(1120, -1, 'inspecciones', 'actulizarEstatus', 'control-inspeccion', '2019-01-17 12:24:58', NULL, NULL),
(1121, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:24:58', NULL, NULL),
(1122, -1, 'inspecciones', 'guardarInspeccion', 'control-inspeccion', '2019-01-17 12:25:27', NULL, NULL),
(1123, -1, 'inspecciones', 'actulizarEstatus', 'control-inspeccion', '2019-01-17 12:25:28', NULL, NULL),
(1124, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:25:34', NULL, NULL),
(1125, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-17 12:26:04', NULL, NULL),
(1126, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-18 13:13:36', NULL, NULL),
(1127, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-01-18 13:13:40', NULL, NULL),
(1128, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-01-18 13:14:27', NULL, NULL),
(1129, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-01-18 13:14:29', NULL, NULL),
(1130, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-01-18 13:14:51', NULL, NULL),
(1131, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:39:34', NULL, NULL),
(1132, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:39:41', NULL, NULL),
(1133, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:39:58', NULL, NULL),
(1134, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:40:18', NULL, NULL),
(1135, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:40:37', NULL, NULL),
(1136, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:40:45', NULL, NULL),
(1137, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-06 02:40:52', NULL, NULL),
(1138, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:41:44', NULL, NULL),
(1139, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:43:25', NULL, NULL),
(1140, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-06 02:43:26', NULL, NULL),
(1141, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-06 02:43:36', NULL, NULL),
(1142, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-06 02:43:36', NULL, NULL),
(1143, -1, 'personas', 'consultarId', 'control-persona', '2019-02-06 02:43:37', NULL, NULL),
(1144, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-06 02:44:12', NULL, NULL),
(1145, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-06 02:44:12', NULL, NULL),
(1146, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-06 02:44:24', NULL, NULL),
(1147, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-06 02:44:24', NULL, NULL),
(1148, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-06 02:44:56', NULL, NULL),
(1149, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-06 02:44:56', NULL, NULL),
(1150, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-06 02:44:56', NULL, NULL),
(1151, -1, 'usuarios', 'registro', 'control-usuario', '2019-02-06 02:46:05', NULL, NULL),
(1152, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:46:19', NULL, NULL),
(1153, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 02:46:39', NULL, NULL),
(1154, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-06 23:20:26', NULL, NULL),
(1155, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-06 23:20:27', NULL, NULL),
(1156, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-06 23:20:31', NULL, NULL),
(1157, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-06 23:20:31', NULL, NULL),
(1158, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-06 23:20:34', NULL, NULL),
(1159, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-07 02:12:33', NULL, NULL),
(1160, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-07 02:12:34', NULL, NULL),
(1161, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-07 02:13:15', NULL, NULL),
(1162, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-07 02:13:15', NULL, NULL),
(1163, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-07 02:13:15', NULL, NULL),
(1164, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-07 02:13:15', NULL, NULL),
(1165, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-07 02:13:15', NULL, NULL),
(1166, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-07 02:13:15', NULL, NULL),
(1167, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-02-07 02:13:15', NULL, NULL),
(1168, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-02-07 02:13:15', NULL, NULL),
(1169, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-07 02:14:44', NULL, NULL),
(1170, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-07 02:14:44', NULL, NULL),
(1171, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-07 02:14:47', NULL, NULL),
(1172, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-07 02:14:47', NULL, NULL),
(1173, -1, 'usuarios', 'registro', 'control-usuario', '2019-02-07 02:15:59', NULL, NULL),
(1174, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-07 02:16:23', NULL, NULL),
(1175, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-07 02:16:23', NULL, NULL),
(1176, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-07 02:16:31', NULL, NULL),
(1177, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-07 02:16:31', NULL, NULL),
(1178, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-07 02:16:39', NULL, NULL),
(1179, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-07 02:16:39', NULL, NULL),
(1180, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-07 02:16:46', NULL, NULL),
(1181, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-07 02:16:47', NULL, NULL),
(1182, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-07 02:16:51', NULL, NULL),
(1183, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-07 02:16:51', NULL, NULL),
(1184, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-07 02:16:54', NULL, NULL),
(1185, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-07 02:16:55', NULL, NULL),
(1186, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:16:21', NULL, NULL),
(1187, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:16:29', NULL, NULL),
(1188, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:16:51', NULL, NULL),
(1189, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:16:59', NULL, NULL),
(1190, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:17:06', NULL, NULL),
(1191, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:17:22', NULL, NULL),
(1192, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-08 05:19:14', NULL, NULL),
(1193, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-08 05:19:15', NULL, NULL),
(1194, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 00:48:09', NULL, NULL),
(1195, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 00:48:10', NULL, NULL),
(1196, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 00:48:13', NULL, NULL),
(1197, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 00:48:13', NULL, NULL),
(1198, -1, 'personas', 'consultarId', 'control-persona', '2019-02-09 00:48:13', NULL, NULL),
(1199, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 00:56:43', NULL, NULL),
(1200, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 00:56:46', NULL, NULL),
(1201, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 00:56:46', NULL, NULL),
(1202, -1, 'personas', 'consultarId', 'control-persona', '2019-02-09 00:56:46', NULL, NULL),
(1203, -1, 'personas', 'guardar', 'control-persona', '2019-02-09 00:57:30', NULL, NULL),
(1204, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 00:57:31', NULL, NULL),
(1205, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 01:09:16', NULL, NULL),
(1206, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-09 01:09:16', NULL, NULL),
(1207, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 01:09:23', NULL, NULL),
(1208, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 01:33:44', NULL, NULL),
(1209, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-09 01:33:44', NULL, NULL),
(1210, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 01:56:51', NULL, NULL),
(1211, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 01:56:52', NULL, NULL),
(1212, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 01:57:00', NULL, NULL),
(1213, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-09 01:57:00', NULL, NULL),
(1214, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 01:57:28', NULL, NULL),
(1215, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 01:57:28', NULL, NULL),
(1216, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 01:57:48', NULL, NULL),
(1217, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 01:57:55', NULL, NULL),
(1218, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-09 01:58:03', NULL, NULL),
(1219, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 01:58:39', NULL, NULL),
(1220, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 01:58:51', NULL, NULL),
(1221, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 02:07:33', NULL, NULL),
(1222, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 02:07:54', NULL, NULL),
(1223, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 02:08:00', NULL, NULL),
(1224, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 02:08:00', NULL, NULL),
(1225, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 02:44:31', NULL, NULL),
(1226, 6, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-09 02:44:31', NULL, NULL),
(1227, 6, 'usuarios', 'eliminar', 'control-usuario', '2019-02-09 02:44:42', NULL, NULL),
(1228, 6, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-09 02:44:42', NULL, NULL),
(1229, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-09 03:02:56', NULL, NULL),
(1230, -1, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 04:51:14', NULL, NULL),
(1231, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 04:51:27', NULL, NULL),
(1232, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 04:51:28', NULL, NULL),
(1233, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 04:51:33', NULL, NULL),
(1234, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:07:16', NULL, NULL),
(1235, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:14:07', NULL, NULL),
(1236, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:14:29', NULL, NULL),
(1237, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-09 05:14:32', NULL, NULL),
(1238, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:14:33', NULL, NULL),
(1239, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:15:00', NULL, NULL),
(1240, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-09 05:17:39', NULL, NULL),
(1241, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-09 05:17:40', NULL, NULL),
(1242, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:17:55', NULL, NULL),
(1243, 6, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-09 05:17:57', NULL, NULL),
(1244, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-09 05:29:48', NULL, NULL),
(1245, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-11 23:20:12', NULL, NULL),
(1246, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-11 23:20:13', NULL, NULL),
(1247, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-11 23:20:19', NULL, NULL),
(1248, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-11 23:20:28', NULL, NULL),
(1249, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-11 23:26:36', NULL, NULL),
(1250, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-11 23:26:37', NULL, NULL),
(1251, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-11 23:27:55', NULL, NULL),
(1252, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-11 23:27:55', NULL, NULL),
(1253, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-11 23:27:55', NULL, NULL),
(1254, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-11 23:28:16', NULL, NULL),
(1255, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-11 23:28:16', NULL, NULL),
(1256, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-11 23:28:16', NULL, NULL),
(1257, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-11 23:28:16', NULL, NULL),
(1258, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-11 23:28:16', NULL, NULL),
(1259, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-11 23:28:16', NULL, NULL),
(1260, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-11 23:28:16', NULL, NULL),
(1261, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-11 23:41:10', NULL, NULL),
(1262, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-11 23:41:10', NULL, NULL),
(1263, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-11 23:41:11', NULL, NULL),
(1264, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 01:26:49', NULL, NULL),
(1265, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 01:26:50', NULL, NULL),
(1266, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 01:28:06', NULL, NULL),
(1267, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 01:28:06', NULL, NULL),
(1268, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 01:28:06', NULL, NULL),
(1269, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 01:28:19', NULL, NULL),
(1270, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-14 01:28:19', NULL, NULL),
(1271, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-14 01:28:19', NULL, NULL),
(1272, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 01:28:19', NULL, NULL),
(1273, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-14 01:28:19', NULL, NULL),
(1274, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-14 01:28:19', NULL, NULL),
(1275, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-14 01:28:19', NULL, NULL),
(1276, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 02:54:17', NULL, NULL),
(1277, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 02:54:30', NULL, NULL),
(1278, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 02:54:30', NULL, NULL),
(1279, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 02:54:33', NULL, NULL),
(1280, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 02:54:33', NULL, NULL),
(1281, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 02:54:33', NULL, NULL),
(1282, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-14 02:55:37', NULL, NULL),
(1283, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 02:55:37', NULL, NULL),
(1284, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 02:55:37', NULL, NULL),
(1285, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-14 02:55:37', NULL, NULL),
(1286, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-14 02:55:37', NULL, NULL),
(1287, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-14 02:55:37', NULL, NULL),
(1288, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 02:56:47', NULL, NULL),
(1289, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 02:56:47', NULL, NULL),
(1290, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 02:56:47', NULL, NULL),
(1291, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-14 03:04:05', NULL, NULL),
(1292, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 03:04:05', NULL, NULL),
(1293, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-14 03:04:05', NULL, NULL),
(1294, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 03:04:05', NULL, NULL),
(1295, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-14 03:04:05', NULL, NULL),
(1296, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-14 03:04:05', NULL, NULL),
(1297, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:04:44', NULL, NULL),
(1298, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 23:04:45', NULL, NULL),
(1299, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 23:04:58', NULL, NULL),
(1300, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 23:04:58', NULL, NULL),
(1301, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 23:04:58', NULL, NULL),
(1302, 6, 'programas', 'informacionBasica', 'control-programa', '2019-02-14 23:05:33', NULL, NULL),
(1303, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-14 23:05:52', NULL, NULL),
(1304, 6, 'planteles', 'consultarId', 'control-plantel', '2019-02-14 23:05:57', NULL, NULL),
(1305, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-14 23:06:02', NULL, NULL),
(1306, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-14 23:07:14', NULL, NULL),
(1307, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-14 23:07:16', NULL, NULL),
(1308, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 23:07:22', NULL, NULL),
(1309, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 23:07:22', NULL, NULL),
(1310, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 23:07:22', NULL, NULL),
(1311, 6, 'programas', 'informacionBasica', 'control-programa', '2019-02-14 23:07:36', NULL, NULL),
(1312, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:08:04', NULL, NULL),
(1313, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 23:08:05', NULL, NULL),
(1314, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-14 23:08:17', NULL, NULL),
(1315, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-14 23:08:17', NULL, NULL),
(1316, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-14 23:08:30', NULL, NULL),
(1317, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 23:08:30', NULL, NULL),
(1318, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:18:55', NULL, NULL),
(1319, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 23:18:56', NULL, NULL),
(1320, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 23:18:59', NULL, NULL),
(1321, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 23:18:59', NULL, NULL),
(1322, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 23:18:59', NULL, NULL),
(1323, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:22:37', NULL, NULL),
(1324, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:22:45', NULL, NULL),
(1325, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:22:54', NULL, NULL),
(1326, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:23:04', NULL, NULL),
(1327, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:23:20', NULL, NULL),
(1328, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-14 23:23:27', NULL, NULL),
(1329, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-14 23:23:28', NULL, NULL),
(1330, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-14 23:23:31', NULL, NULL),
(1331, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 23:23:31', NULL, NULL),
(1332, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 23:23:31', NULL, NULL),
(1333, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-14 23:26:48', NULL, NULL),
(1334, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-14 23:26:49', NULL, NULL),
(1335, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-14 23:26:49', NULL, NULL),
(1336, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-14 23:26:49', NULL, NULL),
(1337, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-14 23:26:49', NULL, NULL),
(1338, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-14 23:26:49', NULL, NULL),
(1339, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-14 23:26:49', NULL, NULL),
(1340, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:30:18', NULL, NULL),
(1341, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 01:30:19', NULL, NULL),
(1342, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-15 01:30:22', NULL, NULL),
(1343, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-15 01:30:22', NULL, NULL),
(1344, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:31:05', NULL, NULL),
(1345, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:31:15', NULL, NULL),
(1346, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-15 01:31:21', NULL, NULL),
(1347, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 01:31:21', NULL, NULL),
(1348, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-15 01:31:28', NULL, NULL),
(1349, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-15 01:31:28', NULL, NULL),
(1350, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-15 01:31:29', NULL, NULL),
(1351, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:31:35', NULL, NULL),
(1352, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 01:31:36', NULL, NULL),
(1353, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:38:35', NULL, NULL),
(1354, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:38:43', NULL, NULL),
(1355, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:38:53', NULL, NULL),
(1356, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:39:20', NULL, NULL),
(1357, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:39:27', NULL, NULL),
(1358, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:39:45', NULL, NULL),
(1359, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-15 01:39:57', NULL, NULL),
(1360, -1, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-02-15 01:58:41', NULL, NULL),
(1361, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 01:58:50', NULL, NULL),
(1362, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 01:58:50', NULL, NULL),
(1363, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 02:29:01', NULL, NULL),
(1364, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-15 02:29:10', NULL, NULL),
(1365, -1, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-02-15 02:47:13', NULL, NULL),
(1366, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 02:48:30', NULL, NULL),
(1367, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 02:48:30', NULL, NULL),
(1368, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-15 02:48:38', NULL, NULL),
(1369, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-15 02:48:38', NULL, NULL),
(1370, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-02-15 02:48:38', NULL, NULL),
(1371, -1, 'evaluadores', 'guardarCurriculum', 'control-evaluador', '2019-02-15 02:49:17', NULL, NULL),
(1372, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 02:49:18', NULL, NULL),
(1373, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-15 02:49:24', NULL, NULL),
(1374, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-15 02:49:24', NULL, NULL),
(1375, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-02-15 02:49:24', NULL, NULL),
(1376, -1, 'evaluadores', 'guardarCurriculum', 'control-evaluador', '2019-02-15 02:53:13', NULL, NULL),
(1377, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 02:53:13', NULL, NULL),
(1378, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 02:59:03', NULL, NULL),
(1379, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 02:59:04', NULL, NULL),
(1380, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 03:25:08', NULL, NULL),
(1381, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 03:25:08', NULL, NULL),
(1382, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 05:53:00', NULL, NULL),
(1383, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 05:53:29', NULL, NULL),
(1384, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 05:53:41', NULL, NULL),
(1385, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 05:53:58', NULL, NULL),
(1386, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-15 05:54:04', NULL, NULL),
(1387, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 23:00:50', NULL, NULL),
(1388, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 23:00:52', NULL, NULL),
(1389, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 23:01:26', NULL, NULL),
(1390, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 23:01:27', NULL, NULL),
(1391, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-15 23:01:45', NULL, NULL),
(1392, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-15 23:11:54', NULL, NULL),
(1393, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-15 23:11:55', NULL, NULL),
(1394, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-15 23:11:59', NULL, NULL),
(1395, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-15 23:12:00', NULL, NULL),
(1396, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-16 00:52:26', NULL, NULL),
(1397, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-16 00:52:27', NULL, NULL),
(1398, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-16 00:52:30', NULL, NULL),
(1399, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-16 00:52:30', NULL, NULL),
(1400, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-16 00:53:43', NULL, NULL),
(1401, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-02-16 00:53:44', NULL, NULL),
(1402, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-16 00:54:55', NULL, NULL),
(1403, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-16 00:54:55', NULL, NULL),
(1404, 2, 'planteles', 'plantelesActivos', 'control-plantel', '2019-02-16 00:54:59', NULL, NULL),
(1405, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-16 04:24:18', NULL, NULL),
(1406, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-16 04:24:18', NULL, NULL),
(1407, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-16 04:24:24', NULL, NULL),
(1408, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-16 04:24:24', NULL, NULL),
(1409, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-16 04:30:49', NULL, NULL),
(1410, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-16 04:30:56', NULL, NULL),
(1411, -1, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-02-16 04:32:19', NULL, NULL),
(1412, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-16 04:32:33', NULL, NULL),
(1413, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-02-16 04:32:33', NULL, NULL),
(1414, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 02:05:54', NULL, NULL),
(1415, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 02:06:11', NULL, NULL),
(1416, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 02:06:13', NULL, NULL),
(1417, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:06:16', NULL, NULL),
(1418, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:06:24', NULL, NULL),
(1419, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:06:28', NULL, NULL),
(1420, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:06:31', NULL, NULL),
(1421, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:06:32', NULL, NULL),
(1422, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:07:09', NULL, NULL),
(1423, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:07:12', NULL, NULL),
(1424, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:07:13', NULL, NULL),
(1425, 6, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-19 02:07:27', NULL, NULL),
(1426, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:07:36', NULL, NULL),
(1427, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 02:07:41', NULL, NULL),
(1428, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:07:44', NULL, NULL),
(1429, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:07:49', NULL, NULL),
(1430, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:07:51', NULL, NULL),
(1431, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:07:52', NULL, NULL),
(1432, 6, 'planteles', 'consultarId', 'control-plantel', '2019-02-19 02:07:58', NULL, NULL),
(1433, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:08:03', NULL, NULL),
(1434, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:08:12', NULL, NULL),
(1435, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:08:15', NULL, NULL),
(1436, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:08:16', NULL, NULL),
(1437, 6, 'planteles', 'consultarId', 'control-plantel', '2019-02-19 02:08:20', NULL, NULL),
(1438, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:11:14', NULL, NULL),
(1439, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:11:15', NULL, NULL),
(1440, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:11:17', NULL, NULL),
(1441, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:11:18', NULL, NULL),
(1442, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:11:22', NULL, NULL),
(1443, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:35:03', NULL, NULL),
(1444, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:35:39', NULL, NULL),
(1445, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:43:46', NULL, NULL),
(1446, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:27', NULL, NULL),
(1447, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:38', NULL, NULL),
(1448, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:41', NULL, NULL),
(1449, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:50:42', NULL, NULL),
(1450, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:43', NULL, NULL),
(1451, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:47', NULL, NULL),
(1452, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:54', NULL, NULL),
(1453, 6, 'instituciones', 'guardar', 'control-institucion', '2019-02-19 02:50:56', NULL, NULL),
(1454, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:50:56', NULL, NULL),
(1455, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:51:00', NULL, NULL),
(1456, 6, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-19 02:54:01', NULL, NULL),
(1457, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:59:34', NULL, NULL),
(1458, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 02:59:35', NULL, NULL),
(1459, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 03:00:03', NULL, NULL),
(1460, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 03:00:14', NULL, NULL),
(1461, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 03:00:22', NULL, NULL),
(1462, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 03:00:23', NULL, NULL),
(1463, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-19 03:00:27', NULL, NULL),
(1464, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-19 03:00:27', NULL, NULL),
(1465, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-19 03:00:28', NULL, NULL),
(1466, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 03:00:34', NULL, NULL),
(1467, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-19 03:22:24', NULL, NULL),
(1468, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-19 03:28:16', NULL, NULL),
(1469, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-19 03:28:16', NULL, NULL),
(1470, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-19 03:28:16', NULL, NULL),
(1471, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-19 03:28:32', NULL, NULL),
(1472, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-19 03:28:32', NULL, NULL),
(1473, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-19 03:28:32', NULL, NULL),
(1474, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-19 03:28:32', NULL, NULL),
(1475, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-19 03:28:32', NULL, NULL),
(1476, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-19 03:28:32', NULL, NULL),
(1477, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-19 03:28:33', NULL, NULL),
(1478, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 06:19:40', NULL, NULL),
(1479, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 06:19:41', NULL, NULL),
(1480, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 06:26:29', NULL, NULL),
(1481, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 06:26:30', NULL, NULL),
(1482, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-19 06:26:33', NULL, NULL),
(1483, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-19 06:26:33', NULL, NULL),
(1484, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 06:28:41', NULL, NULL),
(1485, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 06:28:42', NULL, NULL),
(1486, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:16:16', NULL, NULL),
(1487, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:16:17', NULL, NULL),
(1488, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-19 23:16:34', NULL, NULL),
(1489, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-19 23:16:34', NULL, NULL),
(1490, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:18:06', NULL, NULL),
(1491, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:18:06', NULL, NULL),
(1492, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-19 23:18:20', NULL, NULL),
(1493, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-19 23:18:20', NULL, NULL),
(1494, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-19 23:18:20', NULL, NULL),
(1495, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-19 23:18:20', NULL, NULL),
(1496, 3, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-19 23:18:20', NULL, NULL),
(1497, 3, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-19 23:18:20', NULL, NULL),
(1498, 3, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-02-19 23:18:20', NULL, NULL),
(1499, 3, 'programas', 'modificacionPrograma', 'control-programa', '2019-02-19 23:18:21', NULL, NULL),
(1500, 3, 'instituciones', 'consultarTodos', 'control-institucion', '2019-02-19 23:18:35', NULL, NULL),
(1501, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:19:33', NULL, NULL),
(1502, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-19 23:19:40', NULL, NULL),
(1503, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:19:54', NULL, NULL),
(1504, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:20:11', NULL, NULL),
(1505, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:20:23', NULL, NULL),
(1506, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:20:24', NULL, NULL),
(1507, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:22:07', NULL, NULL),
(1508, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:22:08', NULL, NULL),
(1509, 3, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-02-19 23:29:37', NULL, NULL),
(1510, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:29:37', NULL, NULL),
(1511, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:32:40', NULL, NULL),
(1512, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-19 23:32:51', NULL, NULL),
(1513, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:33:04', NULL, NULL),
(1514, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:33:05', NULL, NULL),
(1515, -1, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-02-19 23:47:48', NULL, NULL),
(1516, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:48:02', NULL, NULL),
(1517, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:48:05', NULL, NULL),
(1518, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:48:23', NULL, NULL),
(1519, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:48:23', NULL, NULL),
(1520, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-02-19 23:48:26', NULL, NULL),
(1521, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-02-19 23:52:09', NULL, NULL),
(1522, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:54:20', NULL, NULL),
(1523, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:54:20', NULL, NULL),
(1524, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:54:37', NULL, NULL),
(1525, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:54:38', NULL, NULL),
(1526, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-02-19 23:54:41', NULL, NULL),
(1527, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:55:05', NULL, NULL),
(1528, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:55:05', NULL, NULL),
(1529, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-19 23:55:09', NULL, NULL),
(1530, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-19 23:55:09', NULL, NULL),
(1531, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:55:33', NULL, NULL),
(1532, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:55:34', NULL, NULL),
(1533, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-19 23:55:54', NULL, NULL),
(1534, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-02-19 23:55:54', NULL, NULL),
(1535, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-02-19 23:56:02', NULL, NULL),
(1536, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-19 23:56:26', NULL, NULL),
(1537, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-19 23:56:26', NULL, NULL),
(1538, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-02-19 23:56:26', NULL, NULL),
(1539, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-20 00:04:08', NULL, NULL),
(1540, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-02-20 00:04:09', NULL, NULL);
INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1541, 11, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-20 00:05:18', NULL, NULL),
(1542, 11, 'usuarios', 'consultarId', 'control-usuario', '2019-02-20 00:05:19', NULL, NULL),
(1543, 11, 'usuarios', 'guardar', 'control-usuario', '2019-02-20 00:05:19', NULL, NULL),
(1544, 11, 'usuarios', 'consultarId', 'control-usuario', '2019-02-20 00:05:19', NULL, NULL),
(1545, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-20 00:05:26', NULL, NULL),
(1546, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-20 00:05:26', NULL, NULL),
(1547, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-20 00:05:26', NULL, NULL),
(1548, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-20 00:05:26', NULL, NULL),
(1549, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-02-20 00:05:26', NULL, NULL),
(1550, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-02-20 00:05:26', NULL, NULL),
(1551, 11, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-02-20 00:05:26', NULL, NULL),
(1552, 11, 'instituciones', 'consultarTodos', 'control-institucion', '2019-02-20 00:05:43', NULL, NULL),
(1553, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:19:55', NULL, NULL),
(1554, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:19:56', NULL, NULL),
(1555, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:20:21', NULL, NULL),
(1556, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:20:22', NULL, NULL),
(1557, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:21:18', NULL, NULL),
(1558, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:21:18', NULL, NULL),
(1559, -1, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:21:19', NULL, NULL),
(1560, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:21:27', NULL, NULL),
(1561, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:21:28', NULL, NULL),
(1562, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:21:48', NULL, NULL),
(1563, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:21:48', NULL, NULL),
(1564, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:22:04', NULL, NULL),
(1565, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:22:04', NULL, NULL),
(1566, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:22:37', NULL, NULL),
(1567, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:22:37', NULL, NULL),
(1568, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:22:41', NULL, NULL),
(1569, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:22:42', NULL, NULL),
(1570, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:22:49', NULL, NULL),
(1571, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:22:50', NULL, NULL),
(1572, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:22:52', NULL, NULL),
(1573, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:22:53', NULL, NULL),
(1574, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:23:16', NULL, NULL),
(1575, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:23:16', NULL, NULL),
(1576, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:23:52', NULL, NULL),
(1577, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:23:52', NULL, NULL),
(1578, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:24:14', NULL, NULL),
(1579, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:24:14', NULL, NULL),
(1580, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:24:53', NULL, NULL),
(1581, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:24:53', NULL, NULL),
(1582, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:24:53', NULL, NULL),
(1583, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:25:01', NULL, NULL),
(1584, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:25:01', NULL, NULL),
(1585, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:25:04', NULL, NULL),
(1586, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:25:04', NULL, NULL),
(1587, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:25:19', NULL, NULL),
(1588, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:25:19', NULL, NULL),
(1589, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:25:20', NULL, NULL),
(1590, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:25:27', NULL, NULL),
(1591, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:25:27', NULL, NULL),
(1592, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:25:29', NULL, NULL),
(1593, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:25:29', NULL, NULL),
(1594, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-21 23:25:38', NULL, NULL),
(1595, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:25:38', NULL, NULL),
(1596, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:25:39', NULL, NULL),
(1597, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:26:40', NULL, NULL),
(1598, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:26:41', NULL, NULL),
(1599, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:26:41', NULL, NULL),
(1600, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:26:43', NULL, NULL),
(1601, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:27:45', NULL, NULL),
(1602, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:27:46', NULL, NULL),
(1603, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:27:46', NULL, NULL),
(1604, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:28:32', NULL, NULL),
(1605, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:28:35', NULL, NULL),
(1606, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:28:35', NULL, NULL),
(1607, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:29:49', NULL, NULL),
(1608, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:29:50', NULL, NULL),
(1609, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:29:52', NULL, NULL),
(1610, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:29:52', NULL, NULL),
(1611, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:29:55', NULL, NULL),
(1612, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:29:55', NULL, NULL),
(1613, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:30:04', NULL, NULL),
(1614, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:30:04', NULL, NULL),
(1615, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-21 23:30:10', NULL, NULL),
(1616, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:30:10', NULL, NULL),
(1617, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:30:12', NULL, NULL),
(1618, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:30:52', NULL, NULL),
(1619, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:30:52', NULL, NULL),
(1620, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:30:52', NULL, NULL),
(1621, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:32:21', NULL, NULL),
(1622, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:32:21', NULL, NULL),
(1623, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:32:24', NULL, NULL),
(1624, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:32:24', NULL, NULL),
(1625, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-21 23:33:37', NULL, NULL),
(1626, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:33:37', NULL, NULL),
(1627, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:33:43', NULL, NULL),
(1628, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:35:04', NULL, NULL),
(1629, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:35:05', NULL, NULL),
(1630, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:35:14', NULL, NULL),
(1631, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:35:14', NULL, NULL),
(1632, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:35:34', NULL, NULL),
(1633, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:35:34', NULL, NULL),
(1634, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:35:37', NULL, NULL),
(1635, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:35:37', NULL, NULL),
(1636, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:35:50', NULL, NULL),
(1637, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:36:44', NULL, NULL),
(1638, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:36:45', NULL, NULL),
(1639, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:37:07', NULL, NULL),
(1640, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:37:07', NULL, NULL),
(1641, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:39:53', NULL, NULL),
(1642, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:40:42', NULL, NULL),
(1643, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:40:42', NULL, NULL),
(1644, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:40:43', NULL, NULL),
(1645, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:42:13', NULL, NULL),
(1646, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:42:46', NULL, NULL),
(1647, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:42:56', NULL, NULL),
(1648, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-21 23:43:04', NULL, NULL),
(1649, 2, 'usuarios', 'guardar', 'control-usuario', '2019-02-21 23:43:30', NULL, NULL),
(1650, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:43:31', NULL, NULL),
(1651, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-21 23:43:37', NULL, NULL),
(1652, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:43:37', NULL, NULL),
(1653, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:43:40', NULL, NULL),
(1654, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:44:56', NULL, NULL),
(1655, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:44:57', NULL, NULL),
(1656, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-21 23:46:01', NULL, NULL),
(1657, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-21 23:46:01', NULL, NULL),
(1658, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-21 23:46:01', NULL, NULL),
(1659, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:46:22', NULL, NULL),
(1660, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:46:22', NULL, NULL),
(1661, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:46:23', NULL, NULL),
(1662, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-21 23:47:03', NULL, NULL),
(1663, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:47:05', NULL, NULL),
(1664, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-21 23:47:06', NULL, NULL),
(1665, 24, 'usuarios', 'guardar', 'control-usuario', '2019-02-22 00:11:05', NULL, NULL),
(1666, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:11:05', NULL, NULL),
(1667, -1, 'usuarios', 'registro', 'control-usuario', '2019-02-22 00:23:22', NULL, NULL),
(1668, -1, 'instituciones', 'guardarPrimeraVez', 'control-institucion', '2019-02-22 00:25:07', NULL, NULL),
(1669, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 00:26:26', NULL, NULL),
(1670, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 00:26:41', NULL, NULL),
(1671, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 00:26:55', NULL, NULL),
(1672, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 00:27:16', NULL, NULL),
(1673, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:27:17', NULL, NULL),
(1674, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:27:18', NULL, NULL),
(1675, 20, 'instituciones', 'guardarPrimeraVez', 'control-institucion', '2019-02-22 00:31:03', NULL, NULL),
(1676, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:31:07', NULL, NULL),
(1677, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:33:41', NULL, NULL),
(1678, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 00:33:41', NULL, NULL),
(1679, -1, 'personas', 'consultarId', 'control-persona', '2019-02-22 00:33:42', NULL, NULL),
(1680, -1, 'personas', 'guardar', 'control-persona', '2019-02-22 00:37:08', NULL, NULL),
(1681, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:37:12', NULL, NULL),
(1682, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 00:37:47', NULL, NULL),
(1683, 20, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 00:37:47', NULL, NULL),
(1684, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 00:38:19', NULL, NULL),
(1685, 20, 'usuarios', 'registro', 'control-usuario', '2019-02-22 00:40:25', NULL, NULL),
(1686, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 00:40:26', NULL, NULL),
(1687, 20, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 00:40:26', NULL, NULL),
(1688, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:40:58', NULL, NULL),
(1689, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:41:07', NULL, NULL),
(1690, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:41:41', NULL, NULL),
(1691, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-02-22 00:42:00', NULL, NULL),
(1692, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 00:42:01', NULL, NULL),
(1693, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 00:42:01', NULL, NULL),
(1694, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 00:42:01', NULL, NULL),
(1695, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:42:13', NULL, NULL),
(1696, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:42:15', NULL, NULL),
(1697, 20, 'instituciones', 'guardar', 'control-institucion', '2019-02-22 00:44:06', NULL, NULL),
(1698, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:44:07', NULL, NULL),
(1699, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 00:44:19', NULL, NULL),
(1700, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 00:46:46', NULL, NULL),
(1701, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 00:51:47', NULL, NULL),
(1702, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 00:52:08', NULL, NULL),
(1703, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 00:52:20', NULL, NULL),
(1704, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 00:52:23', NULL, NULL),
(1705, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 00:52:32', NULL, NULL),
(1706, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 00:52:36', NULL, NULL),
(1707, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:00:06', NULL, NULL),
(1708, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:00:08', NULL, NULL),
(1709, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:00:15', NULL, NULL),
(1710, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:00:18', NULL, NULL),
(1711, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:00:46', NULL, NULL),
(1712, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:00:49', NULL, NULL),
(1713, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:00:49', NULL, NULL),
(1714, -1, 'personas', 'consultarId', 'control-persona', '2019-02-22 01:00:49', NULL, NULL),
(1715, -1, 'personas', 'guardar', 'control-persona', '2019-02-22 01:00:56', NULL, NULL),
(1716, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:00:56', NULL, NULL),
(1717, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:01:04', NULL, NULL),
(1718, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:01:06', NULL, NULL),
(1719, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:01:38', NULL, NULL),
(1720, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:01:55', NULL, NULL),
(1721, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:02:31', NULL, NULL),
(1722, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:02:36', NULL, NULL),
(1723, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:02:52', NULL, NULL),
(1724, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:02:53', NULL, NULL),
(1725, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 01:02:56', NULL, NULL),
(1726, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:02:56', NULL, NULL),
(1727, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:02:57', NULL, NULL),
(1728, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:03:03', NULL, NULL),
(1729, 6, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:03:05', NULL, NULL),
(1730, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:04:24', NULL, NULL),
(1731, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:05:56', NULL, NULL),
(1732, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:05:57', NULL, NULL),
(1733, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:06:10', NULL, NULL),
(1734, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:07:19', NULL, NULL),
(1735, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:07:23', NULL, NULL),
(1736, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:07:23', NULL, NULL),
(1737, -1, 'personas', 'consultarId', 'control-persona', '2019-02-22 01:07:23', NULL, NULL),
(1738, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 01:07:57', NULL, NULL),
(1739, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:07:57', NULL, NULL),
(1740, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:07:57', NULL, NULL),
(1741, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-22 01:08:11', NULL, NULL),
(1742, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:08:11', NULL, NULL),
(1743, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-22 01:08:11', NULL, NULL),
(1744, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-22 01:08:11', NULL, NULL),
(1745, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:08:11', NULL, NULL),
(1746, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-22 01:08:11', NULL, NULL),
(1747, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-22 01:08:12', NULL, NULL),
(1748, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:10:27', NULL, NULL),
(1749, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:10:46', NULL, NULL),
(1750, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:10:48', NULL, NULL),
(1751, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:10:54', NULL, NULL),
(1752, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:10:57', NULL, NULL),
(1753, -1, 'personas', 'guardar', 'control-persona', '2019-02-22 01:12:38', NULL, NULL),
(1754, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:12:39', NULL, NULL),
(1755, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:13:23', NULL, NULL),
(1756, 24, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:13:23', NULL, NULL),
(1757, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:13:40', NULL, NULL),
(1758, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:14:49', NULL, NULL),
(1759, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:14:54', NULL, NULL),
(1760, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:17:52', NULL, NULL),
(1761, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:18:50', NULL, NULL),
(1762, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:19:43', NULL, NULL),
(1763, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:20:09', NULL, NULL),
(1764, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:20:10', NULL, NULL),
(1765, 6, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:20:15', NULL, NULL),
(1766, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 01:20:18', NULL, NULL),
(1767, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:20:18', NULL, NULL),
(1768, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:20:18', NULL, NULL),
(1769, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-22 01:20:30', NULL, NULL),
(1770, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-22 01:20:30', NULL, NULL),
(1771, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:20:30', NULL, NULL),
(1772, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-22 01:20:30', NULL, NULL),
(1773, 6, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-22 01:20:30', NULL, NULL),
(1774, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:20:30', NULL, NULL),
(1775, 6, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-22 01:20:31', NULL, NULL),
(1776, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:21:02', NULL, NULL),
(1777, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:21:20', NULL, NULL),
(1778, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:21:20', NULL, NULL),
(1779, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:21:24', NULL, NULL),
(1780, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:21:26', NULL, NULL),
(1781, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:21:40', NULL, NULL),
(1782, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:21:44', NULL, NULL),
(1783, 20, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:21:44', NULL, NULL),
(1784, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:21:47', NULL, NULL),
(1785, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:21:48', NULL, NULL),
(1786, 20, 'usuarios', 'registro', 'control-usuario', '2019-02-22 01:21:59', NULL, NULL),
(1787, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:22:00', NULL, NULL),
(1788, 20, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:22:00', NULL, NULL),
(1789, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:22:03', NULL, NULL),
(1790, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:22:05', NULL, NULL),
(1791, 20, 'instituciones', 'guardar', 'control-institucion', '2019-02-22 01:22:09', NULL, NULL),
(1792, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:22:10', NULL, NULL),
(1793, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:22:14', NULL, NULL),
(1794, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-02-22 01:23:00', NULL, NULL),
(1795, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 01:23:00', NULL, NULL),
(1796, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:23:00', NULL, NULL),
(1797, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:23:00', NULL, NULL),
(1798, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-22 01:23:08', NULL, NULL),
(1799, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:23:08', NULL, NULL),
(1800, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-22 01:23:08', NULL, NULL),
(1801, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:23:08', NULL, NULL),
(1802, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-22 01:23:08', NULL, NULL),
(1803, 20, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-22 01:23:08', NULL, NULL),
(1804, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:23:13', NULL, NULL),
(1805, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:23:15', NULL, NULL),
(1806, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:23:44', NULL, NULL),
(1807, 20, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:23:44', NULL, NULL),
(1808, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:24:06', NULL, NULL),
(1809, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:24:18', NULL, NULL),
(1810, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:24:33', NULL, NULL),
(1811, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:24:33', NULL, NULL),
(1812, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:24:36', NULL, NULL),
(1813, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:24:37', NULL, NULL),
(1814, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:24:46', NULL, NULL),
(1815, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:24:46', NULL, NULL),
(1816, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:24:51', NULL, NULL),
(1817, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:24:51', NULL, NULL),
(1818, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:25:16', NULL, NULL),
(1819, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:25:17', NULL, NULL),
(1820, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:25:20', NULL, NULL),
(1821, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:25:20', NULL, NULL),
(1822, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:25:26', NULL, NULL),
(1823, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:25:26', NULL, NULL),
(1824, 2, 'usuarios', 'registro', 'control-usuario', '2019-02-22 01:25:30', NULL, NULL),
(1825, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:25:30', NULL, NULL),
(1826, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:25:31', NULL, NULL),
(1827, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:25:51', NULL, NULL),
(1828, 20, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-22 01:25:52', NULL, NULL),
(1829, 27, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:26:32', NULL, NULL),
(1830, 27, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:26:34', NULL, NULL),
(1831, 27, 'usuarios', 'guardar', 'control-usuario', '2019-02-22 01:26:34', NULL, NULL),
(1832, 27, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:26:35', NULL, NULL),
(1833, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:26:38', NULL, NULL),
(1834, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:26:38', NULL, NULL),
(1835, 27, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-02-22 01:26:44', NULL, NULL),
(1836, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 01:26:45', NULL, NULL),
(1837, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:26:45', NULL, NULL),
(1838, 27, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:26:45', NULL, NULL),
(1839, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:27:10', NULL, NULL),
(1840, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:27:11', NULL, NULL),
(1841, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:27:21', NULL, NULL),
(1842, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 01:28:08', NULL, NULL),
(1843, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:28:09', NULL, NULL),
(1844, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:28:09', NULL, NULL),
(1845, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:28:11', NULL, NULL),
(1846, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:28:14', NULL, NULL),
(1847, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:28:16', NULL, NULL),
(1848, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-22 01:28:16', NULL, NULL),
(1849, -1, 'personas', 'consultarId', 'control-persona', '2019-02-22 01:28:16', NULL, NULL),
(1850, -1, 'personas', 'guardar', 'control-persona', '2019-02-22 01:28:20', NULL, NULL),
(1851, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 01:28:21', NULL, NULL),
(1852, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:28:27', NULL, NULL),
(1853, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:28:29', NULL, NULL),
(1854, 20, 'instituciones', 'guardar', 'control-institucion', '2019-02-22 01:29:31', NULL, NULL),
(1855, 20, 'instituciones', 'guardar', 'control-institucion', '2019-02-22 01:29:32', NULL, NULL),
(1856, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:29:33', NULL, NULL),
(1857, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:29:33', NULL, NULL),
(1858, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:29:35', NULL, NULL),
(1859, 20, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:29:41', NULL, NULL),
(1860, 24, 'instituciones', 'guardar', 'control-institucion', '2019-02-22 01:32:50', NULL, NULL),
(1861, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:32:50', NULL, NULL),
(1862, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:33:12', NULL, NULL),
(1863, 20, 'planteles', 'guardarInformacion', 'control-plantel', '2019-02-22 01:34:33', NULL, NULL),
(1864, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:34:34', NULL, NULL),
(1865, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 01:35:21', NULL, NULL),
(1866, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-02-22 01:35:21', NULL, NULL),
(1867, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:35:21', NULL, NULL),
(1868, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:35:22', NULL, NULL),
(1869, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-22 01:35:47', NULL, NULL),
(1870, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 01:35:47', NULL, NULL),
(1871, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-22 01:35:47', NULL, NULL),
(1872, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-22 01:35:47', NULL, NULL),
(1873, 20, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-22 01:35:47', NULL, NULL),
(1874, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 01:35:47', NULL, NULL),
(1875, 20, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-22 01:35:48', NULL, NULL),
(1876, 24, 'instituciones', 'guardar', 'control-institucion', '2019-02-22 01:37:17', NULL, NULL),
(1877, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 01:37:17', NULL, NULL),
(1878, 24, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 01:39:22', NULL, NULL),
(1879, 24, 'planteles', 'guardarInformacion', 'control-plantel', '2019-02-22 02:18:08', NULL, NULL),
(1880, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 02:18:09', NULL, NULL),
(1881, 24, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 02:19:33', NULL, NULL),
(1882, -1, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-02-22 02:23:20', NULL, NULL),
(1883, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-22 02:24:10', NULL, NULL),
(1884, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-02-22 02:24:15', NULL, NULL),
(1885, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-02-22 02:24:20', NULL, NULL),
(1886, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 02:24:20', NULL, NULL),
(1887, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 02:24:20', NULL, NULL),
(1888, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 02:24:20', NULL, NULL),
(1889, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 02:34:01', NULL, NULL),
(1890, 24, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-02-22 02:34:07', NULL, NULL),
(1891, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-02-22 02:44:01', NULL, NULL),
(1892, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-02-22 02:44:44', NULL, NULL),
(1893, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-22 02:44:45', NULL, NULL),
(1894, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 02:44:45', NULL, NULL),
(1895, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 02:44:46', NULL, NULL),
(1896, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-02-22 02:45:40', NULL, NULL),
(1897, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-02-22 02:45:40', NULL, NULL),
(1898, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-22 02:45:40', NULL, NULL),
(1899, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-02-22 02:45:40', NULL, NULL),
(1900, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-02-22 02:45:40', NULL, NULL),
(1901, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-22 02:45:41', NULL, NULL),
(1902, 24, 'planteles', 'plantelPorId', 'control-plantel', '2019-02-22 02:45:41', NULL, NULL),
(1903, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:35:19', NULL, NULL),
(1904, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:35:23', NULL, NULL),
(1905, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:35:29', NULL, NULL),
(1906, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:35:33', NULL, NULL),
(1907, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:35:37', NULL, NULL),
(1908, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:47:28', NULL, NULL),
(1909, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 00:47:29', NULL, NULL),
(1910, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:53:43', NULL, NULL),
(1911, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:53:48', NULL, NULL),
(1912, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:55:59', NULL, NULL),
(1913, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 00:56:00', NULL, NULL),
(1914, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-02-26 00:56:07', NULL, NULL),
(1915, -1, 'pagos', 'consultarTodosTabla', 'control-pago', '2019-02-26 00:56:07', NULL, NULL),
(1916, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:56:44', NULL, NULL),
(1917, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 00:56:51', NULL, NULL),
(1918, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:08:11', NULL, NULL),
(1919, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 01:08:11', NULL, NULL),
(1920, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-02-26 01:08:15', NULL, NULL),
(1921, -1, 'pagos', 'consultarTodosTabla', 'control-pago', '2019-02-26 01:08:15', NULL, NULL),
(1922, -1, 'pagos', 'consultarSolucitudesUsuario', 'control-pago', '2019-02-26 01:08:33', NULL, NULL),
(1923, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:12:03', NULL, NULL),
(1924, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:12:10', NULL, NULL),
(1925, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:12:18', NULL, NULL),
(1926, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:12:40', NULL, NULL),
(1927, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:13:25', NULL, NULL),
(1928, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:13:38', NULL, NULL),
(1929, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:14:07', NULL, NULL),
(1930, 6, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:14:30', NULL, NULL),
(1931, 6, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 01:14:31', NULL, NULL),
(1932, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-26 01:14:42', NULL, NULL),
(1933, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-26 01:14:42', NULL, NULL),
(1934, 6, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-26 01:14:42', NULL, NULL),
(1935, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:16:04', NULL, NULL),
(1936, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:16:08', NULL, NULL),
(1937, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 01:16:19', NULL, NULL),
(1938, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 01:16:20', NULL, NULL),
(1939, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-02-26 01:16:24', NULL, NULL),
(1940, -1, 'pagos', 'consultarTodosTabla', 'control-pago', '2019-02-26 01:16:24', NULL, NULL),
(1941, -1, 'pagos', 'consultarSolucitudesUsuario', 'control-pago', '2019-02-26 01:16:27', NULL, NULL),
(1942, 2, 'planteles', 'plantelesActivos', 'control-plantel', '2019-02-26 01:25:01', NULL, NULL),
(1943, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-02-26 01:31:51', NULL, NULL),
(1944, -1, 'pagos', 'consultarTodosTabla', 'control-pago', '2019-02-26 01:31:52', NULL, NULL),
(1945, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 22:59:24', NULL, NULL),
(1946, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 22:59:37', NULL, NULL),
(1947, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:00:13', NULL, NULL),
(1948, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:00:19', NULL, NULL),
(1949, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:00:33', NULL, NULL),
(1950, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:00:40', NULL, NULL),
(1951, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:00:52', NULL, NULL),
(1952, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:01:08', NULL, NULL),
(1953, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 23:01:09', NULL, NULL),
(1954, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-26 23:01:20', NULL, NULL),
(1955, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-26 23:01:21', NULL, NULL),
(1956, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:01:55', NULL, NULL),
(1957, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:02:03', NULL, NULL),
(1958, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 23:02:03', NULL, NULL),
(1959, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-26 23:02:06', NULL, NULL),
(1960, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-26 23:02:06', NULL, NULL),
(1961, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:02:32', NULL, NULL),
(1962, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:02:42', NULL, NULL),
(1963, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:03:23', NULL, NULL),
(1964, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-26 23:03:36', NULL, NULL),
(1965, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:04:55', NULL, NULL),
(1966, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:05:02', NULL, NULL),
(1967, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:05:09', NULL, NULL),
(1968, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:05:20', NULL, NULL),
(1969, -1, 'usuarios', 'restablecerContrasena', 'control-usuario', '2019-02-26 23:06:04', NULL, NULL),
(1970, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-26 23:06:23', NULL, NULL),
(1971, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-02-26 23:06:24', NULL, NULL),
(1972, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-02-26 23:52:45', NULL, NULL),
(1973, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-02-26 23:52:46', NULL, NULL),
(1974, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-02-26 23:52:46', NULL, NULL),
(1975, -1, 'usuarios', 'registro', 'control-usuario', '2019-02-28 01:02:43', NULL, NULL),
(1976, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 01:04:00', NULL, NULL),
(1977, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 01:04:01', NULL, NULL),
(1978, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-28 01:04:54', NULL, NULL),
(1979, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-28 01:04:54', NULL, NULL),
(1980, 2, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 01:05:00', NULL, NULL),
(1981, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-28 01:05:00', NULL, NULL),
(1982, 28, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 01:05:14', NULL, NULL),
(1983, 28, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 01:05:15', NULL, NULL),
(1984, 28, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 01:05:15', NULL, NULL),
(1985, 2, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 01:07:35', NULL, NULL),
(1986, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-28 01:07:35', NULL, NULL),
(1987, 2, 'usuarios', 'eliminar', 'control-usuario', '2019-02-28 01:07:39', NULL, NULL),
(1988, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-28 01:07:39', NULL, NULL),
(1989, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:45:33', NULL, NULL),
(1990, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:45:50', NULL, NULL),
(1991, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:45:59', NULL, NULL),
(1992, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:46:12', NULL, NULL),
(1993, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:46:25', NULL, NULL),
(1994, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 02:46:25', NULL, NULL),
(1995, -1, 'roles', 'consultarTodos', 'control-rol', '2019-02-28 02:46:28', NULL, NULL),
(1996, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-02-28 02:46:29', NULL, NULL),
(1997, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:47:27', NULL, NULL),
(1998, -1, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 02:47:29', NULL, NULL),
(1999, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-02-28 02:47:30', NULL, NULL),
(2000, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:47:34', NULL, NULL),
(2001, -1, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 02:48:03', NULL, NULL),
(2002, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:48:30', NULL, NULL),
(2003, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:48:40', NULL, NULL),
(2004, -1, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 02:48:40', NULL, NULL),
(2005, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-02-28 02:48:41', NULL, NULL),
(2006, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 02:48:44', NULL, NULL),
(2007, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-02-28 02:48:48', NULL, NULL),
(2008, -1, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-02-28 02:48:48', NULL, NULL),
(2009, -1, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-02-28 02:48:49', NULL, NULL),
(2010, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-02-28 02:49:11', NULL, NULL),
(2011, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-02-28 02:49:14', NULL, NULL),
(2012, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 03:58:51', NULL, NULL),
(2013, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:15:29', NULL, NULL),
(2014, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:15:37', NULL, NULL),
(2015, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:15:52', NULL, NULL),
(2016, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:16:02', NULL, NULL),
(2017, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:16:21', NULL, NULL),
(2018, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 04:16:22', NULL, NULL),
(2019, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:16:36', NULL, NULL),
(2020, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 04:16:36', NULL, NULL),
(2021, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:17:20', NULL, NULL),
(2022, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 04:17:21', NULL, NULL),
(2023, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:17:33', NULL, NULL),
(2024, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:17:58', NULL, NULL),
(2025, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-02-28 04:18:09', NULL, NULL),
(2026, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:25:44', NULL, NULL),
(2027, 15, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 04:25:44', NULL, NULL),
(2028, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-02-28 04:25:44', NULL, NULL),
(2029, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:25:50', NULL, NULL),
(2030, 15, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-02-28 04:25:56', NULL, NULL),
(2031, 15, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-02-28 04:25:56', NULL, NULL),
(2032, 15, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-02-28 04:25:56', NULL, NULL),
(2033, 15, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-02-28 04:26:00', NULL, NULL),
(2034, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-02-28 04:26:04', NULL, NULL),
(2035, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2019-02-28 04:26:07', NULL, NULL),
(2036, -1, 'inspecciones', 'inspeccionesInstitucion', 'control-inspeccion', '2019-02-28 04:26:07', NULL, NULL),
(2037, -1, 'inspecciones', 'detallesInspeccion', 'control-inspeccion', '2019-02-28 04:26:07', NULL, NULL),
(2038, -1, 'inspecciones', 'detallesInspeccion', 'control-inspeccion', '2019-02-28 04:26:10', NULL, NULL),
(2039, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-02-28 04:26:26', NULL, NULL),
(2040, 15, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 04:27:38', NULL, NULL),
(2041, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:28:02', NULL, NULL),
(2042, 2, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 04:28:02', NULL, NULL),
(2043, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-02-28 04:28:02', NULL, NULL),
(2044, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-02-28 04:28:06', NULL, NULL),
(2045, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:28:10', NULL, NULL),
(2046, 2, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-02-28 04:28:16', NULL, NULL),
(2047, 2, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-02-28 04:28:16', NULL, NULL),
(2048, 2, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-02-28 04:28:17', NULL, NULL),
(2049, 2, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-02-28 04:28:19', NULL, NULL),
(2050, 2, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-02-28 04:28:20', NULL, NULL),
(2051, 2, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-02-28 04:28:20', NULL, NULL),
(2052, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-02-28 04:28:24', NULL, NULL),
(2053, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:29:38', NULL, NULL),
(2054, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:29:48', NULL, NULL);
INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2055, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 04:29:49', NULL, NULL),
(2056, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:30:06', NULL, NULL),
(2057, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-02-28 04:30:09', NULL, NULL),
(2058, 2, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 04:30:34', NULL, NULL),
(2059, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-02-28 04:30:50', NULL, NULL),
(2060, 12, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 04:30:50', NULL, NULL),
(2061, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-02-28 04:30:50', NULL, NULL),
(2062, 12, 'usuarios', 'guardar', 'control-usuario', '2019-02-28 04:34:08', NULL, NULL),
(2063, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-06 03:12:43', NULL, NULL),
(2064, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-06 03:12:53', NULL, NULL),
(2065, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-06 03:14:07', NULL, NULL),
(2066, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-03-06 03:14:07', NULL, NULL),
(2067, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-06 03:14:23', NULL, NULL),
(2068, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-06 03:14:23', NULL, NULL),
(2069, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-06 03:14:23', NULL, NULL),
(2070, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-06 03:14:38', NULL, NULL),
(2071, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-06 03:14:38', NULL, NULL),
(2072, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-06 03:14:38', NULL, NULL),
(2073, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-06 03:14:38', NULL, NULL),
(2074, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-06 03:14:38', NULL, NULL),
(2075, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-06 03:14:38', NULL, NULL),
(2076, 15, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-06 03:14:39', NULL, NULL),
(2077, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-06 03:14:49', NULL, NULL),
(2078, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-06 03:14:49', NULL, NULL),
(2079, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-06 03:14:49', NULL, NULL),
(2080, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-06 03:14:51', NULL, NULL),
(2081, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-06 03:14:51', NULL, NULL),
(2082, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-06 03:14:51', NULL, NULL),
(2083, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-06 03:14:51', NULL, NULL),
(2084, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-06 03:14:51', NULL, NULL),
(2085, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-06 03:14:51', NULL, NULL),
(2086, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-06 03:14:51', NULL, NULL),
(2087, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-03-06 03:15:01', NULL, NULL),
(2088, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-06 03:15:22', NULL, NULL),
(2089, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-06 03:15:23', NULL, NULL),
(2090, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-06 03:15:23', NULL, NULL),
(2091, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-06 03:15:25', NULL, NULL),
(2092, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-06 03:15:25', NULL, NULL),
(2093, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-06 03:15:25', NULL, NULL),
(2094, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-06 03:15:25', NULL, NULL),
(2095, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-06 03:15:25', NULL, NULL),
(2096, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-06 03:15:25', NULL, NULL),
(2097, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-06 03:15:25', NULL, NULL),
(2098, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 00:31:33', NULL, NULL),
(2099, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:31:36', NULL, NULL),
(2100, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 00:31:52', NULL, NULL),
(2101, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 00:31:52', NULL, NULL),
(2102, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 00:31:53', NULL, NULL),
(2103, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 00:31:53', NULL, NULL),
(2104, 2, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 00:31:53', NULL, NULL),
(2105, 2, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 00:31:53', NULL, NULL),
(2106, 2, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-07 00:31:53', NULL, NULL),
(2107, 2, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-07 00:31:53', NULL, NULL),
(2108, -1, 'usuarios', 'registro', 'control-usuario', '2019-03-07 00:35:32', NULL, NULL),
(2109, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 00:45:26', NULL, NULL),
(2110, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:45:29', NULL, NULL),
(2111, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 00:47:40', NULL, NULL),
(2112, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-07 00:47:40', NULL, NULL),
(2113, 2, 'usuarios', 'guardar', 'control-usuario', '2019-03-07 00:47:47', NULL, NULL),
(2114, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-07 00:47:47', NULL, NULL),
(2115, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 00:48:00', NULL, NULL),
(2116, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:48:01', NULL, NULL),
(2117, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:48:01', NULL, NULL),
(2118, 29, 'usuarios', 'guardar', 'control-usuario', '2019-03-07 00:48:07', NULL, NULL),
(2119, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:48:07', NULL, NULL),
(2120, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 00:48:12', NULL, NULL),
(2121, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:48:12', NULL, NULL),
(2122, -1, 'personas', 'consultarId', 'control-persona', '2019-03-07 00:48:12', NULL, NULL),
(2123, -1, 'personas', 'guardar', 'control-persona', '2019-03-07 00:58:13', NULL, NULL),
(2124, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 00:58:14', NULL, NULL),
(2125, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 00:59:20', NULL, NULL),
(2126, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 00:59:30', NULL, NULL),
(2127, 29, 'instituciones', 'guardar', 'control-institucion', '2019-03-07 01:08:46', NULL, NULL),
(2128, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 01:08:47', NULL, NULL),
(2129, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 01:09:41', NULL, NULL),
(2130, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 01:26:36', NULL, NULL),
(2131, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 01:26:55', NULL, NULL),
(2132, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 01:26:56', NULL, NULL),
(2133, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 01:27:05', NULL, NULL),
(2134, 29, 'usuarios', 'gestoresPorAsignar', 'control-usuario', '2019-03-07 01:27:07', NULL, NULL),
(2135, -1, 'planteles', 'guardarInformacion', 'control-plantel', '2019-03-07 02:03:10', NULL, NULL),
(2136, -1, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 02:03:12', NULL, NULL),
(2137, -1, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 02:07:07', NULL, NULL),
(2138, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 02:07:20', NULL, NULL),
(2139, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 02:07:21', NULL, NULL),
(2140, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 02:07:23', NULL, NULL),
(2141, 29, 'planteles', 'consultarId', 'control-plantel', '2019-03-07 02:07:26', NULL, NULL),
(2142, 29, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-07 02:07:33', NULL, NULL),
(2143, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 02:07:33', NULL, NULL),
(2144, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 02:07:33', NULL, NULL),
(2145, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 02:07:34', NULL, NULL),
(2146, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 02:08:49', NULL, NULL),
(2147, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 02:08:54', NULL, NULL),
(2148, 29, 'instituciones', 'guardar', 'control-institucion', '2019-03-07 02:09:17', NULL, NULL),
(2149, 29, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-07 02:09:20', NULL, NULL),
(2150, 29, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-07 02:09:32', NULL, NULL),
(2151, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 02:09:34', NULL, NULL),
(2152, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 02:09:34', NULL, NULL),
(2153, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 02:09:35', NULL, NULL),
(2154, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 02:10:01', NULL, NULL),
(2155, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 02:10:01', NULL, NULL),
(2156, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 02:10:01', NULL, NULL),
(2157, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 02:10:01', NULL, NULL),
(2158, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 02:10:01', NULL, NULL),
(2159, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 02:10:01', NULL, NULL),
(2160, 29, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-07 02:10:01', NULL, NULL),
(2161, -1, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-07 03:16:32', NULL, NULL),
(2162, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:16:47', NULL, NULL),
(2163, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:17:01', NULL, NULL),
(2164, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:17:02', NULL, NULL),
(2165, 29, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-07 03:17:08', NULL, NULL),
(2166, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:17:08', NULL, NULL),
(2167, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:17:08', NULL, NULL),
(2168, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:17:09', NULL, NULL),
(2169, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:17:18', NULL, NULL),
(2170, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:17:18', NULL, NULL),
(2171, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:17:18', NULL, NULL),
(2172, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:17:18', NULL, NULL),
(2173, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:17:18', NULL, NULL),
(2174, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:17:18', NULL, NULL),
(2175, 29, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-07 03:17:18', NULL, NULL),
(2176, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:17:33', NULL, NULL),
(2177, 29, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-07 03:17:33', NULL, NULL),
(2178, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:17:35', NULL, NULL),
(2179, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:17:51', NULL, NULL),
(2180, -1, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:17:52', NULL, NULL),
(2181, -1, 'usuarios', 'registro', 'control-usuario', '2019-03-07 03:18:12', NULL, NULL),
(2182, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:19:40', NULL, NULL),
(2183, 29, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-07 03:19:40', NULL, NULL),
(2184, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:19:41', NULL, NULL),
(2185, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:19:41', NULL, NULL),
(2186, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:19:53', NULL, NULL),
(2187, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:19:53', NULL, NULL),
(2188, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:19:53', NULL, NULL),
(2189, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:19:54', NULL, NULL),
(2190, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:19:54', NULL, NULL),
(2191, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:19:54', NULL, NULL),
(2192, 29, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-07 03:19:58', NULL, NULL),
(2193, 29, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-07 03:36:08', NULL, NULL),
(2194, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:36:14', NULL, NULL),
(2195, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:36:15', NULL, NULL),
(2196, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:36:15', NULL, NULL),
(2197, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:36:54', NULL, NULL),
(2198, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:36:55', NULL, NULL),
(2199, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:37:00', NULL, NULL),
(2200, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-07 03:37:00', NULL, NULL),
(2201, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:38:01', NULL, NULL),
(2202, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:38:02', NULL, NULL),
(2203, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:38:58', NULL, NULL),
(2204, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:39:00', NULL, NULL),
(2205, 29, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-07 03:39:03', NULL, NULL),
(2206, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:39:03', NULL, NULL),
(2207, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:39:03', NULL, NULL),
(2208, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:39:03', NULL, NULL),
(2209, 29, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-07 03:39:11', NULL, NULL),
(2210, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:39:11', NULL, NULL),
(2211, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:39:13', NULL, NULL),
(2212, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:39:13', NULL, NULL),
(2213, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:39:34', NULL, NULL),
(2214, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:39:35', NULL, NULL),
(2215, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:39:42', NULL, NULL),
(2216, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-07 03:39:42', NULL, NULL),
(2217, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:39:49', NULL, NULL),
(2218, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:39:49', NULL, NULL),
(2219, 2, 'usuarios', 'registro', 'control-usuario', '2019-03-07 03:39:56', NULL, NULL),
(2220, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-07 03:39:56', NULL, NULL),
(2221, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-07 03:39:57', NULL, NULL),
(2222, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:40:30', NULL, NULL),
(2223, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:40:30', NULL, NULL),
(2224, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:40:34', NULL, NULL),
(2225, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:40:34', NULL, NULL),
(2226, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:40:34', NULL, NULL),
(2227, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:40:43', NULL, NULL),
(2228, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:40:43', NULL, NULL),
(2229, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:40:43', NULL, NULL),
(2230, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:40:43', NULL, NULL),
(2231, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:40:43', NULL, NULL),
(2232, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:40:43', NULL, NULL),
(2233, 29, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-07 03:40:43', NULL, NULL),
(2234, 29, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-07 03:49:38', NULL, NULL),
(2235, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:49:39', NULL, NULL),
(2236, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:49:39', NULL, NULL),
(2237, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:49:39', NULL, NULL),
(2238, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:49:57', NULL, NULL),
(2239, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:49:57', NULL, NULL),
(2240, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:49:57', NULL, NULL),
(2241, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:49:57', NULL, NULL),
(2242, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:49:57', NULL, NULL),
(2243, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:49:57', NULL, NULL),
(2244, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-07 03:49:57', NULL, NULL),
(2245, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:50:00', NULL, NULL),
(2246, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:50:00', NULL, NULL),
(2247, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:50:00', NULL, NULL),
(2248, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:50:02', NULL, NULL),
(2249, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:50:02', NULL, NULL),
(2250, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:50:02', NULL, NULL),
(2251, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:50:02', NULL, NULL),
(2252, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:50:02', NULL, NULL),
(2253, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:50:02', NULL, NULL),
(2254, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-07 03:50:02', NULL, NULL),
(2255, 29, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-07 03:50:39', NULL, NULL),
(2256, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:50:40', NULL, NULL),
(2257, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:50:40', NULL, NULL),
(2258, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:50:40', NULL, NULL),
(2259, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:50:56', NULL, NULL),
(2260, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:50:56', NULL, NULL),
(2261, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:50:56', NULL, NULL),
(2262, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:50:56', NULL, NULL),
(2263, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:50:56', NULL, NULL),
(2264, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:50:56', NULL, NULL),
(2265, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-07 03:50:57', NULL, NULL),
(2266, 29, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-07 03:55:51', NULL, NULL),
(2267, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-07 03:55:52', NULL, NULL),
(2268, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:55:52', NULL, NULL),
(2269, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:55:53', NULL, NULL),
(2270, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 03:56:17', NULL, NULL),
(2271, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-07 03:56:17', NULL, NULL),
(2272, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-07 03:56:52', NULL, NULL),
(2273, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-07 03:56:52', NULL, NULL),
(2274, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-07 03:56:52', NULL, NULL),
(2275, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-07 03:56:52', NULL, NULL),
(2276, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-07 03:56:52', NULL, NULL),
(2277, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-07 03:56:52', NULL, NULL),
(2278, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-07 03:56:52', NULL, NULL),
(2279, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-07 03:56:52', NULL, NULL),
(2280, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-07 03:56:52', NULL, NULL),
(2281, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-07 13:10:29', NULL, NULL),
(2282, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 01:19:16', NULL, NULL),
(2283, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 01:19:16', NULL, NULL),
(2284, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-13 01:19:31', NULL, NULL),
(2285, -1, 'modulos', 'consultarTodos', 'control-modulo', '2019-03-13 01:19:31', NULL, NULL),
(2286, 2, 'modulos_roles', 'consultarTodosTabla', 'control-modulo-rol', '2019-03-13 01:19:31', NULL, NULL),
(2287, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-03-13 01:20:33', NULL, NULL),
(2288, -1, 'pagos', 'consultarTodosTabla', 'control-pago', '2019-03-13 01:20:33', NULL, NULL),
(2289, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-13 01:25:15', NULL, NULL),
(2290, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-13 01:25:15', NULL, NULL),
(2291, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 01:26:29', NULL, NULL),
(2292, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 01:26:30', NULL, NULL),
(2293, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 01:26:34', NULL, NULL),
(2294, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:26:34', NULL, NULL),
(2295, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 01:26:34', NULL, NULL),
(2296, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 01:26:45', NULL, NULL),
(2297, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 01:26:45', NULL, NULL),
(2298, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:26:45', NULL, NULL),
(2299, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 01:26:45', NULL, NULL),
(2300, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 01:26:45', NULL, NULL),
(2301, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 01:26:45', NULL, NULL),
(2302, 15, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-13 01:26:46', NULL, NULL),
(2303, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-13 01:33:43', NULL, NULL),
(2304, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 01:33:43', NULL, NULL),
(2305, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:33:43', NULL, NULL),
(2306, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 01:33:43', NULL, NULL),
(2307, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 01:33:52', NULL, NULL),
(2308, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:33:52', NULL, NULL),
(2309, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 01:33:52', NULL, NULL),
(2310, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 01:33:52', NULL, NULL),
(2311, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 01:33:52', NULL, NULL),
(2312, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 01:33:52', NULL, NULL),
(2313, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 01:33:53', NULL, NULL),
(2314, 15, 'oficios', 'guardar', 'OrdenInspección', '2019-03-13 01:33:59', NULL, NULL),
(2315, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 01:43:32', NULL, NULL),
(2316, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:43:32', NULL, NULL),
(2317, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 01:43:32', NULL, NULL),
(2318, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 01:44:17', NULL, NULL),
(2319, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 01:44:18', NULL, NULL),
(2320, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 01:51:52', NULL, NULL),
(2321, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 01:51:53', NULL, NULL),
(2322, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 01:52:54', NULL, NULL),
(2323, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:52:54', NULL, NULL),
(2324, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 01:52:54', NULL, NULL),
(2325, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 01:52:54', NULL, NULL),
(2326, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-13 01:52:54', NULL, NULL),
(2327, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 01:52:54', NULL, NULL),
(2328, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 01:52:54', NULL, NULL),
(2329, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 01:52:54', NULL, NULL),
(2330, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-13 01:52:55', NULL, NULL),
(2331, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-13 01:55:47', NULL, NULL),
(2332, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 01:55:58', NULL, NULL),
(2333, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 01:55:58', NULL, NULL),
(2334, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 01:55:58', NULL, NULL),
(2335, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 01:55:58', NULL, NULL),
(2336, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 01:55:58', NULL, NULL),
(2337, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 01:55:58', NULL, NULL),
(2338, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-13 01:55:58', NULL, NULL),
(2339, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 01:55:58', NULL, NULL),
(2340, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-13 01:55:58', NULL, NULL),
(2341, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-13 01:57:20', NULL, NULL),
(2342, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:08:26', NULL, NULL),
(2343, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:08:26', NULL, NULL),
(2344, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:08:26', NULL, NULL),
(2345, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:08:26', NULL, NULL),
(2346, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:08:27', NULL, NULL),
(2347, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-13 02:08:27', NULL, NULL),
(2348, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:08:27', NULL, NULL),
(2349, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 02:08:27', NULL, NULL),
(2350, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-13 02:08:28', NULL, NULL),
(2351, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-12 20:10:06', NULL, NULL),
(2352, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:10:15', NULL, NULL),
(2353, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:10:15', NULL, NULL),
(2354, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:10:15', NULL, NULL),
(2355, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:10:15', NULL, NULL),
(2356, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:10:15', NULL, NULL),
(2357, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 02:10:16', NULL, NULL),
(2358, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:10:16', NULL, NULL),
(2359, 8, 'solicitudes', 'agendarCita', 'control-solicitud', '2019-03-13 02:13:08', NULL, NULL),
(2360, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:14:02', NULL, NULL),
(2361, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:14:11', NULL, NULL),
(2362, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:14:11', NULL, NULL),
(2363, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:15:51', NULL, NULL),
(2364, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:15:51', NULL, NULL),
(2365, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:17:03', NULL, NULL),
(2366, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:17:17', NULL, NULL),
(2367, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:17:17', NULL, NULL),
(2368, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-03-13 02:17:21', NULL, NULL),
(2369, 29, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:19:58', NULL, NULL),
(2370, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:19:59', NULL, NULL),
(2371, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:20:05', NULL, NULL),
(2372, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:20:05', NULL, NULL),
(2373, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:20:05', NULL, NULL),
(2374, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:20:25', NULL, NULL),
(2375, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:20:25', NULL, NULL),
(2376, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:20:25', NULL, NULL),
(2377, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:20:25', NULL, NULL),
(2378, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:20:25', NULL, NULL),
(2379, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:20:25', NULL, NULL),
(2380, 29, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-13 02:20:25', NULL, NULL),
(2381, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:20:35', NULL, NULL),
(2382, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:20:36', NULL, NULL),
(2383, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:20:36', NULL, NULL),
(2384, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:20:46', NULL, NULL),
(2385, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:20:46', NULL, NULL),
(2386, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:20:46', NULL, NULL),
(2387, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:20:46', NULL, NULL),
(2388, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:20:46', NULL, NULL),
(2389, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:20:46', NULL, NULL),
(2390, 29, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 02:20:46', NULL, NULL),
(2391, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:20:55', NULL, NULL),
(2392, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:21:04', NULL, NULL),
(2393, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:21:04', NULL, NULL),
(2394, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:21:04', NULL, NULL),
(2395, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:21:09', NULL, NULL),
(2396, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:21:09', NULL, NULL),
(2397, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:21:09', NULL, NULL),
(2398, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:21:09', NULL, NULL),
(2399, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 02:21:09', NULL, NULL),
(2400, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:21:09', NULL, NULL),
(2401, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:21:09', NULL, NULL),
(2402, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:21:14', NULL, NULL),
(2403, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:21:14', NULL, NULL),
(2404, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:21:14', NULL, NULL),
(2405, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:21:16', NULL, NULL),
(2406, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:21:16', NULL, NULL),
(2407, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:21:16', NULL, NULL),
(2408, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:21:16', NULL, NULL),
(2409, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:21:16', NULL, NULL),
(2410, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:21:16', NULL, NULL),
(2411, 29, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 02:21:17', NULL, NULL),
(2412, 29, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:21:53', NULL, NULL),
(2413, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:22:30', NULL, NULL),
(2414, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:22:31', NULL, NULL),
(2415, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:22:48', NULL, NULL),
(2416, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:22:48', NULL, NULL),
(2417, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:22:48', NULL, NULL),
(2418, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:22:48', NULL, NULL),
(2419, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:22:49', NULL, NULL),
(2420, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:22:49', NULL, NULL),
(2421, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 02:22:49', NULL, NULL),
(2422, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:23:17', NULL, NULL),
(2423, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:23:17', NULL, NULL),
(2424, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:23:17', NULL, NULL),
(2425, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:23:17', NULL, NULL),
(2426, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 02:23:17', NULL, NULL),
(2427, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:23:17', NULL, NULL),
(2428, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 02:23:17', NULL, NULL),
(2429, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:24:29', NULL, NULL),
(2430, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:24:33', NULL, NULL),
(2431, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:24:56', NULL, NULL),
(2432, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:24:57', NULL, NULL),
(2433, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:24:57', NULL, NULL),
(2434, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:25:02', NULL, NULL),
(2435, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:25:02', NULL, NULL),
(2436, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:25:02', NULL, NULL),
(2437, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:25:02', NULL, NULL),
(2438, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:25:02', NULL, NULL),
(2439, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 02:25:02', NULL, NULL),
(2440, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:25:02', NULL, NULL),
(2441, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:25:16', NULL, NULL),
(2442, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:25:16', NULL, NULL),
(2443, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:25:16', NULL, NULL),
(2444, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:26:30', NULL, NULL),
(2445, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-13 02:26:37', NULL, NULL),
(2446, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-13 02:26:37', NULL, NULL),
(2447, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:27:35', NULL, NULL),
(2448, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:27:36', NULL, NULL),
(2449, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:28:03', NULL, NULL),
(2450, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:28:04', NULL, NULL),
(2451, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-13 02:28:14', NULL, NULL),
(2452, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-13 02:28:54', NULL, NULL),
(2453, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:29:19', NULL, NULL),
(2454, -1, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-13 02:29:19', NULL, NULL),
(2455, 12, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:29:19', NULL, NULL),
(2456, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-13 02:30:11', NULL, NULL),
(2457, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-03-13 02:30:23', NULL, NULL),
(2458, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:31:03', NULL, NULL),
(2459, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:31:04', NULL, NULL),
(2460, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-03-13 02:31:08', NULL, NULL),
(2461, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:31:40', NULL, NULL),
(2462, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:31:41', NULL, NULL),
(2463, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:32:05', NULL, NULL),
(2464, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:32:16', NULL, NULL),
(2465, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:32:17', NULL, NULL),
(2466, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:41:19', NULL, NULL),
(2467, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:41:19', NULL, NULL),
(2468, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:41:19', NULL, NULL),
(2469, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:41:19', NULL, NULL),
(2470, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:41:19', NULL, NULL),
(2471, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:41:19', NULL, NULL),
(2472, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 02:41:19', NULL, NULL),
(2473, 29, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-13 02:44:33', NULL, NULL),
(2474, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:44:33', NULL, NULL),
(2475, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:44:34', NULL, NULL),
(2476, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:44:34', NULL, NULL),
(2477, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:44:39', NULL, NULL),
(2478, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:44:39', NULL, NULL),
(2479, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:44:39', NULL, NULL),
(2480, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:44:39', NULL, NULL),
(2481, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:44:39', NULL, NULL),
(2482, 29, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:44:39', NULL, NULL),
(2483, 29, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 02:44:39', NULL, NULL),
(2484, 29, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-13 02:44:43', NULL, NULL),
(2485, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:44:43', NULL, NULL),
(2486, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 02:44:43', NULL, NULL),
(2487, 29, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:44:44', NULL, NULL),
(2488, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:45:23', NULL, NULL),
(2489, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:45:24', NULL, NULL),
(2490, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 02:45:39', NULL, NULL),
(2491, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 02:45:39', NULL, NULL),
(2492, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 02:45:39', NULL, NULL),
(2493, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-13 02:45:39', NULL, NULL),
(2494, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-13 02:45:39', NULL, NULL),
(2495, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 02:45:39', NULL, NULL),
(2496, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-13 02:45:39', NULL, NULL),
(2497, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-13 02:45:39', NULL, NULL),
(2498, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-13 02:45:40', NULL, NULL),
(2499, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-12 20:46:27', NULL, NULL),
(2500, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:47:05', NULL, NULL),
(2501, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:47:05', NULL, NULL),
(2502, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:48:01', NULL, NULL),
(2503, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:48:02', NULL, NULL),
(2504, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-13 02:48:42', NULL, NULL),
(2505, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-13 02:48:42', NULL, NULL),
(2506, 11, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:49:18', NULL, NULL),
(2507, 11, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:49:18', NULL, NULL),
(2508, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 02:49:54', NULL, NULL),
(2509, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 02:49:54', NULL, NULL),
(2510, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 04:44:59', NULL, NULL),
(2511, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 04:45:00', NULL, NULL),
(2512, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 04:45:09', NULL, NULL),
(2513, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 04:45:09', NULL, NULL),
(2514, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 04:45:09', NULL, NULL),
(2515, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 04:45:09', NULL, NULL),
(2516, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 04:45:09', NULL, NULL),
(2517, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 04:45:09', NULL, NULL),
(2518, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 04:45:09', NULL, NULL),
(2519, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 04:51:38', NULL, NULL),
(2520, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 04:51:39', NULL, NULL),
(2521, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 04:52:14', NULL, NULL),
(2522, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-13 04:52:14', NULL, NULL),
(2523, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-13 04:52:14', NULL, NULL),
(2524, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-13 04:52:14', NULL, NULL),
(2525, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 04:52:14', NULL, NULL),
(2526, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-13 04:52:14', NULL, NULL),
(2527, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-13 04:52:15', NULL, NULL),
(2528, 8, 'solicitudes', 'agendarCita', 'control-solicitud', '2019-03-13 04:53:04', NULL, NULL),
(2529, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 04:58:25', NULL, NULL),
(2530, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 04:58:43', NULL, NULL),
(2531, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 04:58:44', NULL, NULL),
(2532, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:06:12', NULL, NULL),
(2533, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:06:20', NULL, NULL),
(2534, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:06:29', NULL, NULL),
(2535, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:06:52', NULL, NULL),
(2536, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:07:01', NULL, NULL),
(2537, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:07:10', NULL, NULL),
(2538, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:07:33', NULL, NULL),
(2539, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:07:41', NULL, NULL),
(2540, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:08:09', NULL, NULL),
(2541, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:08:10', NULL, NULL),
(2542, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:11:08', NULL, NULL),
(2543, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-13 05:14:51', NULL, NULL),
(2544, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:21:44', NULL, NULL),
(2545, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:22:19', NULL, NULL),
(2546, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:22:19', NULL, NULL),
(2547, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-13 05:22:38', NULL, NULL),
(2548, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-13 05:22:46', NULL, NULL),
(2549, 12, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-13 05:22:46', NULL, NULL),
(2550, -1, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-13 05:22:46', NULL, NULL),
(2551, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:22:57', NULL, NULL),
(2552, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-13 05:23:02', NULL, NULL),
(2553, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-03-13 05:23:24', NULL, NULL),
(2554, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:25:04', NULL, NULL),
(2555, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:25:14', NULL, NULL),
(2556, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:25:15', NULL, NULL),
(2557, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:25:32', NULL, NULL);
INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2558, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:25:33', NULL, NULL),
(2559, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 05:27:20', NULL, NULL),
(2560, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 05:27:20', NULL, NULL),
(2561, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-13 05:27:51', NULL, NULL),
(2562, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-13 05:51:35', NULL, NULL),
(2563, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-13 05:51:39', NULL, NULL),
(2564, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-13 06:12:17', NULL, NULL),
(2565, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 23:13:00', NULL, NULL),
(2566, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 23:13:01', NULL, NULL),
(2567, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-13 23:13:07', NULL, NULL),
(2568, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 23:20:29', NULL, NULL),
(2569, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 23:20:30', NULL, NULL),
(2570, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-13 23:20:34', NULL, NULL),
(2571, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-13 23:20:34', NULL, NULL),
(2572, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 23:20:57', NULL, NULL),
(2573, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-13 23:21:07', NULL, NULL),
(2574, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-03-13 23:21:08', NULL, NULL),
(2575, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-13 23:23:37', NULL, NULL),
(2576, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-13 23:23:41', NULL, NULL),
(2577, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-14 23:55:28', NULL, NULL),
(2578, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 04:52:40', NULL, NULL),
(2579, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-15 04:52:41', NULL, NULL),
(2580, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 04:56:10', NULL, NULL),
(2581, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-15 04:56:11', NULL, NULL),
(2582, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-15 04:56:25', NULL, NULL),
(2583, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-15 04:57:12', NULL, NULL),
(2584, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-15 04:57:35', NULL, NULL),
(2585, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-15 04:57:52', NULL, NULL),
(2586, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 04:58:48', NULL, NULL),
(2587, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-03-15 04:58:49', NULL, NULL),
(2588, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 05:00:22', NULL, NULL),
(2589, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-03-15 05:00:23', NULL, NULL),
(2590, 9, 'programas', 'datosGenerales', 'control-programa', '2019-03-15 05:00:46', NULL, NULL),
(2591, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 05:04:00', NULL, NULL),
(2592, 10, 'usuarios', 'consultarId', 'control-usuario', '2019-03-15 05:04:01', NULL, NULL),
(2593, -1, 'inspecciones', 'tablaInspecciones', 'control-inspeccion', '2019-03-15 05:04:04', NULL, NULL),
(2594, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 05:46:45', NULL, NULL),
(2595, -1, 'usuarios', 'guardar', 'control-usuario', '2019-03-15 05:46:45', NULL, NULL),
(2596, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-03-15 05:46:46', NULL, NULL),
(2597, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-15 05:46:51', NULL, NULL),
(2598, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-03-15 05:47:01', NULL, NULL),
(2599, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 22:29:13', NULL, NULL),
(2600, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-20 22:29:15', NULL, NULL),
(2601, -1, 'roles', 'consultarTodos', 'control-rol', '2019-03-20 22:29:17', NULL, NULL),
(2602, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-03-20 22:29:17', NULL, NULL),
(2603, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 22:30:05', NULL, NULL),
(2604, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 22:30:10', NULL, NULL),
(2605, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 22:30:29', NULL, NULL),
(2606, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-03-20 22:30:29', NULL, NULL),
(2607, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 22:31:04', NULL, NULL),
(2608, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 22:31:13', NULL, NULL),
(2609, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-20 22:31:13', NULL, NULL),
(2610, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:31:38', NULL, NULL),
(2611, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:31:38', NULL, NULL),
(2612, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:31:38', NULL, NULL),
(2613, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:31:38', NULL, NULL),
(2614, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:31:38', NULL, NULL),
(2615, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:31:38', NULL, NULL),
(2616, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:31:38', NULL, NULL),
(2617, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:31:38', NULL, NULL),
(2618, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-20 22:31:42', NULL, NULL),
(2619, 20, 'planteles', 'consultarId', 'control-plantel', '2019-03-20 22:31:50', NULL, NULL),
(2620, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:32:23', NULL, NULL),
(2621, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:32:23', NULL, NULL),
(2622, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:32:23', NULL, NULL),
(2623, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:32:23', NULL, NULL),
(2624, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:32:31', NULL, NULL),
(2625, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:32:31', NULL, NULL),
(2626, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:32:31', NULL, NULL),
(2627, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:32:32', NULL, NULL),
(2628, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:32:40', NULL, NULL),
(2629, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:32:40', NULL, NULL),
(2630, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:32:40', NULL, NULL),
(2631, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:32:41', NULL, NULL),
(2632, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:32:50', NULL, NULL),
(2633, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:32:50', NULL, NULL),
(2634, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:32:50', NULL, NULL),
(2635, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:32:50', NULL, NULL),
(2636, 20, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-20 22:32:58', NULL, NULL),
(2637, 20, 'planteles', 'consultarId', 'control-plantel', '2019-03-20 22:33:11', NULL, NULL),
(2638, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-20 22:33:13', NULL, NULL),
(2639, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-20 22:33:24', NULL, NULL),
(2640, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:41:31', NULL, NULL),
(2641, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:41:31', NULL, NULL),
(2642, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:41:31', NULL, NULL),
(2643, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:41:31', NULL, NULL),
(2644, 24, 'instituciones', 'guardar', 'control-institucion', '2019-03-20 22:41:55', NULL, NULL),
(2645, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-20 22:41:57', NULL, NULL),
(2646, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-20 22:42:17', NULL, NULL),
(2647, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-20 22:42:17', NULL, NULL),
(2648, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-20 22:42:17', NULL, NULL),
(2649, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:42:17', NULL, NULL),
(2650, 20, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-20 22:42:17', NULL, NULL),
(2651, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:42:17', NULL, NULL),
(2652, 20, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-20 22:42:17', NULL, NULL),
(2653, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 22:44:16', NULL, NULL),
(2654, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-20 22:44:16', NULL, NULL),
(2655, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:44:16', NULL, NULL),
(2656, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:44:16', NULL, NULL),
(2657, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-20 22:44:32', NULL, NULL),
(2658, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 22:44:32', NULL, NULL),
(2659, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-20 22:44:32', NULL, NULL),
(2660, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-20 22:44:32', NULL, NULL),
(2661, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-20 22:44:32', NULL, NULL),
(2662, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 22:44:32', NULL, NULL),
(2663, 24, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-20 22:44:33', NULL, NULL),
(2664, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-03-20 23:06:35', NULL, NULL),
(2665, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-03-20 23:06:38', NULL, NULL),
(2666, -1, 'inspecciones', 'actulizarEstatus', 'control-inspeccion', '2019-03-20 23:06:52', NULL, NULL),
(2667, -1, 'inspecciones', 'informacionActaInspeccion', 'control-inspeccion', '2019-03-20 23:06:52', NULL, NULL),
(2668, -1, 'inspecciones', 'guiaInspeccion', 'control-inspeccion', '2019-03-20 23:06:52', NULL, NULL),
(2669, -1, 'inspecciones', 'inspeccionesInspector', 'control-inspeccion', '2019-03-20 23:06:57', NULL, NULL),
(2670, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 23:25:20', NULL, NULL),
(2671, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 23:25:31', NULL, NULL),
(2672, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 23:25:39', NULL, NULL),
(2673, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 23:25:46', NULL, NULL),
(2674, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-20 23:25:46', NULL, NULL),
(2675, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-20 23:26:44', NULL, NULL),
(2676, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-03-20 23:26:44', NULL, NULL),
(2677, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 23:26:57', NULL, NULL),
(2678, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-20 23:26:57', NULL, NULL),
(2679, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-20 23:26:57', NULL, NULL),
(2680, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-20 23:26:57', NULL, NULL),
(2681, 3, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-20 23:26:57', NULL, NULL),
(2682, 3, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-20 23:26:57', NULL, NULL),
(2683, 3, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-20 23:26:57', NULL, NULL),
(2684, 3, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-20 23:26:57', NULL, NULL),
(2685, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-20 23:27:10', NULL, NULL),
(2686, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-20 23:27:10', NULL, NULL),
(2687, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-20 23:27:10', NULL, NULL),
(2688, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-20 23:27:10', NULL, NULL),
(2689, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-20 23:27:10', NULL, NULL),
(2690, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-20 23:27:10', NULL, NULL),
(2691, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-20 23:27:10', NULL, NULL),
(2692, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-03-20 23:27:57', NULL, NULL),
(2693, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 00:52:32', NULL, NULL),
(2694, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 00:52:35', NULL, NULL),
(2695, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:52:52', NULL, NULL),
(2696, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:52:52', NULL, NULL),
(2697, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:52:52', NULL, NULL),
(2698, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:52:52', NULL, NULL),
(2699, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:54:02', NULL, NULL),
(2700, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:54:02', NULL, NULL),
(2701, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:54:03', NULL, NULL),
(2702, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:54:03', NULL, NULL),
(2703, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:54:42', NULL, NULL),
(2704, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:54:42', NULL, NULL),
(2705, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:54:42', NULL, NULL),
(2706, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:54:42', NULL, NULL),
(2707, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:55:03', NULL, NULL),
(2708, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:55:03', NULL, NULL),
(2709, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:55:03', NULL, NULL),
(2710, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:55:03', NULL, NULL),
(2711, 24, 'programas', 'informacionBasica', 'control-programa', '2019-03-21 00:55:10', NULL, NULL),
(2712, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:55:43', NULL, NULL),
(2713, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:55:43', NULL, NULL),
(2714, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:55:43', NULL, NULL),
(2715, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:55:44', NULL, NULL),
(2716, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 00:56:35', NULL, NULL),
(2717, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-21 00:56:48', NULL, NULL),
(2718, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-21 00:57:03', NULL, NULL),
(2719, 24, 'instituciones', 'consultarUsuarioInstitucion', 'control-institucion', '2019-03-21 00:57:16', NULL, NULL),
(2720, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:57:35', NULL, NULL),
(2721, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:57:35', NULL, NULL),
(2722, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:57:36', NULL, NULL),
(2723, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:57:36', NULL, NULL),
(2724, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 00:58:09', NULL, NULL),
(2725, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 00:58:09', NULL, NULL),
(2726, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:58:09', NULL, NULL),
(2727, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:58:09', NULL, NULL),
(2728, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 00:58:46', NULL, NULL),
(2729, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 00:58:47', NULL, NULL),
(2730, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 00:58:47', NULL, NULL),
(2731, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 00:58:47', NULL, NULL),
(2732, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 00:58:47', NULL, NULL),
(2733, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 00:58:47', NULL, NULL),
(2734, 24, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-21 00:58:47', NULL, NULL),
(2735, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 01:27:12', NULL, NULL),
(2736, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 01:27:12', NULL, NULL),
(2737, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 01:27:12', NULL, NULL),
(2738, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 01:27:12', NULL, NULL),
(2739, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 01:27:12', NULL, NULL),
(2740, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 01:27:12', NULL, NULL),
(2741, 24, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-21 01:27:13', NULL, NULL),
(2742, -1, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-21 02:27:38', NULL, NULL),
(2743, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 02:28:14', NULL, NULL),
(2744, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 02:28:23', NULL, NULL),
(2745, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 02:28:24', NULL, NULL),
(2746, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 02:28:34', NULL, NULL),
(2747, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:28:34', NULL, NULL),
(2748, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 02:28:34', NULL, NULL),
(2749, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:28:34', NULL, NULL),
(2750, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 02:28:44', NULL, NULL),
(2751, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:28:44', NULL, NULL),
(2752, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 02:28:44', NULL, NULL),
(2753, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:28:44', NULL, NULL),
(2754, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 02:28:44', NULL, NULL),
(2755, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 02:28:45', NULL, NULL),
(2756, 24, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-21 02:28:45', NULL, NULL),
(2757, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 02:50:41', NULL, NULL),
(2758, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 02:50:50', NULL, NULL),
(2759, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 02:51:07', NULL, NULL),
(2760, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 02:51:08', NULL, NULL),
(2761, 24, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 02:51:11', NULL, NULL),
(2762, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 02:51:11', NULL, NULL),
(2763, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:51:11', NULL, NULL),
(2764, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:51:12', NULL, NULL),
(2765, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 02:51:29', NULL, NULL),
(2766, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:51:29', NULL, NULL),
(2767, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 02:51:29', NULL, NULL),
(2768, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:51:29', NULL, NULL),
(2769, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 02:51:29', NULL, NULL),
(2770, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 02:51:29', NULL, NULL),
(2771, 24, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-21 02:55:38', NULL, NULL),
(2772, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:55:39', NULL, NULL),
(2773, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 02:55:39', NULL, NULL),
(2774, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:55:39', NULL, NULL),
(2775, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:57:51', NULL, NULL),
(2776, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 02:57:51', NULL, NULL),
(2777, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 02:57:51', NULL, NULL),
(2778, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:57:51', NULL, NULL),
(2779, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 02:57:51', NULL, NULL),
(2780, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 02:57:51', NULL, NULL),
(2781, 24, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-21 02:57:51', NULL, NULL),
(2782, 24, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-21 02:57:56', NULL, NULL),
(2783, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 02:57:57', NULL, NULL),
(2784, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 02:57:57', NULL, NULL),
(2785, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 02:57:57', NULL, NULL),
(2786, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:05:36', NULL, NULL),
(2787, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:05:36', NULL, NULL),
(2788, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 03:05:39', NULL, NULL),
(2789, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:05:39', NULL, NULL),
(2790, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:05:39', NULL, NULL),
(2791, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:05:39', NULL, NULL),
(2792, 24, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-21 03:05:42', NULL, NULL),
(2793, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:05:59', NULL, NULL),
(2794, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:06:11', NULL, NULL),
(2795, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:06:23', NULL, NULL),
(2796, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:06:32', NULL, NULL),
(2797, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:06:42', NULL, NULL),
(2798, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:06:50', NULL, NULL),
(2799, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:07:03', NULL, NULL),
(2800, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:08:05', NULL, NULL),
(2801, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:08:08', NULL, NULL),
(2802, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:08:13', NULL, NULL),
(2803, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:09:45', NULL, NULL),
(2804, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:09:46', NULL, NULL),
(2805, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:10:30', NULL, NULL),
(2806, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:10:31', NULL, NULL),
(2807, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:10:50', NULL, NULL),
(2808, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:11:14', NULL, NULL),
(2809, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:11:15', NULL, NULL),
(2810, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:12:08', NULL, NULL),
(2811, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:12:08', NULL, NULL),
(2812, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 03:12:08', NULL, NULL),
(2813, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:12:08', NULL, NULL),
(2814, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:12:08', NULL, NULL),
(2815, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-21 03:12:08', NULL, NULL),
(2816, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:12:08', NULL, NULL),
(2817, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-21 03:12:08', NULL, NULL),
(2818, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-21 03:12:08', NULL, NULL),
(2819, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:12:09', NULL, NULL),
(2820, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:12:10', NULL, NULL),
(2821, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 03:12:10', NULL, NULL),
(2822, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:12:10', NULL, NULL),
(2823, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:12:10', NULL, NULL),
(2824, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:12:11', NULL, NULL),
(2825, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-21 03:12:11', NULL, NULL),
(2826, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-21 03:12:11', NULL, NULL),
(2827, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-21 03:12:11', NULL, NULL),
(2828, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:16:38', NULL, NULL),
(2829, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-21 03:23:44', NULL, NULL),
(2830, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-21 03:24:03', NULL, NULL),
(2831, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:24:08', NULL, NULL),
(2832, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:24:13', NULL, NULL),
(2833, -1, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-21 03:26:48', NULL, NULL),
(2834, 20, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:27:31', NULL, NULL),
(2835, 20, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:27:32', NULL, NULL),
(2836, 20, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-03-21 03:27:35', NULL, NULL),
(2837, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:27:35', NULL, NULL),
(2838, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 03:27:35', NULL, NULL),
(2839, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:27:35', NULL, NULL),
(2840, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:27:49', NULL, NULL),
(2841, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:27:50', NULL, NULL),
(2842, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:27:50', NULL, NULL),
(2843, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:27:50', NULL, NULL),
(2844, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 03:27:50', NULL, NULL),
(2845, 20, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:27:50', NULL, NULL),
(2846, 20, 'planteles', 'plantelPorId', 'control-plantel', '2019-03-21 03:27:51', NULL, NULL),
(2847, 20, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-03-21 03:31:01', NULL, NULL),
(2848, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 03:31:04', NULL, NULL),
(2849, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:31:04', NULL, NULL),
(2850, 20, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:31:13', NULL, NULL),
(2851, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:31:53', NULL, NULL),
(2852, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:31:54', NULL, NULL),
(2853, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:31:57', NULL, NULL),
(2854, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:31:57', NULL, NULL),
(2855, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:32:38', NULL, NULL),
(2856, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:32:38', NULL, NULL),
(2857, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:32:38', NULL, NULL),
(2858, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 03:32:38', NULL, NULL),
(2859, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:32:38', NULL, NULL),
(2860, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-21 03:32:38', NULL, NULL),
(2861, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:32:38', NULL, NULL),
(2862, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-21 03:32:38', NULL, NULL),
(2863, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-21 03:32:38', NULL, NULL),
(2864, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:32:43', NULL, NULL),
(2865, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:32:43', NULL, NULL),
(2866, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:32:43', NULL, NULL),
(2867, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:32:43', NULL, NULL),
(2868, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-21 03:32:43', NULL, NULL),
(2869, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-03-21 03:32:43', NULL, NULL),
(2870, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-21 03:32:43', NULL, NULL),
(2871, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-21 03:32:43', NULL, NULL),
(2872, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-03-21 03:32:43', NULL, NULL),
(2873, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-03-20 21:37:13', NULL, NULL),
(2874, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:37:57', NULL, NULL),
(2875, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:37:57', NULL, NULL),
(2876, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:37:57', NULL, NULL),
(2877, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 03:37:57', NULL, NULL),
(2878, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:37:58', NULL, NULL),
(2879, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:37:58', NULL, NULL),
(2880, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-21 03:37:58', NULL, NULL),
(2881, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:38:09', NULL, NULL),
(2882, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:38:23', NULL, NULL),
(2883, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:38:28', NULL, NULL),
(2884, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:38:54', NULL, NULL),
(2885, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:38:55', NULL, NULL),
(2886, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:38:55', NULL, NULL),
(2887, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:38:55', NULL, NULL),
(2888, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:38:55', NULL, NULL),
(2889, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 03:38:55', NULL, NULL),
(2890, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-21 03:38:55', NULL, NULL),
(2891, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-21 03:39:50', NULL, NULL),
(2892, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:39:51', NULL, NULL),
(2893, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-21 03:39:51', NULL, NULL),
(2894, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-21 03:39:51', NULL, NULL),
(2895, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:39:51', NULL, NULL),
(2896, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-03-21 03:39:51', NULL, NULL),
(2897, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-03-21 03:39:51', NULL, NULL),
(2898, 8, 'solicitudes', 'agendarCita', 'control-solicitud', '2019-03-21 03:41:41', NULL, NULL),
(2899, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:44:25', NULL, NULL),
(2900, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:44:26', NULL, NULL),
(2901, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:44:44', NULL, NULL),
(2902, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:44:46', NULL, NULL),
(2903, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:44:46', NULL, NULL),
(2904, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:44:54', NULL, NULL),
(2905, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:44:54', NULL, NULL),
(2906, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:45:00', NULL, NULL),
(2907, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:45:20', NULL, NULL),
(2908, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:45:21', NULL, NULL),
(2909, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-21 03:45:53', NULL, NULL),
(2910, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-21 03:45:57', NULL, NULL),
(2911, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-21 03:46:08', NULL, NULL),
(2912, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:46:11', NULL, NULL),
(2913, 12, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:46:11', NULL, NULL),
(2914, -1, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-21 03:46:11', NULL, NULL),
(2915, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:46:25', NULL, NULL),
(2916, 12, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:46:25', NULL, NULL),
(2917, -1, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-21 03:46:25', NULL, NULL),
(2918, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-21 03:46:51', NULL, NULL),
(2919, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-03-21 03:47:13', NULL, NULL),
(2920, 12, 'programas', 'datosGenerales', 'control-programa', '2019-03-21 03:47:18', NULL, NULL),
(2921, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-03-21 03:48:28', NULL, NULL),
(2922, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:49:44', NULL, NULL),
(2923, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:49:52', NULL, NULL),
(2924, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:49:52', NULL, NULL),
(2925, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:49:54', NULL, NULL),
(2926, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:49:54', NULL, NULL),
(2927, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:50:02', NULL, NULL),
(2928, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-21 03:50:10', NULL, NULL),
(2929, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-21 03:50:11', NULL, NULL),
(2930, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:50:22', NULL, NULL),
(2931, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-21 03:50:22', NULL, NULL),
(2932, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:50:22', NULL, NULL),
(2933, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:50:26', NULL, NULL),
(2934, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:50:26', NULL, NULL),
(2935, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-21 03:50:26', NULL, NULL),
(2936, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-21 03:50:27', NULL, NULL),
(2937, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-21 03:50:27', NULL, NULL),
(2938, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-03-21 03:50:27', NULL, NULL),
(2939, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-21 03:53:41', NULL, NULL),
(2940, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-21 03:53:52', NULL, NULL),
(2941, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-21 03:54:08', NULL, NULL),
(2942, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-21 03:55:10', NULL, NULL),
(2943, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-21 03:56:34', NULL, NULL),
(2944, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-21 03:57:30', NULL, NULL),
(2945, -1, 'programa_evaluaciones', 'guardarRevision', 'control-programa-evaluacion', '2019-03-21 03:57:56', NULL, NULL),
(2946, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:11:31', NULL, NULL),
(2947, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:11:35', NULL, NULL),
(2948, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:11:47', NULL, NULL),
(2949, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:11:51', NULL, NULL),
(2950, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:25:11', NULL, NULL),
(2951, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-03-22 05:25:12', NULL, NULL),
(2952, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:25:26', NULL, NULL),
(2953, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:25:34', NULL, NULL),
(2954, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-03-22 05:25:34', NULL, NULL),
(2955, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:25:55', NULL, NULL),
(2956, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-03-22 05:25:56', NULL, NULL),
(2957, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:26:11', NULL, NULL),
(2958, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:26:31', NULL, NULL),
(2959, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:26:39', NULL, NULL),
(2960, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:26:47', NULL, NULL),
(2961, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-03-22 05:26:48', NULL, NULL),
(2962, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-03-22 05:26:53', NULL, NULL),
(2963, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:32:31', NULL, NULL),
(2964, 24, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-22 05:32:39', NULL, NULL),
(2965, 24, 'usuarios', 'consultarId', 'control-usuario', '2019-03-22 05:32:40', NULL, NULL),
(2966, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-22 05:32:45', NULL, NULL),
(2967, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-22 05:32:45', NULL, NULL),
(2968, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-22 05:32:45', NULL, NULL),
(2969, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-22 05:32:48', NULL, NULL),
(2970, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-22 05:32:48', NULL, NULL),
(2971, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-22 05:32:48', NULL, NULL),
(2972, 24, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-22 05:32:48', NULL, NULL),
(2973, 24, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-22 05:32:48', NULL, NULL),
(2974, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-22 05:32:48', NULL, NULL),
(2975, 24, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-22 05:32:49', NULL, NULL),
(2976, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-29 05:05:55', NULL, NULL),
(2977, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-29 05:06:02', NULL, NULL),
(2978, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-29 05:06:08', NULL, NULL),
(2979, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-03-29 05:06:09', NULL, NULL),
(2980, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-29 05:06:12', NULL, NULL),
(2981, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-29 05:06:12', NULL, NULL),
(2982, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-29 05:06:13', NULL, NULL),
(2983, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-29 05:06:20', NULL, NULL),
(2984, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-29 05:06:20', NULL, NULL),
(2985, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-29 05:06:20', NULL, NULL),
(2986, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-29 05:06:20', NULL, NULL),
(2987, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-29 05:06:20', NULL, NULL),
(2988, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-29 05:06:20', NULL, NULL),
(2989, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-29 05:06:20', NULL, NULL),
(2990, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-03-29 22:45:52', NULL, NULL),
(2991, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-03-29 22:45:53', NULL, NULL),
(2992, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-03-29 22:45:56', NULL, NULL),
(2993, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-29 22:45:56', NULL, NULL),
(2994, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-29 22:45:56', NULL, NULL),
(2995, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-03-29 22:45:59', NULL, NULL),
(2996, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-03-29 22:45:59', NULL, NULL),
(2997, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-03-29 22:45:59', NULL, NULL),
(2998, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-03-29 22:45:59', NULL, NULL),
(2999, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-03-29 22:45:59', NULL, NULL),
(3000, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-03-29 22:45:59', NULL, NULL),
(3001, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-03-29 22:45:59', NULL, NULL),
(3002, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:34:49', NULL, NULL),
(3003, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-04-03 05:34:50', NULL, NULL),
(3004, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:35:04', NULL, NULL),
(3005, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:35:14', NULL, NULL),
(3006, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:35:22', NULL, NULL),
(3007, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-04-03 05:35:23', NULL, NULL),
(3008, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:35:35', NULL, NULL),
(3009, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-04-03 05:35:35', NULL, NULL),
(3010, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-03 05:37:10', NULL, NULL),
(3011, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:37:10', NULL, NULL),
(3012, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-03 05:37:11', NULL, NULL),
(3013, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-03 05:37:16', NULL, NULL),
(3014, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-03 05:37:16', NULL, NULL),
(3015, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:37:16', NULL, NULL),
(3016, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-04-03 05:37:16', NULL, NULL),
(3017, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-03 05:37:16', NULL, NULL),
(3018, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-03 05:37:16', NULL, NULL),
(3019, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-04-03 05:37:16', NULL, NULL),
(3020, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-04-03 05:37:18', NULL, NULL),
(3021, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-03 05:37:19', NULL, NULL),
(3022, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:37:19', NULL, NULL),
(3023, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-03 05:37:19', NULL, NULL),
(3024, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-03 05:37:21', NULL, NULL),
(3025, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:37:21', NULL, NULL),
(3026, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-04-03 05:37:21', NULL, NULL),
(3027, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-03 05:37:21', NULL, NULL),
(3028, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-03 05:37:21', NULL, NULL),
(3029, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-03 05:37:21', NULL, NULL),
(3030, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-04-03 05:37:21', NULL, NULL),
(3031, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-04-03 05:37:24', NULL, NULL),
(3032, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-03 05:37:24', NULL, NULL),
(3033, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:37:24', NULL, NULL),
(3034, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-03 05:37:24', NULL, NULL),
(3035, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:37:38', NULL, NULL),
(3036, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-03 05:37:46', NULL, NULL),
(3037, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-04-03 05:37:46', NULL, NULL),
(3038, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-03 05:37:51', NULL, NULL),
(3039, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:37:52', NULL, NULL),
(3040, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-03 05:37:52', NULL, NULL),
(3041, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-04-03 05:37:52', NULL, NULL),
(3042, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-03 05:37:52', NULL, NULL),
(3043, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-03 05:37:52', NULL, NULL),
(3044, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-04-03 05:37:52', NULL, NULL),
(3045, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-04-03 05:37:52', NULL, NULL),
(3046, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-04-03 05:37:52', NULL, NULL),
(3047, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-04-02 23:38:03', NULL, NULL),
(3048, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-03 05:38:06', NULL, NULL),
(3049, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:38:06', NULL, NULL),
(3050, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-03 05:38:06', NULL, NULL),
(3051, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-03 05:38:07', NULL, NULL),
(3052, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-03 05:38:07', NULL, NULL),
(3053, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-03 05:38:07', NULL, NULL);
INSERT INTO `bitacoras` (`id`, `usuario_id`, `entidad`, `accion`, `lugar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3054, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-03 05:38:07', NULL, NULL),
(3055, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-04-03 05:39:49', NULL, NULL),
(3056, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-03 05:47:37', NULL, NULL),
(3057, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-03 05:47:37', NULL, NULL),
(3058, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-03 05:47:37', NULL, NULL),
(3059, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-03 05:47:37', NULL, NULL),
(3060, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-03 05:47:37', NULL, NULL),
(3061, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-03 05:47:37', NULL, NULL),
(3062, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-03 05:47:37', NULL, NULL),
(3063, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 05:55:11', NULL, NULL),
(3064, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 05:55:12', NULL, NULL),
(3065, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 05:58:12', NULL, NULL),
(3066, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 05:58:19', NULL, NULL),
(3067, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 05:58:20', NULL, NULL),
(3068, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 05:59:04', NULL, NULL),
(3069, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 05:59:37', NULL, NULL),
(3070, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 05:59:38', NULL, NULL),
(3071, -1, 'roles', 'consultarTodos', 'control-rol', '2019-04-04 05:59:41', NULL, NULL),
(3072, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-04-04 05:59:42', NULL, NULL),
(3073, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 06:00:36', NULL, NULL),
(3074, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 06:00:36', NULL, NULL),
(3075, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-04 06:00:43', NULL, NULL),
(3076, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-04 06:00:43', NULL, NULL),
(3077, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-04 06:00:43', NULL, NULL),
(3078, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-04 06:00:43', NULL, NULL),
(3079, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-04 06:00:43', NULL, NULL),
(3080, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-04 06:00:43', NULL, NULL),
(3081, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-04 06:00:43', NULL, NULL),
(3082, 8, 'solicitudes', 'agendarCita', 'control-solicitud', '2019-04-04 06:00:51', NULL, NULL),
(3083, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 06:01:02', NULL, NULL),
(3084, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 06:02:29', NULL, NULL),
(3085, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 06:02:30', NULL, NULL),
(3086, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 06:02:54', NULL, NULL),
(3087, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 06:02:55', NULL, NULL),
(3088, 12, 'programas', 'datosGenerales', 'control-programa', '2019-04-04 06:15:07', NULL, NULL),
(3089, 12, 'programas', 'datosGenerales', 'control-programa', '2019-04-04 06:15:31', NULL, NULL),
(3090, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-04 06:17:44', NULL, NULL),
(3091, 12, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-04 06:17:44', NULL, NULL),
(3092, -1, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-04-04 06:17:44', NULL, NULL),
(3093, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-04-04 06:31:31', NULL, NULL),
(3094, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-04 06:43:20', NULL, NULL),
(3095, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 06:43:21', NULL, NULL),
(3096, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-04 07:14:51', NULL, NULL),
(3097, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-04 07:14:52', NULL, NULL),
(3098, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-04-04 07:14:52', NULL, NULL),
(3099, -1, 'evaluadores', 'guardarCurriculum', 'control-evaluador', '2019-04-04 07:23:21', NULL, NULL),
(3100, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 07:23:21', NULL, NULL),
(3101, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-04 07:23:26', NULL, NULL),
(3102, 16, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-04 07:23:26', NULL, NULL),
(3103, 16, 'evaluadores', 'datosCurriculum', 'control-evaluador', '2019-04-04 07:23:27', NULL, NULL),
(3104, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-04-04 07:30:41', NULL, NULL),
(3105, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-04-04 07:43:46', NULL, NULL),
(3106, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-05 03:47:07', NULL, NULL),
(3107, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 03:47:08', NULL, NULL),
(3108, -1, 'roles', 'consultarTodos', 'control-rol', '2019-04-05 03:47:11', NULL, NULL),
(3109, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-04-05 03:47:12', NULL, NULL),
(3110, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-05 03:47:44', NULL, NULL),
(3111, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 03:47:45', NULL, NULL),
(3112, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-05 04:23:41', NULL, NULL),
(3113, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 04:23:42', NULL, NULL),
(3114, 3, 'instituciones', 'consultarTodos', 'control-institucion', '2019-04-05 04:23:50', NULL, NULL),
(3115, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-05 04:52:18', NULL, NULL),
(3116, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-05 04:52:18', NULL, NULL),
(3117, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-05 04:52:18', NULL, NULL),
(3118, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-05 04:52:18', NULL, NULL),
(3119, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-05 04:52:19', NULL, NULL),
(3120, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-05 04:52:19', NULL, NULL),
(3121, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-05 04:52:19', NULL, NULL),
(3122, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 04:59:36', NULL, NULL),
(3123, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 04:59:44', NULL, NULL),
(3124, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 05:00:08', NULL, NULL),
(3125, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-05 05:00:13', NULL, NULL),
(3126, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-06 01:54:36', NULL, NULL),
(3127, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-06 01:56:10', NULL, NULL),
(3128, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-06 01:56:32', NULL, NULL),
(3129, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-06 01:56:33', NULL, NULL),
(3130, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-06 02:02:50', NULL, NULL),
(3131, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-06 02:02:51', NULL, NULL),
(3132, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-06 02:15:09', NULL, NULL),
(3133, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-06 02:15:09', NULL, NULL),
(3134, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-06 02:15:09', NULL, NULL),
(3135, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-06 02:15:09', NULL, NULL),
(3136, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-06 02:15:09', NULL, NULL),
(3137, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-06 02:15:09', NULL, NULL),
(3138, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-06 02:15:10', NULL, NULL),
(3139, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-06 02:42:53', NULL, NULL),
(3140, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-06 02:42:53', NULL, NULL),
(3141, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-06 02:42:53', NULL, NULL),
(3142, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-06 02:42:53', NULL, NULL),
(3143, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-06 02:42:53', NULL, NULL),
(3144, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-06 02:42:53', NULL, NULL),
(3145, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-06 02:42:53', NULL, NULL),
(3146, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-09 01:11:57', NULL, NULL),
(3147, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-04-09 01:11:57', NULL, NULL),
(3148, -1, 'roles', 'consultarTodos', 'control-rol', '2019-04-09 01:12:00', NULL, NULL),
(3149, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-04-09 01:12:01', NULL, NULL),
(3150, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-09 05:11:22', NULL, NULL),
(3151, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-04-09 05:11:23', NULL, NULL),
(3152, -1, 'roles', 'consultarTodos', 'control-rol', '2019-04-09 05:11:26', NULL, NULL),
(3153, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-04-09 05:11:26', NULL, NULL),
(3154, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-04-12 02:23:01', NULL, NULL),
(3155, 10, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-12 02:23:05', NULL, NULL),
(3156, -1, 'usuarios', 'guardar', 'control-usuario', '2019-04-12 02:23:17', NULL, NULL),
(3157, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-12 02:23:43', NULL, NULL),
(3158, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-12 02:23:50', NULL, NULL),
(3159, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-12 02:25:32', NULL, NULL),
(3160, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-12 02:26:10', NULL, NULL),
(3161, -1, 'usuarios', 'guardar', 'control-usuario', '2019-04-12 02:26:11', NULL, NULL),
(3162, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-04-12 02:26:16', NULL, NULL),
(3163, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-12 02:26:19', NULL, NULL),
(3164, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-04-12 02:26:47', NULL, NULL),
(3165, -1, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-04-12 02:26:48', NULL, NULL),
(3166, -1, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-04-12 02:26:49', NULL, NULL),
(3167, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 22:39:25', NULL, NULL),
(3168, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 22:40:07', NULL, NULL),
(3169, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:05:32', NULL, NULL),
(3170, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:05:44', NULL, NULL),
(3171, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-04-26 23:05:45', NULL, NULL),
(3172, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:05:52', NULL, NULL),
(3173, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:05:52', NULL, NULL),
(3174, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:05:52', NULL, NULL),
(3175, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:05:59', NULL, NULL),
(3176, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:05:59', NULL, NULL),
(3177, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:05:59', NULL, NULL),
(3178, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:05:59', NULL, NULL),
(3179, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:05:59', NULL, NULL),
(3180, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:05:59', NULL, NULL),
(3181, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-26 23:05:59', NULL, NULL),
(3182, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:06:08', NULL, NULL),
(3183, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:06:08', NULL, NULL),
(3184, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:06:08', NULL, NULL),
(3185, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:06:11', NULL, NULL),
(3186, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:06:11', NULL, NULL),
(3187, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:06:11', NULL, NULL),
(3188, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-04-26 23:06:11', NULL, NULL),
(3189, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-26 23:06:11', NULL, NULL),
(3190, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:06:11', NULL, NULL),
(3191, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-04-26 23:06:11', NULL, NULL),
(3192, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:07:38', NULL, NULL),
(3193, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:07:38', NULL, NULL),
(3194, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:07:38', NULL, NULL),
(3195, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:07:40', NULL, NULL),
(3196, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:07:40', NULL, NULL),
(3197, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:07:40', NULL, NULL),
(3198, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:07:40', NULL, NULL),
(3199, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:07:40', NULL, NULL),
(3200, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:07:40', NULL, NULL),
(3201, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-26 23:07:40', NULL, NULL),
(3202, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:08:05', NULL, NULL),
(3203, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:08:05', NULL, NULL),
(3204, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:08:05', NULL, NULL),
(3205, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:08:07', NULL, NULL),
(3206, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:08:07', NULL, NULL),
(3207, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:08:07', NULL, NULL),
(3208, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:08:07', NULL, NULL),
(3209, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:08:07', NULL, NULL),
(3210, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:08:07', NULL, NULL),
(3211, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-26 23:08:07', NULL, NULL),
(3212, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:08:09', NULL, NULL),
(3213, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:08:09', NULL, NULL),
(3214, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:08:09', NULL, NULL),
(3215, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:08:11', NULL, NULL),
(3216, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:08:11', NULL, NULL),
(3217, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:08:11', NULL, NULL),
(3218, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-26 23:08:11', NULL, NULL),
(3219, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-04-26 23:08:11', NULL, NULL),
(3220, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:08:11', NULL, NULL),
(3221, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-04-26 23:08:11', NULL, NULL),
(3222, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:16:02', NULL, NULL),
(3223, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:16:10', NULL, NULL),
(3224, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-04-26 23:16:10', NULL, NULL),
(3225, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:17:25', NULL, NULL),
(3226, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-04-26 23:17:26', NULL, NULL),
(3227, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:17:44', NULL, NULL),
(3228, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:17:44', NULL, NULL),
(3229, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-04-26 23:17:44', NULL, NULL),
(3230, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:17:44', NULL, NULL),
(3231, 3, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-04-26 23:17:44', NULL, NULL),
(3232, 3, 'planteles', 'informacionBasica', 'control-plantel', '2019-04-26 23:17:44', NULL, NULL),
(3233, 3, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-04-26 23:17:44', NULL, NULL),
(3234, 3, 'programas', 'modificacionPrograma', 'control-programa', '2019-04-26 23:17:44', NULL, NULL),
(3235, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-04-26 23:17:52', NULL, NULL),
(3236, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-04-26 23:17:52', NULL, NULL),
(3237, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-04-26 23:17:52', NULL, NULL),
(3238, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:17:52', NULL, NULL),
(3239, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-04-26 23:17:52', NULL, NULL),
(3240, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-04-26 23:17:52', NULL, NULL),
(3241, 3, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-04-26 23:17:52', NULL, NULL),
(3242, 9, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:22:34', NULL, NULL),
(3243, 9, 'usuarios', 'consultarId', 'control-usuario', '2019-04-26 23:22:34', NULL, NULL),
(3244, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-04-26 23:24:42', NULL, NULL),
(3245, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-04-26 23:24:44', NULL, NULL),
(3246, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2019-04-26 23:24:48', NULL, NULL),
(3247, -1, 'inspecciones', 'inspeccionesInstitucion', 'control-inspeccion', '2019-04-26 23:24:48', NULL, NULL),
(3248, -1, 'usuarios', 'guardar', 'control-usuario', '2019-04-26 23:24:54', NULL, NULL),
(3249, 3, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-01 00:36:02', NULL, NULL),
(3250, 3, 'usuarios', 'consultarId', 'control-usuario', '2019-05-01 00:36:03', NULL, NULL),
(3251, 3, 'instituciones', 'consultarTodos', 'control-institucion', '2019-05-01 00:36:08', NULL, NULL),
(3252, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-09 02:00:11', NULL, NULL),
(3253, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-05-09 02:00:12', NULL, NULL),
(3254, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-25 21:18:42', NULL, NULL),
(3255, -1, 'usuarios', 'registro', 'control-usuario', '2019-05-25 21:20:11', NULL, NULL),
(3256, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:08:29', NULL, NULL),
(3257, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:10:01', NULL, NULL),
(3258, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:10:11', NULL, NULL),
(3259, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-05-30 02:10:12', NULL, NULL),
(3260, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:10:47', NULL, NULL),
(3261, -1, 'roles', 'consultarTodos', 'control-rol', '2019-05-30 02:10:58', NULL, NULL),
(3262, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-05-30 02:10:58', NULL, NULL),
(3263, -1, 'personas', 'consultarId', 'control-persona', '2019-05-30 02:10:58', NULL, NULL),
(3264, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:11:10', NULL, NULL),
(3265, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:11:21', NULL, NULL),
(3266, -1, 'usuarios', 'guardar', 'control-usuario', '2019-05-30 02:11:21', NULL, NULL),
(3267, -1, 'noticias', 'consultarTodos', 'control-noticia', '2019-05-30 02:11:22', NULL, NULL),
(3268, -1, 'solicitudes', 'institucionesSolicitudes', 'control-solicitud', '2019-05-30 02:11:26', NULL, NULL),
(3269, -1, 'solicitudes', 'solicitudesInstitucion', 'control-solicitud', '2019-05-30 02:11:26', NULL, NULL),
(3270, -1, 'solicitudes', 'avanceSolicitud', 'control-solicitud', '2019-05-30 02:11:27', NULL, NULL),
(3271, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-05-30 02:11:53', NULL, NULL),
(3272, -1, 'notificaciones', 'consultarNotificacionesIdUsuario', 'control-notificacion', '2019-05-30 02:12:04', NULL, NULL),
(3273, -1, 'pagos', 'obtenerInstituciones', 'control-pago', '2019-05-30 02:12:06', NULL, NULL),
(3274, -1, 'inspecciones', 'inspecciones', 'control-inspeccion', '2019-05-30 02:12:10', NULL, NULL),
(3275, -1, 'inspecciones', 'inspeccionesInstitucion', 'control-inspeccion', '2019-05-30 02:12:10', NULL, NULL),
(3276, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-01 06:40:28', NULL, NULL),
(3277, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-01 06:40:35', NULL, NULL),
(3278, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-01 06:50:35', NULL, NULL),
(3279, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-13 00:55:03', NULL, NULL),
(3280, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:45:35', NULL, NULL),
(3281, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 04:45:36', NULL, NULL),
(3282, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-14 04:45:43', NULL, NULL),
(3283, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 04:45:43', NULL, NULL),
(3284, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 04:45:43', NULL, NULL),
(3285, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:45:56', NULL, NULL),
(3286, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 04:45:56', NULL, NULL),
(3287, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:46:27', NULL, NULL),
(3288, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 04:46:27', NULL, NULL),
(3289, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-14 04:46:30', NULL, NULL),
(3290, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 04:46:30', NULL, NULL),
(3291, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 04:46:30', NULL, NULL),
(3292, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-14 04:46:47', NULL, NULL),
(3293, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 04:46:47', NULL, NULL),
(3294, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-14 04:46:47', NULL, NULL),
(3295, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-06-14 04:46:47', NULL, NULL),
(3296, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-06-14 04:46:47', NULL, NULL),
(3297, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 04:46:48', NULL, NULL),
(3298, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-06-14 04:56:39', NULL, NULL),
(3299, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-14 04:56:39', NULL, NULL),
(3300, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 04:56:39', NULL, NULL),
(3301, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 04:56:39', NULL, NULL),
(3302, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:56:55', NULL, NULL),
(3303, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:57:07', NULL, NULL),
(3304, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 04:57:08', NULL, NULL),
(3305, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-14 04:57:10', NULL, NULL),
(3306, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-06-14 04:57:10', NULL, NULL),
(3307, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:57:52', NULL, NULL),
(3308, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 04:57:52', NULL, NULL),
(3309, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:58:09', NULL, NULL),
(3310, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 04:58:16', NULL, NULL),
(3311, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 04:58:17', NULL, NULL),
(3312, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:03:33', NULL, NULL),
(3313, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:03:33', NULL, NULL),
(3314, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:03:53', NULL, NULL),
(3315, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:04:10', NULL, NULL),
(3316, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:04:24', NULL, NULL),
(3317, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:04:24', NULL, NULL),
(3318, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-14 05:04:28', NULL, NULL),
(3319, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 05:04:28', NULL, NULL),
(3320, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 05:04:28', NULL, NULL),
(3321, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-14 05:04:31', NULL, NULL),
(3322, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 05:04:31', NULL, NULL),
(3323, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-06-14 05:04:31', NULL, NULL),
(3324, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-06-14 05:04:31', NULL, NULL),
(3325, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-14 05:04:31', NULL, NULL),
(3326, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 05:04:31', NULL, NULL),
(3327, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-06-14 05:04:31', NULL, NULL),
(3328, 15, 'solicitudes', 'guardarSolicitud', 'control-solicitud', '2019-06-14 05:04:39', NULL, NULL),
(3329, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-14 05:04:39', NULL, NULL),
(3330, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 05:04:39', NULL, NULL),
(3331, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 05:04:40', NULL, NULL),
(3332, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:04:49', NULL, NULL),
(3333, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:04:57', NULL, NULL),
(3334, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:04:57', NULL, NULL),
(3335, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-14 05:05:02', NULL, NULL),
(3336, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 05:05:02', NULL, NULL),
(3337, -1, 'solicitudes_estatus_solicitudes', 'estatus', 'control-solicitud-estatus', '2019-06-14 05:05:02', NULL, NULL),
(3338, 8, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-06-14 05:05:02', NULL, NULL),
(3339, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-06-14 05:05:02', NULL, NULL),
(3340, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-14 05:05:02', NULL, NULL),
(3341, 8, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-14 05:05:03', NULL, NULL),
(3342, 8, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-06-14 05:05:03', NULL, NULL),
(3343, 8, 'programas', 'modificacionPrograma', 'control-programa', '2019-06-14 05:05:03', NULL, NULL),
(3344, 8, 'solicitudes', 'revisionDocumentacion', 'control-solicitud', '2019-06-14 00:05:08', NULL, NULL),
(3345, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:05:56', NULL, NULL),
(3346, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:05:56', NULL, NULL),
(3347, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:06:15', NULL, NULL),
(3348, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:06:23', NULL, NULL),
(3349, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:06:23', NULL, NULL),
(3350, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-14 05:06:31', NULL, NULL),
(3351, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-14 05:06:31', NULL, NULL),
(3352, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-14 05:06:31', NULL, NULL),
(3353, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-14 05:06:31', NULL, NULL),
(3354, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-14 05:06:31', NULL, NULL),
(3355, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-14 05:06:31', NULL, NULL),
(3356, 8, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-06-14 05:06:31', NULL, NULL),
(3357, 8, 'solicitudes', 'agendarCita', 'control-solicitud', '2019-06-14 05:06:48', NULL, NULL),
(3358, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:07:01', NULL, NULL),
(3359, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:09:15', NULL, NULL),
(3360, 12, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:09:21', NULL, NULL),
(3361, 12, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:09:22', NULL, NULL),
(3362, 12, 'programas', 'datosGenerales', 'control-programa', '2019-06-14 05:09:26', NULL, NULL),
(3363, -1, 'programa_evaluaciones', 'asignarEvaluacion', 'control-programa-evaluacion', '2019-06-14 05:09:38', NULL, NULL),
(3364, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:09:56', NULL, NULL),
(3365, 16, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-14 05:10:10', NULL, NULL),
(3366, 16, 'usuarios', 'consultarId', 'control-usuario', '2019-06-14 05:10:10', NULL, NULL),
(3367, -1, 'evaluacion_preguntas', 'preguntasGuia', 'control-evaluacion-pregunta', '2019-06-14 05:12:00', NULL, NULL),
(3368, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-17 22:20:31', NULL, NULL),
(3369, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-17 22:20:31', NULL, NULL),
(3370, 2, 'instituciones', 'consultarTodos', 'control-institucion', '2019-06-17 22:20:47', NULL, NULL),
(3371, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-17 22:54:13', NULL, NULL),
(3372, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-17 22:54:14', NULL, NULL),
(3373, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-17 23:04:27', NULL, NULL),
(3374, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-17 23:04:27', NULL, NULL),
(3375, -1, 'personas', 'consultarId', 'control-persona', '2019-06-17 23:04:27', NULL, NULL),
(3376, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-17 23:04:37', NULL, NULL),
(3377, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-18 00:43:56', NULL, NULL),
(3378, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-18 00:43:58', NULL, NULL),
(3379, 2, 'planteles', 'plantelesActivos', 'control-plantel', '2019-06-18 00:44:11', NULL, NULL),
(3380, 2, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-18 01:37:42', NULL, NULL),
(3381, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-18 01:37:44', NULL, NULL),
(3382, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-18 01:37:52', NULL, NULL),
(3383, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-06-18 01:37:52', NULL, NULL),
(3384, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-18 01:38:11', NULL, NULL),
(3385, 2, 'usuarios', 'consultarId', 'control-usuario', '2019-06-18 01:38:11', NULL, NULL),
(3386, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-18 02:11:43', NULL, NULL),
(3387, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-18 02:11:43', NULL, NULL),
(3388, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-18 02:11:43', NULL, NULL),
(3389, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-18 02:11:43', NULL, NULL),
(3390, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-18 02:11:43', NULL, NULL),
(3391, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-18 02:11:43', NULL, NULL),
(3392, 2, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-06-18 02:11:44', NULL, NULL),
(3393, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-18 02:22:34', NULL, NULL),
(3394, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-06-18 02:22:34', NULL, NULL),
(3395, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-18 02:23:14', NULL, NULL),
(3396, 2, 'usuarios', 'registro', 'control-usuario', '2019-06-18 02:24:26', NULL, NULL),
(3397, -1, 'roles', 'consultarTodos', 'control-rol', '2019-06-18 02:24:28', NULL, NULL),
(3398, 2, 'usuarios', 'consultarTodosTabla', 'control-usuario', '2019-06-18 02:24:28', NULL, NULL),
(3399, 31, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-18 02:24:50', NULL, NULL),
(3400, 31, 'usuarios', 'consultarId', 'control-usuario', '2019-06-18 02:24:51', NULL, NULL),
(3401, 31, 'usuarios', 'consultarId', 'control-usuario', '2019-06-18 02:24:52', NULL, NULL),
(3402, 31, 'usuarios', 'guardar', 'control-usuario', '2019-06-18 02:24:58', NULL, NULL),
(3403, 31, 'usuarios', 'consultarId', 'control-usuario', '2019-06-18 02:25:00', NULL, NULL),
(3404, 31, 'solicitudes_usuarios', 'solicitudes', 'control-solicitud-usuario', '2019-06-18 02:25:04', NULL, NULL),
(3405, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-18 02:25:04', NULL, NULL),
(3406, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-18 02:25:04', NULL, NULL),
(3407, 31, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-18 02:25:05', NULL, NULL),
(3408, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-18 02:25:53', NULL, NULL),
(3409, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-18 02:25:53', NULL, NULL),
(3410, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-18 02:25:53', NULL, NULL),
(3411, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-06-18 02:25:53', NULL, NULL),
(3412, 31, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-06-18 02:25:53', NULL, NULL),
(3413, 31, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-18 02:25:53', NULL, NULL),
(3414, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-18 04:40:50', NULL, NULL),
(3415, -1, 'usuarios', 'solicitarNuevaContrasena', 'control-usuario', '2019-06-19 02:49:25', NULL, NULL),
(3416, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-20 00:42:24', NULL, NULL),
(3417, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-20 00:42:31', NULL, NULL),
(3418, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-20 00:42:31', NULL, NULL),
(3419, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-20 00:42:45', NULL, NULL),
(3420, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-20 00:42:45', NULL, NULL),
(3421, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-20 00:42:49', NULL, NULL),
(3422, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-20 00:42:50', NULL, NULL),
(3423, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-20 00:42:50', NULL, NULL),
(3424, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-20 00:42:53', NULL, NULL),
(3425, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-20 00:42:53', NULL, NULL),
(3426, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-20 00:42:53', NULL, NULL),
(3427, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-06-20 00:42:53', NULL, NULL),
(3428, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-06-20 00:42:53', NULL, NULL),
(3429, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-20 00:42:53', NULL, NULL),
(3430, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-06-20 00:42:53', NULL, NULL),
(3431, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-20 00:43:00', NULL, NULL),
(3432, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-20 00:43:00', NULL, NULL),
(3433, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-20 00:43:01', NULL, NULL),
(3434, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-20 00:43:03', NULL, NULL),
(3435, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-20 00:43:03', NULL, NULL),
(3436, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-20 00:43:03', NULL, NULL),
(3437, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-20 00:43:03', NULL, NULL),
(3438, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-20 00:43:03', NULL, NULL),
(3439, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-20 00:43:03', NULL, NULL),
(3440, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-06-20 00:43:03', NULL, NULL),
(3441, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-20 00:45:00', NULL, NULL),
(3442, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-20 00:45:20', NULL, NULL),
(3443, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-20 00:45:36', NULL, NULL),
(3444, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-20 00:45:36', NULL, NULL),
(3445, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-20 00:45:36', NULL, NULL),
(3446, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-20 00:45:39', NULL, NULL),
(3447, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-20 00:45:39', NULL, NULL),
(3448, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-20 00:45:39', NULL, NULL),
(3449, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-20 00:45:39', NULL, NULL),
(3450, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-20 00:45:39', NULL, NULL),
(3451, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-20 00:45:39', NULL, NULL),
(3452, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-06-20 00:45:39', NULL, NULL),
(3453, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:18:41', NULL, NULL),
(3454, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:19:59', NULL, NULL),
(3455, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:20:13', NULL, NULL),
(3456, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:20:14', NULL, NULL),
(3457, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:20:21', NULL, NULL),
(3458, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:20:38', NULL, NULL),
(3459, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:20:38', NULL, NULL),
(3460, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:20:47', NULL, NULL),
(3461, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:20:49', NULL, NULL),
(3462, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:21:15', NULL, NULL),
(3463, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:23:30', NULL, NULL),
(3464, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:24:55', NULL, NULL),
(3465, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:26:28', NULL, NULL),
(3466, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:27:32', NULL, NULL),
(3467, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:27:33', NULL, NULL),
(3468, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:27:45', NULL, NULL),
(3469, 8, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:28:26', NULL, NULL),
(3470, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:28:28', NULL, NULL),
(3471, 8, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:28:44', NULL, NULL),
(3472, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:29:25', NULL, NULL),
(3473, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:31:34', NULL, NULL),
(3474, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:39:26', NULL, NULL),
(3475, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:39:34', NULL, NULL),
(3476, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:39:40', NULL, NULL),
(3477, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:39:41', NULL, NULL),
(3478, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:39:54', NULL, NULL),
(3479, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:40:01', NULL, NULL),
(3480, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:40:01', NULL, NULL),
(3481, 15, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-21 02:40:16', NULL, NULL),
(3482, 15, 'usuarios', 'consultarId', 'control-usuario', '2019-06-21 02:40:18', NULL, NULL),
(3483, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-21 02:40:24', NULL, NULL),
(3484, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-21 02:40:24', NULL, NULL),
(3485, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-21 02:40:24', NULL, NULL),
(3486, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-21 02:40:37', NULL, NULL),
(3487, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-21 02:40:37', NULL, NULL),
(3488, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-21 02:40:37', NULL, NULL),
(3489, -1, 'tipo_instalaciones', 'consultarTodos', 'control-tipo-instalacion', '2019-06-21 02:40:37', NULL, NULL),
(3490, 15, 'usuarios', 'datosRepresentante', 'control-usuario', '2019-06-21 02:40:37', NULL, NULL),
(3491, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-21 02:40:37', NULL, NULL),
(3492, 15, 'solicitudes_usuarios', 'datosSolicitud', 'control-solicitud-usuario', '2019-06-21 02:40:38', NULL, NULL),
(3493, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-21 02:40:50', NULL, NULL),
(3494, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-21 02:40:50', NULL, NULL),
(3495, 15, 'planteles', 'informacionBasica', 'control-plantel', '2019-06-21 02:40:50', NULL, NULL),
(3496, -1, 'niveles', 'consultarTodos', 'control-nivel', '2019-06-21 02:40:55', NULL, NULL),
(3497, -1, 'modalidades', 'consultarTodos', 'control-modalidad', '2019-06-21 02:40:55', NULL, NULL),
(3498, -1, 'turnos', 'consultarTodos', 'control-turno', '2019-06-21 02:40:55', NULL, NULL),
(3499, -1, 'tipo_solicitudes', 'consultarTodos', 'control-tipo-solicitud', '2019-06-21 02:40:55', NULL, NULL),
(3500, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-21 02:40:55', NULL, NULL),
(3501, -1, 'documentos', 'consultarFormato', 'control-documento', '2019-06-21 02:40:55', NULL, NULL),
(3502, 15, 'solicitudes', 'detallesSolicitud', 'control-solicitud', '2019-06-21 02:40:55', NULL, NULL),
(3503, -1, 'usuarios', 'registro', 'control-usuario', '2019-06-22 01:26:06', NULL, NULL),
(3504, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-22 01:26:55', NULL, NULL),
(3505, -1, 'usuarios', 'validarInicioSesion', 'control-usuario', '2019-06-22 01:27:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  `estatus_calificacion_id` int(11) DEFAULT NULL,
  `calificacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_examen` date DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_evaluacion_pregunta`
--

CREATE TABLE `categorias_evaluacion_pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_evaluacion_pregunta`
--

INSERT INTO `categorias_evaluacion_pregunta` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Revisión Técnica', NULL, '2018-10-08 00:00:00', NULL, NULL),
(2, 'Antecedentes académicos de ingreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(3, 'Perfil de ingreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(4, 'Proceso de selección de estudiantes', NULL, '2018-10-08 00:00:00', NULL, NULL),
(5, 'Perfil de egreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(6, 'Mapa curricular', NULL, '2018-10-08 00:00:00', NULL, NULL),
(7, 'Flexibilidad curricular', NULL, '2018-10-08 00:00:00', NULL, NULL),
(8, 'Objetivo general', NULL, '2018-10-08 00:00:00', NULL, NULL),
(9, 'Estructura del plan de estudios', NULL, '2018-10-08 00:00:00', NULL, NULL),
(10, 'Operación del plan de estudios a través de sus academias', NULL, '2018-10-08 00:00:00', NULL, NULL),
(11, 'Líneas de generación y aplicación de conocimiento', NULL, '2018-10-08 00:00:00', NULL, NULL),
(12, 'Actulización del plan de estudios', NULL, '2018-10-08 00:00:00', NULL, NULL),
(13, 'Proyecto de seguimiento a egresados', NULL, '2018-10-08 00:00:00', NULL, NULL),
(14, 'Vinculación con los colegios de profesionistas, academias, asocciaciones profesionales,etc.', NULL, '2018-10-08 00:00:00', NULL, NULL),
(15, 'Vigencia', NULL, '2018-10-08 00:00:00', NULL, NULL),
(16, 'Portada del programa de estudio', NULL, '2018-10-08 00:00:00', NULL, NULL),
(17, 'Contenido de cada asignatura', NULL, '2018-10-08 00:00:00', NULL, NULL),
(18, 'Objetivo general de cada asignatura', NULL, '2018-10-08 00:00:00', NULL, NULL),
(19, 'Modelo de diseño instruccional', NULL, '2018-10-08 00:00:00', NULL, NULL),
(20, 'Diseño instruccional y recursos de aprendizaje', NULL, '2018-10-08 00:00:00', NULL, NULL),
(21, 'Temas y subtemas o unidades de aprendizaje', NULL, '2018-10-08 00:00:00', NULL, NULL),
(22, 'Actividades de aprendizaje', NULL, '2018-10-08 00:00:00', NULL, NULL),
(23, 'Criterios de evalución y acreditación de la asignatura', NULL, '2018-10-08 00:00:00', NULL, NULL),
(24, 'Programa de seguimiento', NULL, '2018-10-08 00:00:00', NULL, NULL),
(25, 'Función de las tutorías', NULL, '2018-10-08 00:00:00', NULL, NULL),
(26, 'Tipo de tutorías e informe de resultados', NULL, '2018-10-08 00:00:00', NULL, NULL),
(27, 'Tasa de egreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(28, 'Base de datos para la titulación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(29, 'Vinculación y movilidad académica', NULL, '2018-10-08 00:00:00', NULL, NULL),
(30, 'Perfil de los académicos', NULL, '2018-10-08 00:00:00', NULL, NULL),
(31, 'Programas de superación académica', NULL, '2018-10-08 00:00:00', NULL, NULL),
(32, 'Espacios y equipamento', NULL, '2018-10-08 00:00:00', NULL, NULL),
(33, 'Laboratorios y talleres', NULL, '2018-10-08 00:00:00', NULL, NULL),
(34, 'Laboratorio de cómputo', NULL, '2018-10-08 00:00:00', NULL, NULL),
(35, 'Información y documentación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(36, 'Licencias de software', NULL, '2018-10-08 00:00:00', NULL, NULL),
(37, 'Sistemas de seguridad', NULL, '2018-10-08 00:00:00', NULL, NULL),
(38, 'Tecnologías de la información y comunicación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(39, 'Acceso a internet con calidad en el servicio', NULL, '2018-10-08 00:00:00', NULL, NULL),
(40, 'Tecnologías para el aprendizaje y servicios administrativos a distancia', NULL, '2018-10-08 00:00:00', NULL, NULL),
(41, 'Potencialidad del programa', NULL, '2018-10-08 00:00:00', NULL, NULL),
(42, 'Plan de trabajo anul', NULL, '2018-10-08 00:00:00', NULL, NULL),
(43, 'Análisis FODA', NULL, '2018-10-08 00:00:00', NULL, NULL),
(44, 'Compromiso académico para consolidar el programa', NULL, '2018-10-08 00:00:00', NULL, NULL),
(45, 'Pertinencia, necesidades sociales y profesionales', NULL, '2018-10-08 00:00:00', NULL, NULL),
(46, 'Oferta y demanda', NULL, '2018-10-08 00:00:00', NULL, NULL),
(47, 'Fuentes de información', NULL, '2018-10-08 00:00:00', NULL, NULL),
(48, 'Objetivos particulares', NULL, '2018-10-08 00:00:00', NULL, NULL),
(49, 'Listado de asignaturas', NULL, '2018-10-08 00:00:00', NULL, NULL),
(50, 'Seriación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(51, 'Bibliohemerografía', NULL, '2018-10-08 00:00:00', NULL, NULL),
(52, 'Titulación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(53, 'Espacios para las tutorías', NULL, '2018-10-08 00:00:00', NULL, NULL),
(54, 'Plataforma educativa', NULL, '2018-10-08 00:00:00', NULL, NULL),
(55, 'Ideario institucional', NULL, '2018-10-16 00:00:00', NULL, NULL),
(56, 'Recursos para su operación', NULL, '2018-10-16 00:00:00', NULL, NULL),
(57, 'Fondos externo', NULL, '2018-10-16 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Semestral', NULL, '2018-11-19 00:00:00', NULL, NULL),
(2, 'Cuatrimestral', NULL, '2018-11-19 00:00:00', NULL, NULL),
(3, 'Anual', NULL, '2018-11-19 00:00:00', NULL, NULL),
(4, 'Semestral curriculum flexible', NULL, '2018-11-19 00:00:00', NULL, NULL),
(5, 'Cuatrimestral curriculum flexible', NULL, '2018-11-19 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos_escolares`
--

CREATE TABLE `ciclos_escolares` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cumplimientos`
--

CREATE TABLE `cumplimientos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `porcentaje_cumplimiento` int(11) NOT NULL,
  `cumplimiento_minimo` int(11) NOT NULL,
  `cumplimiento_maximo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cumplimientos`
--

INSERT INTO `cumplimientos` (`id`, `nombre`, `modalidad_id`, `porcentaje_cumplimiento`, `cumplimiento_minimo`, `cumplimiento_maximo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cumple al 100%', 2, 100, 317, 352, '2018-10-07 19:00:00', NULL, NULL),
(2, 'Aceptable con mínimas recomendaciones ( no requiere segunda revisión)', 2, 90, 282, 316, '2018-10-07 19:00:00', NULL, NULL),
(3, 'Aceptable con recomendaciones (Requiere segunda revisión)', 2, 80, 265, 281, '2018-10-07 19:00:00', NULL, NULL),
(4, 'No aceptable', 2, 70, 0, 264, '2018-10-07 19:00:00', NULL, NULL),
(5, 'Cumple al 100%', 3, 100, 317, 352, '2018-10-07 19:00:00', NULL, NULL),
(6, 'Aceptable con mínimas recomendaciones ( no requiere segunda revisión)', 3, 90, 282, 316, '2018-10-07 19:00:00', NULL, NULL),
(7, 'Aceptable con recomendaciones (Requiere segunda revisión)', 3, 80, 265, 281, '2018-10-07 19:00:00', NULL, NULL),
(8, 'No aceptable', 3, 70, 0, 264, '2018-10-07 19:00:00', NULL, NULL),
(9, 'Cumple al 100%', 1, 100, 281, 312, '2018-10-07 19:00:00', NULL, NULL),
(10, 'Aceptable con mínimas recomendaciones ( no requiere segunda revisión)', 1, 90, 250, 280, '2018-10-07 19:00:00', NULL, NULL),
(11, 'Aceptable con recomendaciones (Requiere segunda revisión)', 1, 80, 219, 249, '2018-10-07 19:00:00', NULL, NULL),
(12, 'No aceptable', 1, 70, 0, 218, '2018-10-07 19:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dictamenes`
--

CREATE TABLE `dictamenes` (
  `id` int(11) NOT NULL,
  `programa_evaluacion_id` int(11) NOT NULL,
  `dictamen_integral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recomendaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluacion_apartado_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `es_aceptado` tinyint(1) DEFAULT '0',
  `tipo_docente` int(11) DEFAULT NULL,
  `tipo_contratacion` int(11) DEFAULT NULL,
  `antiguedad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experiencias` text COLLATE utf8_unicode_ci,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `persona_id`, `es_aceptado`, `tipo_docente`, `tipo_contratacion`, `antiguedad`, `experiencias`, `observaciones`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 10, 0, 1, 1, '1', 'a', NULL, '2019-01-15 17:30:19', NULL, NULL),
(3, 3, 0, 0, 0, '1', 'x', NULL, '2019-01-16 22:01:55', '2019-01-16 22:11:18', NULL),
(4, 4, 0, 0, 0, 'Ninguna', NULL, NULL, '2019-03-06 20:36:08', '2019-03-06 20:55:51', NULL),
(5, 44, 0, 2, 1, NULL, NULL, NULL, '2019-03-06 20:49:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `tipo_entidad` int(11) NOT NULL,
  `entidad_id` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `tipo_entidad`, `entidad_id`, `tipo_documento`, `nombre`, `archivo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'acta-constitutiva_6.pdf', '../uploads/actas-constitutivas/acta-constitutiva_6.pdf', '2019-01-09 02:19:49', '2019-01-12 03:02:39', NULL),
(2, 1, 2, 2, 'acta-constitutiva_15.pdf', '../uploads/actas-constitutivas/acta-constitutiva_15.pdf', '2019-01-17 04:43:02', NULL, NULL),
(3, 2, 3, 1, 'ratificacion_15.pdf', '../uploads/ratificaciones/ratificacion_15.pdf', '2019-01-17 04:43:02', NULL, NULL),
(4, 1, 2, 3, 'logotipo_15.png', '../uploads/logotipos/logotipo_15.png', '2019-01-17 04:43:02', NULL, NULL),
(5, 4, 15, 2, 'firma_representante_201901161001.pdf', '../uploads/Institucion2/REPRESENTANTE/firma_representante_201901161001.pdf', '2019-01-17 05:01:55', NULL, NULL),
(6, 2, 0, 1, 'ratificacion_.pdf', '../uploads/ratificaciones/ratificacion_.pdf', '2019-02-22 00:25:07', NULL, NULL),
(7, 1, 0, 3, 'logotipo_.jpg', '../uploads/logotipos/logotipo_.jpg', '2019-02-22 00:25:07', NULL, NULL),
(8, 2, 0, 1, 'ratificacion_20.pdf', '../uploads/ratificaciones/ratificacion_20.pdf', '2019-02-22 00:31:03', NULL, NULL),
(9, 1, 0, 3, 'logotipo_20.jpg', '../uploads/logotipos/logotipo_20.jpg', '2019-02-22 00:31:03', NULL, NULL),
(10, 1, 3, 1, 'acta-constitutiva_20.pdf', '../uploads/actas-constitutivas/acta-constitutiva_20.pdf', '2019-02-22 01:29:31', NULL, NULL),
(11, 1, 3, 1, 'acta-constitutiva_20.pdf', '../uploads/actas-constitutivas/acta-constitutiva_20.pdf', '2019-02-22 01:29:32', NULL, NULL),
(12, 1, 4, 1, 'acta-constitutiva_24.pdf', '../uploads/actas-constitutivas/acta-constitutiva_24.pdf', '2019-02-22 01:32:50', '2019-02-22 01:37:17', NULL),
(13, 1, 5, 1, 'acta-constitutiva_29.pdf', '../uploads/actas-constitutivas/acta-constitutiva_29.pdf', '2019-03-07 01:08:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilios`
--

CREATE TABLE `domicilios` (
  `id` int(11) NOT NULL,
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero_exterior` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero_interior` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `municipio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_postal` int(11) NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitud` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `domicilios`
--

INSERT INTO `domicilios` (`id`, `calle`, `numero_exterior`, `numero_interior`, `colonia`, `municipio`, `estado`, `codigo_postal`, `pais`, `latitud`, `longitud`, `created_at`, `updated_at`, `deleted_at`) VALUES
(-1, 'WEBSERVICE', '0', '0', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 0, 'WEBSERVICE', '0', '0', '2018-11-04 16:00:00', NULL, NULL),
(1, 'SIN DATO', '0', '0', 'SIN DATO', 'Guadalajara', 'Jalisco', 0, 'SIN DATO', '0', '0', '2018-11-04 16:00:00', NULL, NULL),
(2, 'AVENIDA FARO', '2350', 'PB', 'VERDE VALLE', 'Guadalajara', 'Jalisco', 45037, 'Mexico', '20.65172981052222', '-103.3897590637207', '2019-01-12 03:47:16', '2019-01-16 00:49:18', NULL),
(3, 'SIN DATO', '0', '0', 'SIN DATO', 'Guadalajara', 'Jalisco', 0, 'México', NULL, NULL, '2019-01-12 06:04:06', '2019-01-16 00:49:18', NULL),
(4, 'AV X', '12', '1', 'CENTRO', 'Guadalajara', 'Jalisco', 45100, 'Mexico', '20.74448347251838', '-103.9971227954959', '2019-01-17 04:45:29', '2019-04-03 05:37:24', NULL),
(5, 'calle dato', '11', '0', 'colonia prueba', 'Guadalajara', 'Jalisco', 45100, 'México', NULL, NULL, '2019-01-17 05:01:55', '2019-06-14 05:04:39', NULL),
(6, 'Galileo Galilei', '4040', NULL, 'Arboledas', 'Zapopan', 'Jalisco', 45070, 'Mexico', NULL, NULL, '2019-02-22 01:34:33', '2019-03-21 03:31:01', NULL),
(7, 'Av. Federalismo ', '566', NULL, 'Centro', 'Guadalajara', 'Jalisco', 44180, 'mexico', NULL, NULL, '2019-02-22 02:18:08', NULL, NULL),
(8, 'galileo galilei ', '4030', '0', 'Arboledas', 'Zapopan', 'Jalisco', 45070, 'México', NULL, NULL, '2019-02-22 02:23:20', '2019-03-21 03:31:01', NULL),
(9, 'LOPEZ COTILLA', '19', NULL, 'CENTRO', 'Tala', 'Jalisco', 45300, 'Mexico', '20.64899110889679', '-103.70311157151275', '2019-03-07 02:03:10', '2019-03-13 02:44:43', NULL),
(10, 'lopez cotilla ', '75', '0', 'BARRIO CHARCO VERDE', 'Tala', 'Jalisco', 45300, 'México', NULL, NULL, '2019-03-07 03:16:32', '2019-03-13 02:44:43', NULL),
(11, 'SIN DATO', '0', '0', 'SIN DATO', 'Guadalajara', 'Jalisco', 0, 'México', NULL, NULL, '2019-03-21 02:27:38', '2019-03-21 02:57:56', NULL),
(12, 'lopez mateos', '1111', NULL, 'centro', 'Guadalajara', 'Jalisco', 45100, 'Mexico', NULL, NULL, '2019-03-21 02:55:38', '2019-03-21 02:57:56', NULL),
(13, 'xxx', '11', '11', 'xxxx', 'Acatic', 'Jalisco', 1111, 'Mexico', NULL, NULL, '2019-06-14 04:56:38', '2019-06-14 05:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificios_niveles`
--

CREATE TABLE `edificios_niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `edificios_niveles`
--

INSERT INTO `edificios_niveles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'primer_piso', 'Primer piso', '2018-08-27 17:30:00', NULL, NULL),
(2, 'segundo_piso', 'Segundo piso', '2018-08-27 17:30:00', NULL, NULL),
(3, 'tercer_piso', 'Tercer piso', '2018-08-27 17:30:00', NULL, NULL),
(4, 'cuarto_piso', 'Cuarto piso', '2018-08-27 17:30:00', NULL, NULL),
(10, 'sotano', 'Sotano', '2018-08-27 17:30:00', NULL, NULL),
(20, 'planta_baja', 'Planta baja', '2018-08-27 17:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escalas`
--

CREATE TABLE `escalas` (
  `id` int(11) NOT NULL,
  `puntos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `escalas`
--

INSERT INTO `escalas` (`id`, `puntos`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '[{\"respuesta\":\"NA\",\"valor\":0},{\"respuesta\":\"NO\",\"valor\":0},{\"respuesta\":\"SI\",\"valor\":1}]', 'Escala dicotomica 2018', '2018-10-08 17:00:00', NULL, NULL),
(2, '[{\"respuesta\":\"NA\",\"valor\":0},{\"respuesta\":\"0\",\"valor\":0},{\"respuesta\":\"1\",\"valor\":1},{\"respuesta\":\"2\",\"valor\":2},{\"respuesta\":\"3\",\"valor\":3}]', 'Escala likert 2018', '2018-10-08 17:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espejos`
--

CREATE TABLE `espejos` (
  `id` int(11) NOT NULL,
  `mixta_noescolarizada_id` int(11) NOT NULL,
  `proveedor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ancho_banda` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periocidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_espejo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `espejos`
--

INSERT INTO `espejos` (`id`, `mixta_noescolarizada_id`, `proveedor`, `ancho_banda`, `ubicacion`, `periocidad`, `url_espejo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', NULL, NULL, '2019-03-06 20:36:08', '2019-03-06 20:50:39', NULL),
(2, 5, 'telmex', '15mb', 'mind', NULL, NULL, '2019-03-12 19:44:33', '2019-03-12 19:44:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `pais_id`, `estado`) VALUES
(1, 117, 'Aguascalientes'),
(2, 117, 'Baja California'),
(3, 117, 'Baja California Sur'),
(4, 117, 'Campeche'),
(5, 117, 'Coahuila de Zaragoza'),
(6, 117, 'Colima'),
(7, 117, 'Chiapas'),
(8, 117, 'Chihuahua'),
(9, 117, 'Distrito Federal'),
(10, 117, 'Durango'),
(11, 117, 'Guanajuato'),
(12, 117, 'Guerrero'),
(13, 117, 'Hidalgo'),
(14, 117, 'Jalisco'),
(15, 117, 'México'),
(16, 117, 'Michoacán de Ocampo'),
(17, 117, 'Morelos'),
(18, 117, 'Nayarit'),
(19, 117, 'Nuevo León'),
(20, 117, 'Oaxaca de Juárez'),
(21, 117, 'Puebla'),
(22, 117, 'Querétaro'),
(23, 117, 'Quintana Roo'),
(24, 117, 'San Luis Potosí'),
(25, 117, 'Sinaloa'),
(26, 117, 'Sonora'),
(27, 117, 'Tabasco'),
(28, 117, 'Tamaulipas'),
(29, 117, 'Tlaxcala'),
(30, 117, 'Veracruz de Ignacio de la Llave'),
(31, 117, 'Yucatán'),
(32, 117, 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_calificaciones`
--

CREATE TABLE `estatus_calificaciones` (
  `id` int(11) NOT NULL,
  `estatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_inspeccion`
--

CREATE TABLE `estatus_inspeccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estatus_inspeccion`
--

INSERT INTO `estatus_inspeccion` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nueva', 'Inspección asignada ', '2018-10-06', NULL, NULL),
(2, 'En proceso', 'inspección en proceso', '2018-10-06', NULL, NULL),
(3, 'Completa', 'Inspección completa', '2018-10-06', NULL, NULL),
(4, 'En observación\r\n', 'Inspección terminada pero por atender observaciones', '2018-10-06', NULL, NULL),
(5, 'Sincronizada', 'Acta de cierre expedida', '2018-10-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_solicitudes`
--

CREATE TABLE `estatus_solicitudes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estatus_solicitudes`
--

INSERT INTO `estatus_solicitudes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'COMPLETAR SOLICITUD', 'Solicitud en proceso de llenado', '2018-08-07 03:00:00', NULL, NULL),
(2, 'REVISIÓN DE DOCUMENTACIÓN', 'Solicitud en revisión de documentación', '2018-08-07 03:00:00', NULL, NULL),
(3, 'ENTREGAR DOCUMENTOS EN FÍSICOS', 'Cita generada y a la espera de entregar los formatos FDA01,FDA02 y FDA03', '2018-08-07 03:00:00', NULL, NULL),
(4, 'ASIGNACIÓN TÉCNICO-CURRICULAR', 'Progama en lista de espera para la asignación de un evaluador.', '2018-08-07 03:00:00', NULL, NULL),
(5, 'EVALUACIÓN TÉCNICO-CURRICULAR', 'Programa de estudios en proceso de la evaluación técnico-curricular.', '2018-08-07 03:00:00', NULL, NULL),
(6, 'ASIGNACIÓN INSPECCIÓN FÍSICA', 'Programa en espera de asignación de inspector(es) para realizar la inspección física en el plantel que se imparte el programa.', '2018-08-07 03:00:00', NULL, NULL),
(7, 'INSPECCIÓN FÍSICA', 'Programa en proceso de la inspección física', '2018-08-07 03:00:00', NULL, NULL),
(8, 'REVISIÓN DEL EXPEDIENTE', 'Programa bajo revisión del expediente', '2018-08-07 03:00:00', NULL, NULL),
(9, 'ACUERDO EN IMPRESIÓN', 'Programa en proceso de impresión del certifficado', '2018-08-07 03:00:00', NULL, NULL),
(10, 'RECOGER ACUERDO', 'Certifficado a la espera de ser recogido por el representante legal de la institución', '2018-08-07 03:00:00', NULL, NULL),
(11, 'RVOE ENTREGADO', 'Programa con RVOE activo', '2018-08-07 03:00:00', NULL, NULL),
(100, 'SOLICITUD RECHEZADA', 'Solicitud rechazada', '2018-08-07 03:00:00', NULL, NULL),
(200, 'ATENDER OBSERVACIONES', 'Atender las observaciones', '2018-08-07 03:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` int(11) NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `criterio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones_evaluacion_preguntas`
--

CREATE TABLE `evaluaciones_evaluacion_preguntas` (
  `id` int(11) NOT NULL,
  `programa_evaluacion_id` int(11) NOT NULL,
  `evaluacion_pregunta_id` int(11) NOT NULL,
  `escala_id` int(11) NOT NULL,
  `respuesta` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `comentarios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluaciones_evaluacion_preguntas`
--

INSERT INTO `evaluaciones_evaluacion_preguntas` (`id`, `programa_evaluacion_id`, `evaluacion_pregunta_id`, `escala_id`, `respuesta`, `comentarios`, `created_at`, `updated_at`, `deleted_at`) VALUES
(361, 1, 1, 1, 'SI', 'xxx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(362, 1, 2, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(363, 1, 3, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(364, 1, 11, 2, '1', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(365, 1, 12, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(366, 1, 13, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(367, 1, 14, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(368, 1, 4, 2, '2', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(369, 1, 5, 2, '1', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(370, 1, 6, 2, '2', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(371, 1, 7, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(372, 1, 8, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(373, 1, 9, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(374, 1, 10, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(375, 1, 15, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(376, 1, 16, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(377, 1, 17, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(378, 1, 18, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(379, 1, 19, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(380, 1, 20, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(381, 1, 21, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(382, 1, 22, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(383, 1, 23, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(384, 1, 24, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(385, 1, 25, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(386, 1, 26, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(387, 1, 27, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(388, 1, 28, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(389, 1, 29, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(390, 1, 30, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(391, 1, 31, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(392, 1, 32, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(393, 1, 33, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(394, 1, 36, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(395, 1, 37, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(396, 1, 38, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(397, 1, 39, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(398, 1, 40, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(399, 1, 41, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(400, 1, 42, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(401, 1, 45, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(402, 1, 46, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(403, 1, 47, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(404, 1, 48, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(405, 1, 49, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(406, 1, 50, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(407, 1, 51, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(408, 1, 52, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(409, 1, 53, 2, '3', 'xxx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(410, 1, 54, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(411, 1, 34, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(412, 1, 35, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(413, 1, 43, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(414, 1, 44, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(415, 1, 55, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(416, 1, 56, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(417, 1, 57, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(418, 1, 58, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(419, 1, 59, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(420, 1, 60, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(421, 1, 61, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(422, 1, 62, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(423, 1, 63, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(424, 1, 64, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(425, 1, 65, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(426, 1, 66, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(427, 1, 67, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(428, 1, 68, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(429, 1, 69, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(430, 1, 70, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(431, 1, 71, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(432, 1, 72, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(433, 1, 73, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(434, 1, 75, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(435, 1, 74, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(436, 1, 76, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(437, 1, 77, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(438, 1, 78, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(439, 1, 79, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(440, 1, 80, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(441, 1, 81, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(442, 1, 82, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(443, 1, 83, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(444, 1, 84, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(445, 1, 85, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(446, 1, 86, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(447, 1, 87, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(448, 1, 88, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(449, 1, 89, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(450, 1, 90, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(451, 1, 91, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(452, 1, 92, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(453, 1, 93, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(454, 1, 94, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(455, 1, 95, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(456, 1, 96, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(457, 1, 97, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(458, 1, 98, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(459, 1, 99, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(460, 1, 100, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(461, 1, 101, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(462, 1, 102, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(463, 1, 103, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(464, 1, 104, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(465, 1, 106, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(466, 1, 108, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(467, 1, 109, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(468, 1, 110, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(469, 1, 111, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(470, 1, 112, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(471, 1, 113, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(472, 1, 105, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(473, 1, 107, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(474, 1, 114, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(475, 1, 115, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(476, 1, 116, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(477, 1, 117, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(478, 1, 118, 1, 'SI', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(479, 1, 119, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(480, 1, 120, 2, '3', 'xx', '2019-01-17 05:42:57', '2019-01-17 05:43:07', NULL),
(481, 2, 121, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(482, 2, 122, 1, 'SI', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(483, 2, 123, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(484, 2, 124, 2, '3', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(485, 2, 125, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(486, 2, 126, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(487, 2, 127, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(488, 2, 128, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(489, 2, 129, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(490, 2, 130, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(491, 2, 131, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(492, 2, 132, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(493, 2, 133, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(494, 2, 134, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(495, 2, 135, 1, 'SI', 'xxxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(496, 2, 136, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(497, 2, 137, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(498, 2, 138, 1, 'SI', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(499, 2, 139, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(500, 2, 140, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(501, 2, 141, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(502, 2, 181, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(503, 2, 145, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(504, 2, 146, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(505, 2, 147, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(506, 2, 148, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(507, 2, 149, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(508, 2, 150, 2, '3', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(509, 2, 151, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(510, 2, 152, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(511, 2, 153, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(512, 2, 154, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(513, 2, 155, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(514, 2, 156, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(515, 2, 157, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(516, 2, 158, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(517, 2, 159, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(518, 2, 160, 2, '3', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(519, 2, 161, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(520, 2, 162, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(521, 2, 163, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(522, 2, 164, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(523, 2, 165, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(524, 2, 166, 1, 'SI', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(525, 2, 167, 1, 'SI', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(526, 2, 168, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(527, 2, 169, 1, 'SI', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(528, 2, 170, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(529, 2, 171, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(530, 2, 178, 2, '3', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(531, 2, 182, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(532, 2, 183, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(533, 2, 184, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(534, 2, 185, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(535, 2, 186, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(536, 2, 187, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(537, 2, 188, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(538, 2, 189, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(539, 2, 190, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(540, 2, 191, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(541, 2, 192, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(542, 2, 193, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(543, 2, 194, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(544, 2, 195, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(545, 2, 196, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(546, 2, 197, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(547, 2, 198, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(548, 2, 199, 2, '3', 'xxxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(549, 2, 200, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(550, 2, 201, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(551, 2, 202, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(552, 2, 203, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(553, 2, 204, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(554, 2, 205, 1, 'SI', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(555, 2, 206, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(556, 2, 207, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(557, 2, 208, 1, 'SI', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(558, 2, 209, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(559, 2, 210, 2, '3', 'xxxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(560, 2, 211, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(561, 2, 212, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(562, 2, 213, 2, '3', 'xxxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(563, 2, 214, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(564, 2, 215, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(565, 2, 216, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(566, 2, 217, 2, '3', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(567, 2, 218, 2, '3', 'xxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(568, 2, 219, 2, '3', 'xxxxx', '2019-03-13 06:12:17', '2019-03-15 04:57:52', NULL),
(569, 2, 220, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(570, 2, 221, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(571, 2, 222, 1, 'SI', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(572, 2, 223, 1, 'SI', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(573, 2, 224, 1, 'SI', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(574, 2, 225, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(575, 2, 226, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(576, 2, 227, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(577, 2, 228, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(578, 2, 229, 2, '3', 'xxxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(579, 2, 230, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(580, 2, 231, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(581, 2, 232, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(582, 2, 233, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(583, 2, 234, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(584, 2, 235, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(585, 2, 236, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(586, 2, 237, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(587, 2, 238, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(588, 2, 239, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(589, 2, 240, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(590, 2, 241, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(591, 2, 242, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(592, 2, 243, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(593, 2, 244, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(594, 2, 245, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(595, 2, 246, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(596, 2, 247, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(597, 2, 248, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(598, 2, 249, 2, '3', 'xxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(599, 2, 250, 2, '3', 'xxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(600, 2, 251, 2, '3', 'xxxxxx', '2019-03-13 23:23:37', '2019-03-15 04:57:52', NULL),
(601, 2, 142, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(602, 2, 143, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(603, 2, 144, 2, '3', 'xxxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(604, 2, 172, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(605, 2, 173, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(606, 2, 174, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(607, 2, 175, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(608, 2, 176, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(609, 2, 177, 2, '3', 'xxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(610, 2, 179, 2, '3', 'xxxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL),
(611, 2, 180, 2, '3', 'xxxxx', '2019-03-14 23:55:28', '2019-03-15 04:57:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_apartados`
--

CREATE TABLE `evaluacion_apartados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluacion_apartados`
--

INSERT INTO `evaluacion_apartados` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'FUNDAMENTACIÓN', '2018-10-07 17:00:00', NULL, NULL),
(2, 'PLAN DE ESTUDIOS', '2018-10-07 17:00:00', NULL, NULL),
(3, 'PROGRAMA DE ESTUDIOS', '2018-10-07 17:00:00', NULL, NULL),
(4, 'PROPUESTA BIBLIOGRÁFICA', '2018-10-07 17:00:00', NULL, NULL),
(5, 'TRAYECTORIA Y TUTORÍA ', '2018-10-07 17:00:00', NULL, NULL),
(6, 'VINCULACIÓN Y MOVILIDAD', '2018-10-07 17:00:00', NULL, NULL),
(7, 'PLANTILLA DOCENTE', '2018-10-07 17:00:00', NULL, NULL),
(8, 'INFRAESTRUCTURA ', '2018-10-07 17:00:00', NULL, NULL),
(9, 'TRASCENDENCIA, COBERTURA Y EVOLUCIÓN ', '2018-10-07 17:00:00', NULL, NULL),
(10, 'PLAN DE MEJORA', '2018-10-07 17:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_preguntas`
--

CREATE TABLE `evaluacion_preguntas` (
  `id` int(11) NOT NULL,
  `categoria_evaluacion_pregunta_id` int(11) NOT NULL,
  `evaluacion_apartado_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `escala_id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `item` int(11) NOT NULL,
  `evidencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluacion_preguntas`
--

INSERT INTO `evaluacion_preguntas` (`id`, `categoria_evaluacion_pregunta_id`, `evaluacion_apartado_id`, `modalidad_id`, `escala_id`, `nombre`, `item`, `evidencia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Fundamentación (FDP01)', '2018-10-08 17:00:00', NULL, NULL),
(2, 1, 1, 1, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Fundamentación (FDP01)', '2018-10-08 17:00:00', NULL, NULL),
(3, 1, 1, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Fundamentación (FDP01)', '2018-10-08 17:00:00', NULL, NULL),
(4, 45, 1, 1, 2, '¿En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades sociales?', 8, 'Estudio de Pertinencia y Factibilidad.', '2018-10-08 17:00:00', NULL, NULL),
(5, 45, 1, 1, 2, '¿En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades profesionales?', 9, 'Estudio de Pertinencia y Factibilidad.', '2018-10-08 17:00:00', NULL, NULL),
(6, 45, 1, 1, 2, '¿En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades institucionales?', 10, 'Estudio de Pertinencia y Factibilidad.', '2018-10-08 17:00:00', NULL, NULL),
(7, 46, 1, 1, 2, '¿El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel nacional?', 11, 'Estudio de oferta y demanda', '2018-10-08 17:00:00', NULL, NULL),
(8, 46, 1, 1, 2, '¿El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel internacional?', 12, 'Estudio de oferta y demanda', '2018-10-08 17:00:00', NULL, NULL),
(9, 46, 1, 1, 2, '¿El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel local?', 13, 'Estudio de oferta y demanda', '2018-10-08 17:00:00', NULL, NULL),
(10, 46, 1, 1, 2, '¿El estudio de oferta y demanda incluye la demanda potencial a quién va dirigido?', 14, 'Estudio de oferta y demanda', '2018-10-08 17:00:00', NULL, NULL),
(11, 1, 1, 1, 2, '¿Se citan las fuentes de información utilizadas y son actuales, encuentran actualizadas en la realización de los estudios de:                                                                            Pertinencia, factibilidad, oferta y demanda ?', 4, 'Fuentes de información', '2018-10-08 17:00:00', NULL, NULL),
(12, 1, 1, 1, 1, '¿Cuenta con la misión?', 5, 'Fundamentación (FDP01)', '2018-10-08 17:00:00', NULL, NULL),
(13, 1, 1, 1, 1, '¿La misión define cual es la razón de ser de la institución?', 6, 'Fundamentación (FDP01)', '2018-10-08 17:00:00', NULL, NULL),
(14, 1, 1, 1, 1, '¿Cuenta con la visión?', 7, 'Fundamentación (FDP01)', '2018-10-08 17:00:00', NULL, NULL),
(15, 1, 2, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Plan de estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(16, 1, 2, 1, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Plan de estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(17, 1, 2, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Plan de estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(18, 1, 2, 1, 1, '¿Contiene nombre de la institución, nombre del plan de estudios, nombre del coordinador(a), perfil del coordinador(a) y duración del plan de estudios?', 4, 'Plan de estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(19, 2, 2, 1, 2, '¿Se establece los antecedentes académicos para el ingreso?', 5, 'Antecedentes académicos de ingreso (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(20, 2, 2, 1, 2, '¿Los antecedentes de ingreso son adecuados a la naturaleza del programa educativo?', 6, 'Antecedentes académicos de ingreso (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(21, 2, 2, 1, 2, '¿Establece métodos de inducción donde dará a conocer al aspirante toda la información relativa al plan de estudios?', 7, 'Estructura del plan de estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(22, 3, 2, 1, 2, '¿Establece el perfil de ingreso (conocimientos, habilidades y actitudes)?', 8, 'Perfil de ingreso (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(23, 3, 2, 1, 2, '¿Se definen las características del alumno mismas que permitirán lograr el objetivo del plan de estudios mediante la transformación del estudiante a lo largo del proceso de enseñanza-aprendizaje?', 9, 'Perfil de ingreso (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(24, 4, 2, 1, 2, '¿Establece el proceso de selección de estudiantes?', 10, 'Proceso de selección de estudiantes (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(25, 4, 2, 1, 2, 'Con base en los medios de verificación: ¿el proceso de selección de estudiantes, es rigurosamente académicos y toma en cuenta el perfil de ingreso?', 11, 'Proceso de selección de estudiantes (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(26, 5, 2, 1, 2, '¿El perfil de egreso es acorde al nivel de estudios?', 12, 'Plan de Estudios Perfil de Egreso (FDP02)', NULL, NULL, NULL),
(27, 5, 2, 1, 2, '¿Establece el perfil de egreso (conocimientos, habilidades y actitudes)?', 13, 'Plan de Estudios Perfil de Egreso (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(28, 6, 2, 1, 2, '¿El mapa curricular contiene: nombre de asignaturas con claves, periodo, unidades de aprendizaje obligatorias y optativas en el caso de que las proponga?', 14, 'Mapa Curricular (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(29, 6, 2, 1, 2, '¿El mapa curricular es adecuado para alcanzar los atributos del perfil de egreso?', 15, 'Mapa Curricular (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(30, 6, 2, 1, 2, '¿La estructura del mapa curricular (cursos, seminarios, trabajo de campo o experimental, actividades académicas mediadas por TIC), es la apropiada para cumplir con el proceso de enseñanza-aprendizaje?', 16, 'Mapa Curricular (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(31, 6, 2, 1, 2, ' ¿Se cuenta con la totalidad de los programas de estudio del mapa curricular autorizado por la Institución Educativa que propone el plan de estudio?', 17, 'Mapa Curricular (FDP02) Y (FDP03)', '2018-10-08 17:00:00', NULL, NULL),
(32, 7, 2, 1, 2, '¿La flexibilidad curricular permite al estudiante conjuntamente con su comité tutorial diseñar su trayectoria académica?', 18, 'Mapa Curricular (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(33, 8, 2, 1, 2, '¿Se describe el objetivo general y este expresa una descripción de los resultados que deben obtenerse en un proceso educativo y satisface necesidades sociales?', 19, 'Plan de Estudios, Objetivo General (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(34, 48, 2, 1, 2, '¿Se describen los objetivos particulares y estos se encuentran formulados como logros a mediano plazo del aprendizaje que se produce como consecuencia del proceso educativo?', 37, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(35, 48, 2, 1, 2, '¿Se encuentran expresados en función a las diversas necesidades que solventa el plan de estudio, y son congruentes con el objetivo general?', 38, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(36, 9, 2, 1, 2, '¿Se establecen correctamente las claves para cada asignatura?', 20, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(37, 9, 2, 1, 1, '¿La suma de las horas docentes son correctas, por cada cuatrimestre y por el total de cuatrimestres?', 21, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(38, 9, 2, 1, 1, '¿Las horas bajo la conducción de un docente son congruentes con la modalidad y nivel educativo solicitado? ', 22, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(39, 9, 2, 1, 1, '¿Considerando las horas de trabajo independiente son congruentes con la modalidad y nivel educativo solicitado?', 23, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(40, 9, 2, 1, 1, '¿El número de créditos es correcto de acuerdo al parámetro del nivel y modalidad solicitada?', 24, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(41, 9, 2, 1, 1, '¿El número de Los créditos son correctos de acuerdo a las horas docentes más las independientes por el factor .0625? ', 25, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(42, 9, 2, 1, 2, '¿El Plan de Estudios cuenta con una estructura que muestre la articulación entre sus componentes (objetivos, mapa curricular, contenido temático, formas de evaluación, flexibilidad entre otros)?', 26, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(43, 49, 2, 1, 2, '¿El contenido curricular es el apropiado para alcanzar el perfil de egreso propuesto?', 39, 'Listado de asignaturas (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(44, 50, 2, 1, 2, '¿Se presentan en una secuencia y organización tal que permite al educando aprender desde lo simple a lo complejo de manera coherente y sistemática, congruente con la prioridad de aprendizaje de los objetivos particulares?', 40, 'Seriación (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(45, 10, 2, 1, 2, '¿Se cuenta con un reglamento para el funcionamiento de las academias que sustentan los planes y programas de estudio?', 27, 'Operación del Plan de Estudios a través de sus Academias (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(46, 10, 2, 1, 2, '¿Se cuentan conformadas academias de acuerdo al plan de estudios presentado?', 28, 'Operación del Plan de Estudios a través de sus Academias (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(47, 10, 2, 1, 2, 'La conformación de la academia es:\r\na) Por área del conocimiento\r\nb) De forma general', 29, 'Operación del Plan de Estudios a través de sus Academias (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(48, 11, 2, 1, 2, '¿Las LGAC son congruentes con la naturaleza del programa educativo?', 30, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(49, 11, 2, 1, 2, '¿Proyecto donde se establece la participación de los estudiantes en proyectos (de investigación y/o trabajo profesional) derivados de las LGAC del programa educativo.', 31, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(50, 12, 2, 1, 2, '¿Se establecen mecanismos para la actualización periódica del Plan de Estudios?', 32, 'Actualización del Plan de Estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(51, 13, 2, 1, 2, '¿El Proyecto de seguimiento de egresados es el adecuado?', 33, 'Proyecto de seguimiento de egresados. (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(52, 14, 2, 1, 2, '¿Se tienen establecidos convenios de colaboración con Colegios de Profesionistas, Asociaciones, Redes Académicas, etc., afines a la profesión de egreso?', 34, 'Convenios de vinculación', '2018-10-08 17:00:00', NULL, NULL),
(53, 14, 2, 1, 2, '¿Presenta evidencias?', 35, 'Convenios de vinculación', '2018-10-08 17:00:00', NULL, NULL),
(54, 15, 2, 1, 2, '¿Establece la propuesta vigencia, que corresponde al año de la convocatoria?', 36, 'Plan de estudios (FDP02)', '2018-10-08 17:00:00', NULL, NULL),
(55, 1, 3, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Programas de Estudio (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(56, 1, 3, 1, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Programas de Estudio (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(57, 1, 3, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Programas de Estudio (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(58, 1, 3, 1, 1, '¿Cuenta con el nombre, modalidad, logo de la institución, nombre del representante legal, domicilio, teléfono del plantel y vigencia?', 4, 'Programas de Estudio (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(59, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas el nombre de la asignatura igual a como lo menciona el plan de estudios?', 5, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(60, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas el ciclo al que corresponde?', 6, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(61, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas la calve de la asignatura?', 7, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(62, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas los temas y subtemas?', 8, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(63, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas las actividades de aprendizaje?', 9, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(64, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas los criterios de evaluación y acreditación?', 10, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(65, 18, 3, 1, 2, '¿Los contenidos de cada una de las asignaturas están diseñados de tal manera que los alumnos desarrollen los conocimientos y las habilidades necesarios para alcanzar los objetivos de aprendizaje tanto de la asignatura como del programa educativo propuesto', 11, 'Programas de Estudio (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(66, 18, 3, 1, 2, '¿Se presenta el objetivo general de la asignatura?', 12, 'Objetivos general de la asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(67, 18, 3, 1, 2, '¿Los objetivos de aprendizaje describen resultados que son susceptibles de medición?', 13, 'Objetivos general de la asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(68, 18, 3, 1, 2, '¿Los temas y subtemas o unidades de aprendizaje son congruentes con la temática a desarrollar en cada una de las asignaturas y con uno o más objetivos particulares del plan de estudios?', 14, 'Objetivos general de la asignatura (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(69, 21, 3, 1, 2, '¿Los temas y subtemas o unidades de aprendizaje son congruentes con la temática a desarrollar en cada una de las asignaturas y con uno o más objetivos particulares del plan de estudios?', 15, 'Temas y subtemas o unidades de aprendizaje (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(70, 21, 3, 1, 2, '¿La descripción de los temas y subtemas o unidades de aprendizaje son congruentes con el nombre y objetivo general de la asignatura?', 16, 'Temas y subtemas o unidades de aprendizaje (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(71, 21, 3, 1, 2, 'Los temas y subtemas o unidades de aprendizaje ¿Se presentan en una secuencia lógica y es alcanzable de acuerdo a la labor de los docentes, desempeño de los estudiantes y en el período señalado?', 17, 'Temas y subtemas o unidades de aprendizaje (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(72, 22, 3, 1, 2, '¿Las actividades de aprendizaje están dirigidas a desarrollar en los alumnos actividades y actitudes para la aplicación de los conocimientos teóricos?', 18, 'Programas de Estudio.  Actividades de aprendizaje (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(73, 22, 3, 1, 2, 'Las actividades de aprendizaje ¿permiten la identificación de las horas docente de las horas de trabajo independiente por parte de los alumnos?', 19, 'Programas de Estudio.  Actividades de aprendizaje (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(74, 23, 3, 1, 2, '¿Los criterios de evaluación y acreditación de la asignatura permiten evaluar el aprendizaje y habilidades adquiridas por el estudiante?', 20, 'Criterios de evaluación y acreditación. (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(75, 22, 3, 1, 2, '¿Los criterios de evaluación se diferencian entre cada una de las asignaturas?', 21, 'Criterios de evaluación y acreditación. (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(76, 1, 4, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(77, 1, 4, 1, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(78, 1, 4, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(79, 51, 4, 1, 2, '¿Describe número total de ejemplares de la biblioteca institucional?', 4, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(80, 51, 4, 1, 2, '¿El acervo está clasificado con claves y nombre de asignatura idénticamente como lo menciona el plan de estudio?', 5, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(81, 51, 4, 1, 2, '¿El número de ejemplares es de acuerdo a la modalidad solicitada?', 6, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(82, 51, 4, 1, 2, '¿Cumple con el mínimo de títulos?', 7, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(83, 51, 4, 1, 2, '¿Cuenta con un acervo actualizado, con una vigencia no mayor de cinco años?', 8, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(84, 51, 4, 1, 2, '¿Se agregaron todas las asignaturas?', 9, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(85, 51, 4, 1, 2, '¿El nombre del libro, compilación publicación periódica o material multimedia es consistente con las características del curso?', 10, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(86, 51, 4, 1, 2, '¿El material bibliohemerográfico es el adecuado para el nivel de la asignatura?', 11, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(87, 51, 4, 1, 2, '¿Las publicaciones son realmente un apoyo para el aprendizaje y la consecución de los objetivos?', 12, 'Bibliohemerografía (FDP04)', '2018-10-09 17:00:00', NULL, NULL),
(88, 24, 5, 1, 2, 'Con base en los medios de verificación para la evaluación curricular ¿Es pertinente el proyecto de seguimiento de la trayectoria y tutoría académica de los estudiantes desde su ingreso hasta el egreso del programa?', 1, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-09 17:00:00', NULL, NULL),
(89, 25, 5, 1, 2, 'Las tutorias tienen una función:\r\na) Académica\r\nb) Administrativa\r\nc) Psicológica', 2, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-09 17:00:00', NULL, NULL),
(90, 26, 5, 1, 1, 'La tutoría se implementa de forma:\r\n-Individual\r\n-Grupal\r\nBajo la modalidad:\r\n·Presencial\r\n·Virtual\r\n·Mixta', 3, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-09 17:00:00', NULL, NULL),
(91, 26, 5, 1, 1, '¿Se elabora un informe de resultados?', 4, 'Informe de resultados', '2018-10-09 17:00:00', NULL, NULL),
(92, 27, 5, 1, 1, '¿Los formatos o instrumentos para el programa de tutorías son los adecuados?', 5, 'Trayectoria y tutoria académica', '2018-10-09 17:00:00', NULL, NULL),
(93, 27, 5, 1, 1, '¿El tiempo promedio con el que se prevé se gradúen los estudiantes es congruente con el establecido en el plan de estudios?', 6, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 17:00:00', NULL, NULL),
(94, 52, 5, 1, 1, '¿La institución cuenta con bases de datos para emitir reportes estadísticos de titulación por cohorte generacional?', 7, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 17:00:00', NULL, NULL),
(95, 52, 5, 1, 1, '¿La institución tiene proyectados reportes estadísticos de eficiencia terminal por cohorte generacional?', 8, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 17:00:00', NULL, NULL),
(96, 52, 5, 1, 1, 'Modalidad de titulación que utilizan principalmente los alumnos del PE:\r\na) Desempeño académico\r\nb) Exámenes\r\nc)Producción de materiales educativos\r\nd) Investigación y estudios de posgrado\r\ne) Tesis, tesina e informes\r\nf) Demostración de habilidades', 9, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 17:00:00', NULL, NULL),
(97, 29, 6, 1, 1, '¿Se cuenta con un proyecto que permita que los estudiantes y docentes puedan realizar movilidad tanto nacional como internacional en fortalecimiento a sus competencias profesionales?', 1, 'Proyecto de movilidad para el intercambio de los estudiantes y los docentes', '2018-10-09 17:00:00', NULL, NULL),
(98, 29, 6, 1, 1, '¿Se cuentan con convenios de vinculación con los diversos sectores para que los alumnos realicen su práctica profesional, servicio social, tesis de grado, entre otras actividades?', 2, 'Convenios de colaboración ', '2018-10-09 17:00:00', NULL, NULL),
(99, 1, 7, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Plantilla de docentes (FDP06 ) y (FDP07)', '2018-10-09 17:00:00', NULL, NULL),
(100, 1, 7, 1, 1, '¿Menciona nombre de la institución, nombre del plan de estudio, modalidad, domicilio, teléfono, tipo de trámite, duración del programa?', 2, 'Plantilla de docentes (FDP06 ) y (FDP07)', '2018-10-09 17:00:00', NULL, NULL),
(101, 30, 7, 1, 2, '¿Los docentes cumplen con los lineamientos establecidos en el Instructivo de RVOE para garantizar la calidad del programa?', 3, 'Plantilla de docentes (FDP06) y (FDP07)', '2018-10-09 17:00:00', NULL, NULL),
(102, 30, 7, 1, 2, '¿Los docentes que participarán en el programa educativo cuenta con el perfil adecuado para el grado, nivel LGAC y orientación del programa educativo?', 4, 'Plantilla de docentes (FDP06) y (FDP07)', '2018-10-09 17:00:00', NULL, NULL),
(103, 30, 7, 1, 2, '¿Los docentes que no cuentan con el título necesario cumplen  con el perfil de equivalencias?', 5, 'Plantilla de docentes (FDP06) y (FDP07)', '2018-10-09 17:00:00', NULL, NULL),
(104, 30, 7, 1, 2, '¿El programa educativo cuenta con un proyecto de superación académica y es adecuado a la naturaleza del programa’?', 6, 'Programa de superación y/o actualización académica para la modalidad presencial ', '2018-10-09 17:00:00', NULL, NULL),
(105, 32, 8, 1, 2, '¿La disponibilidad y funcionalidad de los espacios destinados a profesores y estudiantes son adecuadas para el desarrollo del programa?', 8, 'Descripción de instalaciones  (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(106, 1, 8, 1, 1, '¿El plantel dispone de espacios individuales o grupales para las tutorías?', 1, 'Descripción de instalaciones  (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(107, 33, 8, 1, 2, '¿De acuerdo a la naturaleza del programa, los laboratorios realizan proyectos de investigación y/o desarrollo reflejados en la productividad académica del programa?', 9, 'Fotografías de los espacios', '2018-10-09 17:00:00', NULL, NULL),
(108, 1, 8, 1, 1, '¿Especificar los laboratorios y talleres con que cuentan para el programa educativo?', 2, 'Descripción de instalaciones (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(109, 1, 8, 1, 1, 'Existe laboratorio de cómputo para el programa educativo:\r\n  a)Porpio\r\n  b)Compartido', 3, 'Descripción de instalaciones (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(110, 1, 8, 1, 1, '¿Existe evidencia de la actualización y nuevas adquisiciones de acervos (digitales e impresos) de la biblioteca?', 4, 'Descripción de instalaciones (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(111, 1, 8, 1, 1, 'Número totales de ejemplares de la biblioteca', 5, 'Descripción de instalaciones (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(112, 1, 8, 1, 1, 'Número total de ejemplares para el programa educativo', 6, 'Descripción de instalaciones (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(113, 1, 8, 1, 1, '¿El número de ejemplares de la biblioteca básica son suficientes para la matrícula del programa educativo? Parámetro: 1 ejemplar por cada/10 alumnos.', 7, 'Descripción de instalaciones (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(114, 38, 8, 1, 2, '¿La infraestructura de las TIC es adecuada a las necesidades de desarrollo del programa educativo?', 10, 'Documento que mencione la infraestructura de las TIC con la que cuenta el programa educativo, portal web y plataformas educativas.(FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(115, 38, 8, 1, 2, 'Los estudiantes y profesores tienen  acceso ágil y eficiente a redes nacionales e internacionales de información, bases de datos y publicaciones digitales.', 11, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-09 17:00:00', NULL, NULL),
(116, 38, 8, 1, 2, '¿Se tiene una plataforma educativa que garantice la adecuada comunicación entre el alumno y el tutor, de manera que dicho instrumento apoye realmente la actividad de aprendizaje?', 12, 'Plataforma educativa, portal web.', '2018-10-09 17:00:00', NULL, NULL),
(117, 1, 10, 1, 1, 'Se tiene establecido un plan de trabajo anual para el desarrollo de las actividades académicas del programa educativo.', 1, 'Plan de trabajo anual para el desarrollo del programa educativo. (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(118, 1, 10, 1, 1, 'En caso de tener un plan anual se consideran las actividades tales como:\r\na)Conferencias\r\nb)Talleres\r\nc)Actividades\r\nd)Seminarios o exposiciones', 2, 'Plan de trabajo anual para el desarrollo del programa educativo. (FDP03)', '2018-10-09 17:00:00', NULL, NULL),
(119, 43, 10, 1, 2, '¿El Plan de Mejora toma en cuenta el análisis FODA de la autoevaluación para su elaboración?', 3, 'Plan de mejora', '2018-10-09 17:00:00', NULL, NULL),
(120, 44, 10, 1, 2, '¿El Plan de Mejora manifiesta el compromiso académico para consolidar el programa educativo en el ámbito local y nacional?', 4, 'Plan de mejora', '2018-10-09 17:00:00', NULL, NULL),
(121, 1, 1, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(122, 1, 1, 2, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(123, 1, 1, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(124, 45, 1, 2, 2, 'En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades: Sociales, profesionales e institucionales', 4, 'Estudio de Pertinencia y Factibilidad. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(125, 46, 1, 2, 2, 'El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel: Internacional,Nacional, Local y demanda potencial', 5, 'Estudio de oferta y demanda. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(126, 47, 1, 2, 2, '¿Los estudios de pertinencia, factibilidad, oferta y demanda educativa se obtuvieron utilizando la versión más actualizada de fuentes de información?', 6, 'Fuentes de información. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(127, 55, 1, 2, 1, '¿Cuenta con misión?', 7, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(128, 55, 1, 2, 1, '¿La misión define cual es la razón de ser de la institución?', 8, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(129, 55, 1, 2, 1, '¿Cuenta con la Visión?', 9, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(130, 55, 1, 2, 1, '¿La visión define a dónde se quiere llegar?', 10, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(131, 55, 1, 2, 1, '¿Se formula en tiempo presente como condiciones de efectividad ya alcanzadas?', 11, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(132, 55, 1, 2, 1, '¿Cuenta con Valores Institucionales?', 12, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(133, 55, 1, 2, 1, '¿Los valores institucionales son congruentes con la misión y la visión?', 13, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(134, 55, 1, 2, 1, '¿Describe la Historia de la Institución?', 14, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(135, 56, 1, 2, 1, '¿Existe evidencia de que el programa cuenta con recursos institucionales para su operación? ', 15, 'Recursos para su operación. Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(136, 57, 1, 2, 2, '¿Presenta convenios o acciones de vinculación?', 16, 'Convenios . Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(137, 57, 1, 2, 2, '¿Los convenios son acordes al nivel y orientación del programa?', 17, 'Fundamentación (FDP01)', '2018-10-13 17:00:00', NULL, NULL),
(138, 1, 2, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Plan de estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(139, 1, 2, 2, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Plan de estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(140, 1, 2, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Plan de estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(141, 1, 2, 2, 1, '¿Contiene nombre de la institución, nombre del Plan de Estudio, nombre del coordinador(a),  perfil del coordinador(a) y Duración del plan de estudio?', 4, 'Plan de estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(142, 2, 2, 2, 2, '¿Se establece los antecedentes académicos para el ingreso?', 6, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(143, 2, 2, 2, 2, '¿Estos son adecuados a la naturaleza del programa educativo?', 7, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(144, 2, 2, 2, 2, '¿Establece Métodos de Inducción donde dará a conocer al aspirante  toda la información relativa al  plan de estudio?', 8, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(145, 2, 2, 2, 2, '¿Se informa a los aspirantes las características del programa a fin de determinar si cuentan con la automotivación y el compromiso necesarios para emprender un aprendizaje en estas modalidades?', 9, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(146, 2, 2, 2, 2, '¿Se informa a los aspirantes las características del programa a fin de determinar si tienen acceso a los requisitos tecnológicos mínimos exigidos por el diseño del programa?', 10, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(147, 2, 2, 2, 2, 'Los aspirantes reciben (o tienen acceso a) información acerca de los programas, incluidos los requisitos de admisión, matrícula y cuotas, libros e insumos, requisitos técnicos y de supervisión de exámenes y servicios de apoyo para alumnos antes de la admisión y la inscripción en los cursos', 11, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(148, 3, 2, 2, 2, '¿Establece el perfil de ingreso (conocimientos, habilidades y actitudes)?', 12, 'Perfil de Ingreso (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(149, 3, 2, 2, 2, '¿Se definen las características del alumno mismas que permitirán lograr el objetivo del plan de estudios mediante la transformación del estudiante a lo largo del proceso de enseñanza-aprendizaje?', 13, 'Perfil de Ingreso (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(150, 4, 2, 2, 2, '¿Establece el proceso de selección de estudiantes?', 14, ' Proceso de selección de estudiantes (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(151, 4, 2, 2, 2, 'Con base en los medios de verificación: ¿el proceso de selección de estudiantes, es rigurosamente académico?', 15, ' Proceso de selección de estudiantes (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(152, 4, 2, 2, 2, '¿Toma en cuenta el perfil de ingreso?', 16, ' Proceso de selección de estudiantes (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(153, 5, 2, 2, 2, '¿El perfil de egreso establece los conocimientos  habilidades y actitudes que los estudiantes deben tener al concluir sus estudios?', 17, 'Perfil de egreso (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(154, 5, 2, 2, 2, '¿El perfil de egreso es acorde al nivel de estudios?', 18, 'Perfil de egreso (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(155, 6, 2, 2, 1, '¿El mapa curricular contiene: nombre de asignaturas con claves, periodo, unidades de aprendizaje obligatorias y optativas en el caso de que las proponga?', 19, 'Mapa curricular (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(156, 6, 2, 2, 2, '¿El mapa curricular es adecuado para alcanzar los atributos del perfil de egreso?', 20, 'Mapa curricular (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(157, 6, 2, 2, 2, '¿La estructura del mapa curricular (cursos, seminarios, trabajo de campo o experimental, actividades académicas mediadas por TIC), es la apropiada para cumplir con el proceso de enseñanza-aprendizaje?', 21, 'Mapa curricular (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(158, 6, 2, 2, 2, '¿Se cuenta con la totalidad de los programas de estudio del mapa curricular autorizado por la Institución Educativa que propone el plan de estudio?', 22, 'Mapa curricular (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(159, 6, 2, 2, 2, '¿La flexibilidad curricular permite al estudiante conjuntamente con su comité tutorial diseñar su trayectoria académica?', 23, 'Mapa curricular (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(160, 8, 2, 2, 2, '¿Se describe el objetivo general y este expresa una descripción de los resultados que deben obtenerse en un proceso educativo y satisface necesidades sociales?', 24, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(161, 8, 2, 2, 2, '¿Se describen los objetivos particulares y estos se encuentran formulados como logros a mediano plazo del aprendizaje que se produce como consecuencia del proceso educativo?', 25, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(162, 8, 2, 2, 2, '¿Se encuentran expresados en función a las diversas necesidades que solventa el plan de estudio, y son congruentes con el objetivo genera?', 26, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(163, 9, 2, 2, 1, '¿Se establecen correctamente las claves para cada asignatura?', 27, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(164, 9, 2, 2, 1, 'La suma de las horas docentes son correctas, por cada cuatrimestre y por el total de cuatrimestres?', 28, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(165, 9, 2, 2, 1, '¿Las horas bajo la conducción de un docente son congruentes con la modalidad y nivel educativo solicitado?', 29, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(166, 9, 2, 2, 1, '¿Considerando las horas de trabajo independiente son congruentes con la modalidad y nivel educativo solicitado?', 30, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(167, 9, 2, 2, 1, '¿El número de créditos es correcto de acuerdo al parámetro del nivel y modalidad solicitada?', 31, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(168, 9, 2, 2, 1, '¿El número de Los créditos son correctos de acuerdo a las horas docentes más las independientes por el factor .0625?', 32, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(169, 9, 2, 2, 1, '¿El Plan de Estudios cuenta con una estructura que muestre la articulación entre sus componentes (objetivos, mapa curricular, contenido temático, formas de evaluación, flexibilidad entre otros)?', 33, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(170, 9, 2, 2, 2, '¿El contenido curricular es el apropiado para alcanzar el perfil de egreso propuesto?', 34, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(171, 9, 2, 2, 2, '¿Se presentan en una secuencia y organización tal que permite al educando aprender desde lo simple a lo complejo de manera coherente y sistemática, congruente con la prioridad de aprendizaje de los objetivos particulares?', 35, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(172, 10, 2, 2, 2, '¿Se cuenta con un reglamento para el funcionamiento de las academias que sustentan los planes y programas de estudio?', 36, 'Operación del Plan de Estudios a través de sus Academias (FDP02) (Reglas operación academia)', '2018-10-16 17:00:00', NULL, NULL),
(173, 10, 2, 2, 2, '¿Se cuentan conformadas academias de acuerdo al plan de estudios presentado?', 37, 'Operación del Plan de Estudios a través de sus Academias (FDP02) (Reglas operación academia)', '2018-10-16 17:00:00', NULL, NULL),
(174, 10, 2, 2, 2, 'La conformación de las academias es: Por área del conocimiento, De manera general', 38, 'Operación del Plan de Estudios a través de sus Academias (FDP02) (Reglas operación academia)', '2018-10-16 17:00:00', NULL, NULL),
(175, 11, 2, 2, 2, '¿Las LGAC son congruentes con la naturaleza del programa educativo?', 39, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(176, 11, 2, 2, 2, '¿Proyecto donde se establece la participación de los estudiantes en proyectos (de investigación y/o trabajo profesional) derivados de las LGAC del programa educativo?', 40, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(177, 12, 2, 2, 2, '¿Se establecen mecanismos para la actualización periódica del Plan de Estudios?', 41, 'Actualización del Plan de Estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(178, 24, 2, 2, 2, '¿El Proyecto de seguimiento de egresados es el adecuado?', 44, 'Proyecto de seguimiento de egresados. (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(179, 14, 2, 2, 2, '¿Se tienen establecidos convenios de colaboración con Colegios de Profesionistas, Asociaciones, Redes Académicas, etc., afines a la profesión de egreso?', 42, '(Convenios)', '2018-10-16 17:00:00', NULL, NULL),
(180, 14, 2, 2, 2, '¿Presenta evidencias?', 43, '(Convenios)', '2018-10-16 17:00:00', NULL, NULL),
(181, 1, 2, 2, 1, '¿Establece la propuesta vigencia, que corresponde al año de la convocatoria?', 5, 'Plan de estudios (FDP02)', '2018-10-16 17:00:00', NULL, NULL),
(182, 1, 3, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Programas de Estudio (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(183, 1, 3, 2, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Programas de Estudio (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(184, 1, 3, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Programas de Estudio (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(185, 1, 3, 2, 1, '¿Cuenta con el nombre, modalidad, logo de la institución, nombre del representante legal, domicilio, teléfono del plantel y vigencia?', 4, 'Programas de Estudio (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(186, 3, 3, 2, 2, '¿Los contenidos de cada una de las asignaturas están diseñados de tal manera que los alumnos desarrollen los conocimientos y las habilidades necesarios para alcanzar los objetivos de aprendizaje tanto de la asignatura como del programa educativo propuesto?', 5, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(187, 3, 3, 2, 2, '¿Se presenta en cada una de las asignaturas los siguientes elementos de acuerdo al Instructivo de RVOE?: Nombre de la asignatura igual como lo menciona el plan de estudios, cliclo al que corresponde, clave de la asignatura, temas y subtemas, actividades de aprendizaje y criterios de procedimientos de evaluación/acreditación', 6, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(188, 3, 3, 2, 2, 'Los objetivos de aprendizaje describen resultados que son susceptibles de medición. ', 7, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(189, 3, 3, 2, 2, 'El Modelo de diseño instruccional establece los lineamientos o guías que lo norman.', 8, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(190, 3, 3, 2, 2, 'Se establecen los lineamientos y procesos mediante los cuales se diseñan las unidades, temas y actividades que favorecen el aprendizaje activo y colaborativo, así como el acceso a los contenidos en diferentes ambientes virtuales.', 9, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(191, 3, 3, 2, 2, 'Se consideran estrategias para garantizar que los recursos de aprendizaje consideren de manera integral aspectos pedagógicos, editoriales, técnicos y de diseño gráfico.', 10, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(192, 21, 3, 2, 2, '¿Los temas y subtemas son congruentes con la temática a desarrollar en cada una de las asignaturas y con uno o más objetivos particulares del plan de estudios', 11, 'Temas y subtemas o unidades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(193, 21, 3, 2, 2, '¿La descripción de los temas y subtemas son congruentes con el nombre y objetivo general de la asignatura?', 12, 'Temas y subtemas o unidades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(194, 21, 3, 2, 2, 'Los temas y subtemas ¿Se presentan en una secuencia lógica y es alcanzable de acuerdo a la labor de los docentes, desempeño de los estudiantes y en el período señalado?', 13, 'Temas y subtemas o unidades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(195, 22, 3, 2, 2, '¿Las actividades de aprendizaje están dirigidas a desarrollar en los alumnos actividades y actitudes para la aplicación de los conocimientos teóricos?', 14, 'Actividades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(196, 22, 3, 2, 2, 'Las actividades de aprendizaje ¿permiten la identificación de las horas docente de las horas de trabajo independiente por parte de los alumnos?', 15, 'Actividades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(197, 23, 3, 2, 2, '¿En el diseño instruccional quedan claramente establecidas las actividades de aprendizaje, las formas de evaluación, las fechas de entrega, los productos a realizar entre otros, de manera tal que el estudiante pueda realizarlas de manera autónoma?', 16, 'Criterios de evaluación y acreditación. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(198, 23, 3, 2, 2, '¿Los criterios de evaluación y acreditación de la asignatura permiten evaluar el aprendizaje y habilidades adquiridas por el estudiante?', 17, 'Criterios de evaluación y acreditación. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(199, 23, 3, 2, 2, '¿Los criterios de evaluación se diferencian entre cada una de las asignaturas?', 18, 'Criterios de evaluación y acreditación. (Asignaturas a detalle) (FDP03)', '2018-10-16 17:00:00', NULL, NULL),
(200, 1, 4, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(201, 1, 4, 2, 1, '¿Se cuenta con una buena redacción (sin faltas de ortografía)? ', 2, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(202, 1, 4, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(203, 1, 4, 2, 1, '¿El acervo está clasificado  con claves y nombre de asignatura idénticamente como lo menciona el plan de estudio?', 4, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(204, 1, 4, 2, 1, '¿El número de ejemplares es de acuerdo a la modalidad solicitada?', 5, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(205, 1, 4, 2, 1, '¿Cumple con el mínimo de títulos? ', 6, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(206, 1, 4, 2, 1, '¿Cuenta con un acervo actualizado, con una vigencia no mayor de cinco años?', 7, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(207, 1, 4, 2, 1, '¿Se agregaron todas las asignaturas? ', 8, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(208, 1, 4, 2, 1, '¿El material bibliohemerográfico es el adecuado para el nivel de la asignatura?', 9, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(209, 51, 4, 2, 2, '¿Las publicaciones son realmente un apoyo para el aprendizaje y la consecución de los objetivos?', 10, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(210, 51, 4, 2, 2, '¿Existen mecanismos para promover y vigilar que los materiales utilizados en las unidades de aprendizaje cumplan con la normativa vigente en materia de derechos de autor?', 11, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(211, 24, 5, 2, 2, 'Con base en los medios de verificación para la evaluación curricular ¿Es pertinente el proyecto de seguimiento de la trayectoria académica de los estudiantes desde su ingreso hasta el egreso del programa?', 1, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 17:00:00', NULL, NULL),
(212, 25, 5, 2, 2, 'Las tutorías tienen una funcion: academica, administrativa o psicológica', 2, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 17:00:00', NULL, NULL),
(213, 26, 5, 2, 2, 'Las tutoría se implemente de forma: individual o grupal. Bajo la modalidad de : presencial, virtual o mixta', 3, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 17:00:00', NULL, NULL),
(214, 26, 5, 2, 2, '¿Se elabora un informe de resultados?', 4, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) (Infrome de resultados)', '2018-10-16 17:00:00', NULL, NULL),
(215, 26, 5, 2, 2, '¿Los formatos o instrumentos para el programa de tutorías son los adecuados?', 5, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)(Instrumentos para tutoria)', '2018-10-16 17:00:00', NULL, NULL),
(216, 27, 5, 2, 2, '¿El tiempo promedio con el que se prevé se gradúen los estudiantes es congruente con el establecido en el plan de estudios?', 6, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 17:00:00', NULL, NULL),
(217, 28, 5, 2, 2, '¿La institución cuenta con bases de datos para emitir reportes estadísticos de titulación por cohorte generacional?', 7, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 17:00:00', NULL, NULL),
(218, 28, 5, 2, 2, '¿La institución tiene proyectados reportes estadísticos de eficiencia terminal por cohorte generacional?', 8, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 17:00:00', NULL, NULL),
(219, 28, 5, 2, 2, 'Modalidad de titulación que utilizan principalmente los alumnos del PE: desempeño académico, exámenes, producción de materiales educativos, investigación y estudios de posgrados, tesis, tesina e informes o demostración de habilidades', 9, 'Trayectoria educativa y tutoría de los estudiantes. (Reglamento institucional)', '2018-10-16 17:00:00', NULL, NULL),
(220, 29, 6, 2, 2, '¿Se cuenta con un proyecto que permita que los estudiantes y docentes puedan realizar movilidad tanto nacional como internacional en fortalecimiento a sus competencias profesionales?', 1, '(Proyecto de vinculación y movilidad)', '2018-10-16 17:00:00', NULL, NULL),
(221, 29, 6, 2, 2, '¿Se cuentan con convenios de vinculación con los diversos sectores para que los alumnos realicen su práctica profesional, servicio social, tesis de grado, entre otras actividades?', 2, '(Convenios)', '2018-10-16 17:00:00', NULL, NULL),
(222, 1, 7, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 17:00:00', NULL, NULL),
(223, 1, 7, 2, 1, '¿Menciona nombre de la institución, nombre del plan de estudio, modalidad, domicilio, teléfono, tipo de trámite, duración del programa?', 2, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 17:00:00', NULL, NULL),
(224, 1, 7, 2, 1, '¿Los docentes cumplen con los lineamientos establecidos en el Instructivo de RVOE para garantizar la calidad del programa?', 3, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 17:00:00', NULL, NULL),
(225, 30, 7, 2, 2, '¿Los docentes que participarán en el programa educativo cuenta con el perfil adecuado para el grado, nivel LGAC y orientación del programa educativo?', 4, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 17:00:00', NULL, NULL),
(226, 30, 7, 2, 2, '¿Los docentes que no cuentan con el título necesario cumplen  con el perfil de equivalencias?', 5, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 17:00:00', NULL, NULL),
(227, 31, 7, 2, 2, '¿El programa educativo cuenta con un proyecto de superación académica y es adecuado a la naturaleza del programa’?', 6, '(Progrma de superación)', '2018-10-16 17:00:00', NULL, NULL),
(228, 32, 8, 2, 2, '¿La disponibilidad y funcionalidad de los espacios destinados a profesores y estudiantes son adecuadas para el desarrollo del programa?', 1, 'Descripción de instalaciones (FDA05)', '2018-10-16 17:00:00', NULL, NULL);
INSERT INTO `evaluacion_preguntas` (`id`, `categoria_evaluacion_pregunta_id`, `evaluacion_apartado_id`, `modalidad_id`, `escala_id`, `nombre`, `item`, `evidencia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(229, 33, 8, 2, 2, '¿De acuerdo a la naturaleza del programa, los laboratorios realizan proyectos de investigación y/o desarrollo reflejados en la productividad académica del programa?', 2, 'Descripción de instalaciones (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(230, 33, 8, 2, 2, '¿Especificar los laboratorios y talleres con que cuentan para el programa educativo?', 3, 'Descripción de instalaciones (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(231, 33, 8, 2, 2, '¿Existe laboratorio de cómputo propio o campartido para el programa educativo?', 4, '(Fotografías)', '2018-10-16 17:00:00', NULL, NULL),
(232, 35, 8, 2, 2, '¿Existe evidencia de la actualización y nuevas adquisiciones de acervos (digitales e impresos) de la biblioteca?', 5, 'Propuesta Hemeroblibliográfica (FDP04)', '2018-10-16 17:00:00', NULL, NULL),
(233, 36, 8, 2, 2, '¿El software utilizado en la operación de los sistemas y servicios, tecnología educativa y producción de recursos didácticos digitales cuenta con licenciamiento?', 6, '(Licencias de software)', '2018-10-16 17:00:00', NULL, NULL),
(234, 37, 8, 2, 2, '¿Se cuentan con los recursos necesarios para impedir intrusión, robo de información, suplantaciones, afectaciones deliberadas a programas y bases de datos?', 7, '(Licencias de software)', '2018-10-16 17:00:00', NULL, NULL),
(235, 38, 8, 2, 2, '¿La infraestructura de las TIC es adecuada a las necesidades de desarrollo del programa educativo?', 8, 'Documento que mencione la infraestructura de las TIC con la que cuenta el programa educativo, portal web y plataformas educativas. (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(236, 38, 8, 2, 2, '¿Los estudiantes y profesores tienen  acceso ágil y eficiente a redes nacionales e internacionales de información, bases de datos y publicaciones digitales.', 9, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(237, 38, 8, 2, 2, '¿La accesibilidad de los espacios virtuales para estudiantes y asesores es adecuada?', 10, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(238, 38, 8, 2, 2, '¿Es adecuada la infraestructura de telecomunicaciones para dar servicios a estudiantes y asesores académicos?', 11, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(239, 38, 8, 2, 2, '¿Se cuenta con protocolos de seguridad de los espacios educativos y de la infraestructura tecnológica utilizada que permita garantizar la seguridad y privacidad de la información de la institución y de los usuarios?', 12, 'Protocolos de seguridad (FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(240, 38, 8, 2, 2, '¿Existe un equipo de soporte que da respaldo profesional continuo y oportuno a la infraestructura tecnológica?', 13, '(FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(241, 38, 8, 2, 2, '¿Se cuenta con enlaces a INTERNET que ofrezca la posibilidad de administrar con calidad el servicio del ancho de banda adecuada que asegure el acceso de los usuarios?', 14, '(FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(242, 40, 8, 2, 2, '¿Se tiene una plataforma educativa que garantice la adecuada comunicación entre el alumno y el tutor, de manera que dicho instrumento apoye realmente la actividad de aprendizaje?', 15, '(FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(243, 40, 8, 2, 2, '¿Los espacios de trabajo virtual son adecuados y suficientes para el desempeño de las actividades de acuerdo al modelo educativo definido por la institución?', 16, '(FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(244, 40, 8, 2, 2, '¿La institución cuenta con una encuesta de satisfacción de usuarios que permita valorar la confiabilidad y usabilidad de los sistemas tecnológicos tales como plataforma de aprendizaje, administrativa, correo electrónico, video conferencia entre otros?', 17, '(FDA05)', '2018-10-16 17:00:00', NULL, NULL),
(245, 41, 9, 2, 2, '¿Los resultados del programa en cuanto a formación de recursos humanos contribuyen a la atención de las necesidades que dieron origen al programa?', 1, 'Fundamentación del Plan de Estudios (FDP01).', '2018-10-16 17:00:00', NULL, NULL),
(246, 41, 9, 2, 2, '¿Considerando la infraestructura, la composición de los docentes y la productividad académica del programa, los resultados y la cobertura son acordes a la potencialidad del programa?', 2, '(FDP01) (FDP02) (FDP03) (FDP04) (FDP05) (FDA05).', '2018-10-16 17:00:00', NULL, NULL),
(247, 41, 9, 2, 2, '¿La productividad académica del programa educativo es suficiente y congruente con las líneas de generación y/o aplicación del conocimiento?', 3, 'Líneas de generación y/o aplicación del conocimiento (FDP02).', '2018-10-16 17:00:00', NULL, NULL),
(248, 42, 10, 2, 2, 'Se tiene establecido un plan de trabajo anual para el desarrollo de las actividades académicas del programa educativo.', 1, '(Plan de mejora)', '2018-10-16 17:00:00', NULL, NULL),
(249, 42, 10, 2, 2, 'En caso de tener un plan anual se consideran las actividades tales como:\r\na)Conferencias,\r\nb)Talleres\r\nc)Actividades culturales o deportivas\r\nd)Seminarios o exposiciones\r\n', 2, '(Plan de mejora)', '2018-10-16 17:00:00', NULL, NULL),
(250, 43, 10, 2, 2, '¿El Plan de Mejora toma en cuenta el análisis FODA de la autoevaluación para su elaboración?', 3, '(Plan de mejora)', '2018-10-16 17:00:00', NULL, NULL),
(251, 44, 10, 2, 2, '¿El Plan de Mejora manifiesta el compromiso académico para consolidar el programa educativo en el ámbito local y nacional?', 4, '(Plan de mejora)', '2018-10-16 17:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_procesos`
--

CREATE TABLE `evaluacion_procesos` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `registro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_proceso` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluacion_procesos`
--

INSERT INTO `evaluacion_procesos` (`id`, `evaluador_id`, `registro`, `tipo_proceso`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 2, 'RCEA', 1, '11111x1111', '2019-02-15 02:49:17', '2019-02-15 02:53:13', NULL),
(6, 2, 'CIIES', 1, '13131313131', '2019-02-15 02:49:17', '2019-02-15 02:53:13', NULL),
(7, 2, 'COEPES', 1, '3131313131', '2019-02-15 02:49:17', '2019-02-15 02:53:13', NULL),
(8, 2, 'CONACYT', 1, '31313131', '2019-02-15 02:49:17', '2019-02-15 02:53:13', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluadores`
--

CREATE TABLE `evaluadores` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `tipo_evaluador` int(11) NOT NULL,
  `especialidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otros_registros` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logros` text COLLATE utf8_unicode_ci,
  `numero_evaluador` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluadores`
--

INSERT INTO `evaluadores` (`id`, `persona_id`, `tipo_evaluador`, `especialidad`, `otros_registros`, `logros`, `numero_evaluador`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'NINGUNA', NULL, NULL, NULL, '2018-12-02 14:00:00', NULL, NULL),
(2, 23, 1, 'pruebas', NULL, NULL, NULL, '2019-01-17 05:24:04', '2019-04-04 07:23:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluadores_modalidades`
--

CREATE TABLE `evaluadores_modalidades` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluadores_modalidades`
--

INSERT INTO `evaluadores_modalidades` (`id`, `evaluador_id`, `modalidad_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 2, 1, '2019-02-15 02:49:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencias`
--

CREATE TABLE `experiencias` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `experiencias`
--

INSERT INTO `experiencias` (`id`, `persona_id`, `tipo`, `nombre`, `funcion`, `institucion`, `periodo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, NULL, 'a', 'a', '2011-11-11,2012-11-11', '2019-01-16 00:30:19', '2019-01-16 00:49:18', NULL),
(2, 46, 3, NULL, 'funcionprueba', 'instpruebaexperiencia', '2010-01-04,2011-02-10', '2019-03-21 02:55:38', '2019-03-21 02:57:56', NULL),
(3, 34, 1, NULL, 'xx', 'xxxx', '2019-03-11,2018-11-27', '2019-03-21 03:31:01', NULL, NULL),
(4, 50, 1, NULL, 'xxxx', 'xxxx', '2011-11-11,2011-11-11', '2019-06-14 04:56:38', '2019-06-14 05:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaciones`
--

CREATE TABLE `formaciones` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_graduado` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `formaciones`
--

INSERT INTO `formaciones` (`id`, `persona_id`, `nombre`, `nivel`, `institucion`, `descripcion`, `fecha_graduado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'a', 3, 'a', 'TÍtulo', NULL, '2019-01-16 00:30:19', '2019-01-16 00:49:18', NULL),
(2, 10, 'a', 2, NULL, 'Título', NULL, '2019-01-16 00:30:19', NULL, NULL),
(3, 10, 'a', 2, NULL, 'Título', NULL, '2019-01-16 00:30:19', NULL, NULL),
(4, 19, 'lic. prueba', 2, 'NO SE GUARDA DATO', 'TÍtulo', NULL, '2019-01-17 05:01:55', '2019-04-03 05:37:24', NULL),
(5, 22, 'licenciatura', 2, NULL, 'Título', NULL, '2019-01-17 05:01:55', NULL, NULL),
(6, 3, 'licenciatura', 0, NULL, 'Título', NULL, '2019-01-17 05:03:03', NULL, NULL),
(7, 3, 'licenciatura', NULL, NULL, 'Título', NULL, '2019-01-17 05:11:18', NULL, NULL),
(8, 23, 'pruebas', 2, NULL, NULL, '2011-11-11', '2019-02-15 02:53:13', '2019-04-04 07:23:21', NULL),
(9, 38, 'DOCTORADO EN DERECHO', 6, 'NO SE GUARDA DATO', 'TÍtulo', NULL, '2019-03-07 03:36:08', '2019-03-13 02:44:43', NULL),
(10, 38, 'MAESTRIA EN EDUCACIÓN', 5, 'NO SE GUARDA DATO', 'TÍtulo', NULL, '2019-03-07 03:36:08', '2019-03-13 02:44:43', NULL),
(11, 41, 'DOCTOR EN DERECHO', 6, NULL, 'Título', NULL, '2019-03-07 03:36:08', NULL, NULL),
(12, 41, 'MAESTRO EN DESARROLLO SOCIAL', 5, NULL, 'Título', NULL, '2019-03-07 03:36:08', NULL, NULL),
(13, 44, 'DOCTOR EN DERECHO', 6, NULL, 'Título', NULL, '2019-03-07 03:49:38', NULL, NULL),
(14, 44, 'MAESTRO EN DESARROLLO SOCIAL', 5, NULL, 'Título', NULL, '2019-03-07 03:49:38', NULL, NULL),
(15, 4, 'DOCTOR EN DERECHO', 0, NULL, 'Título', NULL, '2019-03-07 03:50:39', NULL, NULL),
(16, 4, 'MAESTRO EN DESARROLLO SOCIAL', 0, NULL, 'Título', NULL, '2019-03-07 03:50:39', NULL, NULL),
(17, 4, 'DOCTOR EN DERECHO', NULL, NULL, 'Título', NULL, '2019-03-07 03:55:51', NULL, NULL),
(18, 4, 'MAESTRO EN DESARROLLO SOCIAL', NULL, NULL, 'Título', NULL, '2019-03-07 03:55:51', NULL, NULL),
(19, 46, 'maestro en prueba', 5, 'instpruebadirector', 'TÍtulo', NULL, '2019-03-21 02:55:38', '2019-03-21 02:57:56', NULL),
(20, 34, 'xxx', 2, 'xxx', 'TÍtulo', NULL, '2019-03-21 03:31:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `ciclo_escolar_id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `grado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grupo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `generacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `generacion_fecha_inicio` date NOT NULL,
  `generacion_fecha_fin` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hemerobibliograficas`
--

CREATE TABLE `hemerobibliograficas` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ejemplares` int(11) NOT NULL,
  `editorial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anio` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `higienes`
--

CREATE TABLE `higienes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `higienes`
--

INSERT INTO `higienes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sanitarios_alumnos_hombres', 'Sanitarios exclusivos para el alumnado varón', '2018-08-29 00:00:00', NULL, NULL),
(2, 'sanitarios_alumnos_mujeres', 'Sanitarios exclusivos para el alumnado femenino', '2018-08-29 00:00:00', NULL, NULL),
(3, 'sanitarios_administrativos_hombres', 'Sanitarios exclusivos para el personal masculino administrativo', '2018-08-29 00:00:00', NULL, NULL),
(4, 'sanitarios_administrativos_mujeres', 'Sanitarios exclusivos para el personal femenino administrativo', '2018-08-29 00:00:00', NULL, NULL),
(5, 'personal_limpieza', 'Personas encargadas de la limpieza', '2018-08-29 00:00:00', NULL, NULL),
(6, 'cestos_basura', 'Cestos de basura', '2018-08-29 00:00:00', NULL, NULL),
(7, 'numero_aulas', 'Número de aulas en el plantel', '2018-08-29 00:00:00', NULL, NULL),
(8, 'butacas_aula', 'Butacas por aula', '2018-08-29 00:00:00', NULL, NULL),
(9, 'ventanas', 'Ventanas que pueden abrirse por aula', '2018-08-29 00:00:00', NULL, NULL),
(10, 'ventilador', 'Número de ventiladores en todo el plantel', '2018-08-29 00:00:00', NULL, NULL),
(11, 'acondicionado', 'Número de aires acondicionados en todo el plantel', '2018-08-29 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infraestructuras`
--

CREATE TABLE `infraestructuras` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `tipo_instalacion_id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `metros` int(11) DEFAULT NULL,
  `recursos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `infraestructuras`
--

INSERT INTO `infraestructuras` (`id`, `plantel_id`, `tipo_instalacion_id`, `solicitud_id`, `nombre`, `ubicacion`, `capacidad`, `metros`, `recursos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 2, 'aula x', 'primer piso', 20, 10, 'xxx', '2019-01-16 22:01:55', '2019-01-16 22:11:18', NULL),
(2, 5, 1, 3, 'AULA 1', 'PLANTA BAJA', 18, 24, 'BUTACASnPIZARRON', '2019-03-06 20:36:08', '2019-03-06 20:55:51', NULL),
(3, 7, 1, 0, 'xxxx', NULL, 11, 11, 'xxxxx', '2019-06-13 21:56:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones`
--

CREATE TABLE `inspecciones` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `estatus_inspeccion_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_asignada` date DEFAULT NULL,
  `resultado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspecciones`
--

INSERT INTO `inspecciones` (`id`, `programa_id`, `estatus_inspeccion_id`, `fecha`, `fecha_asignada`, `resultado`, `folio`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 5, NULL, '2011-10-11', 'Bien', '123', '2019-01-16 22:45:22', '2019-01-17 05:25:28', NULL),
(2, 3, 2, NULL, '2019-04-10', NULL, '1234-xccv-123', '2019-03-14 22:01:53', '2019-03-20 16:06:52', NULL),
(3, 3, 1, NULL, '2019-04-10', NULL, '1234-xccv-123', '2019-03-14 22:02:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones_inspeccion_preguntas`
--

CREATE TABLE `inspecciones_inspeccion_preguntas` (
  `id` int(11) NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  `inspeccion_pregunta_id` int(11) NOT NULL,
  `respuesta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspecciones_inspeccion_preguntas`
--

INSERT INTO `inspecciones_inspeccion_preguntas` (`id`, `inspeccion_id`, `inspeccion_pregunta_id`, `respuesta`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(2, 1, 2, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(3, 1, 3, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(4, 1, 4, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(5, 1, 5, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(6, 1, 6, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(7, 1, 7, '6', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(8, 1, 8, '9', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(9, 1, 9, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(10, 1, 10, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(11, 1, 11, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(12, 1, 12, '2', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(13, 1, 13, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(14, 1, 14, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(15, 1, 15, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(16, 1, 16, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(17, 1, 17, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(18, 1, 18, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(19, 1, 19, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(20, 1, 20, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(21, 1, 21, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(22, 1, 22, 'ejemplo', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(23, 1, 23, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(24, 1, 24, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(25, 1, 25, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(26, 1, 26, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(27, 1, 27, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(28, 1, 28, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(29, 1, 29, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(30, 1, 30, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(31, 1, 31, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(32, 1, 33, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(33, 1, 32, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(34, 1, 34, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(35, 1, 36, '9', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(36, 1, 37, '9', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(37, 1, 39, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(38, 1, 40, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(39, 1, 41, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(40, 1, 42, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(41, 1, 43, '9', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(42, 1, 44, '0', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(43, 1, 45, '0', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(44, 1, 46, '0', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(45, 1, 47, '0', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(46, 1, 48, '0', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(47, 1, 49, '9', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(48, 1, 50, '1', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(49, 1, 51, 'os ej', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(50, 1, 52, 'sldjh', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(51, 1, 53, 'sdf', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(52, 1, 54, '345', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(53, 1, 55, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(54, 1, 56, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(55, 1, 57, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(56, 1, 58, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(57, 1, 59, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(58, 1, 60, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(59, 1, 61, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(60, 1, 62, 'SI', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_apartados`
--

CREATE TABLE `inspeccion_apartados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_apartado` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_apartados`
--

INSERT INTO `inspeccion_apartados` (`id`, `nombre`, `descripcion`, `tipo_apartado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AULAS INDICADORES', 'Apartado que engloba a las aulas', 1, '2018-09-11 12:00:00', NULL, NULL),
(2, 'CONSTANCIA INFEJAL Y DICTAMEN DE PROTECCIÓN CIVIL ', 'N/A', 1, '2018-09-11 12:00:00', NULL, NULL),
(3, 'LABORATORIOS Y TALLERES', 'N/A', 1, '2018-09-10 12:00:00', NULL, NULL),
(4, 'BILBIOTECA', 'N/A', 1, '2018-09-10 12:00:00', NULL, NULL),
(5, 'INFRAESTRUCTURA - ESPACIOS FÍSICOS DE USO GENERAL', 'N/A', 1, '2018-09-11 12:00:00', NULL, NULL),
(6, 'CENTRO O LABORATORIO DE CÓMPUTO', 'N/A', 1, '2018-09-11 12:00:00', NULL, NULL),
(7, 'ÁREA ADMINISTRATIVA', 'N/A', 1, '2018-09-11 12:00:00', NULL, NULL),
(8, 'Características del inmueble', 'caracteristica_inmueble', 2, '2018-09-11 12:00:00', NULL, NULL),
(9, 'Edificios y/o niveles', 'planteles_edificios_niveles', 2, '2018-09-11 12:00:00', NULL, NULL),
(10, 'Sistema de seguridad', 'planteles_seguridad_sistemas', 2, '2018-09-11 12:00:00', NULL, NULL),
(11, 'Higiene en general', 'planteles_higienes', 2, '2018-09-11 12:00:00', NULL, NULL),
(12, 'Aulas', 'tipo_instalaciones', 2, '2018-09-11 12:00:00', NULL, NULL),
(13, 'Servicios sanitarios', 'planteles_higienes', 3, '2018-10-02 12:00:00', NULL, NULL),
(14, 'Centro de cómputo', 'tipo_instalaciones', 2, '2018-09-11 12:00:00', NULL, NULL),
(15, 'Centro de documentación o biblioteca', 'tipo_instalaciones', 0, '2018-09-11 12:00:00', NULL, NULL),
(16, 'Otros laboratorios y/o talleres', 'tipo_instalaciones', 0, '2018-09-11 12:00:00', NULL, NULL),
(17, 'Área administrativa', 'tipo_instalaciones', 0, '2018-09-11 12:00:00', NULL, NULL),
(18, 'Otras áreas', 'tipo_instalaciones', 0, '2018-09-11 12:00:00', NULL, NULL),
(19, 'Área para archivo muerto', 'tipo_instalaciones', 0, '2018-09-11 12:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_categorias`
--

CREATE TABLE `inspeccion_categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instruccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_categorias`
--

INSERT INTO `inspeccion_categorias` (`id`, `nombre`, `descripcion`, `instruccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AULAS', 'N/A', 'Verificar que la ventilación, iluminación y condiciones de mantenimiento de las aulas sean adecuadas.', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'AULAS EN EL PLANTEL', 'N/A', 'Verificar la adecuación\r\ndel tamaño y cantidad\r\nde las aulas conforme a\r\nla por grupo.', '2018-09-11 00:00:00', NULL, NULL),
(3, 'CONSTANCIA INFEJAL Y PROTECCIÓN CIVIL', 'N/A', 'Verificar que la constancia de INFEJAL y Dictamen de protección civil se encuentren en vigor en el plantel, así como las medidas de seguridad.', '2018-09-11 00:00:00', NULL, NULL),
(4, 'ELEMENTOS SEGURIDAD LABORATORIO O TALLER', 'N/A', 'Verificar la existencia y\r\nfuncionalidad de los\r\nelementos de seguridad\r\ny de identificación en el\r\nlaboratorio.', '2018-09-11 00:00:00', NULL, NULL),
(5, 'FUNCIONAMIENTO DE TALLER O LABORATORIO', 'N/A', 'Verificar que las\r\ninstalaciones\r\nhidráulicas, eléctricas y\r\nde gas funcionen\r\nadecuadamente.', '2018-09-11 00:00:00', NULL, NULL),
(6, 'CONDICIONES DE BIBLIOTECA', 'N/A', 'Verificar que la ventilación,\r\niluminación y condiciones de\r\nmantenimiento de la\r\nbiblioteca y sala de lectura\r\nsean adecuadas.', '2018-09-11 00:00:00', NULL, NULL),
(7, 'ELEMENTOS DE LA BIBLIOTECA', 'N/A', 'Verificar la existencia de los\r\nelementos de seguridad, de\r\nidentificación y registro en la\r\nbiblioteca.', '2018-09-11 00:00:00', NULL, NULL),
(8, 'DIMENSIONES BIBLIOTECA', 'N/A', 'Verificar la biblioteca cuente\r\ncon una superficie mínima\r\nnecesaria.', '2018-09-11 00:00:00', NULL, NULL),
(9, 'SANITARIOS', 'N/A', 'Verificar la\r\nexistencia,\r\nsuficiencia y\r\npertinencia, así\r\ncomo las condiciones\r\nde mantenimiento y\r\nseguridad de los\r\nespacios físicos de\r\nuso general que\r\nrequiere el programa\r\neducativo. ', '2018-09-11 00:00:00', NULL, NULL),
(10, 'ESPECIFICACIONES DE EQUIPO DE CÓMPUTO', 'N/A', 'Verificar las\r\ncondiciones\r\nnecesarias para el\r\ncentro o\r\nlaboratorio de\r\ncómputo.', '2018-09-11 00:00:00', NULL, NULL),
(11, 'IDENTIFICACIÓN DEL PLANTEL (EXTERIOR)', 'N/A', 'Verificar la presencia\r\nde la razón social de la\r\ninstitución y las\r\ncondiciones de\r\nmantenimiento de la\r\nfachada del plante.', '2018-09-11 00:00:00', NULL, NULL),
(12, 'IDENTIFICACIÓN DE LAS ÁREAS ADMINISTRATIVAS', 'N/A', 'Verificar que se\r\ncuente con las áreas\r\nque se indican.', '2018-09-11 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_observaciones`
--

CREATE TABLE `inspeccion_observaciones` (
  `id` int(11) NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  `inspeccion_apartado_id` int(11) NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_observaciones`
--

INSERT INTO `inspeccion_observaciones` (`id`, `inspeccion_id`, `inspeccion_apartado_id`, `comentario`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 8, 'Todo bien', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(2, 1, 9, 'null', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(3, 1, 10, 'null', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(4, 1, 11, 'null', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(5, 1, 12, 'null', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL),
(6, 1, 14, 'null', '2019-01-17 06:26:38', '2019-01-17 12:25:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_preguntas`
--

CREATE TABLE `inspeccion_preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_inspeccion_tipo_pregunta` int(11) NOT NULL,
  `id_inspeccion_apartado` int(11) NOT NULL,
  `id_inspeccion_categoria` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_preguntas`
--

INSERT INTO `inspeccion_preguntas` (`id`, `pregunta`, `id_inspeccion_tipo_pregunta`, `id_inspeccion_apartado`, `id_inspeccion_categoria`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '¿Las aulas tienen adecuada y suficiente ventilación?', 1, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(2, '¿Las aulas tienen adecuada y suficiente iluminación?', 1, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(3, '¿Son adecuadas las condiciones de mantenimiento y limpieza ? (Pisos, pintura, techos, muros, puertas, instalaciones eléctricas…)', 1, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(4, '¿Las aulas cuentan con nomenclatura?', 1, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(5, '¿Las aulas cuentas con pintarrón en buen estado?', 1, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(6, '¿Las aulas cuentan con botes de basura?', 1, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(7, 'Capacidad mínima de las aulas (personas):', 2, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(8, 'Capacidad máxima de las aulas (personas):', 2, 1, 1, '2018-09-11 12:00:00', NULL, NULL),
(9, '¿El plantel cuenta con las aulas suficientes para los grupos\r\nvigentes del programa educativo? ', 1, 1, 2, '2018-09-11 12:00:00', NULL, NULL),
(10, '¿Cuenta con constancia de INFEJAL actulizada?', 1, 2, 3, '2018-09-11 12:00:00', NULL, NULL),
(11, '¿Cuenta con el dictamen de protección civil actualizado?', 1, 2, 3, '2018-09-11 12:00:00', NULL, NULL),
(12, 'Número de extintores:', 2, 2, 3, '2018-09-11 12:00:00', NULL, NULL),
(13, '¿Los extintores cuentan con recarga vigente?', 1, 2, 3, '2018-09-11 12:00:00', NULL, NULL),
(14, '¿Se cuenta con señalamientos de evacuación?', 1, 2, 3, '2018-09-11 12:00:00', NULL, NULL),
(15, '¿El laboratorio cuenta con nomenclatura?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(16, '¿El laboratorio cuenta señalamientos de evacuación?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(17, '¿El laboratorio cuenta con extintor?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(18, '¿El laboratorio cuenta con reglamento de uso?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(19, '¿El laboratorio cuenta con horarios de atención?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(20, '¿El laboratorio se observa limpio e higiénico?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(21, '¿Se cuenta con laboratorios y talleres especiales?', 1, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(22, 'De ser positiva la respuesta en la pregunta anterior, indicar los nombres de los talleres o laboratorios:', 3, 3, 4, '2018-09-11 12:00:00', NULL, NULL),
(23, '¿ Se cuenta con una iluminación  adecuada y suficiente en el laboratorio?', 1, 3, 5, '2018-09-11 12:00:00', NULL, NULL),
(24, '¿ Se cuenta con una ventilación adecuada y suficiente en el laboratorio?', 1, 3, 5, '2018-09-11 12:00:00', NULL, NULL),
(25, '¿La biblioteca tiene adecuada y suficiente ventilación?', 1, 4, 6, '2018-09-11 12:00:00', NULL, NULL),
(26, '¿La biblioteca tiene adecuada y suficiente ventilación?', 1, 4, 6, '2018-09-11 12:00:00', NULL, NULL),
(27, '¿Son adecuadas las condiciones de mantenimiento y\r\nlimpieza?\r\n(Pisos, pintura, techos, muros, puertas…)', 1, 4, 6, '2018-09-11 12:00:00', NULL, NULL),
(28, '¿Cuenta con el acervo manifestado en el formato FDP04?', 1, 4, 6, '2018-09-11 12:00:00', NULL, NULL),
(29, '¿La biblioteca cuenta con nomenclatura?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(30, '¿La biblioteca cuenta con horarios de atención?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(31, '¿La biblioteca cuenta con mobilario adecuado y suficiente?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(32, '¿La biblioteca cuenta con reglamento interno?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(33, '¿La biblioteca cuenta con bitácora de registro de préstamo en la sala o domicilio?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(34, '¿La biblioteca cuenta con señalamientos de seguridad?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(35, '¿La biblioteca cuenta con extintor?', 1, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(36, 'Número de títulos:', 2, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(37, 'Número de volúmenes', 2, 4, 7, '2018-09-11 12:00:00', NULL, NULL),
(38, '¿Las dimensiones de la biblioteca son adecuadas?', 1, 4, 8, '2018-09-11 12:00:00', NULL, NULL),
(39, '¿Los sanitarios en general cuentan con señalización del espacio?', 1, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(40, '¿Los sanitarios en general se obervan limpios e higiénicos y funcionales?', 1, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(41, '¿Los sanitarios en general cuentan con suministro permanente de agua?', 1, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(42, '¿Los sanitarios en general cuentan con jabón y papel higiénico?', 1, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(43, 'Número de inodoros para estudiantes mujeres:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(44, 'Número de lavamanos en los baños de mujeres estudiantes:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(45, 'Número de inodoros para estudiantes hombres:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(46, 'Número de lavamanos en los baños de hombres estudiantes:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(47, 'Número de mingitorios en los baños de hombres estudiantes:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(48, 'Número de sanitarios para el personal administrativo hombres:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(49, 'Número de sanitarios para el personal administrativo mujeres:', 2, 5, 9, '2018-09-11 12:00:00', NULL, NULL),
(50, 'Núumero de computadoras:', 2, 6, 10, '2018-09-11 12:00:00', NULL, NULL),
(51, 'Sistema operativo del equipo de cómputo:', 3, 6, 10, '2018-09-11 12:00:00', NULL, NULL),
(52, 'Versión del sistema operativo del equipo de cómputo:', 3, 6, 10, '2018-09-11 12:00:00', NULL, NULL),
(53, 'Memoria RAM del equipo de cómputo:', 3, 6, 10, '2018-09-11 12:00:00', NULL, NULL),
(54, 'Capacidad del disco duro del equipo de cómputo:', 3, 6, 10, '2018-09-11 12:00:00', NULL, NULL),
(55, 'Se identifica claramente el plantel, nombre de la escuela ', 1, 6, 11, '2018-09-11 12:00:00', NULL, NULL),
(56, 'Se identifica claramente el número de domicilio ', 1, 6, 11, '2018-09-11 12:00:00', NULL, NULL),
(57, 'Se observa limpio e higiénico el exterior del plantel', 1, 6, 11, '2018-09-11 12:00:00', NULL, NULL),
(58, '¿La institución cuenta con área de recepción?', 1, 7, 12, '2018-09-11 12:00:00', NULL, NULL),
(59, '¿La institución cuenta con dirección?', 1, 7, 12, '2018-09-11 12:00:00', NULL, NULL),
(60, '¿La institución cuenta con área de control escolar?', 1, 7, 12, '2018-09-11 12:00:00', NULL, NULL),
(61, '¿La institución cuenta con sala(s) de maestros?', 1, 7, 12, '2018-09-11 12:00:00', NULL, NULL),
(62, '¿La institución cuenta con cubículo(s) de orientación educativa?', 1, 7, 12, '2018-09-11 12:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_tipo_preguntas`
--

CREATE TABLE `inspeccion_tipo_preguntas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_tipo_preguntas`
--

INSERT INTO `inspeccion_tipo_preguntas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SI/NO', 'Tipo de pregunta SI o NO', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'NUMERICO', 'Tipo de pregunta entero', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'ABIERTA', 'Tipo de pregunta que recibe una cadena', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspectores`
--

CREATE TABLE `inspectores` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspectores`
--

INSERT INTO `inspectores` (`id`, `persona_id`, `programa_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 13, 2, '2019-01-17 05:45:22', NULL, NULL),
(3, 13, 3, '2019-03-15 05:01:53', NULL, NULL),
(4, 13, 3, '2019-03-15 05:02:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucionales`
--

CREATE TABLE `institucionales` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `institucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombramiento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `departamento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `institucionales`
--

INSERT INTO `institucionales` (`id`, `evaluador_id`, `institucion`, `nombramiento`, `departamento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'unipruebas', NULL, 'deptopruebas', '2019-02-15 02:53:13', '2019-04-04 07:23:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituciones`
--

CREATE TABLE `instituciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `historia` text COLLATE utf8_unicode_ci,
  `vision` text COLLATE utf8_unicode_ci,
  `mision` text COLLATE utf8_unicode_ci,
  `valores_institucionales` text COLLATE utf8_unicode_ci,
  `es_nombre_autorizado` tinyint(1) DEFAULT '0',
  `clave_ies` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `instituciones`
--

INSERT INTO `instituciones` (`id`, `usuario_id`, `nombre`, `historia`, `vision`, `mision`, `valores_institucionales`, `es_nombre_autorizado`, `clave_ies`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'PRUEBAS IE', 'PRUEBA IE MUESTRA', 'PRUEBA IE MUESTRA', 'PRUEBA IE MUESTRA', 'PRUEBA IE MUESTRA', 0, NULL, '2019-01-08 19:19:49', '2019-02-18 19:50:56', NULL),
(2, 15, 'UAG', 'X', 'X', 'X', 'X', 1, NULL, '2019-01-16 21:43:02', '2019-06-13 22:04:39', NULL),
(3, 20, 'ESCUELA SUPERIOR DE COMERCIO INTERNACIONAL-PRUEBA', 'aslkjaslkjlkasjdas', 'lkasdlkajsldkjasldkjasd', 'lkasjdlkajsdlkajsdlkjasd', 'lkjasldkjasldkjasldkj', 0, NULL, '2019-02-21 17:44:06', '2019-03-20 20:31:01', NULL),
(4, 24, 'Centro Educativo Nueva Cultura Social', 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 0, NULL, '2019-02-21 18:32:50', '2019-03-20 19:57:56', NULL),
(5, 29, 'INSTITUTO SUPERIOR VANCOUVER', 'En nuestro municipio somos los únicos que impartimos educación media superior orientada a un mercado en rezago desde el año 2010, entregando a la sociedad 8 generaciones de graduados.A partir del interés de estas generaciones, en estudiar el nivel superior pretendemos lograr la incorporación de carreras para continuar atendiendo a estos y otros usuarios.', 'Ser una institución que en su pensamiento y en su desarrollo interno  sea, innovadora en la docencia, la investigación, la gestión y las actividades de impacto social.', 'Generar,  aplicar  y  difundir  conocimiento para  formar personas  competentes,  cultas, responsables y solidarias que colaboren en el progreso económico y bienestar social de nuestra región, además de crear y extender la cultura.', 'Eficiencia\r\nCompromiso con la sociedad.\r\nExcelencia en la docencia, la investigación, la gestión institucional y la prestación\r\nEquidad e Igualdad de oportunidades.\r\nSolidaridad\r\nCooperación', 0, NULL, '2019-03-06 18:08:46', '2019-03-12 19:44:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mixta_noescolarizadas`
--

CREATE TABLE `mixta_noescolarizadas` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `licencias_software` text COLLATE utf8_unicode_ci,
  `servicios_herramientas_educativas` text COLLATE utf8_unicode_ci,
  `sistemas_seguridad` text COLLATE utf8_unicode_ci,
  `direccionamiento_ip_publico` text COLLATE utf8_unicode_ci,
  `tecnologias_informacion_comunicacion` text COLLATE utf8_unicode_ci,
  `mantenimiento_plataforma` text COLLATE utf8_unicode_ci,
  `diagrama_plataforma` text COLLATE utf8_unicode_ci,
  `acceso_internet` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mixta_noescolarizadas`
--

INSERT INTO `mixta_noescolarizadas` (`id`, `programa_id`, `licencias_software`, `servicios_herramientas_educativas`, `sistemas_seguridad`, `direccionamiento_ip_publico`, `tecnologias_informacion_comunicacion`, `mantenimiento_plataforma`, `diagrama_plataforma`, `acceso_internet`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '[{\"id\":null,\"nombre\":\"NO CUENTA\",\"contrato\":\"0\",\"tipo\":\"\",\"terminos\":\"NO CUENTA\",\"usuarios\":\"\",\"enlace\":\"\"}]', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'INGRESO:PENDIENTEESTRUCTURA:PENDIENTECONTRATOS:PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', '2019-03-06 20:36:08', NULL, NULL),
(2, 3, '[{\"id\":null,\"nombre\":\"NO CUENTA\",\"contrato\":\"0\",\"tipo\":\"\",\"terminos\":\"NO CUENTA\",\"usuarios\":\"\",\"enlace\":\"\"}]', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'INGRESO:PENDIENTEESTRUCTURA:PENDIENTECONTRATOS:PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', '2019-03-06 20:50:39', NULL, NULL),
(3, 3, '[{\"id\":null,\"nombre\":\"NO CUENTA\",\"contrato\":\"0\",\"tipo\":\"\",\"terminos\":\"NO CUENTA\",\"usuarios\":\"\",\"enlace\":\"\"}]', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'INGRESO:PENDIENTEESTRUCTURA:PENDIENTECONTRATOS:PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', '2019-03-06 20:55:51', NULL, NULL),
(4, 4, '[]', 'no cuenta', 'no cuenta', 'no cuenta', 'INGRESO:no cuentaESTRUCTURA:no cuentaCONTRATOS:no cuenta', 'contratación de servicos externos de TI', 'se realiza aviso durante clase', 'telemx 15mb', '2019-03-12 19:44:33', NULL, NULL),
(5, 4, '[]', 'no cuenta', 'no cuenta', 'no cuenta', 'INGRESO:no cuentaESTRUCTURA:no cuentaCONTRATOS:no cuenta', 'contratación de servicos externos de TI', 'se realiza aviso durante clase', 'telemx 15mb', '2019-03-12 19:44:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades`
--

CREATE TABLE `modalidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modalidades`
--

INSERT INTO `modalidades` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Escolarizada', 'Modalidad escolarizada de un programa de estudios', '2018-11-11 00:00:00', NULL, NULL),
(2, 'No escolarizada', 'Modalidad no escolarizada de un programa de estudios', '2018-11-21 00:00:00', NULL, NULL),
(3, 'Mixta', 'Modalidad mixta de un programa de estudios', '2018-11-21 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'solicitudes', 'Solicitudes', '2018-09-18 00:00:00', NULL, NULL),
(3, 'usuarios', 'Usuarios', '2018-09-18 00:00:00', NULL, NULL),
(4, 'solicitudes-estatus-solicitudes', 'Comentarios', '2018-09-18 00:00:00', NULL, NULL),
(5, 'programas', 'Programas', '2018-09-18 00:00:00', NULL, NULL),
(6, 'inspeccion-observaciones', 'Observaciones de Inspección', '2018-09-18 01:00:00', NULL, NULL),
(7, 'planteles', 'Planteles', '2018-09-18 01:00:00', NULL, NULL),
(8, 'inspecciones-inspeccion-preguntas', 'Respuestas de las preguntas de inspección', '2018-09-18 01:00:00', NULL, NULL),
(9, 'modulos-roles', 'Accesos', '2018-09-19 20:00:00', NULL, NULL),
(10, 'pagos', 'Pagos', '2018-09-30 20:00:00', NULL, NULL),
(11, 'curriculum', 'Curriculum para evaluadores', '2018-11-14 13:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos_roles`
--

CREATE TABLE `modulos_roles` (
  `id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `accion` int(11) NOT NULL COMMENT '1=Ver propios, 2=Ver Todo, 3=Ver detalles, 4=Crear, 5=Editar, 6=Eliminar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modulos_roles`
--

INSERT INTO `modulos_roles` (`id`, `modulo_id`, `rol_id`, `accion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 3, 1, '2018-09-18 00:00:00', NULL, NULL),
(2, 2, 3, 3, '2018-09-18 00:00:00', NULL, NULL),
(3, 2, 3, 4, '2018-09-18 00:00:00', NULL, NULL),
(4, 2, 3, 5, '2018-09-18 00:00:00', NULL, NULL),
(5, 2, 3, 6, '2018-09-18 00:00:00', NULL, NULL),
(6, 3, 3, 1, '2018-09-18 00:00:00', NULL, NULL),
(7, 3, 3, 3, '2018-09-18 00:00:00', NULL, NULL),
(8, 3, 3, 4, '2018-09-18 00:00:00', NULL, NULL),
(9, 3, 3, 5, '2018-09-18 00:00:00', NULL, NULL),
(10, 3, 3, 6, '2018-09-18 00:00:00', NULL, NULL),
(11, 2, 4, 1, '2018-09-17 23:00:00', NULL, NULL),
(12, 2, 4, 3, '2018-09-17 23:00:00', NULL, NULL),
(13, 2, 4, 5, '2018-09-17 23:00:00', NULL, NULL),
(14, 2, 7, 2, '2018-09-17 23:00:00', NULL, NULL),
(15, 2, 7, 3, '2018-09-17 23:00:00', NULL, NULL),
(16, 2, 7, 5, '2018-09-17 23:00:00', NULL, NULL),
(17, 2, 8, 2, '2018-09-17 23:00:00', NULL, NULL),
(18, 2, 8, 3, '2018-09-17 23:00:00', NULL, NULL),
(19, 4, 8, 2, '2018-09-17 23:00:00', NULL, NULL),
(20, 2, 9, 2, '2018-09-17 23:00:00', NULL, NULL),
(21, 2, 9, 3, '2018-09-17 23:00:00', NULL, NULL),
(22, 2, 9, 5, '2018-09-17 23:00:00', NULL, NULL),
(23, 5, 9, 5, '2018-09-17 23:00:00', NULL, NULL),
(24, 6, 6, 1, '2018-09-17 23:00:00', NULL, NULL),
(25, 6, 6, 3, '2018-09-17 23:00:00', NULL, NULL),
(26, 6, 6, 4, '2018-09-17 23:00:00', NULL, NULL),
(27, 7, 6, 1, '2018-09-17 23:00:00', NULL, NULL),
(28, 7, 6, 3, '2018-09-17 23:00:00', NULL, NULL),
(29, 8, 6, 1, '2018-09-17 23:00:00', NULL, NULL),
(30, 8, 6, 3, '2018-09-17 23:00:00', NULL, NULL),
(31, 8, 6, 4, '2018-09-17 23:00:00', NULL, NULL),
(33, 2, 2, 2, '2018-09-18 00:00:00', NULL, NULL),
(34, 2, 2, 3, '2018-09-18 00:00:00', NULL, NULL),
(35, 2, 2, 4, '2018-09-18 00:00:00', NULL, NULL),
(36, 2, 2, 5, '2018-09-18 00:00:00', NULL, NULL),
(37, 2, 2, 6, '2018-09-18 00:00:00', NULL, '2018-09-21 11:50:08'),
(38, 3, 2, 1, '2018-09-18 00:00:00', NULL, NULL),
(39, 3, 2, 2, '2018-09-18 00:00:00', NULL, NULL),
(40, 3, 2, 3, '2018-09-18 00:00:00', NULL, NULL),
(41, 3, 2, 4, '2018-09-18 00:00:00', NULL, NULL),
(42, 3, 2, 5, '2018-09-18 00:00:00', NULL, NULL),
(43, 3, 2, 6, '2018-09-18 00:00:00', NULL, NULL),
(44, 9, 2, 4, '2018-09-20 16:51:33', NULL, NULL),
(45, 9, 2, 5, '2018-09-20 16:52:49', NULL, NULL),
(46, 9, 2, 6, '2018-09-20 17:00:38', NULL, NULL),
(48, 2, 2, 1, '2018-09-20 18:59:46', NULL, '2018-09-20 19:03:01'),
(49, 2, 2, 1, '2018-09-20 19:03:10', NULL, '2018-09-20 19:03:22'),
(50, 2, 2, 1, '2018-09-20 19:03:29', NULL, NULL),
(51, 7, 2, 2, '2018-09-21 11:46:19', NULL, NULL),
(52, 2, 2, 6, '2018-09-21 11:50:28', NULL, NULL),
(53, 10, 2, 2, '2018-10-01 14:11:53', NULL, NULL),
(54, 10, 2, 4, '2018-10-01 14:12:05', NULL, '2018-10-02 10:04:47'),
(55, 10, 2, 5, '2018-10-01 14:12:14', NULL, NULL),
(56, 10, 2, 6, '2018-10-01 14:12:22', NULL, NULL),
(57, 10, 2, 4, '2018-10-02 10:05:14', NULL, NULL),
(58, 2, 3, 2, '2019-01-12 00:19:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `municipio` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `estado_id`, `municipio`) VALUES
(1, 1, 'Aguascalientes'),
(2, 1, 'San Francisco de los Romo'),
(3, 1, 'El Llano'),
(4, 1, 'Rincón de Romos'),
(5, 1, 'Cosío'),
(6, 1, 'San José de Gracia'),
(7, 1, 'Tepezalá'),
(8, 1, 'Pabellón de Arteaga'),
(9, 1, 'Asientos'),
(10, 1, 'Calvillo'),
(11, 1, 'Jesús María'),
(12, 2, 'Mexicali'),
(13, 2, 'Tecate'),
(14, 2, 'Tijuana'),
(15, 2, 'Playas de Rosarito'),
(16, 2, 'Ensenada'),
(17, 3, 'La Paz'),
(18, 3, 'Los Cabos'),
(19, 3, 'Comondú'),
(20, 3, 'Loreto'),
(21, 3, 'Mulegé'),
(22, 4, 'Campeche'),
(23, 4, 'Carmen'),
(24, 4, 'Palizada'),
(25, 4, 'Candelaria'),
(26, 4, 'Escárcega'),
(27, 4, 'Champotón'),
(28, 4, 'Hopelchén'),
(29, 4, 'Calakmul'),
(30, 4, 'Tenabo'),
(31, 4, 'Hecelchakán'),
(32, 4, 'Calkiní'),
(33, 5, 'Saltillo'),
(34, 5, 'Arteaga'),
(35, 5, 'Juárez'),
(36, 5, 'Progreso'),
(37, 5, 'Escobedo'),
(38, 5, 'San Buenaventura'),
(39, 5, 'Abasolo'),
(40, 5, 'Candela'),
(41, 5, 'Frontera'),
(42, 5, 'Monclova'),
(43, 5, 'Castaños'),
(44, 5, 'Ramos Arizpe'),
(45, 5, 'General Cepeda'),
(46, 5, 'Piedras Negras'),
(47, 5, 'Nava'),
(48, 5, 'Acuña'),
(49, 5, 'Múzquiz'),
(50, 5, 'Jiménez'),
(51, 5, 'Zaragoza'),
(52, 5, 'Morelos'),
(53, 5, 'Allende'),
(54, 5, 'Villa Unión'),
(55, 5, 'Guerrero'),
(56, 5, 'Hidalgo'),
(57, 5, 'Sabinas'),
(58, 5, 'San Juan de Sabinas'),
(59, 5, 'Torreón'),
(60, 5, 'Matamoros'),
(61, 5, 'Viesca'),
(62, 5, 'Ocampo'),
(63, 5, 'Nadadores'),
(64, 5, 'Sierra Mojada'),
(65, 5, 'Cuatro Ciénegas'),
(66, 5, 'Lamadrid'),
(67, 5, 'Sacramento'),
(68, 5, 'San Pedro'),
(69, 5, 'Francisco I. Madero'),
(70, 5, 'Parras'),
(71, 6, 'Colima'),
(72, 6, 'Tecomán'),
(73, 6, 'Manzanillo'),
(74, 6, 'Armería'),
(75, 6, 'Coquimatlán'),
(76, 6, 'Comala'),
(77, 6, 'Cuauhtémoc'),
(78, 6, 'Ixtlahuacán'),
(79, 6, 'Minatitlán'),
(80, 6, 'Villa de Álvarez'),
(81, 7, 'Tuxtla Gutiérrez'),
(82, 7, 'San Fernando'),
(83, 7, 'Berriozábal'),
(84, 7, 'Ocozocoautla de Espinosa'),
(85, 7, 'Suchiapa'),
(86, 7, 'Chiapa de Corzo'),
(87, 7, 'Osumacinta'),
(88, 7, 'San Cristóbal de las Casas'),
(89, 7, 'Chamula'),
(90, 7, 'Ixtapa'),
(91, 7, 'Zinacantán'),
(92, 7, 'Acala'),
(93, 7, 'Chiapilla'),
(94, 7, 'San Lucas'),
(95, 7, 'Teopisca'),
(96, 7, 'Amatenango del Valle'),
(97, 7, 'Chanal'),
(98, 7, 'Oxchuc'),
(99, 7, 'Huixtán'),
(100, 7, 'Tenejapa'),
(101, 7, 'Mitontic'),
(102, 7, 'Reforma'),
(103, 7, 'Juárez'),
(104, 7, 'Pichucalco'),
(105, 7, 'Sunuapa'),
(106, 7, 'Ostuacán'),
(107, 7, 'Francisco León'),
(108, 7, 'Ixtacomitán'),
(109, 7, 'Solosuchiapa'),
(110, 7, 'Ixtapangajoya'),
(111, 7, 'Tecpatán'),
(112, 7, 'Copainalá'),
(113, 7, 'Chicoasén'),
(114, 7, 'Coapilla'),
(115, 7, 'Pantepec'),
(116, 7, 'Tapalapa'),
(117, 7, 'Ocotepec'),
(118, 7, 'Chapultenango'),
(119, 7, 'Amatán'),
(120, 7, 'Huitiupán'),
(121, 7, 'Ixhuatán'),
(122, 7, 'Tapilula'),
(123, 7, 'Rayón'),
(124, 7, 'Pueblo Nuevo Solistahuacán'),
(125, 7, 'Jitotol'),
(126, 7, 'Bochil'),
(127, 7, 'Soyaló'),
(128, 7, 'San Juan Cancuc'),
(129, 7, 'Sabanilla'),
(130, 7, 'Simojovel'),
(131, 7, 'San Andrés Duraznal'),
(132, 7, 'El Bosque'),
(133, 7, 'Chalchihuitán'),
(134, 7, 'Larráinzar'),
(135, 7, 'Santiago el Pinar'),
(136, 7, 'Chenalhó'),
(137, 7, 'Aldama'),
(138, 7, 'Pantelhó'),
(139, 7, 'Sitalá'),
(140, 7, 'Salto de Agua'),
(141, 7, 'Tila'),
(142, 7, 'Tumbalá'),
(143, 7, 'Yajalón'),
(144, 7, 'Ocosingo'),
(145, 7, 'Chilón'),
(146, 7, 'Benemérito de las Américas'),
(147, 7, 'Marqués de Comillas'),
(148, 7, 'Palenque'),
(149, 7, 'La Libertad'),
(150, 7, 'Catazajá'),
(151, 7, 'Comitán de Domínguez'),
(152, 7, 'Tzimol'),
(153, 7, 'Chicomuselo'),
(154, 7, 'Bella Vista'),
(155, 7, 'Frontera Comalapa'),
(156, 7, 'La Trinitaria'),
(157, 7, 'La Independencia'),
(158, 7, 'Maravilla Tenejapa'),
(159, 7, 'Las Margaritas'),
(160, 7, 'Altamirano'),
(161, 7, 'Venustiano Carranza'),
(162, 7, 'Totolapa'),
(163, 7, 'Nicolás Ruíz'),
(164, 7, 'Las Rosas'),
(165, 7, 'La Concordia'),
(166, 7, 'Angel Albino Corzo'),
(167, 7, 'Montecristo de Guerrero'),
(168, 7, 'Socoltenango'),
(169, 7, 'Cintalapa'),
(170, 7, 'Jiquipilas'),
(171, 7, 'Arriaga'),
(172, 7, 'Villaflores'),
(173, 7, 'Tonalá'),
(174, 7, 'Villa Corzo'),
(175, 7, 'Pijijiapan'),
(176, 7, 'Mapastepec'),
(177, 7, 'Acapetahua'),
(178, 7, 'Acacoyagua'),
(179, 7, 'Escuintla'),
(180, 7, 'Villa Comaltitlán'),
(181, 7, 'Huixtla'),
(182, 7, 'Mazatán'),
(183, 7, 'Huehuetán'),
(184, 7, 'Tuzantán'),
(185, 7, 'Tapachula'),
(186, 7, 'Suchiate'),
(187, 7, 'Frontera Hidalgo'),
(188, 7, 'Metapa'),
(189, 7, 'Tuxtla Chico'),
(190, 7, 'Unión Juárez'),
(191, 7, 'Cacahoatán'),
(192, 7, 'Motozintla'),
(193, 7, 'Mazapa de Madero'),
(194, 7, 'Amatenango de la Frontera'),
(195, 7, 'Bejucal de Ocampo'),
(196, 7, 'La Grandeza'),
(197, 7, 'El Porvenir'),
(198, 7, 'Siltepec'),
(199, 8, 'Chihuahua'),
(200, 8, 'Cuauhtémoc'),
(201, 8, 'Riva Palacio'),
(202, 8, 'Aquiles Serdán'),
(203, 8, 'Bachíniva'),
(204, 8, 'Guerrero'),
(205, 8, 'Nuevo Casas Grandes'),
(206, 8, 'Ascensión'),
(207, 8, 'Janos'),
(208, 8, 'Casas Grandes'),
(209, 8, 'Galeana'),
(210, 8, 'Buenaventura'),
(211, 8, 'Gómez Farías'),
(212, 8, 'Ignacio Zaragoza'),
(213, 8, 'Madera'),
(214, 8, 'Namiquipa'),
(215, 8, 'Temósachic'),
(216, 8, 'Matachí'),
(217, 8, 'Juárez'),
(218, 8, 'Guadalupe'),
(219, 8, 'Praxedis G. Guerrero'),
(220, 8, 'Ahumada'),
(221, 8, 'Coyame del Sotol'),
(222, 8, 'Ojinaga'),
(223, 8, 'Aldama'),
(224, 8, 'Julimes'),
(225, 8, 'Manuel Benavides'),
(226, 8, 'Delicias'),
(227, 8, 'Rosales'),
(228, 8, 'Meoqui'),
(229, 8, 'Dr. Belisario Domínguez'),
(230, 8, 'Satevó'),
(231, 8, 'San Francisco de Borja'),
(232, 8, 'Nonoava'),
(233, 8, 'Guachochi'),
(234, 8, 'Bocoyna'),
(235, 8, 'Cusihuiriachi'),
(236, 8, 'Gran Morelos'),
(237, 8, 'Santa Isabel'),
(238, 8, 'Carichí'),
(239, 8, 'Uruachi'),
(240, 8, 'Ocampo'),
(241, 8, 'Moris'),
(242, 8, 'Chínipas'),
(243, 8, 'Maguarichi'),
(244, 8, 'Guazapares'),
(245, 8, 'Batopilas'),
(246, 8, 'Urique'),
(247, 8, 'Morelos'),
(248, 8, 'Guadalupe y Calvo'),
(249, 8, 'San Francisco del Oro'),
(250, 8, 'Rosario'),
(251, 8, 'Huejotitán'),
(252, 8, 'El Tule'),
(253, 8, 'Balleza'),
(254, 8, 'Santa Bárbara'),
(255, 8, 'Camargo'),
(256, 8, 'Saucillo'),
(257, 8, 'Valle de Zaragoza'),
(258, 8, 'La Cruz'),
(259, 8, 'San Francisco de Conchos'),
(260, 8, 'Hidalgo del Parral'),
(261, 8, 'Allende'),
(262, 8, 'López'),
(263, 8, 'Matamoros'),
(264, 8, 'Jiménez'),
(265, 8, 'Coronado'),
(266, 9, 'Álvaro Obregón'),
(267, 9, 'Azcapotzalco'),
(268, 9, 'Benito Juárez'),
(269, 9, 'Coyoacán'),
(270, 9, 'Cuajimalpa de Morelos'),
(271, 9, 'Cuauhtémoc'),
(272, 9, 'Gustavo A. Madero'),
(273, 9, 'Iztacalco'),
(274, 9, 'Iztapalapa'),
(275, 9, 'La Magdalena Contreras'),
(276, 9, 'Miguel Hidalgo'),
(277, 9, 'Milpa Alta'),
(278, 9, 'Tláhuac'),
(279, 9, 'Tlalpan'),
(280, 9, 'Venustiano Carranza'),
(281, 9, 'Xochimilco'),
(282, 10, 'Durango'),
(283, 10, 'Canatlán'),
(284, 10, 'Nuevo Ideal'),
(285, 10, 'Coneto de Comonfort'),
(286, 10, 'San Juan del Río'),
(287, 10, 'Canelas'),
(288, 10, 'Topia'),
(289, 10, 'Tamazula'),
(290, 10, 'Santiago Papasquiaro'),
(291, 10, 'Otáez'),
(292, 10, 'San Dimas'),
(293, 10, 'Guadalupe Victoria'),
(294, 10, 'Peñón Blanco'),
(295, 10, 'Pánuco de Coronado'),
(296, 10, 'Poanas'),
(297, 10, 'Nombre de Dios'),
(298, 10, 'Vicente Guerrero'),
(299, 10, 'Súchil'),
(300, 10, 'Pueblo Nuevo'),
(301, 10, 'Mezquital'),
(302, 10, 'Gómez Palacio'),
(303, 10, 'Lerdo'),
(304, 10, 'Mapimí'),
(305, 10, 'Tlahualilo'),
(306, 10, 'Hidalgo'),
(307, 10, 'Ocampo'),
(308, 10, 'Guanaceví'),
(309, 10, 'San Bernardo'),
(310, 10, 'Indé'),
(311, 10, 'San Pedro del Gallo'),
(312, 10, 'Tepehuanes'),
(313, 10, 'El Oro'),
(314, 10, 'Nazas'),
(315, 10, 'San Luis del Cordero'),
(316, 10, 'Rodeo'),
(317, 10, 'Cuencamé'),
(318, 10, 'Santa Clara'),
(319, 10, 'San Juan de Guadalupe'),
(320, 10, 'General Simón Bolívar'),
(321, 11, 'Guanajuato'),
(322, 11, 'Silao de la Victoria'),
(323, 11, 'Romita'),
(324, 11, 'San Francisco del Rincón'),
(325, 11, 'Purísima del Rincón'),
(326, 11, 'Manuel Doblado'),
(327, 11, 'Irapuato'),
(328, 11, 'Salamanca'),
(329, 11, 'Pueblo Nuevo'),
(330, 11, 'Pénjamo'),
(331, 11, 'Cuerámaro'),
(332, 11, 'Abasolo'),
(333, 11, 'Huanímaro'),
(334, 11, 'León'),
(335, 11, 'San Felipe'),
(336, 11, 'Ocampo'),
(337, 11, 'San Miguel de Allende'),
(338, 11, 'Dolores Hidalgo Cuna de la Independencia Nacional'),
(339, 11, 'San Diego de la Unión'),
(340, 11, 'San Luis de la Paz'),
(341, 11, 'Victoria'),
(342, 11, 'Xichú'),
(343, 11, 'Atarjea'),
(344, 11, 'Santa Catarina'),
(345, 11, 'Doctor Mora'),
(346, 11, 'Tierra Blanca'),
(347, 11, 'San José Iturbide'),
(348, 11, 'Celaya'),
(349, 11, 'Apaseo el Grande'),
(350, 11, 'Comonfort'),
(351, 11, 'Santa Cruz de Juventino Rosas'),
(352, 11, 'Villagrán'),
(353, 11, 'Cortazar'),
(354, 11, 'Valle de Santiago'),
(355, 11, 'Jaral del Progreso'),
(356, 11, 'Apaseo el Alto'),
(357, 11, 'Jerécuaro'),
(358, 11, 'Coroneo'),
(359, 11, 'Acámbaro'),
(360, 11, 'Tarimoro'),
(361, 11, 'Tarandacuao'),
(362, 11, 'Moroleón'),
(363, 11, 'Salvatierra'),
(364, 11, 'Yuriria'),
(365, 11, 'Santiago Maravatío'),
(366, 11, 'Uriangato'),
(367, 12, 'Chilpancingo de los Bravo'),
(368, 12, 'General Heliodoro Castillo'),
(369, 12, 'Leonardo Bravo'),
(370, 12, 'Tixtla de Guerrero'),
(371, 12, 'Ayutla de los Libres'),
(372, 12, 'Mochitlán'),
(373, 12, 'Quechultenango'),
(374, 12, 'Tecoanapa'),
(375, 12, 'Acapulco de Juárez'),
(376, 12, 'Juan R. Escudero'),
(377, 12, 'San Marcos'),
(378, 12, 'Iguala de la Independencia'),
(379, 12, 'Huitzuco de los Figueroa'),
(380, 12, 'Tepecoacuilco de Trujano'),
(381, 12, 'Eduardo Neri'),
(382, 12, 'Taxco de Alarcón'),
(383, 12, 'Buenavista de Cuéllar'),
(384, 12, 'Tetipac'),
(385, 12, 'Pilcaya'),
(386, 12, 'Teloloapan'),
(387, 12, 'Ixcateopan de Cuauhtémoc'),
(388, 12, 'Pedro Ascencio Alquisiras'),
(389, 12, 'General Canuto A. Neri'),
(390, 12, 'Arcelia'),
(391, 12, 'Apaxtla'),
(392, 12, 'Cuetzala del Progreso'),
(393, 12, 'Cocula'),
(394, 12, 'Tlapehuala'),
(395, 12, 'Cutzamala de Pinzón'),
(396, 12, 'Pungarabato'),
(397, 12, 'Tlalchapa'),
(398, 12, 'Coyuca de Catalán'),
(399, 12, 'Ajuchitlán del Progreso'),
(400, 12, 'Zirándaro'),
(401, 12, 'San Miguel Totolapan'),
(402, 12, 'La Unión de Isidoro Montes de Oca'),
(403, 12, 'Petatlán'),
(404, 12, 'Coahuayutla de José María Izazaga'),
(405, 12, 'Zihuatanejo de Azueta'),
(406, 12, 'Técpan de Galeana'),
(407, 12, 'Atoyac de Álvarez'),
(408, 12, 'Benito Juárez'),
(409, 12, 'Coyuca de Benítez'),
(410, 12, 'Olinalá'),
(411, 12, 'Atenango del Río'),
(412, 12, 'Copalillo'),
(413, 12, 'Cualác'),
(414, 12, 'Chilapa de Álvarez'),
(415, 12, 'José Joaquín de Herrera'),
(416, 12, 'Ahuacuotzingo'),
(417, 12, 'Zitlala'),
(418, 12, 'Mártir de Cuilapan'),
(419, 12, 'Huamuxtitlán'),
(420, 12, 'Xochihuehuetlán'),
(421, 12, 'Alpoyeca'),
(422, 12, 'Tlapa de Comonfort'),
(423, 12, 'Tlalixtaquilla de Maldonado'),
(424, 12, 'Xalpatláhuac'),
(425, 12, 'Zapotitlán Tablas'),
(426, 12, 'Acatepec'),
(427, 12, 'Atlixtac'),
(428, 12, 'Copanatoyac'),
(429, 12, 'Malinaltepec'),
(430, 12, 'Iliatenco'),
(431, 12, 'Tlacoapa'),
(432, 12, 'Atlamajalcingo del Monte'),
(433, 12, 'San Luis Acatlán'),
(434, 12, 'Metlatónoc'),
(435, 12, 'Cochoapa el Grande'),
(436, 12, 'Alcozauca de Guerrero'),
(437, 12, 'Ometepec'),
(438, 12, 'Tlacoachistlahuaca'),
(439, 12, 'Xochistlahuaca'),
(440, 12, 'Florencio Villarreal'),
(441, 12, 'Cuautepec'),
(442, 12, 'Copala'),
(443, 12, 'Azoyú'),
(444, 12, 'Juchitán'),
(445, 12, 'Marquelia'),
(446, 12, 'Cuajinicuilapa'),
(447, 12, 'Igualapa'),
(448, 13, 'Pachuca de Soto'),
(449, 13, 'Mineral del Chico'),
(450, 13, 'Mineral del Monte'),
(451, 13, 'Ajacuba'),
(452, 13, 'San Agustín Tlaxiaca'),
(453, 13, 'Mineral de la Reforma'),
(454, 13, 'Zapotlán de Juárez'),
(455, 13, 'Jacala de Ledezma'),
(456, 13, 'Pisaflores'),
(457, 13, 'Pacula'),
(458, 13, 'La Misión'),
(459, 13, 'Chapulhuacán'),
(460, 13, 'Ixmiquilpan'),
(461, 13, 'Zimapán'),
(462, 13, 'Nicolás Flores'),
(463, 13, 'Cardonal'),
(464, 13, 'Tasquillo'),
(465, 13, 'Alfajayucan'),
(466, 13, 'Huichapan'),
(467, 13, 'Tecozautla'),
(468, 13, 'Nopala de Villagrán'),
(469, 13, 'Actopan'),
(470, 13, 'Santiago de Anaya'),
(471, 13, 'San Salvador'),
(472, 13, 'Francisco I. Madero'),
(473, 13, 'El Arenal'),
(474, 13, 'Mixquiahuala de Juárez'),
(475, 13, 'Progreso de Obregón'),
(476, 13, 'Chilcuautla'),
(477, 13, 'Tezontepec de Aldama'),
(478, 13, 'Tlahuelilpan'),
(479, 13, 'Tula de Allende'),
(480, 13, 'Tepeji del Río de Ocampo'),
(481, 13, 'Chapantongo'),
(482, 13, 'Tepetitlán'),
(483, 13, 'Tetepango'),
(484, 13, 'Tlaxcoapan'),
(485, 13, 'Atitalaquia'),
(486, 13, 'Atotonilco de Tula'),
(487, 13, 'Huejutla de Reyes'),
(488, 13, 'San Felipe Orizatlán'),
(489, 13, 'Jaltocán'),
(490, 13, 'Huautla'),
(491, 13, 'Atlapexco'),
(492, 13, 'Huazalingo'),
(493, 13, 'Yahualica'),
(494, 13, 'Xochiatipan'),
(495, 13, 'Molango de Escamilla'),
(496, 13, 'Tepehuacán de Guerrero'),
(497, 13, 'Lolotla'),
(498, 13, 'Tlanchinol'),
(499, 13, 'Tlahuiltepa'),
(500, 13, 'Juárez Hidalgo'),
(501, 13, 'Zacualtipán de Ángeles'),
(502, 13, 'Calnali'),
(503, 13, 'Xochicoatlán'),
(504, 13, 'Tianguistengo'),
(505, 13, 'Atotonilco el Grande'),
(506, 13, 'Eloxochitlán'),
(507, 13, 'Metztitlán'),
(508, 13, 'San Agustín Metzquititlán'),
(509, 13, 'Metepec'),
(510, 13, 'Huehuetla'),
(511, 13, 'San Bartolo Tutotepec'),
(512, 13, 'Agua Blanca de Iturbide'),
(513, 13, 'Tenango de Doria'),
(514, 13, 'Huasca de Ocampo'),
(515, 13, 'Acatlán'),
(516, 13, 'Omitlán de Juárez'),
(517, 13, 'Epazoyucan'),
(518, 13, 'Tulancingo de Bravo'),
(519, 13, 'Acaxochitlán'),
(520, 13, 'Cuautepec de Hinojosa'),
(521, 13, 'Santiago Tulantepec de Lugo Guerrero'),
(522, 13, 'Singuilucan'),
(523, 13, 'Tizayuca'),
(524, 13, 'Zempoala'),
(525, 13, 'Tolcayuca'),
(526, 13, 'Villa de Tezontepec'),
(527, 13, 'Apan'),
(528, 13, 'Tlanalapa'),
(529, 13, 'Almoloya'),
(530, 13, 'Emiliano Zapata'),
(531, 13, 'Tepeapulco'),
(532, 14, 'Guadalajara'),
(533, 14, 'Zapopan'),
(534, 14, 'San Cristóbal de la Barranca'),
(535, 14, 'Ixtlahuacán del Río'),
(536, 14, 'Tala'),
(537, 14, 'El Arenal'),
(538, 14, 'Amatitán'),
(539, 14, 'Tonalá'),
(540, 14, 'Zapotlanejo'),
(541, 14, 'Acatic'),
(542, 14, 'Cuquío'),
(543, 14, 'San Pedro Tlaquepaque'),
(544, 14, 'Tlajomulco de Zúñiga'),
(545, 14, 'El Salto'),
(546, 14, 'Acatlán de Juárez'),
(547, 14, 'Villa Corona'),
(548, 14, 'Zacoalco de Torres'),
(549, 14, 'Atemajac de Brizuela'),
(550, 14, 'Jocotepec'),
(551, 14, 'Ixtlahuacán de los Membrillos'),
(552, 14, 'Juanacatlán'),
(553, 14, 'Chapala'),
(554, 14, 'Poncitlán'),
(555, 14, 'Zapotlán del Rey'),
(556, 14, 'Huejuquilla el Alto'),
(557, 14, 'Mezquitic'),
(558, 14, 'Villa Guerrero'),
(559, 14, 'Bolaños'),
(560, 14, 'Totatiche'),
(561, 14, 'Colotlán'),
(562, 14, 'Santa María de los Ángeles'),
(563, 14, 'Huejúcar'),
(564, 14, 'Chimaltitán'),
(565, 14, 'San Martín de Bolaños'),
(566, 14, 'Tequila'),
(567, 14, 'Hostotipaquillo'),
(568, 14, 'Magdalena'),
(569, 14, 'Etzatlán'),
(570, 14, 'San Marcos'),
(571, 14, 'San Juanito de Escobedo'),
(572, 14, 'Ameca'),
(573, 14, 'Ahualulco de Mercado'),
(574, 14, 'Teuchitlán'),
(575, 14, 'San Martín Hidalgo'),
(576, 14, 'Guachinango'),
(577, 14, 'Mixtlán'),
(578, 14, 'Mascota'),
(579, 14, 'San Sebastián del Oeste'),
(580, 14, 'San Juan de los Lagos'),
(581, 14, 'Jalostotitlán'),
(582, 14, 'San Miguel el Alto'),
(583, 14, 'San Julián'),
(584, 14, 'Arandas'),
(585, 14, 'San Ignacio Cerro Gordo'),
(586, 14, 'Teocaltiche'),
(587, 14, 'Villa Hidalgo'),
(588, 14, 'Encarnación de Díaz'),
(589, 14, 'Yahualica de González Gallo'),
(590, 14, 'Mexticacán'),
(591, 14, 'Cañadas de Obregón'),
(592, 14, 'Valle de Guadalupe'),
(593, 14, 'Lagos de Moreno'),
(594, 14, 'Ojuelos de Jalisco'),
(595, 14, 'Unión de San Antonio'),
(596, 14, 'San Diego de Alejandría'),
(597, 14, 'Tepatitlán de Morelos'),
(598, 14, 'Tototlán'),
(599, 14, 'Atotonilco el Alto'),
(600, 14, 'Ocotlán'),
(601, 14, 'Jamay'),
(602, 14, 'La Barca'),
(603, 14, 'Ayotlán'),
(604, 14, 'Jesús María'),
(605, 14, 'Degollado'),
(606, 14, 'Unión de Tula'),
(607, 14, 'Ayutla'),
(608, 14, 'Atenguillo'),
(609, 14, 'Cuautla'),
(610, 14, 'Atengo'),
(611, 14, 'Talpa de Allende'),
(612, 14, 'Puerto Vallarta'),
(613, 14, 'Cabo Corrientes'),
(614, 14, 'Tomatlán'),
(615, 14, 'Cocula'),
(616, 14, 'Tecolotlán'),
(617, 14, 'Tenamaxtlán'),
(618, 14, 'Juchitlán'),
(619, 14, 'Chiquilistlán'),
(620, 14, 'Ejutla'),
(621, 14, 'El Limón'),
(622, 14, 'El Grullo'),
(623, 14, 'Tonaya'),
(624, 14, 'Tuxcacuesco'),
(625, 14, 'Villa Purificación'),
(626, 14, 'La Huerta'),
(627, 14, 'Autlán de Navarro'),
(628, 14, 'Casimiro Castillo'),
(629, 14, 'Cuautitlán de García Barragán'),
(630, 14, 'Cihuatlán'),
(631, 14, 'Zapotlán el Grande'),
(632, 14, 'Gómez Farías'),
(633, 14, 'Concepción de Buenos Aires'),
(634, 14, 'Atoyac'),
(635, 14, 'Techaluta de Montenegro'),
(636, 14, 'Teocuitatlán de Corona'),
(637, 14, 'Sayula'),
(638, 14, 'Tapalpa'),
(639, 14, 'Amacueca'),
(640, 14, 'Tizapán el Alto'),
(641, 14, 'Tuxcueca'),
(642, 14, 'La Manzanilla de la Paz'),
(643, 14, 'Mazamitla'),
(644, 14, 'Valle de Juárez'),
(645, 14, 'Quitupan'),
(646, 14, 'Zapotiltic'),
(647, 14, 'Tamazula de Gordiano'),
(648, 14, 'San Gabriel'),
(649, 14, 'Tolimán'),
(650, 14, 'Zapotitlán de Vadillo'),
(651, 14, 'Tuxpan'),
(652, 14, 'Tonila'),
(653, 14, 'Pihuamo'),
(654, 14, 'Tecalitlán'),
(655, 14, 'Jilotlán de los Dolores'),
(656, 14, 'Santa María del Oro'),
(657, 15, 'Toluca'),
(658, 15, 'Acambay de Ruíz Castañeda'),
(659, 15, 'Aculco'),
(660, 15, 'Temascalcingo'),
(661, 15, 'Atlacomulco'),
(662, 15, 'Timilpan'),
(663, 15, 'Morelos'),
(664, 15, 'El Oro'),
(665, 15, 'San Felipe del Progreso'),
(666, 15, 'San José del Rincón'),
(667, 15, 'Jocotitlán'),
(668, 15, 'Ixtlahuaca'),
(669, 15, 'Jiquipilco'),
(670, 15, 'Temoaya'),
(671, 15, 'Almoloya de Juárez'),
(672, 15, 'Villa Victoria'),
(673, 15, 'Villa de Allende'),
(674, 15, 'Donato Guerra'),
(675, 15, 'Ixtapan del Oro'),
(676, 15, 'Santo Tomás'),
(677, 15, 'Otzoloapan'),
(678, 15, 'Zacazonapan'),
(679, 15, 'Valle de Bravo'),
(680, 15, 'Amanalco'),
(681, 15, 'Temascaltepec'),
(682, 15, 'Zinacantepec'),
(683, 15, 'Tejupilco'),
(684, 15, 'Luvianos'),
(685, 15, 'San Simón de Guerrero'),
(686, 15, 'Amatepec'),
(687, 15, 'Tlatlaya'),
(688, 15, 'Sultepec'),
(689, 15, 'Texcaltitlán'),
(690, 15, 'Coatepec Harinas'),
(691, 15, 'Villa Guerrero'),
(692, 15, 'Zacualpan'),
(693, 15, 'Almoloya de Alquisiras'),
(694, 15, 'Ixtapan de la Sal'),
(695, 15, 'Tonatico'),
(696, 15, 'Zumpahuacán'),
(697, 15, 'Lerma'),
(698, 15, 'Xonacatlán'),
(699, 15, 'Otzolotepec'),
(700, 15, 'San Mateo Atenco'),
(701, 15, 'Metepec'),
(702, 15, 'Mexicaltzingo'),
(703, 15, 'Calimaya'),
(704, 15, 'Chapultepec'),
(705, 15, 'San Antonio la Isla'),
(706, 15, 'Tenango del Valle'),
(707, 15, 'Rayón'),
(708, 15, 'Joquicingo'),
(709, 15, 'Tenancingo'),
(710, 15, 'Malinalco'),
(711, 15, 'Ocuilan'),
(712, 15, 'Atizapán'),
(713, 15, 'Almoloya del Río'),
(714, 15, 'Texcalyacac'),
(715, 15, 'Tianguistenco'),
(716, 15, 'Xalatlaco'),
(717, 15, 'Capulhuac'),
(718, 15, 'Ocoyoacac'),
(719, 15, 'Huixquilucan'),
(720, 15, 'Atizapán de Zaragoza'),
(721, 15, 'Naucalpan de Juárez'),
(722, 15, 'Tlalnepantla de Baz'),
(723, 15, 'Polotitlán'),
(724, 15, 'Jilotepec'),
(725, 15, 'Soyaniquilpan de Juárez'),
(726, 15, 'Villa del Carbón'),
(727, 15, 'Chapa de Mota'),
(728, 15, 'Nicolás Romero'),
(729, 15, 'Isidro Fabela'),
(730, 15, 'Jilotzingo'),
(731, 15, 'Tepotzotlán'),
(732, 15, 'Coyotepec'),
(733, 15, 'Huehuetoca'),
(734, 15, 'Cuautitlán Izcalli'),
(735, 15, 'Teoloyucan'),
(736, 15, 'Cuautitlán'),
(737, 15, 'Melchor Ocampo'),
(738, 15, 'Tultitlán'),
(739, 15, 'Tultepec'),
(740, 15, 'Ecatepec de Morelos'),
(741, 15, 'Zumpango'),
(742, 15, 'Tequixquiac'),
(743, 15, 'Apaxco'),
(744, 15, 'Hueypoxtla'),
(745, 15, 'Coacalco de Berriozábal'),
(746, 15, 'Tecámac'),
(747, 15, 'Jaltenco'),
(748, 15, 'Tonanitla'),
(749, 15, 'Nextlalpan'),
(750, 15, 'Teotihuacán'),
(751, 15, 'San Martín de las Pirámides'),
(752, 15, 'Acolman'),
(753, 15, 'Otumba'),
(754, 15, 'Axapusco'),
(755, 15, 'Nopaltepec'),
(756, 15, 'Temascalapa'),
(757, 15, 'Tezoyuca'),
(758, 15, 'Chiautla'),
(759, 15, 'Papalotla'),
(760, 15, 'Tepetlaoxtoc'),
(761, 15, 'Texcoco'),
(762, 15, 'Chiconcuac'),
(763, 15, 'Atenco'),
(764, 15, 'Chimalhuacán'),
(765, 15, 'Chicoloapan'),
(766, 15, 'La Paz'),
(767, 15, 'Ixtapaluca'),
(768, 15, 'Chalco'),
(769, 15, 'Valle de Chalco Solidaridad'),
(770, 15, 'Temamatla'),
(771, 15, 'Cocotitlán'),
(772, 15, 'Tlalmanalco'),
(773, 15, 'Ayapango'),
(774, 15, 'Tenango del Aire'),
(775, 15, 'Ozumba'),
(776, 15, 'Juchitepec'),
(777, 15, 'Tepetlixpa'),
(778, 15, 'Amecameca'),
(779, 15, 'Atlautla'),
(780, 15, 'Ecatzingo'),
(781, 15, 'Nezahualcóyotl'),
(782, 16, 'Morelia'),
(783, 16, 'Huaniqueo'),
(784, 16, 'Coeneo'),
(785, 16, 'Quiroga'),
(786, 16, 'Tzintzuntzan'),
(787, 16, 'Lagunillas'),
(788, 16, 'Acuitzio'),
(789, 16, 'Madero'),
(790, 16, 'Puruándiro'),
(791, 16, 'José Sixto Verduzco'),
(792, 16, 'Angamacutiro'),
(793, 16, 'Panindícuaro'),
(794, 16, 'Zacapu'),
(795, 16, 'Tlazazalca'),
(796, 16, 'Purépero'),
(797, 16, 'Jiménez'),
(798, 16, 'Morelos'),
(799, 16, 'Huandacareo'),
(800, 16, 'Cuitzeo'),
(801, 16, 'Chucándiro'),
(802, 16, 'Copándaro'),
(803, 16, 'Tarímbaro'),
(804, 16, 'Santa Ana Maya'),
(805, 16, 'Álvaro Obregón'),
(806, 16, 'Zinapécuaro'),
(807, 16, 'Indaparapeo'),
(808, 16, 'Queréndaro'),
(809, 16, 'Sahuayo'),
(810, 16, 'Briseñas'),
(811, 16, 'Cojumatlán de Régules'),
(812, 16, 'Venustiano Carranza'),
(813, 16, 'Pajacuarán'),
(814, 16, 'Vista Hermosa'),
(815, 16, 'Tanhuato'),
(816, 16, 'Yurécuaro'),
(817, 16, 'Ixtlán'),
(818, 16, 'La Piedad'),
(819, 16, 'Numarán'),
(820, 16, 'Churintzio'),
(821, 16, 'Zináparo'),
(822, 16, 'Penjamillo'),
(823, 16, 'Marcos Castellanos'),
(824, 16, 'Jiquilpan'),
(825, 16, 'Villamar'),
(826, 16, 'Chavinda'),
(827, 16, 'Zamora'),
(828, 16, 'Ecuandureo'),
(829, 16, 'Tangancícuaro'),
(830, 16, 'Chilchota'),
(831, 16, 'Jacona'),
(832, 16, 'Tangamandapio'),
(833, 16, 'Cotija'),
(834, 16, 'Tocumbo'),
(835, 16, 'Tingüindín'),
(836, 16, 'Uruapan'),
(837, 16, 'Charapan'),
(838, 16, 'Paracho'),
(839, 16, 'Cherán'),
(840, 16, 'Nahuatzen'),
(841, 16, 'Tingambato'),
(842, 16, 'Los Reyes'),
(843, 16, 'Peribán'),
(844, 16, 'Tancítaro'),
(845, 16, 'Nuevo Parangaricutiro'),
(846, 16, 'Buenavista'),
(847, 16, 'Tepalcatepec'),
(848, 16, 'Aguililla'),
(849, 16, 'Apatzingán'),
(850, 16, 'Parácuaro'),
(851, 16, 'Coahuayana'),
(852, 16, 'Chinicuila'),
(853, 16, 'Coalcomán de Vázquez Pallares'),
(854, 16, 'Aquila'),
(855, 16, 'Tumbiscatío'),
(856, 16, 'Arteaga'),
(857, 16, 'Lázaro Cárdenas'),
(858, 16, 'Epitacio Huerta'),
(859, 16, 'Contepec'),
(860, 16, 'Tlalpujahua'),
(861, 16, 'Hidalgo'),
(862, 16, 'Maravatío'),
(863, 16, 'Irimbo'),
(864, 16, 'Senguio'),
(865, 16, 'Charo'),
(866, 16, 'Tzitzio'),
(867, 16, 'Tiquicheo de Nicolás Romero'),
(868, 16, 'Aporo'),
(869, 16, 'Angangueo'),
(870, 16, 'Tuxpan'),
(871, 16, 'Ocampo'),
(872, 16, 'Jungapeo'),
(873, 16, 'Zitácuaro'),
(874, 16, 'Tuzantla'),
(875, 16, 'Juárez'),
(876, 16, 'Susupuato'),
(877, 16, 'Pátzcuaro'),
(878, 16, 'Erongarícuaro'),
(879, 16, 'Huiramba'),
(880, 16, 'Tacámbaro'),
(881, 16, 'Turicato'),
(882, 16, 'Ziracuaretiro'),
(883, 16, 'Taretan'),
(884, 16, 'Gabriel Zamora'),
(885, 16, 'Nuevo Urecho'),
(886, 16, 'Múgica'),
(887, 16, 'Salvador Escalante'),
(888, 16, 'Ario'),
(889, 16, 'La Huacana'),
(890, 16, 'Churumuco'),
(891, 16, 'Nocupétaro'),
(892, 16, 'Carácuaro'),
(893, 16, 'Huetamo'),
(894, 16, 'San Lucas'),
(895, 17, 'Cuernavaca'),
(896, 17, 'Huitzilac'),
(897, 17, 'Tepoztlán'),
(898, 17, 'Tlalnepantla'),
(899, 17, 'Tlayacapan'),
(900, 17, 'Jiutepec'),
(901, 17, 'Temixco'),
(902, 17, 'Miacatlán'),
(903, 17, 'Coatlán del Río'),
(904, 17, 'Tetecala'),
(905, 17, 'Mazatepec'),
(906, 17, 'Amacuzac'),
(907, 17, 'Puente de Ixtla'),
(908, 17, 'Ayala'),
(909, 17, 'Yautepec'),
(910, 17, 'Cuautla'),
(911, 17, 'Emiliano Zapata'),
(912, 17, 'Tlaltizapán de Zapata'),
(913, 17, 'Zacatepec'),
(914, 17, 'Xochitepec'),
(915, 17, 'Tetela del Volcán'),
(916, 17, 'Yecapixtla'),
(917, 17, 'Totolapan'),
(918, 17, 'Atlatlahucan'),
(919, 17, 'Ocuituco'),
(920, 17, 'Temoac'),
(921, 17, 'Zacualpan'),
(922, 17, 'Jojutla'),
(923, 17, 'Tepalcingo'),
(924, 17, 'Jonacatepec'),
(925, 17, 'Axochiapan'),
(926, 17, 'Jantetelco'),
(927, 17, 'Tlaquiltenango'),
(928, 18, 'Tepic'),
(929, 18, 'Tuxpan'),
(930, 18, 'Santiago Ixcuintla'),
(931, 18, 'Acaponeta'),
(932, 18, 'Tecuala'),
(933, 18, 'Huajicori'),
(934, 18, 'Del Nayar'),
(935, 18, 'La Yesca'),
(936, 18, 'Ruíz'),
(937, 18, 'Rosamorada'),
(938, 18, 'Compostela'),
(939, 18, 'Bahía de Banderas'),
(940, 18, 'San Blas'),
(941, 18, 'Xalisco'),
(942, 18, 'San Pedro Lagunillas'),
(943, 18, 'Santa María del Oro'),
(944, 18, 'Jala'),
(945, 18, 'Ahuacatlán'),
(946, 18, 'Ixtlán del Río'),
(947, 18, 'Amatlán de Cañas'),
(948, 19, 'Monterrey'),
(949, 19, 'Anáhuac'),
(950, 19, 'Lampazos de Naranjo'),
(951, 19, 'Mina'),
(952, 19, 'Bustamante'),
(953, 19, 'Sabinas Hidalgo'),
(954, 19, 'Villaldama'),
(955, 19, 'Vallecillo'),
(956, 19, 'Parás'),
(957, 19, 'Salinas Victoria'),
(958, 19, 'Ciénega de Flores'),
(959, 19, 'Hidalgo'),
(960, 19, 'Abasolo'),
(961, 19, 'Higueras'),
(962, 19, 'General Zuazua'),
(963, 19, 'Agualeguas'),
(964, 19, 'General Treviño'),
(965, 19, 'Cerralvo'),
(966, 19, 'Melchor Ocampo'),
(967, 19, 'García'),
(968, 19, 'General Escobedo'),
(969, 19, 'Santa Catarina'),
(970, 19, 'San Pedro Garza García'),
(971, 19, 'San Nicolás de los Garza'),
(972, 19, 'El Carmen'),
(973, 19, 'Apodaca'),
(974, 19, 'Pesquería'),
(975, 19, 'Marín'),
(976, 19, 'Doctor González'),
(977, 19, 'Los Ramones'),
(978, 19, 'Los Herreras'),
(979, 19, 'Los Aldamas'),
(980, 19, 'Doctor Coss'),
(981, 19, 'General Bravo'),
(982, 19, 'China'),
(983, 19, 'Guadalupe'),
(984, 19, 'Juárez'),
(985, 19, 'Santiago'),
(986, 19, 'Allende'),
(987, 19, 'General Terán'),
(988, 19, 'Cadereyta Jiménez'),
(989, 19, 'Montemorelos'),
(990, 19, 'Rayones'),
(991, 19, 'Linares'),
(992, 19, 'Iturbide'),
(993, 19, 'Galeana'),
(994, 19, 'Hualahuises'),
(995, 19, 'Doctor Arroyo'),
(996, 19, 'Aramberri'),
(997, 19, 'General Zaragoza'),
(998, 19, 'Mier y Noriega'),
(999, 20, 'Oaxaca de Juárez'),
(1000, 20, 'Villa de Etla'),
(1001, 20, 'San Juan Bautista Atatlahuca'),
(1002, 20, 'San Jerónimo Sosola'),
(1003, 20, 'San Juan Bautista Jayacatlán'),
(1004, 20, 'San Francisco Telixtlahuaca'),
(1005, 20, 'Santiago Tenango'),
(1006, 20, 'San Pablo Huitzo'),
(1007, 20, 'San Juan del Estado'),
(1008, 20, 'Magdalena Apasco'),
(1009, 20, 'Santiago Suchilquitongo'),
(1010, 20, 'San Juan Bautista Guelache'),
(1011, 20, 'Reyes Etla'),
(1012, 20, 'Nazareno Etla'),
(1013, 20, 'San Andrés Zautla'),
(1014, 20, 'San Agustín Etla'),
(1015, 20, 'Soledad Etla'),
(1016, 20, 'Santo Tomás Mazaltepec'),
(1017, 20, 'Guadalupe Etla'),
(1018, 20, 'San Pablo Etla'),
(1019, 20, 'San Felipe Tejalápam'),
(1020, 20, 'San Lorenzo Cacaotepec'),
(1021, 20, 'Santa María Peñoles'),
(1022, 20, 'Santiago Tlazoyaltepec'),
(1023, 20, 'Tlalixtac de Cabrera'),
(1024, 20, 'San Jacinto Amilpas'),
(1025, 20, 'San Andrés Huayápam'),
(1026, 20, 'San Agustín Yatareni'),
(1027, 20, 'Santo Domingo Tomaltepec'),
(1028, 20, 'Santa María del Tule'),
(1029, 20, 'San Juan Bautista Tuxtepec'),
(1030, 20, 'Loma Bonita'),
(1031, 20, 'San José Independencia'),
(1032, 20, 'Cosolapa'),
(1033, 20, 'Acatlán de Pérez Figueroa'),
(1034, 20, 'San Miguel Soyaltepec'),
(1035, 20, 'Ayotzintepec'),
(1036, 20, 'San Pedro Ixcatlán'),
(1037, 20, 'San José Chiltepec'),
(1038, 20, 'San Felipe Jalapa de Díaz'),
(1039, 20, 'Santa María Jacatepec'),
(1040, 20, 'San Lucas Ojitlán'),
(1041, 20, 'San Juan Bautista Valle Nacional'),
(1042, 20, 'San Felipe Usila'),
(1043, 20, 'Huautla de Jiménez'),
(1044, 20, 'Santa María Chilchotla'),
(1045, 20, 'Santa Ana Ateixtlahuaca'),
(1046, 20, 'San Lorenzo Cuaunecuiltitla'),
(1047, 20, 'San Francisco Huehuetlán'),
(1048, 20, 'San Pedro Ocopetatillo'),
(1049, 20, 'Santa Cruz Acatepec'),
(1050, 20, 'Eloxochitlán de Flores Magón'),
(1051, 20, 'Santiago Texcalcingo'),
(1052, 20, 'Teotitlán de Flores Magón'),
(1053, 20, 'Santa María Teopoxco'),
(1054, 20, 'San Martín Toxpalan'),
(1055, 20, 'San Jerónimo Tecóatl'),
(1056, 20, 'Santa María la Asunción'),
(1057, 20, 'Huautepec'),
(1058, 20, 'San Juan Coatzóspam'),
(1059, 20, 'San Lucas Zoquiápam'),
(1060, 20, 'San Antonio Nanahuatípam'),
(1061, 20, 'San José Tenango'),
(1062, 20, 'San Mateo Yoloxochitlán'),
(1063, 20, 'San Bartolomé Ayautla'),
(1064, 20, 'Mazatlán Villa de Flores'),
(1065, 20, 'San Juan de los Cués'),
(1066, 20, 'Santa María Tecomavaca'),
(1067, 20, 'Santa María Ixcatlán'),
(1068, 20, 'San Juan Bautista Cuicatlán'),
(1069, 20, 'Cuyamecalco Villa de Zaragoza'),
(1070, 20, 'Santa Ana Cuauhtémoc'),
(1071, 20, 'Chiquihuitlán de Benito Juárez'),
(1072, 20, 'San Pedro Teutila'),
(1073, 20, 'San Miguel Santa Flor'),
(1074, 20, 'Santa María Tlalixtac'),
(1075, 20, 'San Andrés Teotilálpam'),
(1076, 20, 'San Francisco Chapulapa'),
(1077, 20, 'Concepción Pápalo'),
(1078, 20, 'Santos Reyes Pápalo'),
(1079, 20, 'San Juan Bautista Tlacoatzintepec'),
(1080, 20, 'Santa María Pápalo'),
(1081, 20, 'San Juan Tepeuxila'),
(1082, 20, 'San Pedro Sochiápam'),
(1083, 20, 'Valerio Trujano'),
(1084, 20, 'San Pedro Jocotipac'),
(1085, 20, 'Santa María Texcatitlán'),
(1086, 20, 'San Pedro Jaltepetongo'),
(1087, 20, 'Santiago Nacaltepec'),
(1088, 20, 'Natividad'),
(1089, 20, 'San Juan Quiotepec'),
(1090, 20, 'San Pedro Yólox'),
(1091, 20, 'Santiago Comaltepec'),
(1092, 20, 'Abejones'),
(1093, 20, 'San Pablo Macuiltianguis'),
(1094, 20, 'Ixtlán de Juárez'),
(1095, 20, 'San Juan Atepec'),
(1096, 20, 'San Pedro Yaneri'),
(1097, 20, 'San Miguel Aloápam'),
(1098, 20, 'Teococuilco de Marcos Pérez'),
(1099, 20, 'Santa Ana Yareni'),
(1100, 20, 'San Juan Evangelista Analco'),
(1101, 20, 'Santa María Jaltianguis'),
(1102, 20, 'San Miguel del Río'),
(1103, 20, 'San Juan Chicomezúchil'),
(1104, 20, 'Capulálpam de Méndez'),
(1105, 20, 'Nuevo Zoquiápam'),
(1106, 20, 'Santiago Xiacuí'),
(1107, 20, 'Guelatao de Juárez'),
(1108, 20, 'Santa Catarina Ixtepeji'),
(1109, 20, 'San Miguel Yotao'),
(1110, 20, 'Santa Catarina Lachatao'),
(1111, 20, 'San Miguel Amatlán'),
(1112, 20, 'Santa María Yavesía'),
(1113, 20, 'Santiago Laxopa'),
(1114, 20, 'San Ildefonso Villa Alta'),
(1115, 20, 'Santiago Camotlán'),
(1116, 20, 'San Juan Yaeé'),
(1117, 20, 'Santiago Lalopa'),
(1118, 20, 'San Juan Yatzona'),
(1119, 20, 'Villa Talea de Castro'),
(1120, 20, 'Tanetze de Zaragoza'),
(1121, 20, 'San Juan Juquila Vijanos'),
(1122, 20, 'San Cristóbal Lachirioag'),
(1123, 20, 'Santa María Temaxcalapa'),
(1124, 20, 'Santo Domingo Roayaga'),
(1125, 20, 'Santa María Yalina'),
(1126, 20, 'San Andrés Solaga'),
(1127, 20, 'San Juan Tabaá'),
(1128, 20, 'San Melchor Betaza'),
(1129, 20, 'San Andrés Yaá'),
(1130, 20, 'San Bartolomé Zoogocho'),
(1131, 20, 'San Baltazar Yatzachi el Bajo'),
(1132, 20, 'Santiago Zoochila'),
(1133, 20, 'Villa Hidalgo'),
(1134, 20, 'San Francisco Cajonos'),
(1135, 20, 'San Mateo Cajonos'),
(1136, 20, 'San Pedro Cajonos'),
(1137, 20, 'Santo Domingo Xagacía'),
(1138, 20, 'San Pablo Yaganiza'),
(1139, 20, 'Santiago Choápam'),
(1140, 20, 'Santiago Jocotepec'),
(1141, 20, 'San Juan Lalana'),
(1142, 20, 'Santiago Yaveo'),
(1143, 20, 'San Juan Petlapa'),
(1144, 20, 'San Juan Comaltepec'),
(1145, 20, 'Heroica Ciudad de Huajuapan de León'),
(1146, 20, 'Santiago Chazumba'),
(1147, 20, 'Cosoltepec'),
(1148, 20, 'San Pedro y San Pablo Tequixtepec'),
(1149, 20, 'San Juan Bautista Suchitepec'),
(1150, 20, 'Santa Catarina Zapoquila'),
(1151, 20, 'Santiago Miltepec'),
(1152, 20, 'San Jerónimo Silacayoapilla'),
(1153, 20, 'Zapotitlán Palmas'),
(1154, 20, 'San Andrés Dinicuiti'),
(1155, 20, 'Santiago Cacaloxtepec'),
(1156, 20, 'Asunción Cuyotepeji'),
(1157, 20, 'Santa María Camotlán'),
(1158, 20, 'Santiago Huajolotitlán'),
(1159, 20, 'Santiago Tamazola'),
(1160, 20, 'San Juan Cieneguilla'),
(1161, 20, 'Zapotitlán Lagunas'),
(1162, 20, 'San Juan Ihualtepec'),
(1163, 20, 'San Nicolás Hidalgo'),
(1164, 20, 'Guadalupe de Ramírez'),
(1165, 20, 'San Andrés Tepetlapa'),
(1166, 20, 'San Miguel Ahuehuetitlán'),
(1167, 20, 'San Mateo Nejápam'),
(1168, 20, 'San Juan Bautista Tlachichilco'),
(1169, 20, 'Tezoatlán de Segura y Luna'),
(1170, 20, 'Fresnillo de Trujano'),
(1171, 20, 'Santiago Ayuquililla'),
(1172, 20, 'San José Ayuquila'),
(1173, 20, 'San Martín Zacatepec'),
(1174, 20, 'San Miguel Amatitlán'),
(1175, 20, 'Mariscala de Juárez'),
(1176, 20, 'Santa Cruz Tacache de Mina'),
(1177, 20, 'San Simón Zahuatlán'),
(1178, 20, 'San Marcos Arteaga'),
(1179, 20, 'San Jorge Nuchita'),
(1180, 20, 'Santos Reyes Yucuná'),
(1181, 20, 'Santo Domingo Tonalá'),
(1182, 20, 'Santo Domingo Yodohino'),
(1183, 20, 'San Juan Bautista Coixtlahuaca'),
(1184, 20, 'Tepelmeme Villa de Morelos'),
(1185, 20, 'Concepción Buenavista'),
(1186, 20, 'Santiago Ihuitlán Plumas'),
(1187, 20, 'Tlacotepec Plumas'),
(1188, 20, 'San Francisco Teopan'),
(1189, 20, 'Santa Magdalena Jicotlán'),
(1190, 20, 'San Mateo Tlapiltepec'),
(1191, 20, 'San Miguel Tequixtepec'),
(1192, 20, 'San Miguel Tulancingo'),
(1193, 20, 'Santiago Tepetlapa'),
(1194, 20, 'San Cristóbal Suchixtlahuaca'),
(1195, 20, 'Santa María Nativitas'),
(1196, 20, 'Silacayoápam'),
(1197, 20, 'Santiago Yucuyachi'),
(1198, 20, 'San Lorenzo Victoria'),
(1199, 20, 'San Agustín Atenango'),
(1200, 20, 'Calihualá'),
(1201, 20, 'Santa Cruz de Bravo'),
(1202, 20, 'Ixpantepec Nieves'),
(1203, 20, 'San Francisco Tlapancingo'),
(1204, 20, 'Santiago del Río'),
(1205, 20, 'San Pedro y San Pablo Teposcolula'),
(1206, 20, 'La Trinidad Vista Hermosa'),
(1207, 20, 'Villa de Tamazulápam del Progreso'),
(1208, 20, 'San Pedro Nopala'),
(1209, 20, 'Teotongo'),
(1210, 20, 'San Antonio Acutla'),
(1211, 20, 'Villa Tejúpam de la Unión'),
(1212, 20, 'Santo Domingo Tonaltepec'),
(1213, 20, 'Villa de Chilapa de Díaz'),
(1214, 20, 'San Antonino Monte Verde'),
(1215, 20, 'San Andrés Lagunas'),
(1216, 20, 'San Pedro Yucunama'),
(1217, 20, 'San Juan Teposcolula'),
(1218, 20, 'San Bartolo Soyaltepec'),
(1219, 20, 'Santiago Yolomécatl'),
(1220, 20, 'San Sebastián Nicananduta'),
(1221, 20, 'Santo Domingo Tlatayápam'),
(1222, 20, 'Santa María Nduayaco'),
(1223, 20, 'San Vicente Nuñú'),
(1224, 20, 'San Pedro Topiltepec'),
(1225, 20, 'Santiago Nejapilla'),
(1226, 20, 'Asunción Nochixtlán'),
(1227, 20, 'San Miguel Huautla'),
(1228, 20, 'San Miguel Chicahua'),
(1229, 20, 'Santa María Apazco'),
(1230, 20, 'Santiago Apoala'),
(1231, 20, 'Santa María Chachoápam'),
(1232, 20, 'San Pedro Coxcaltepec Cántaros'),
(1233, 20, 'Santiago Huauclilla'),
(1234, 20, 'Santo Domingo Yanhuitlán'),
(1235, 20, 'San Andrés Sinaxtla'),
(1236, 20, 'San Juan Yucuita'),
(1237, 20, 'San Juan Sayultepec'),
(1238, 20, 'Santiago Tillo'),
(1239, 20, 'San Francisco Chindúa'),
(1240, 20, 'San Mateo Etlatongo'),
(1241, 20, 'Santa Inés de Zaragoza'),
(1242, 20, 'Santiago Juxtlahuaca'),
(1243, 20, 'San Miguel Tlacotepec'),
(1244, 20, 'San Sebastián Tecomaxtlahuaca'),
(1245, 20, 'Santos Reyes Tepejillo'),
(1246, 20, 'San Juan Mixtepec -Dto. 08 -'),
(1247, 20, 'San Martín Peras'),
(1248, 20, 'Coicoyán de las Flores'),
(1249, 20, 'Heroica Ciudad de Tlaxiaco'),
(1250, 20, 'San Juan Ñumí'),
(1251, 20, 'San Pedro Mártir Yucuxaco'),
(1252, 20, 'San Martín Huamelúlpam'),
(1253, 20, 'Santa Cruz Tayata'),
(1254, 20, 'Santiago Nundiche'),
(1255, 20, 'Santa María del Rosario'),
(1256, 20, 'San Juan Achiutla'),
(1257, 20, 'Santa Catarina Tayata'),
(1258, 20, 'San Cristóbal Amoltepec'),
(1259, 20, 'San Miguel Achiutla'),
(1260, 20, 'San Martín Itunyoso'),
(1261, 20, 'Magdalena Peñasco'),
(1262, 20, 'San Bartolomé Yucuañe'),
(1263, 20, 'Santa Cruz Nundaco'),
(1264, 20, 'San Agustín Tlacotepec'),
(1265, 20, 'Santo Tomás Ocotepec'),
(1266, 20, 'San Antonio Sinicahua'),
(1267, 20, 'San Mateo Peñasco'),
(1268, 20, 'Santa María Tataltepec'),
(1269, 20, 'San Pedro Molinos'),
(1270, 20, 'Santa María Yosoyúa'),
(1271, 20, 'San Juan Teita'),
(1272, 20, 'Magdalena Jaltepec'),
(1273, 20, 'Magdalena Yodocono de Porfirio Díaz'),
(1274, 20, 'San Miguel Tecomatlán'),
(1275, 20, 'Magdalena Zahuatlán'),
(1276, 20, 'San Francisco Nuxaño'),
(1277, 20, 'San Pedro Tidaá'),
(1278, 20, 'San Francisco Jaltepetongo'),
(1279, 20, 'Santiago Tilantongo'),
(1280, 20, 'San Juan Diuxi'),
(1281, 20, 'San Andrés Nuxiño'),
(1282, 20, 'San Juan Tamazola'),
(1283, 20, 'Santo Domingo Nuxaá'),
(1284, 20, 'Yutanduchi de Guerrero'),
(1285, 20, 'San Pedro Teozacoalco'),
(1286, 20, 'San Miguel Piedras'),
(1287, 20, 'San Mateo Sindihui'),
(1288, 20, 'Heroica Ciudad de Juchitán de Zaragoza'),
(1289, 20, 'Ciudad Ixtepec'),
(1290, 20, 'El Espinal'),
(1291, 20, 'Santo Domingo Ingenio'),
(1292, 20, 'Santa María Xadani'),
(1293, 20, 'Santiago Niltepec'),
(1294, 20, 'San Dionisio del Mar'),
(1295, 20, 'Asunción Ixtaltepec'),
(1296, 20, 'San Francisco del Mar'),
(1297, 20, 'Unión Hidalgo'),
(1298, 20, 'San Miguel Chimalapa'),
(1299, 20, 'Santo Domingo Zanatepec'),
(1300, 20, 'Reforma de Pineda'),
(1301, 20, 'San Francisco Ixhuatán'),
(1302, 20, 'San Pedro Tapanatepec'),
(1303, 20, 'Chahuites'),
(1304, 20, 'Santiago Zacatepec'),
(1305, 20, 'Santo Domingo Tepuxtepec'),
(1306, 20, 'San Juan Cotzocón'),
(1307, 20, 'San Juan Mazatlán'),
(1308, 20, 'Totontepec Villa de Morelos'),
(1309, 20, 'Mixistlán de la Reforma'),
(1310, 20, 'Santa María Tlahuitoltepec'),
(1311, 20, 'Santa María Alotepec'),
(1312, 20, 'Santiago Atitlán'),
(1313, 20, 'Tamazulápam del Espíritu Santo'),
(1314, 20, 'San Pedro y San Pablo Ayutla'),
(1315, 20, 'Santa María Tepantlali'),
(1316, 20, 'San Miguel Quetzaltepec'),
(1317, 20, 'Asunción Cacalotepec'),
(1318, 20, 'San Pedro Ocotepec'),
(1319, 20, 'San Lucas Camotlán'),
(1320, 20, 'Santiago Ixcuintepec'),
(1321, 20, 'Matías Romero Avendaño'),
(1322, 20, 'San Juan Guichicovi'),
(1323, 20, 'Santo Domingo Petapa'),
(1324, 20, 'Santa María Chimalapa'),
(1325, 20, 'Santa María Petapa'),
(1326, 20, 'El Barrio de la Soledad'),
(1327, 20, 'Tlacolula de Matamoros'),
(1328, 20, 'San Sebastián Abasolo'),
(1329, 20, 'Villa Díaz Ordaz'),
(1330, 20, 'Santa María Guelacé'),
(1331, 20, 'Teotitlán del Valle'),
(1332, 20, 'San Francisco Lachigoló'),
(1333, 20, 'San Sebastián Teitipac'),
(1334, 20, 'Santa Ana del Valle'),
(1335, 20, 'San Pablo Villa de Mitla'),
(1336, 20, 'Santiago Matatlán'),
(1337, 20, 'Santo Domingo Albarradas'),
(1338, 20, 'Rojas de Cuauhtémoc'),
(1339, 20, 'San Juan Teitipac'),
(1340, 20, 'Santa Cruz Papalutla'),
(1341, 20, 'Magdalena Teitipac'),
(1342, 20, 'San Jerónimo Tlacochahuaya'),
(1343, 20, 'San Juan Guelavía'),
(1344, 20, 'San Lucas Quiaviní'),
(1345, 20, 'San Juan del Río'),
(1346, 20, 'San Bartolomé Quialana'),
(1347, 20, 'San Lorenzo Albarradas'),
(1348, 20, 'San Pedro Totolápam'),
(1349, 20, 'San Pedro Quiatoni'),
(1350, 20, 'Santa María Zoquitlán'),
(1351, 20, 'San Dionisio Ocotepec'),
(1352, 20, 'San Carlos Yautepec'),
(1353, 20, 'San Juan Juquila Mixes'),
(1354, 20, 'Nejapa de Madero'),
(1355, 20, 'Santa Ana Tavela'),
(1356, 20, 'San Juan Lajarcia'),
(1357, 20, 'San Bartolo Yautepec'),
(1358, 20, 'Santa María Ecatepec'),
(1359, 20, 'Asunción Tlacolulita'),
(1360, 20, 'San Pedro Mártir Quiechapa'),
(1361, 20, 'Santa María Quiegolani'),
(1362, 20, 'Santa Catarina Quioquitani'),
(1363, 20, 'Santa Catalina Quierí'),
(1364, 20, 'Salina Cruz'),
(1365, 20, 'Santiago Lachiguiri'),
(1366, 20, 'Santa María Jalapa del Marqués'),
(1367, 20, 'Santa María Totolapilla'),
(1368, 20, 'Santiago Laollaga'),
(1369, 20, 'Guevea de Humboldt'),
(1370, 20, 'Santo Domingo Chihuitán'),
(1371, 20, 'Santa María Guienagati'),
(1372, 20, 'Magdalena Tequisistlán'),
(1373, 20, 'Magdalena Tlacotepec'),
(1374, 20, 'San Pedro Comitancillo'),
(1375, 20, 'Santa María Mixtequilla'),
(1376, 20, 'Santo Domingo Tehuantepec'),
(1377, 20, 'San Pedro Huamelula'),
(1378, 20, 'San Pedro Huilotepec'),
(1379, 20, 'San Mateo del Mar'),
(1380, 20, 'San Blas Atempa'),
(1381, 20, 'Santiago Astata'),
(1382, 20, 'San Miguel Tenango'),
(1383, 20, 'Miahuatlán de Porfirio Díaz'),
(1384, 20, 'San Nicolás'),
(1385, 20, 'San Simón Almolongas'),
(1386, 20, 'San Luis Amatlán'),
(1387, 20, 'San José Lachiguiri'),
(1388, 20, 'Sitio de Xitlapehua'),
(1389, 20, 'San Francisco Logueche'),
(1390, 20, 'Santa Ana'),
(1391, 20, 'Santa Cruz Xitla'),
(1392, 20, 'Monjas'),
(1393, 20, 'San Ildefonso Amatlán'),
(1394, 20, 'Santa Catarina Cuixtla'),
(1395, 20, 'San José del Peñasco'),
(1396, 20, 'San Cristóbal Amatlán'),
(1397, 20, 'San Juan Mixtepec -Dto. 26 -'),
(1398, 20, 'San Pedro Mixtepec -Dto. 26 -'),
(1399, 20, 'Santa Lucía Miahuatlán'),
(1400, 20, 'San Jerónimo Coatlán'),
(1401, 20, 'San Sebastián Coatlán'),
(1402, 20, 'San Pablo Coatlán'),
(1403, 20, 'San Mateo Río Hondo'),
(1404, 20, 'Santo Tomás Tamazulapan'),
(1405, 20, 'San Andrés Paxtlán'),
(1406, 20, 'Santa María Ozolotepec'),
(1407, 20, 'San Miguel Coatlán'),
(1408, 20, 'San Sebastián Río Hondo'),
(1409, 20, 'San Miguel Suchixtepec'),
(1410, 20, 'Santo Domingo Ozolotepec'),
(1411, 20, 'San Francisco Ozolotepec'),
(1412, 20, 'Santiago Xanica'),
(1413, 20, 'San Marcial Ozolotepec'),
(1414, 20, 'San Juan Ozolotepec'),
(1415, 20, 'San Pedro Pochutla'),
(1416, 20, 'Santo Domingo de Morelos'),
(1417, 20, 'Santa Catarina Loxicha'),
(1418, 20, 'San Agustín Loxicha'),
(1419, 20, 'San Baltazar Loxicha'),
(1420, 20, 'Santa María Colotepec'),
(1421, 20, 'San Bartolomé Loxicha'),
(1422, 20, 'Santa María Tonameca'),
(1423, 20, 'Candelaria Loxicha'),
(1424, 20, 'Pluma Hidalgo'),
(1425, 20, 'San Pedro el Alto'),
(1426, 20, 'San Mateo Piñas'),
(1427, 20, 'Santa María Huatulco'),
(1428, 20, 'San Miguel del Puerto'),
(1429, 20, 'Putla Villa de Guerrero'),
(1430, 20, 'Constancia del Rosario'),
(1431, 20, 'Mesones Hidalgo'),
(1432, 20, 'Santa María Zacatepec'),
(1433, 20, 'San Pedro Amuzgos'),
(1434, 20, 'La Reforma'),
(1435, 20, 'Santa María Ipalapa'),
(1436, 20, 'Chalcatongo de Hidalgo'),
(1437, 20, 'Santa María Yucuhiti'),
(1438, 20, 'San Esteban Atatlahuca'),
(1439, 20, 'Santa Catarina Ticuá'),
(1440, 20, 'Santiago Nuyoó'),
(1441, 20, 'Santa Catarina Yosonotú'),
(1442, 20, 'San Miguel el Grande'),
(1443, 20, 'Santo Domingo Ixcatlán'),
(1444, 20, 'San Pablo Tijaltepec'),
(1445, 20, 'Santa Cruz Tacahua'),
(1446, 20, 'Santa Lucía Monteverde'),
(1447, 20, 'San Andrés Cabecera Nueva'),
(1448, 20, 'Santa María Yolotepec'),
(1449, 20, 'Santiago Yosondúa'),
(1450, 20, 'Santa Cruz Itundujia'),
(1451, 20, 'Zimatlán de Álvarez'),
(1452, 20, 'San Bernardo Mixtepec'),
(1453, 20, 'Santa Cruz Mixtepec'),
(1454, 20, 'San Miguel Mixtepec'),
(1455, 20, 'Santa María Atzompa'),
(1456, 20, 'San Andrés Ixtlahuaca'),
(1457, 20, 'Santa Cruz Amilpas'),
(1458, 20, 'Santa Cruz Xoxocotlán'),
(1459, 20, 'Santa Lucía del Camino'),
(1460, 20, 'San Pedro Ixtlahuaca'),
(1461, 20, 'San Antonio de la Cal'),
(1462, 20, 'San Agustín de las Juntas'),
(1463, 20, 'San Pablo Huixtepec'),
(1464, 20, 'Ánimas Trujano'),
(1465, 20, 'San Jacinto Tlacotepec'),
(1466, 20, 'San Raymundo Jalpan'),
(1467, 20, 'Trinidad Zaachila'),
(1468, 20, 'Santa María Coyotepec'),
(1469, 20, 'San Bartolo Coyotepec'),
(1470, 20, 'Santa Inés Yatzeche'),
(1471, 20, 'Ciénega de Zimatlán'),
(1472, 20, 'San Antonio Huitepec'),
(1473, 20, 'Villa de Zaachila'),
(1474, 20, 'San Sebastián Tutla'),
(1475, 20, 'San Miguel Peras'),
(1476, 20, 'San Pablo Cuatro Venados'),
(1477, 20, 'Santa Inés del Monte'),
(1478, 20, 'Santa Gertrudis'),
(1479, 20, 'San Antonino el Alto'),
(1480, 20, 'Magdalena Mixtepec'),
(1481, 20, 'Santa Catarina Quiané'),
(1482, 20, 'Ayoquezco de Aldama'),
(1483, 20, 'Santa Ana Tlapacoyan'),
(1484, 20, 'Santa Cruz Zenzontepec'),
(1485, 20, 'San Francisco Cahuacuá'),
(1486, 20, 'San Mateo Yucutindoo'),
(1487, 20, 'Santiago Textitlán'),
(1488, 20, 'Santiago Amoltepec'),
(1489, 20, 'Santa María Zaniza'),
(1490, 20, 'Santo Domingo Teojomulco'),
(1491, 20, 'Cuilápam de Guerrero'),
(1492, 20, 'Villa Sola de Vega'),
(1493, 20, 'Santa María Lachixío'),
(1494, 20, 'San Vicente Lachixío'),
(1495, 20, 'San Lorenzo Texmelúcan'),
(1496, 20, 'Santa María Sola'),
(1497, 20, 'San Francisco Sola'),
(1498, 20, 'San Ildefonso Sola'),
(1499, 20, 'Santiago Minas'),
(1500, 20, 'Heroica Ciudad de Ejutla de Crespo'),
(1501, 20, 'San Martín Tilcajete'),
(1502, 20, 'Santo Tomás Jalieza'),
(1503, 20, 'San Juan Chilateca'),
(1504, 20, 'Ocotlán de Morelos'),
(1505, 20, 'Santa Ana Zegache'),
(1506, 20, 'Santiago Apóstol'),
(1507, 20, 'San Antonino Castillo Velasco'),
(1508, 20, 'Asunción Ocotlán'),
(1509, 20, 'San Pedro Mártir'),
(1510, 20, 'San Dionisio Ocotlán'),
(1511, 20, 'Magdalena Ocotlán'),
(1512, 20, 'San Miguel Tilquiápam'),
(1513, 20, 'Santa Catarina Minas'),
(1514, 20, 'San Baltazar Chichicápam'),
(1515, 20, 'San Pedro Apóstol'),
(1516, 20, 'Santa Lucía Ocotlán'),
(1517, 20, 'San Jerónimo Taviche'),
(1518, 20, 'San Andrés Zabache'),
(1519, 20, 'San José del Progreso'),
(1520, 20, 'Yaxe'),
(1521, 20, 'San Pedro Taviche'),
(1522, 20, 'San Martín de los Cansecos'),
(1523, 20, 'San Martín Lachilá'),
(1524, 20, 'La Pe'),
(1525, 20, 'La Compañía'),
(1526, 20, 'Coatecas Altas'),
(1527, 20, 'San Juan Lachigalla'),
(1528, 20, 'San Agustín Amatengo'),
(1529, 20, 'Taniche'),
(1530, 20, 'San Miguel Ejutla'),
(1531, 20, 'Yogana'),
(1532, 20, 'San Vicente Coatlán'),
(1533, 20, 'Santiago Pinotepa Nacional'),
(1534, 20, 'San Juan Cacahuatepec'),
(1535, 20, 'San Juan Bautista Lo de Soto'),
(1536, 20, 'Mártires de Tacubaya'),
(1537, 20, 'San Sebastián Ixcapa'),
(1538, 20, 'San Antonio Tepetlapa'),
(1539, 20, 'Santa María Cortijo'),
(1540, 20, 'Santiago Llano Grande'),
(1541, 20, 'San Miguel Tlacamama'),
(1542, 20, 'Santiago Tapextla'),
(1543, 20, 'San José Estancia Grande'),
(1544, 20, 'Santo Domingo Armenta'),
(1545, 20, 'Santiago Jamiltepec'),
(1546, 20, 'San Pedro Atoyac'),
(1547, 20, 'San Juan Colorado'),
(1548, 20, 'Santiago Ixtayutla'),
(1549, 20, 'San Pedro Jicayán'),
(1550, 20, 'Pinotepa de Don Luis'),
(1551, 20, 'San Lorenzo'),
(1552, 20, 'San Agustín Chayuco'),
(1553, 20, 'San Andrés Huaxpaltepec'),
(1554, 20, 'Santa Catarina Mechoacán'),
(1555, 20, 'Santiago Tetepec'),
(1556, 20, 'Santa María Huazolotitlán'),
(1557, 20, 'Villa de Tututepec de Melchor Ocampo'),
(1558, 20, 'Tataltepec de Valdés'),
(1559, 20, 'San Juan Quiahije'),
(1560, 20, 'San Miguel Panixtlahuaca'),
(1561, 20, 'Santa Catarina Juquila'),
(1562, 20, 'San Pedro Juchatengo'),
(1563, 20, 'Santiago Yaitepec'),
(1564, 20, 'San Juan Lachao'),
(1565, 20, 'Santa María Temaxcaltepec'),
(1566, 20, 'Santos Reyes Nopala'),
(1567, 20, 'San Gabriel Mixtepec'),
(1568, 20, 'San Pedro Mixtepec -Dto. 22 -'),
(1569, 21, 'Puebla'),
(1570, 21, 'Tlaltenango'),
(1571, 21, 'San Miguel Xoxtla'),
(1572, 21, 'Juan C. Bonilla'),
(1573, 21, 'Coronango'),
(1574, 21, 'Cuautlancingo'),
(1575, 21, 'San Pedro Cholula'),
(1576, 21, 'San Andrés Cholula'),
(1577, 21, 'Ocoyucan'),
(1578, 21, 'Amozoc'),
(1579, 21, 'Francisco Z. Mena'),
(1580, 21, 'Pantepec'),
(1581, 21, 'Venustiano Carranza'),
(1582, 21, 'Jalpan'),
(1583, 21, 'Tlaxco'),
(1584, 21, 'Tlacuilotepec'),
(1585, 21, 'Xicotepec'),
(1586, 21, 'Pahuatlán'),
(1587, 21, 'Honey'),
(1588, 21, 'Naupan'),
(1589, 21, 'Huauchinango'),
(1590, 21, 'Ahuazotepec'),
(1591, 21, 'Juan Galindo'),
(1592, 21, 'Tlaola'),
(1593, 21, 'Zihuateutla'),
(1594, 21, 'Jopala'),
(1595, 21, 'Tlapacoya'),
(1596, 21, 'Chignahuapan'),
(1597, 21, 'Zacatlán'),
(1598, 21, 'Chiconcuautla'),
(1599, 21, 'Ahuacatlán'),
(1600, 21, 'Tepetzintla'),
(1601, 21, 'San Felipe Tepatlán'),
(1602, 21, 'Amixtlán'),
(1603, 21, 'Tepango de Rodríguez'),
(1604, 21, 'Zongozotla'),
(1605, 21, 'Hermenegildo Galeana'),
(1606, 21, 'Olintla'),
(1607, 21, 'Coatepec'),
(1608, 21, 'Camocuautla'),
(1609, 21, 'Hueytlalpan'),
(1610, 21, 'Zapotitlán de Méndez'),
(1611, 21, 'Huitzilan de Serdán'),
(1612, 21, 'Xochitlán de Vicente Suárez'),
(1613, 21, 'Huehuetla'),
(1614, 21, 'Ixtepec'),
(1615, 21, 'Atlequizayan'),
(1616, 21, 'Tenampulco'),
(1617, 21, 'Tuzamapan de Galeana'),
(1618, 21, 'Caxhuacan'),
(1619, 21, 'Jonotla'),
(1620, 21, 'Zoquiapan'),
(1621, 21, 'Nauzontla'),
(1622, 21, 'Cuetzalan del Progreso'),
(1623, 21, 'Ayotoxco de Guerrero'),
(1624, 21, 'Hueytamalco'),
(1625, 21, 'Acateno'),
(1626, 21, 'Cuautempan'),
(1627, 21, 'Aquixtla'),
(1628, 21, 'Tetela de Ocampo'),
(1629, 21, 'Xochiapulco'),
(1630, 21, 'Zacapoaxtla'),
(1631, 21, 'Zaragoza'),
(1632, 21, 'Ixtacamaxtitlán'),
(1633, 21, 'Zautla'),
(1634, 21, 'Ocotepec'),
(1635, 21, 'Libres'),
(1636, 21, 'Teziutlán'),
(1637, 21, 'Tlatlauquitepec'),
(1638, 21, 'Yaonáhuac'),
(1639, 21, 'Hueyapan'),
(1640, 21, 'Teteles de Avila Castillo'),
(1641, 21, 'Atempan'),
(1642, 21, 'Chignautla'),
(1643, 21, 'Xiutetelco'),
(1644, 21, 'Cuyoaco'),
(1645, 21, 'Tepeyahualco'),
(1646, 21, 'San Martín Texmelucan'),
(1647, 21, 'Tlahuapan'),
(1648, 21, 'San Matías Tlalancaleca'),
(1649, 21, 'San Salvador el Verde'),
(1650, 21, 'San Felipe Teotlalcingo'),
(1651, 21, 'Chiautzingo'),
(1652, 21, 'Huejotzingo'),
(1653, 21, 'Domingo Arenas'),
(1654, 21, 'Calpan'),
(1655, 21, 'San Nicolás de los Ranchos'),
(1656, 21, 'Atlixco'),
(1657, 21, 'Nealtican'),
(1658, 21, 'San Jerónimo Tecuanipan'),
(1659, 21, 'San Gregorio Atzompa'),
(1660, 21, 'Tochimilco'),
(1661, 21, 'Tianguismanalco'),
(1662, 21, 'Santa Isabel Cholula'),
(1663, 21, 'Huaquechula'),
(1664, 21, 'San Diego la Mesa Tochimiltzingo'),
(1665, 21, 'Tepeojuma'),
(1666, 21, 'Izúcar de Matamoros'),
(1667, 21, 'Atzitzihuacán'),
(1668, 21, 'Acteopan'),
(1669, 21, 'Cohuecan'),
(1670, 21, 'Tepemaxalco'),
(1671, 21, 'Tlapanalá'),
(1672, 21, 'Tepexco'),
(1673, 21, 'Tilapa'),
(1674, 21, 'Chietla'),
(1675, 21, 'Atzala'),
(1676, 21, 'Teopantlán'),
(1677, 21, 'San Martín Totoltepec'),
(1678, 21, 'Xochiltepec'),
(1679, 21, 'Epatlán'),
(1680, 21, 'Ahuatlán'),
(1681, 21, 'Coatzingo'),
(1682, 21, 'Santa Catarina Tlaltempan'),
(1683, 21, 'Chigmecatitlán'),
(1684, 21, 'Zacapala'),
(1685, 21, 'Tepexi de Rodríguez'),
(1686, 21, 'Teotlalco'),
(1687, 21, 'Jolalpan'),
(1688, 21, 'Huehuetlán el Chico'),
(1689, 21, 'Chiautla'),
(1690, 21, 'Cohetzala'),
(1691, 21, 'Xicotlán'),
(1692, 21, 'Chila de la Sal'),
(1693, 21, 'Ixcamilpa de Guerrero'),
(1694, 21, 'Albino Zertuche'),
(1695, 21, 'Tulcingo'),
(1696, 21, 'Tehuitzingo'),
(1697, 21, 'Cuayuca de Andrade'),
(1698, 21, 'Santa Inés Ahuatempan'),
(1699, 21, 'Axutla'),
(1700, 21, 'Chinantla'),
(1701, 21, 'Ahuehuetitla'),
(1702, 21, 'San Pablo Anicano'),
(1703, 21, 'Tecomatlán'),
(1704, 21, 'Piaxtla'),
(1705, 21, 'Guadalupe'),
(1706, 21, 'Ixcaquixtla'),
(1707, 21, 'Coyotepec'),
(1708, 21, 'Xayacatlán de Bravo'),
(1709, 21, 'Totoltepec de Guerrero'),
(1710, 21, 'Acatlán'),
(1711, 21, 'San Jerónimo Xayacatlán'),
(1712, 21, 'San Pedro Yeloixtlahuaca'),
(1713, 21, 'Petlalcingo'),
(1714, 21, 'San Miguel Ixitlán'),
(1715, 21, 'Chila'),
(1716, 21, 'Rafael Lara Grajales'),
(1717, 21, 'San José Chiapa'),
(1718, 21, 'Oriental'),
(1719, 21, 'San Nicolás Buenos Aires'),
(1720, 21, 'Guadalupe Victoria'),
(1721, 21, 'Tlachichuca'),
(1722, 21, 'Lafragua'),
(1723, 21, 'Chilchotla'),
(1724, 21, 'Quimixtlán'),
(1725, 21, 'Chichiquila'),
(1726, 21, 'Tepatlaxco de Hidalgo'),
(1727, 21, 'Acajete'),
(1728, 21, 'Nopalucan'),
(1729, 21, 'Mazapiltepec de Juárez'),
(1730, 21, 'Soltepec'),
(1731, 21, 'Acatzingo'),
(1732, 21, 'San Salvador el Seco'),
(1733, 21, 'General Felipe Ángeles'),
(1734, 21, 'Aljojuca'),
(1735, 21, 'San Juan Atenco'),
(1736, 21, 'Tepeaca'),
(1737, 21, 'Cuautinchán'),
(1738, 21, 'Tecali de Herrera'),
(1739, 21, 'Mixtla'),
(1740, 21, 'Santo Tomás Hueyotlipan'),
(1741, 21, 'Tzicatlacoyan'),
(1742, 21, 'Huehuetlán el Grande'),
(1743, 21, 'La Magdalena Tlatlauquitepec'),
(1744, 21, 'San Juan Atzompa'),
(1745, 21, 'Huatlatlauca'),
(1746, 21, 'Los Reyes de Juárez'),
(1747, 21, 'Cuapiaxtla de Madero'),
(1748, 21, 'San Salvador Huixcolotla'),
(1749, 21, 'Quecholac'),
(1750, 21, 'Tecamachalco'),
(1751, 21, 'Palmar de Bravo'),
(1752, 21, 'Chalchicomula de Sesma'),
(1753, 21, 'Atzitzintla'),
(1754, 21, 'Esperanza'),
(1755, 21, 'Cañada Morelos'),
(1756, 21, 'Tlanepantla'),
(1757, 21, 'Tochtepec'),
(1758, 21, 'Atoyatempan'),
(1759, 21, 'Tepeyahualco de Cuauhtémoc'),
(1760, 21, 'Huitziltepec'),
(1761, 21, 'Molcaxac'),
(1762, 21, 'Xochitlán Todos Santos'),
(1763, 21, 'Yehualtepec'),
(1764, 21, 'Tlacotepec de Benito Juárez'),
(1765, 21, 'Juan N. Méndez'),
(1766, 21, 'Tehuacán'),
(1767, 21, 'Tepanco de López'),
(1768, 21, 'Chapulco'),
(1769, 21, 'Santiago Miahuatlán'),
(1770, 21, 'Nicolás Bravo'),
(1771, 21, 'Atexcal'),
(1772, 21, 'San Antonio Cañada'),
(1773, 21, 'Zapotitlán'),
(1774, 21, 'San Gabriel Chilac'),
(1775, 21, 'Caltepec'),
(1776, 21, 'Vicente Guerrero'),
(1777, 21, 'Ajalpan'),
(1778, 21, 'Eloxochitlán'),
(1779, 21, 'Zoquitlán'),
(1780, 21, 'San Sebastián Tlacotepec'),
(1781, 21, 'Altepexi'),
(1782, 21, 'Zinacatepec'),
(1783, 21, 'San José Miahuatlán'),
(1784, 21, 'Coxcatlán'),
(1785, 21, 'Coyomeapan'),
(1786, 22, 'Querétaro'),
(1787, 22, 'El Marqués'),
(1788, 22, 'Colón'),
(1789, 22, 'Pinal de Amoles'),
(1790, 22, 'Jalpan de Serra'),
(1791, 22, 'Landa de Matamoros'),
(1792, 22, 'Arroyo Seco'),
(1793, 22, 'Peñamiller'),
(1794, 22, 'Cadereyta de Montes'),
(1795, 22, 'San Joaquín'),
(1796, 22, 'Tolimán'),
(1797, 22, 'Ezequiel Montes'),
(1798, 22, 'Pedro Escobedo'),
(1799, 22, 'Tequisquiapan'),
(1800, 22, 'San Juan del Río'),
(1801, 22, 'Amealco de Bonfil'),
(1802, 22, 'Corregidora'),
(1803, 22, 'Huimilpan'),
(1804, 23, 'Othón P. Blanco'),
(1805, 23, 'Felipe Carrillo Puerto'),
(1806, 23, 'Lázaro Cárdenas'),
(1807, 23, 'Isla Mujeres'),
(1808, 23, 'Benito Juárez'),
(1809, 23, 'Cozumel');
INSERT INTO `municipios` (`id`, `estado_id`, `municipio`) VALUES
(1810, 23, 'Solidaridad'),
(1811, 23, 'Tulum'),
(1812, 23, 'José María Morelos'),
(1813, 23, 'Bacalar'),
(1814, 24, 'San Luis Potosí'),
(1815, 24, 'Soledad de Graciano Sánchez'),
(1816, 24, 'Cerro de San Pedro'),
(1817, 24, 'Ahualulco'),
(1818, 24, 'Mexquitic de Carmona'),
(1819, 24, 'Villa de Arriaga'),
(1820, 24, 'Vanegas'),
(1821, 24, 'Cedral'),
(1822, 24, 'Catorce'),
(1823, 24, 'Charcas'),
(1824, 24, 'Salinas'),
(1825, 24, 'Santo Domingo'),
(1826, 24, 'Villa de Ramos'),
(1827, 24, 'Matehuala'),
(1828, 24, 'Villa de la Paz'),
(1829, 24, 'Villa de Guadalupe'),
(1830, 24, 'Guadalcázar'),
(1831, 24, 'Moctezuma'),
(1832, 24, 'Venado'),
(1833, 24, 'Villa de Arista'),
(1834, 24, 'Villa Hidalgo'),
(1835, 24, 'Armadillo de los Infante'),
(1836, 24, 'Ciudad Valles'),
(1837, 24, 'Ebano'),
(1838, 24, 'Tamuín'),
(1839, 24, 'El Naranjo'),
(1840, 24, 'Ciudad del Maíz'),
(1841, 24, 'Alaquines'),
(1842, 24, 'Cárdenas'),
(1843, 24, 'Cerritos'),
(1844, 24, 'Villa Juárez'),
(1845, 24, 'San Nicolás Tolentino'),
(1846, 24, 'Villa de Reyes'),
(1847, 24, 'Zaragoza'),
(1848, 24, 'Santa María del Río'),
(1849, 24, 'Tierra Nueva'),
(1850, 24, 'Rioverde'),
(1851, 24, 'Ciudad Fernández'),
(1852, 24, 'San Ciro de Acosta'),
(1853, 24, 'Tamasopo'),
(1854, 24, 'Rayón'),
(1855, 24, 'Aquismón'),
(1856, 24, 'Lagunillas'),
(1857, 24, 'Santa Catarina'),
(1858, 24, 'Tancanhuitz'),
(1859, 24, 'Tanlajás'),
(1860, 24, 'San Vicente Tancuayalab'),
(1861, 24, 'San Antonio'),
(1862, 24, 'Tanquián de Escobedo'),
(1863, 24, 'Tampamolón Corona'),
(1864, 24, 'Coxcatlán'),
(1865, 24, 'Huehuetlán'),
(1866, 24, 'Xilitla'),
(1867, 24, 'Axtla de Terrazas'),
(1868, 24, 'Tampacán'),
(1869, 24, 'San Martín Chalchicuautla'),
(1870, 24, 'Tamazunchale'),
(1871, 24, 'Matlapa'),
(1872, 25, 'Culiacán'),
(1873, 25, 'Navolato'),
(1874, 25, 'Badiraguato'),
(1875, 25, 'Cosalá'),
(1876, 25, 'Mocorito'),
(1877, 25, 'Guasave'),
(1878, 25, 'Ahome'),
(1879, 25, 'Salvador Alvarado'),
(1880, 25, 'Angostura'),
(1881, 25, 'Choix'),
(1882, 25, 'El Fuerte'),
(1883, 25, 'Sinaloa'),
(1884, 25, 'Mazatlán'),
(1885, 25, 'Escuinapa'),
(1886, 25, 'Concordia'),
(1887, 25, 'Elota'),
(1888, 25, 'Rosario'),
(1889, 25, 'San Ignacio'),
(1890, 26, 'Hermosillo'),
(1891, 26, 'San Miguel de Horcasitas'),
(1892, 26, 'Carbó'),
(1893, 26, 'San Luis Río Colorado'),
(1894, 26, 'Puerto Peñasco'),
(1895, 26, 'General Plutarco Elías Calles'),
(1896, 26, 'Caborca'),
(1897, 26, 'Altar'),
(1898, 26, 'Tubutama'),
(1899, 26, 'Atil'),
(1900, 26, 'Oquitoa'),
(1901, 26, 'Sáric'),
(1902, 26, 'Benjamín Hill'),
(1903, 26, 'Trincheras'),
(1904, 26, 'Pitiquito'),
(1905, 26, 'Nogales'),
(1906, 26, 'Imuris'),
(1907, 26, 'Santa Cruz'),
(1908, 26, 'Magdalena'),
(1909, 26, 'Naco'),
(1910, 26, 'Agua Prieta'),
(1911, 26, 'Fronteras'),
(1912, 26, 'Nacozari de García'),
(1913, 26, 'Bavispe'),
(1914, 26, 'Bacerac'),
(1915, 26, 'Huachinera'),
(1916, 26, 'Nácori Chico'),
(1917, 26, 'Granados'),
(1918, 26, 'Bacadéhuachi'),
(1919, 26, 'Cumpas'),
(1920, 26, 'Huásabas'),
(1921, 26, 'Moctezuma'),
(1922, 26, 'Villa Hidalgo'),
(1923, 26, 'Santa Ana'),
(1924, 26, 'Cananea'),
(1925, 26, 'Arizpe'),
(1926, 26, 'Cucurpe'),
(1927, 26, 'Bacoachi'),
(1928, 26, 'San Pedro de la Cueva'),
(1929, 26, 'Divisaderos'),
(1930, 26, 'Tepache'),
(1931, 26, 'Villa Pesqueira'),
(1932, 26, 'Opodepe'),
(1933, 26, 'Huépac'),
(1934, 26, 'Banámichi'),
(1935, 26, 'Ures'),
(1936, 26, 'Aconchi'),
(1937, 26, 'Baviácora'),
(1938, 26, 'San Felipe de Jesús'),
(1939, 26, 'Rayón'),
(1940, 26, 'Cajeme'),
(1941, 26, 'Navojoa'),
(1942, 26, 'Huatabampo'),
(1943, 26, 'Bácum'),
(1944, 26, 'Etchojoa'),
(1945, 26, 'Benito Juárez'),
(1946, 26, 'Empalme'),
(1947, 26, 'Guaymas'),
(1948, 26, 'San Ignacio Río Muerto'),
(1949, 26, 'La Colorada'),
(1950, 26, 'Mazatán'),
(1951, 26, 'Suaqui Grande'),
(1952, 26, 'Sahuaripa'),
(1953, 26, 'San Javier'),
(1954, 26, 'Soyopa'),
(1955, 26, 'Bacanora'),
(1956, 26, 'Arivechi'),
(1957, 26, 'Rosario'),
(1958, 26, 'Quiriego'),
(1959, 26, 'Onavas'),
(1960, 26, 'Alamos'),
(1961, 26, 'Yécora'),
(1962, 27, 'Centro'),
(1963, 27, 'Jalpa de Méndez'),
(1964, 27, 'Nacajuca'),
(1965, 27, 'Comalcalco'),
(1966, 27, 'Huimanguillo'),
(1967, 27, 'Cárdenas'),
(1968, 27, 'Paraíso'),
(1969, 27, 'Cunduacán'),
(1970, 27, 'Macuspana'),
(1971, 27, 'Centla'),
(1972, 27, 'Jonuta'),
(1973, 27, 'Teapa'),
(1974, 27, 'Jalapa'),
(1975, 27, 'Tacotalpa'),
(1976, 27, 'Tenosique'),
(1977, 27, 'Balancán'),
(1978, 27, 'Emiliano Zapata'),
(1979, 28, 'Victoria'),
(1980, 28, 'Llera'),
(1981, 28, 'Güémez'),
(1982, 28, 'Casas'),
(1983, 28, 'Matamoros'),
(1984, 28, 'Valle Hermoso'),
(1985, 28, 'San Fernando'),
(1986, 28, 'Cruillas'),
(1987, 28, 'San Nicolás'),
(1988, 28, 'Soto la Marina'),
(1989, 28, 'Jiménez'),
(1990, 28, 'San Carlos'),
(1991, 28, 'Abasolo'),
(1992, 28, 'Padilla'),
(1993, 28, 'Hidalgo'),
(1994, 28, 'Mainero'),
(1995, 28, 'Villagrán'),
(1996, 28, 'Tula'),
(1997, 28, 'Jaumave'),
(1998, 28, 'Miquihuana'),
(1999, 28, 'Bustamante'),
(2000, 28, 'Palmillas'),
(2001, 28, 'Ocampo'),
(2002, 28, 'Nuevo Laredo'),
(2003, 28, 'Miguel Alemán'),
(2004, 28, 'Guerrero'),
(2005, 28, 'Mier'),
(2006, 28, 'Gustavo Díaz Ordaz'),
(2007, 28, 'Camargo'),
(2008, 28, 'Reynosa'),
(2009, 28, 'Río Bravo'),
(2010, 28, 'Méndez'),
(2011, 28, 'Burgos'),
(2012, 28, 'Tampico'),
(2013, 28, 'Ciudad Madero'),
(2014, 28, 'Altamira'),
(2015, 28, 'Aldama'),
(2016, 28, 'González'),
(2017, 28, 'Xicoténcatl'),
(2018, 28, 'Gómez Farías'),
(2019, 28, 'El Mante'),
(2020, 28, 'Antiguo Morelos'),
(2021, 28, 'Nuevo Morelos'),
(2022, 29, 'Tlaxcala'),
(2023, 29, 'Ixtacuixtla de Mariano Matamoros'),
(2024, 29, 'Santa Ana Nopalucan'),
(2025, 29, 'Panotla'),
(2026, 29, 'Totolac'),
(2027, 29, 'Tepeyanco'),
(2028, 29, 'Santa Isabel Xiloxoxtla'),
(2029, 29, 'San Juan Huactzinco'),
(2030, 29, 'Calpulalpan'),
(2031, 29, 'Sanctórum de Lázaro Cárdenas'),
(2032, 29, 'Benito Juárez'),
(2033, 29, 'Hueyotlipan'),
(2034, 29, 'Tlaxco'),
(2035, 29, 'Nanacamilpa de Mariano Arista'),
(2036, 29, 'Españita'),
(2037, 29, 'Apizaco'),
(2038, 29, 'Atlangatepec'),
(2039, 29, 'Muñoz de Domingo Arenas'),
(2040, 29, 'Tetla de la Solidaridad'),
(2041, 29, 'Xaltocan'),
(2042, 29, 'San Lucas Tecopilco'),
(2043, 29, 'Yauhquemehcan'),
(2044, 29, 'Xaloztoc'),
(2045, 29, 'Tocatlán'),
(2046, 29, 'Tzompantepec'),
(2047, 29, 'San José Teacalco'),
(2048, 29, 'Huamantla'),
(2049, 29, 'Terrenate'),
(2050, 29, 'Lázaro Cárdenas'),
(2051, 29, 'Emiliano Zapata'),
(2052, 29, 'Atltzayanca'),
(2053, 29, 'Cuapiaxtla'),
(2054, 29, 'El Carmen Tequexquitla'),
(2055, 29, 'Ixtenco'),
(2056, 29, 'Ziltlaltépec de Trinidad Sánchez Santos'),
(2057, 29, 'Apetatitlán de Antonio Carvajal'),
(2058, 29, 'Amaxac de Guerrero'),
(2059, 29, 'Santa Cruz Tlaxcala'),
(2060, 29, 'Cuaxomulco'),
(2061, 29, 'Contla de Juan Cuamatzi'),
(2062, 29, 'Tepetitla de Lardizábal'),
(2063, 29, 'Natívitas'),
(2064, 29, 'Santa Apolonia Teacalco'),
(2065, 29, 'Tetlatlahuca'),
(2066, 29, 'San Damián Texóloc'),
(2067, 29, 'San Jerónimo Zacualpan'),
(2068, 29, 'Zacatelco'),
(2069, 29, 'San Lorenzo Axocomanitla'),
(2070, 29, 'Santa Catarina Ayometla'),
(2071, 29, 'Xicohtzinco'),
(2072, 29, 'Papalotla de Xicohténcatl'),
(2073, 29, 'Chiautempan'),
(2074, 29, 'La Magdalena Tlaltelulco'),
(2075, 29, 'San Francisco Tetlanohcan'),
(2076, 29, 'Teolocholco'),
(2077, 29, 'Acuamanala de Miguel Hidalgo'),
(2078, 29, 'Santa Cruz Quilehtla'),
(2079, 29, 'Mazatecochco de José María Morelos'),
(2080, 29, 'Tenancingo'),
(2081, 29, 'San Pablo del Monte'),
(2082, 30, 'Xalapa'),
(2083, 30, 'Tlalnelhuayocan'),
(2084, 30, 'Xico'),
(2085, 30, 'Ixhuacán de los Reyes'),
(2086, 30, 'Ayahualulco'),
(2087, 30, 'Perote'),
(2088, 30, 'Banderilla'),
(2089, 30, 'Rafael Lucio'),
(2090, 30, 'Acajete'),
(2091, 30, 'Las Vigas de Ramírez'),
(2092, 30, 'Villa Aldama'),
(2093, 30, 'Tlacolulan'),
(2094, 30, 'Tonayán'),
(2095, 30, 'Coacoatzintla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BA', 'Bachillerato', '2018-08-20 00:00:00', NULL, NULL),
(2, 'LI', 'Licenciatura', '2018-08-20 00:00:00', NULL, NULL),
(3, 'TSU', 'Técnico Superior Universitario', '2018-08-20 00:00:00', NULL, NULL),
(4, 'ES', 'Especialidad', '2018-08-20 00:00:00', NULL, NULL),
(5, 'MA', 'Maestría ', '2018-08-20 00:00:00', NULL, NULL),
(6, 'DO', 'Doctorado', '2018-08-20 00:00:00', NULL, NULL),
(7, 'EC', 'Educación continua', '2018-08-01 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `usuario_id`, `titulo`, `mensaje`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-01-15 12:35:52', NULL, NULL),
(2, 15, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-01-16 16:05:46', NULL, NULL),
(3, 15, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-01-16 16:13:07', NULL, NULL),
(4, 15, 'Avances', 'Su solicitud está por ser asignada para evaluación técnico curricular.', '2019-01-16 22:15:37', NULL, NULL),
(5, 15, 'Evaluación técnico curricular', 'Su programa de estudios: administración será sometido a evaluación técnico currilar', '2019-01-16 22:25:46', NULL, NULL),
(6, 15, 'Evaluación técnico curricular', 'Su programa de estudios obtuvo un 100% en la evaluación técnico currilar', '2019-01-16 22:43:07', NULL, NULL),
(7, 15, 'Inspección física', 'Su institución tiene una visita de inspección programada.', '2019-01-16 22:45:22', NULL, NULL),
(8, 15, 'Inspección física', 'Su solicitud obtuvo un resultado favorable en la inspección física.', '2019-01-16 23:26:38', NULL, NULL),
(9, 15, 'Acuerdo RVOE', 'Su solicitud está a la espera de la emisón del acuerdo de RVOE.', '2019-01-16 23:29:16', NULL, NULL),
(10, 15, 'Acuerdo RVOE', 'Su solicitud obtuvo el RVOE ¡Felicidades!. Por favor pase a recogerlo a la SICyt.', '2019-01-16 23:30:12', NULL, NULL),
(11, 15, 'Inspección física', 'Su solicitud obtuvo un resultado favorable en la inspección física.', '2019-01-17 05:25:28', NULL, NULL),
(12, 29, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-03-12 13:10:06', NULL, NULL),
(13, 29, 'Avances', 'Su solicitud está por ser asignada para evaluación técnico curricular.', '2019-03-12 19:13:08', NULL, NULL),
(14, 29, 'Evaluación técnico curricular', 'Su programa de estudios: LICENCIATURA EN DERECHO será sometido a evaluación técnico currilar', '2019-03-12 19:30:23', NULL, NULL),
(15, 29, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-03-12 13:46:27', NULL, NULL),
(16, 29, 'Avances', 'Su solicitud está por ser asignada para evaluación técnico curricular.', '2019-03-12 21:53:04', NULL, NULL),
(17, 29, 'Evaluación técnico curricular', 'Su programa de estudios: LICENCIATURA EN DERECHO será sometido a evaluación técnico currilar', '2019-03-12 22:23:24', NULL, NULL),
(18, 29, 'Evaluación técnico curricular', 'Su programa de estudios obtuvo un 100% en la evaluación técnico currilar', '2019-03-14 21:57:52', NULL, NULL),
(19, 29, 'Inspección física', 'Su institución tiene una visita de inspección programada.', '2019-03-14 22:01:53', NULL, NULL),
(20, 29, 'Inspección física', 'Su institución tiene una visita de inspección programada.', '2019-03-14 22:02:25', NULL, NULL),
(21, 24, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-03-20 14:37:13', NULL, NULL),
(22, 24, 'Avances', 'Su solicitud está por ser asignada para evaluación técnico curricular.', '2019-03-20 20:41:41', NULL, NULL),
(23, 24, 'Evaluación técnico curricular', 'Su programa de estudios: nombre programa prueba será sometido a evaluación técnico currilar', '2019-03-20 20:47:13', NULL, NULL),
(24, 24, 'Evaluación técnico curricular', 'Su programa de estudios: nombre programa prueba será sometido a evaluación técnico currilar', '2019-03-20 20:48:28', NULL, NULL),
(25, 15, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-04-02 16:38:03', NULL, NULL),
(26, 15, 'Avances', 'Su solicitud está por ser asignada para evaluación técnico curricular.', '2019-04-03 23:00:51', NULL, NULL),
(27, 15, 'Evaluación técnico curricular', 'Su programa de estudios: Prueba maestría será sometido a evaluación técnico currilar', '2019-04-03 23:31:31', NULL, NULL),
(28, 15, 'Avances', 'Debe de pasar a entregar su documentación.', '2019-06-13 17:05:08', NULL, NULL),
(29, 15, 'Avances', 'Su solicitud está por ser asignada para evaluación técnico curricular.', '2019-06-13 22:06:48', NULL, NULL),
(30, 15, 'Evaluación técnico curricular', 'Su programa de estudios: xxx será sometido a evaluación técnico currilar', '2019-06-13 22:09:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficios`
--

CREATE TABLE `oficios` (
  `id` int(11) NOT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `documento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `solicitud_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `oficios`
--

INSERT INTO `oficios` (`id`, `folio`, `fecha`, `documento`, `created_at`, `deleted_at`, `updated_at`, `solicitud_id`) VALUES
(1, NULL, '2019-01-16', 'ActaDeInspeccion', '2019-01-16 23:25:18', NULL, NULL, 2),
(2, NULL, '2019-01-16', 'ActaDeCierre', '2019-01-16 23:26:50', NULL, NULL, 2),
(3, NULL, '2019-01-16', 'DictamenRVOE', '2019-01-16 23:29:16', NULL, NULL, 2),
(4, NULL, '2019-01-16', 'AcuerdoRVOE', '2019-01-16 23:30:12', NULL, NULL, 2),
(5, NULL, '2019-03-12', 'OrdenInspección', '2019-03-12 18:33:59', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficio_detalles`
--

CREATE TABLE `oficio_detalles` (
  `id` int(11) NOT NULL,
  `oficio_id` int(11) NOT NULL,
  `propiedad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detalle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `oficio_detalles`
--

INSERT INTO `oficio_detalles` (`id`, `oficio_id`, `propiedad`, `detalle`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'respuesta_particular', 'aadsd', '2019-01-16 23:25:18', NULL, NULL),
(2, 1, 'testigo1', 'dasads', '2019-01-16 23:25:18', NULL, NULL),
(3, 1, 'testigo2', 'dasads', '2019-01-16 23:25:18', NULL, NULL),
(4, 1, 'ine1', 'asd', '2019-01-16 23:25:18', NULL, NULL),
(5, 1, 'ine2', 'asd', '2019-01-16 23:25:18', NULL, NULL),
(6, 2, 'observaciones', 'adadsdas', '2019-01-16 23:26:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cobertura` int(11) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `pais` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `pais`) VALUES
(1, 'Afganistán'),
(2, 'Albania'),
(3, 'Alemania'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua y Barbuda'),
(7, 'Arabia Saudita'),
(8, 'Argelia'),
(9, 'Argentina'),
(10, 'Armenia'),
(11, 'Australia'),
(12, 'Austria'),
(13, 'Azerbaiyán'),
(14, 'Bahamas'),
(15, 'Bangladés'),
(16, 'Barbados'),
(17, 'Baréin'),
(18, 'Bélgica'),
(19, 'Belice'),
(20, 'Benín'),
(21, 'Bielorrusia'),
(22, 'Birmania'),
(23, 'Bolivia'),
(24, 'Bosnia y Herzegovina'),
(25, 'Botsuana'),
(26, 'Brasil'),
(27, 'Brunéi'),
(28, 'Bulgaria'),
(29, 'Burkina Faso'),
(30, 'Burundi'),
(31, 'Bután'),
(32, 'Cabo Verde'),
(33, 'Camboya'),
(34, 'Camerún'),
(35, 'Canadá'),
(36, 'Catar'),
(37, 'Chad'),
(38, 'Chile'),
(39, 'China'),
(40, 'Chipre'),
(41, 'Ciudad del Vaticano'),
(42, 'Colombia'),
(43, 'Comoras'),
(44, 'Corea del Norte'),
(45, 'Corea del Sur'),
(46, 'Costa de Marfil'),
(47, 'Costa Rica'),
(48, 'Croacia'),
(49, 'Cuba'),
(50, 'Dinamarca'),
(51, 'Dominica'),
(52, 'Ecuador'),
(53, 'Egipto'),
(54, 'El Salvador'),
(55, 'Emiratos Árabes Unidos'),
(56, 'Eritrea'),
(57, 'Eslovaquia'),
(58, 'Eslovenia'),
(59, 'España'),
(60, 'Estados Unidos'),
(61, 'Estonia'),
(62, 'Etiopía'),
(63, 'Filipinas'),
(64, 'Finlandia'),
(65, 'Fiyi'),
(66, 'Francia'),
(67, 'Gabón'),
(68, 'Gambia'),
(69, 'Georgia'),
(70, 'Ghana'),
(71, 'Granada'),
(72, 'Grecia'),
(73, 'Guatemala'),
(74, 'Guyana'),
(75, 'Guinea'),
(76, 'Guinea Ecuatorial'),
(77, 'Guinea-Bisáu'),
(78, 'Haití'),
(79, 'Honduras'),
(80, 'Hungría'),
(81, 'India'),
(82, 'Indonesia'),
(83, 'Irak'),
(84, 'Irán'),
(85, 'Irlanda'),
(86, 'Islandia'),
(87, 'Islas Marshall'),
(88, 'Islas Salomón'),
(89, 'Israel'),
(90, 'Italia'),
(91, 'Jamaica'),
(92, 'Japón'),
(93, 'Jordania'),
(94, 'Kazajistán'),
(95, 'Kenia'),
(96, 'Kirguistán'),
(97, 'Kiribati'),
(98, 'Kuwait'),
(99, 'Laos'),
(100, 'Lesoto'),
(101, 'Letonia'),
(102, 'Líbano'),
(103, 'Liberia'),
(104, 'Libia'),
(105, 'Liechtenstein'),
(106, 'Lituania'),
(107, 'Luxemburgo'),
(108, 'Madagascar'),
(109, 'Malasia'),
(110, 'Malaui'),
(111, 'Maldivas'),
(112, 'Malí'),
(113, 'Malta'),
(114, 'Marruecos'),
(115, 'Mauricio'),
(116, 'Mauritania'),
(117, 'México'),
(118, 'Micronesia'),
(119, 'Moldavia'),
(120, 'Mónaco'),
(121, 'Mongolia'),
(122, 'Montenegro'),
(123, 'Mozambique'),
(124, 'Namibia'),
(125, 'Nauru'),
(126, 'Nepal'),
(127, 'Nicaragua'),
(128, 'Níger'),
(129, 'Nigeria'),
(130, 'Noruega'),
(131, 'Nueva Zelanda'),
(132, 'Omán'),
(133, 'Países Bajos'),
(134, 'Pakistán'),
(135, 'Palaos'),
(136, 'Panamá'),
(137, 'Papúa Nueva Guinea'),
(138, 'Paraguay'),
(139, 'Perú'),
(140, 'Polonia'),
(141, 'Portugal'),
(142, 'Reino Unido'),
(143, 'República Centroafricana'),
(144, 'República Checa'),
(145, 'República de Macedonia'),
(146, 'República del Congo'),
(147, 'República Democrática del Congo'),
(148, 'República Dominicana'),
(149, 'República Sudafricana'),
(150, 'Ruanda'),
(151, 'Rumanía'),
(152, 'Rusia'),
(153, 'Samoa'),
(154, 'San Cristóbal y Nieves'),
(155, 'San Marino'),
(156, 'San Vicente y las Granadinas'),
(157, 'Santa Lucía'),
(158, 'Santo Tomé y Príncipe'),
(159, 'Senegal'),
(160, 'Serbia'),
(161, 'Seychelles'),
(162, 'Sierra Leona'),
(163, 'Singapur'),
(164, 'Siria'),
(165, 'Somalia'),
(166, 'Sri Lanka'),
(167, 'Suazilandia'),
(168, 'Sudán'),
(169, 'Sudán del Sur'),
(170, 'Suecia'),
(171, 'Suiza'),
(172, 'Surinam'),
(173, 'Tailandia'),
(174, 'Tanzania'),
(175, 'Tayikistán'),
(176, 'Timor Oriental'),
(177, 'Togo'),
(178, 'Tonga'),
(179, 'Trinidad y Tobago'),
(180, 'Túnez'),
(181, 'Turkmenistán'),
(182, 'Turquía'),
(183, 'Tuvalu'),
(184, 'Ucrania'),
(185, 'Uganda'),
(186, 'Uruguay'),
(187, 'Uzbekistán'),
(188, 'Vanuatu'),
(189, 'Venezuela'),
(190, 'Vietnam'),
(191, 'Yemen'),
(192, 'Yibuti'),
(193, 'Zambia'),
(194, 'Zimbabue'),
(195, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aplica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `evaluador_id`, `nombre`, `aplica`, `fecha`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'PROMED', 'VIGENTE', '2111-11-11', '2019-02-15 02:53:13', '2019-04-04 07:23:21', NULL),
(2, 2, 'SNI', 'No Cuenta', NULL, '2019-02-15 02:53:13', '2019-04-04 07:23:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `domicilio_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_materno` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rfc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo_cargo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fotografia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `domicilio_id`, `nombre`, `apellido_paterno`, `apellido_materno`, `fecha_nacimiento`, `sexo`, `nacionalidad`, `correo`, `telefono`, `celular`, `curp`, `rfc`, `ine`, `titulo_cargo`, `fotografia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(-1, -1, 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', '1999-01-01', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', '0', 'WEBSERVICE', 'WEBSERVICE', '2018-11-04 15:00:00', NULL, NULL),
(1, 2, 'Obed', 'Castillo', 'Morales', '1987-09-24', 'Masculino', 'Mexicana', 'obed.castillo07@gmail.com', '15432800', 'SIN DATO', 'SIN DATO', 'CAMO870924R90', '0', 'Administrador de plataforma', 'uploads/fotos/img-usuario.png', '2018-11-04 15:00:00', '2019-02-09 00:57:30', NULL),
(2, 1, 'Alicia ', 'Alvarez', 'Zambrano', NULL, NULL, NULL, 'alicia.alvarez@jalisco.gob.mx', NULL, NULL, NULL, NULL, NULL, 'Coordinadora de Instituciones de. Educación Superior Incorporadas', 'uploads/fotos/img-usuario.png', '2018-12-25 00:13:38', '2018-12-25 00:18:52', NULL),
(3, 4, 'docenteprueba', 'pruebapaellidodocente', 'maternodocente', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'prueba representante legal', 'uploads/fotos/img-usuario.png', '2019-01-08 03:51:26', '2019-01-17 05:11:18', NULL),
(4, 9, 'JOSÉ RAMÓN', 'VIDAL ', 'REYNA ', NULL, NULL, NULL, 'pmartinez@uteg.edu.mx', NULL, NULL, NULL, NULL, NULL, 'Jefa del Departamento de Servicios Escolares', 'uploads/fotos/img-usuario.png', '2019-01-09 02:09:37', '2019-03-07 03:55:51', NULL),
(5, 5, 'PRUEBA', 'TEST', 'TEST00', '2010-10-01', 'Masculino', 'MEXICANA', 'korn07@hotmail.com', '3333333333', '33333333333', 'QWERTYUI1234', 'QWERTY1234', '1234567890', 'PRUEBA REPRESENTANTE LEGAL', 'uploads/fotos/img-usuario.png', '2019-01-09 02:16:31', '2019-06-14 05:04:39', NULL),
(6, 2, 'prueba director', 'PRUEBADIR', 'DIRPRUEBA', NULL, 'Masculino', 'mex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-01-12 03:47:16', '2019-01-16 00:49:18', NULL),
(7, 1, 'GESTORPRUEBA', 'APELLIDOGESTOR', 'APELLIDOMATERNOGESTOR', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'GESTOR', 'uploads/fotos/img-usuario.png', '2019-01-16 00:12:45', NULL, NULL),
(8, 8, 'a', 'a', 'a', NULL, NULL, NULL, 'a@a.a', '3333333', '333333', NULL, '1-10', NULL, 'a', 'uploads/fotos/img-usuario.png', '2019-01-16 00:30:19', '2019-03-21 03:31:01', NULL),
(9, 2, 'a', 'a', 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a', 'uploads/fotos/img-usuario.png', '2019-01-16 00:30:19', '2019-01-16 00:49:18', NULL),
(10, 10, 'aaaa', 'aaaa', 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-01-16 00:30:19', '2019-03-13 02:44:43', NULL),
(11, 11, 'controldoc', 'docontrol', 'maternocontroldoc', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'control documental', 'uploads/fotos/img-usuario.png', '2019-01-16 01:34:46', '2019-03-21 02:57:56', NULL),
(12, 1, 'JEFEINSPECCIONPRUEBA', 'PRUEBAJEFEINSPECCION', 'MATERNOJEFEINSPECCION', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'JEFE DE INSPECCION', 'uploads/fotos/img-usuario.png', '2019-01-16 23:11:11', NULL, NULL),
(13, 1, 'INSPECTORPRUEBA', 'APELLIDOINSPECTOR', 'MATERNOINSPECTOR', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'INSPECTOR', 'uploads/fotos/img-usuario.png', '2019-01-16 23:31:42', NULL, NULL),
(14, 1, 'CONSULTAPRUEBA', 'APELLIDOCONSULTA', 'MATERNOCONSULTA', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'CONSULTA', 'uploads/fotos/img-usuario.png', '2019-01-17 00:05:58', NULL, NULL),
(15, 1, 'EVALUADORPRUEBA', 'APELLIDOEVALUADOR', 'MATERNOEVALUADOR', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'COMITE EVALUADOR', 'uploads/fotos/img-usuario.png', '2019-01-17 00:08:21', NULL, NULL),
(16, 1, 'APELLIDOCONTROLESIECOLARPRUEBA', 'MATERNOCONTROLESCOLARIE', 'MATERNOCONTROLESCOLARIE', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'CONTROL ESCOLAR IE', 'uploads/fotos/img-usuario.png', '2019-01-17 00:10:51', NULL, NULL),
(17, 1, 'CONTROLESCOLARSICYTPRUEBA', 'APELLIDOCONTROLESCOLARPRUEBASICYT', 'MATERNOCONTROLESCOLARSICYT', NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'CONTROL ESCOLAR SICYT', 'uploads/fotos/img-usuario.png', '2019-01-17 00:14:40', NULL, NULL),
(18, 5, 'Salvador ', 'Jiménez ', 'Esparza', NULL, NULL, 'MEXICANA', 'korn07@hotmail.com', '33333333', '3333333', NULL, NULL, NULL, 'representate legal', 'uploads/fotos/img-usuario.png', '2019-01-17 04:40:10', '2019-06-14 05:04:39', NULL),
(19, 4, 'directorUAG', 'Paternodirectoruag', 'maternodirectoruag', NULL, 'Masculino', 'mexicano', NULL, NULL, NULL, 'qwerty1234', NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-01-17 04:45:29', '2019-04-03 05:37:24', NULL),
(20, 4, 'secretaria ', 'particular', 'particular', NULL, NULL, NULL, 'korn07@hotmail.com', '333311111', '333112222', NULL, '9-8', NULL, 'contacto de', 'uploads/fotos/img-usuario.png', '2019-01-17 05:01:55', NULL, NULL),
(21, 4, 'coordinadorprueba', 'xxxxxprueba', 'pruebamaternoxxx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'academico', 'uploads/fotos/img-usuario.png', '2019-01-17 05:01:55', '2019-01-17 05:11:18', NULL),
(22, 4, 'docenteprueba', 'pruebapaellidodocente', 'maternodocente', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-01-17 05:01:55', NULL, NULL),
(23, 1, 'evaluador', 'evaluadorpaterno', 'evaluadormaterno', NULL, NULL, NULL, 'korn07@hotmail.com', '33333333', '333333333', NULL, NULL, NULL, 'evaluadorx', 'uploads/fotos/img-usuario.png', '2019-01-17 05:24:04', '2019-04-04 07:23:21', NULL),
(24, 1, '', '', NULL, NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-02-06 02:46:05', NULL, NULL),
(25, 1, '', '', NULL, NULL, NULL, NULL, 'cristian.lopez@jalisco.gob.mx', NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-02-07 02:15:59', NULL, NULL),
(26, 1, 'Erick', 'Rubio', 'Espinoza', NULL, NULL, NULL, 'urielrubio_@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'Representante legal', 'uploads/fotos/img-usuario.png', '2019-02-21 23:21:19', '2019-02-21 23:24:53', NULL),
(27, 8, 'Erick Uriel', 'Rubio', 'Espinosa', '1992-08-31', 'Masculino', 'Mexicana', 'urielrubio_@hotmail.com', '3360592304', '3360592304', 'RUEE920831', 'RUEE920831TK7', '3188123085454', 'REPRESENTANTE LEGAL', 'uploads/fotos/img-usuario.png', '2019-02-21 23:26:40', '2019-03-21 03:31:01', NULL),
(28, 1, 'Margarita', 'Flores', 'Marquez', NULL, NULL, NULL, 'maggiflores7@gmail.com', NULL, NULL, NULL, NULL, NULL, 'REPRESENTANTE LEGAL', 'uploads/fotos/img-usuario.png', '2019-02-21 23:27:45', NULL, NULL),
(29, 1, 'Margarita', 'Flores', 'Marquez', NULL, NULL, NULL, 'maggiflores7@gmail.com', NULL, NULL, NULL, NULL, NULL, 'REPRESENTANTE LEGAL', 'uploads/fotos/img-usuario.png', '2019-02-21 23:30:52', NULL, NULL),
(30, 1, 'margarita', 'flores ', 'marquez', NULL, NULL, NULL, 'maggie.sicyt@gmail.com', NULL, NULL, NULL, NULL, NULL, 'Representante legal prueba', 'uploads/fotos/img-usuario.png', '2019-02-21 23:40:42', NULL, NULL),
(31, 11, 'margarita', 'flores', 'marquez', NULL, 'Femenino', 'Mexicana', 'magui.sicyt@gmail.com', '38178708', '3312548403', 'FOMM900327MJCLRR09', '1111111155', '55555555', 'representante legal prueba', 'uploads/fotos/img-usuario.png', '2019-02-21 23:46:01', '2019-03-21 02:57:56', NULL),
(32, 1, '', '', NULL, NULL, NULL, NULL, 'sergio.davalos@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-02-22 00:23:22', NULL, NULL),
(33, 1, 'Dulce ', 'Torres', 'Estrada', NULL, NULL, NULL, 'dulce.torresestrada91@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'gestor', 'uploads/fotos/img-usuario.png', '2019-02-22 00:40:25', '2019-02-22 01:21:59', NULL),
(34, 6, 'Erick Uriel', 'Rubio', 'Espinosa', NULL, 'Masculino', 'mex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-02-22 01:34:33', '2019-03-21 03:31:01', NULL),
(35, 7, 'Alejandro ', 'Cardenas ', 'Jimenez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-22 02:18:08', NULL, NULL),
(36, 1, '', '', NULL, NULL, NULL, NULL, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-02-28 01:02:43', NULL, NULL),
(37, 10, 'MARIO ALBERTO', 'PEREZ', 'SANCHEZ', NULL, 'Masculino', 'MEXICANA', 'korn07@hotmail.com', '(384)738-2865', '33333333333', NULL, NULL, NULL, 'DIRECTOR', 'uploads/fotos/img-usuario.png', '2019-03-07 00:35:32', '2019-03-13 02:44:43', NULL),
(38, 9, 'MARIO ALBERTO', 'PEREZ', 'SANCHEZ', NULL, 'Masculino', 'MEXICANA', NULL, NULL, NULL, 'PESM790417HJCRNR01', NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-03-07 02:03:10', '2019-03-13 02:44:43', NULL),
(39, 9, 'PDILIGENCIAS', 'APELLIDOPDILIGENCIA', NULL, NULL, NULL, NULL, 'korn07@hotmail.com', '33333333', '33333333', NULL, '9 - 5', NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-03-07 03:36:08', NULL, NULL),
(40, 9, 'JORGE ANTONIO ', 'LEOS', ' NAVARRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MAESTRO', 'uploads/fotos/img-usuario.png', '2019-03-07 03:36:08', '2019-03-07 03:55:51', NULL),
(41, 9, 'JOSÉ RAMÓN', 'VIDAL ', 'REYNA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-03-07 03:36:08', NULL, NULL),
(42, 9, 'PDILIGENCIAS', 'APELLIDODILIGENCIAS', NULL, NULL, NULL, NULL, 'korn07@hotmail.com', '1111111111', '111111111', NULL, '9- 5', NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-03-07 03:49:38', NULL, NULL),
(43, 9, 'JORGE ANTONIO ', 'LEOS ', 'NAVARRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MAESTRO', 'uploads/fotos/img-usuario.png', '2019-03-07 03:49:38', '2019-03-13 02:44:43', NULL),
(44, 9, 'JOSÉ RAMÓN', 'VIDAL', 'REYNA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-03-07 03:49:38', NULL, NULL),
(45, 4, 'Prueba licenciatura', 'Coordinadorapellido', 'Maternoapellido', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'perfilpruebacoordinador', 'uploads/fotos/img-usuario.png', '2019-03-13 01:33:42', '2019-04-03 05:37:24', NULL),
(46, 12, 'dirxxxx', 'apeliddodirxxx', 'apellidomaternodir', NULL, 'Masculino', 'mexa', NULL, NULL, NULL, '2x1x1x1x', NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-03-21 02:55:38', '2019-03-21 02:57:56', NULL),
(47, 12, 'coordiprueba', 'apellidocordi prueba', 'maeternopruebacordi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xxxx', 'uploads/fotos/img-usuario.png', '2019-03-21 02:55:38', '2019-03-21 02:57:56', NULL),
(48, 6, 'xxxx', 'xxx', 'xxx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xx', 'uploads/fotos/img-usuario.png', '2019-03-21 03:31:01', NULL, NULL),
(49, 1, '', '', NULL, NULL, NULL, NULL, 'edelacruz@universidad-une.com ', NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-05-25 21:20:11', NULL, NULL),
(50, 13, 'xxx', 'xxx', 'xx', NULL, 'Masculino', 'xx', NULL, NULL, NULL, 'xx', NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-06-14 04:56:38', '2019-06-14 05:04:39', NULL),
(51, 13, 'xxx', 'xxx', 'xxx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xxx', 'uploads/fotos/img-usuario.png', '2019-06-14 04:56:39', '2019-06-14 05:04:39', NULL),
(52, 1, 'REPRESENTANTE', 'PRUEBA', 'SICYT', NULL, NULL, NULL, 'representante@mail.com', NULL, NULL, NULL, NULL, NULL, 'REPRESENTANTE', 'uploads/fotos/img-usuario.png', '2019-06-18 02:24:26', NULL, NULL),
(53, 1, '', '', NULL, NULL, NULL, NULL, 'robert.hct@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/fotos/img-usuario.png', '2019-06-22 01:26:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles`
--

CREATE TABLE `planteles` (
  `id` int(11) NOT NULL,
  `institucion_id` int(11) NOT NULL,
  `domicilio_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `email1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dimensiones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redes_sociales` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `convenios_bibliotecas_virtuales` text COLLATE utf8_unicode_ci,
  `especificaciones` text COLLATE utf8_unicode_ci,
  `clave_centro_trabajo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paginaweb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caracteristica_inmueble` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planteles`
--

INSERT INTO `planteles` (`id`, `institucion_id`, `domicilio_id`, `persona_id`, `email1`, `email2`, `email3`, `dimensiones`, `redes_sociales`, `convenios_bibliotecas_virtuales`, `especificaciones`, `clave_centro_trabajo`, `telefono1`, `telefono2`, `telefono3`, `paginaweb`, `caracteristica_inmueble`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 6, 'TESTSICYT1@TESTPRUEBAX.COM', NULL, NULL, NULL, 'https://www.facebook.com/profile.php?id=100008531499793', NULL, NULL, NULL, '3315432800', NULL, NULL, 'https://sicyt.jalisco.gob.mx/', NULL, '2019-01-11 20:47:16', '2019-01-15 17:49:18', NULL),
(2, 2, 4, 19, 'korn07@hotmail.com', NULL, NULL, NULL, NULL, NULL, 'xxx', '123', '15432800', NULL, NULL, NULL, NULL, '2019-01-16 21:45:29', '2019-04-02 22:37:24', NULL),
(3, 3, 6, 34, 'urielrubio_@hotmail.com', 'maggiflores7@gmail.com', 'dulce.torresestrada@hotmail.com', NULL, NULL, NULL, NULL, NULL, '3360592304', '3312548403', '3320712987', 'https://www.unedl.edu.mx/portal/', NULL, '2019-02-21 18:34:33', '2019-03-20 20:31:01', NULL),
(4, 4, 7, 35, 'licenciatura@hotmail.com', 'gdl@hotmail.com', 'gdl@gmail.com', NULL, 'facebook', NULL, NULL, 'cct11111222', '36584407', NULL, NULL, 'https://www.google.com/search?q=cencus&rlz=1C1KMZB_esMX661MX661&oq=cencus&aqs=chrome..69i57.1527j0j7&sourceid=chrome&ie=UTF-8', NULL, '2019-02-21 19:18:08', NULL, NULL),
(5, 5, 9, 38, 'marioalperezs@hotmail.com', 'pesa74@hotmail.com', 'pesamaal@hotmail.com', NULL, NULL, NULL, NULL, NULL, '(384)738-2865', '(384)733-9852', NULL, NULL, NULL, '2019-03-06 19:03:10', '2019-03-12 19:44:43', NULL),
(6, 4, 12, 46, NULL, NULL, NULL, NULL, NULL, NULL, 'xxxx', NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(7, 2, 13, 50, 'qqq@fff.com', NULL, NULL, NULL, NULL, NULL, 'xxx', 'xxx', '1111111111', NULL, NULL, NULL, NULL, '2019-06-13 21:56:38', '2019-06-13 22:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles_edificios_niveles`
--

CREATE TABLE `planteles_edificios_niveles` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `edificio_nivel_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles_higienes`
--

CREATE TABLE `planteles_higienes` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `higiene_id` int(11) NOT NULL,
  `cantidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planteles_higienes`
--

INSERT INTO `planteles_higienes` (`id`, `plantel_id`, `higiene_id`, `cantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(2, 1, 2, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(3, 1, 3, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(4, 1, 4, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(5, 1, 5, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(6, 1, 6, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(7, 1, 7, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(8, 1, 8, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(9, 1, 9, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(10, 1, 10, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(11, 1, 11, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(12, 2, 1, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(13, 2, 2, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(14, 2, 3, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(15, 2, 4, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(16, 2, 5, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(17, 2, 6, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(18, 2, 7, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(19, 2, 8, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(20, 2, 9, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(21, 2, 10, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(22, 2, 11, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(23, 5, 1, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(24, 5, 2, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(25, 5, 3, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(26, 5, 4, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(27, 5, 5, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(28, 5, 6, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(29, 5, 7, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(30, 5, 8, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(31, 5, 9, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(32, 5, 10, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(33, 5, 11, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(34, 6, 1, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(35, 6, 2, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(36, 6, 3, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(37, 6, 4, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(38, 6, 5, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(39, 6, 6, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(40, 6, 7, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(41, 6, 8, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(42, 6, 9, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(43, 6, 10, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(44, 6, 11, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(45, 3, 1, NULL, '2019-03-20 20:31:01', NULL, NULL),
(46, 3, 2, NULL, '2019-03-20 20:31:01', NULL, NULL),
(47, 3, 3, NULL, '2019-03-20 20:31:01', NULL, NULL),
(48, 3, 4, NULL, '2019-03-20 20:31:01', NULL, NULL),
(49, 3, 5, NULL, '2019-03-20 20:31:01', NULL, NULL),
(50, 3, 6, NULL, '2019-03-20 20:31:01', NULL, NULL),
(51, 3, 7, NULL, '2019-03-20 20:31:01', NULL, NULL),
(52, 3, 8, NULL, '2019-03-20 20:31:01', NULL, NULL),
(53, 3, 9, NULL, '2019-03-20 20:31:01', NULL, NULL),
(54, 3, 10, NULL, '2019-03-20 20:31:01', NULL, NULL),
(55, 3, 11, NULL, '2019-03-20 20:31:01', NULL, NULL),
(56, 7, 1, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(57, 7, 2, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(58, 7, 3, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(59, 7, 4, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(60, 7, 5, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(61, 7, 6, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(62, 7, 7, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(63, 7, 8, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(64, 7, 9, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(65, 7, 10, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(66, 7, 11, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles_seguridad_sistemas`
--

CREATE TABLE `planteles_seguridad_sistemas` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `seguridad_sistema_id` int(11) NOT NULL,
  `cantidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planteles_seguridad_sistemas`
--

INSERT INTO `planteles_seguridad_sistemas` (`id`, `plantel_id`, `seguridad_sistema_id`, `cantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(2, 1, 2, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(3, 1, 3, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(4, 1, 4, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(5, 1, 5, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(6, 1, 6, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(7, 1, 7, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(8, 1, 8, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(9, 2, 1, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(10, 2, 2, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(11, 2, 3, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(12, 2, 4, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(13, 2, 5, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(14, 2, 6, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(15, 2, 7, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(16, 2, 8, NULL, '2019-01-16 22:01:55', '2019-04-02 22:37:24', NULL),
(17, 5, 1, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(18, 5, 2, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(19, 5, 3, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(20, 5, 4, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(21, 5, 5, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(22, 5, 6, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(23, 5, 7, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(24, 5, 8, NULL, '2019-03-06 20:36:08', '2019-03-12 19:44:43', NULL),
(25, 6, 1, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(26, 6, 2, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(27, 6, 3, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(28, 6, 4, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(29, 6, 5, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(30, 6, 6, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(31, 6, 7, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(32, 6, 8, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(33, 3, 1, NULL, '2019-03-20 20:31:01', NULL, NULL),
(34, 3, 2, NULL, '2019-03-20 20:31:01', NULL, NULL),
(35, 3, 3, NULL, '2019-03-20 20:31:01', NULL, NULL),
(36, 3, 4, NULL, '2019-03-20 20:31:01', NULL, NULL),
(37, 3, 5, NULL, '2019-03-20 20:31:01', NULL, NULL),
(38, 3, 6, NULL, '2019-03-20 20:31:01', NULL, NULL),
(39, 3, 7, NULL, '2019-03-20 20:31:01', NULL, NULL),
(40, 3, 8, NULL, '2019-03-20 20:31:01', NULL, NULL),
(41, 7, 1, NULL, '2019-06-13 21:56:38', '2019-06-13 22:04:39', NULL),
(42, 7, 2, NULL, '2019-06-13 21:56:38', '2019-06-13 22:04:39', NULL),
(43, 7, 3, NULL, '2019-06-13 21:56:38', '2019-06-13 22:04:39', NULL),
(44, 7, 4, NULL, '2019-06-13 21:56:38', '2019-06-13 22:04:39', NULL),
(45, 7, 5, NULL, '2019-06-13 21:56:38', '2019-06-13 22:04:39', NULL),
(46, 7, 6, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(47, 7, 7, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL),
(48, 7, 8, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantel_dictamenes`
--

CREATE TABLE `plantel_dictamenes` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `autoridad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) DEFAULT NULL,
  `ciclo_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `duracion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objetivos` text COLLATE utf8_unicode_ci,
  `antecedentes` text COLLATE utf8_unicode_ci,
  `creditos` int(11) DEFAULT NULL,
  `minimo_horas_optativas` int(11) DEFAULT NULL,
  `minimo_creditos_optativas` int(11) DEFAULT NULL,
  `vigencia` date DEFAULT NULL,
  `acuerdo_rvoe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `actualizacion` text COLLATE utf8_unicode_ci,
  `seguimiento_egresados` text COLLATE utf8_unicode_ci,
  `total_alumnos_otros_roves` int(11) DEFAULT NULL,
  `convenios_vinculacion` text COLLATE utf8_unicode_ci,
  `fuentes_informacion` text COLLATE utf8_unicode_ci,
  `estudio_oferta_demanda` text COLLATE utf8_unicode_ci,
  `lineas_generacion_aplicacion_conocimiento` text COLLATE utf8_unicode_ci,
  `necesidad_profesional` text COLLATE utf8_unicode_ci,
  `necesidad_institucional` text COLLATE utf8_unicode_ci,
  `recursos_operacion` text COLLATE utf8_unicode_ci,
  `necesidad_social` text COLLATE utf8_unicode_ci,
  `antecedente_academico` text COLLATE utf8_unicode_ci,
  `perfil_ingreso` text COLLATE utf8_unicode_ci,
  `perfil_egreso` text COLLATE utf8_unicode_ci,
  `metodos_induccion` text COLLATE utf8_unicode_ci,
  `proceso_seleccion` text COLLATE utf8_unicode_ci,
  `mapa_curricular` text COLLATE utf8_unicode_ci,
  `flexibilidad_curricular` text COLLATE utf8_unicode_ci,
  `objetivo_general` text COLLATE utf8_unicode_ci,
  `objetivos_particulares` text COLLATE utf8_unicode_ci,
  `otros_rvoes` text COLLATE utf8_unicode_ci,
  `fecha_asignacion_evaluador` date DEFAULT NULL,
  `calificacion_minima` int(11) DEFAULT NULL,
  `calificacion_maxima` int(11) DEFAULT NULL,
  `calificacion_aprobatoria` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id`, `evaluador_id`, `ciclo_id`, `nivel_id`, `solicitud_id`, `modalidad_id`, `plantel_id`, `persona_id`, `duracion`, `objetivos`, `antecedentes`, `creditos`, `minimo_horas_optativas`, `minimo_creditos_optativas`, `vigencia`, `acuerdo_rvoe`, `nombre`, `tipo`, `actualizacion`, `seguimiento_egresados`, `total_alumnos_otros_roves`, `convenios_vinculacion`, `fuentes_informacion`, `estudio_oferta_demanda`, `lineas_generacion_aplicacion_conocimiento`, `necesidad_profesional`, `necesidad_institucional`, `recursos_operacion`, `necesidad_social`, `antecedente_academico`, `perfil_ingreso`, `perfil_egreso`, `metodos_induccion`, `proceso_seleccion`, `mapa_curricular`, `flexibilidad_curricular`, `objetivo_general`, `objetivos_particulares`, `otros_rvoes`, `fecha_asignacion_evaluador`, `calificacion_minima`, `calificacion_maxima`, `calificacion_aprobatoria`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, 1, 1, 1, 9, '24', NULL, NULL, 97, NULL, NULL, '2018-12-30', NULL, 'a', NULL, 'a', 'a', NULL, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '1', '{\"conocimientos\":\"a\",\"habilidades\":\"a\",\"aptitudes\":\"a\"}', '{\"conocimientos\":\"a\",\"habilidades\":\"a\",\"aptitudes\":\"a\"}', 'a', 'a', 'a', 'a', 'a', 'a', '[]', NULL, NULL, NULL, NULL, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(2, 2, 1, 2, 2, 1, 2, 21, '24', NULL, NULL, 380, NULL, NULL, '2018-12-30', 'RVOE1234', 'administración', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', NULL, NULL, NULL, NULL, 'objetivo prueba', 'objetivo prueba', '[]', NULL, NULL, NULL, NULL, '2019-01-16 22:01:55', '2019-01-16 23:30:12', NULL),
(3, 2, 2, 2, 3, 3, 5, 40, '14', NULL, NULL, 364, NULL, NULL, '2018-12-30', NULL, 'LICENCIATURA EN DERECHO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', NULL, NULL, NULL, NULL, 'Formar profesionales con base en principios de calidad, equidad y pertinencia en la adquisición de\r\nconocimientos, habilidades y actitudes que faciliten la visión teórica y el ejercicio práctico del\r\nDerecho, con énfasis en las personas.', 'Fomentar en el alumno el interés por plantear alternativas socialmente viables en la\r\nrealización de investigaciones jurídicas.\r\n Formar profesionistas con conocimientos y habilidades necesarias y suficientes para\r\ncomprender y evaluar el campo y la problemática inherentes al derecho en la defensa de\r\nlos intereses de los particulares ante los órganos jurisdiccionales, así como el\r\nasesoramiento profesional en la organización legislativa y administrativa del estado, con\r\nuna sólida conciencia de su responsabilidad y compromiso social para el logro de los fines\r\ny principios del derecho, entre ellos: la justicia, la libertad, la equidad, el bien común y la\r\npaz social.', '[]', NULL, NULL, NULL, NULL, '2019-03-06 20:36:08', '2019-03-12 19:30:22', NULL),
(4, 2, 2, 2, 4, 3, 5, 43, '14', NULL, NULL, 367, NULL, NULL, '2018-12-30', NULL, 'LICENCIATURA EN DERECHO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', 'Estas campañas planean, diseñan e implementan métodos para captar el mayor número de\r\naspirantes en cumplimiento de informar los requisitos de admisión. La información deberá\r\nenfocarse a públicos específicos: alumnos de bachillerato, orientadores vocacionales, directivos\r\nde educación media superior y padres de familia.\r\nEsta área tiene que reforzar la labor de extensión que realiza nuestro Instituto sobre sus carreras,\r\nprogramas de estudio, infraestructura, apoyos y servicios educativos, mediante el diseño y\r\nproducción de materiales electrónicos (radio, televisión, página web, multimedia, redes sociales,\r\nentre otros).\r\nAdemás fortalecer la labor de divulgación que realiza nuestra institución sobre sus carreras,\r\nprogramas de estudio, infraestructura, apoyos y servicios educativos, mediante el diseño y\r\nproducción de materiales impresos (carteles, volantes, dípticos, trípticos, folletos y gacetas, entre\r\notros).', NULL, NULL, NULL, 'Formar profesionales con base en principios de calidad, equidad y pertinencia en la adquisición de\r\nconocimientos, habilidades y actitudes que faciliten la visión teórica y el ejercicio práctico del\r\nDerecho, con énfasis en las personas.', 'Fomentar en el alumno el interés por plantear alternativas socialmente viables en la\r\nrealización de investigaciones jurídicas.\r\n Formar profesionistas con conocimientos y habilidades necesarias y suficientes para\r\ncomprender y evaluar el campo y la problemática inherentes al derecho en la defensa de\r\nlos intereses de los particulares ante los órganos jurisdiccionales, así como el\r\nasesoramiento profesional en la organización legislativa y administrativa del estado, con\r\nuna sólida conciencia de su responsabilidad y compromiso social para el logro de los fines\r\ny principios del derecho, entre ellos: la justicia, la libertad, la equidad, el bien común y la\r\npaz social.', '[]', NULL, NULL, NULL, NULL, '2019-03-06 20:49:38', '2019-03-12 22:23:24', NULL),
(5, 2, 1, 5, 5, 1, 2, 45, '24', NULL, NULL, 75, NULL, NULL, '2018-12-30', NULL, 'Prueba maestría', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', NULL, NULL, NULL, NULL, 'xxxxxxx objetivo general UAG prueba', 'XXXXX objetivos particulares prueba UAG', '[]', NULL, NULL, NULL, NULL, '2019-03-12 18:33:43', '2019-04-03 23:31:30', NULL),
(6, 2, 1, 2, 6, 1, 6, 47, '14', NULL, NULL, 450, NULL, NULL, '2018-12-30', NULL, 'nombre programa prueba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '{\"conocimientos\":\"xxxx\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', 'xxx', NULL, NULL, NULL, 'xxxx', 'xxx', '[]', NULL, NULL, NULL, NULL, '2019-03-20 19:55:38', '2019-03-20 20:48:28', NULL),
(7, 1, 1, 5, 7, 1, 3, 48, '16', NULL, NULL, 79, NULL, NULL, '2018-12-30', NULL, 'maestriaprueba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', NULL, NULL, NULL, NULL, 'xxx', 'xxx', '[]', NULL, NULL, NULL, NULL, '2019-03-20 20:31:01', NULL, NULL),
(8, 2, 1, 2, 8, 1, 7, 51, '1', NULL, NULL, 111, NULL, NULL, '2018-12-30', NULL, 'xxx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', '{\"conocimientos\":\"\",\"habilidades\":\"\",\"aptitudes\":\"\"}', NULL, NULL, NULL, NULL, 'xxx', 'xxxx', '[]', NULL, NULL, NULL, NULL, '2019-06-13 21:56:39', '2019-06-13 22:09:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_turnos`
--

CREATE TABLE `programas_turnos` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `programas_turnos`
--

INSERT INTO `programas_turnos` (`id`, `programa_id`, `turno_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2019-01-15 17:30:19', '2019-01-15 17:49:18', NULL),
(2, 2, 1, '2019-01-16 22:01:55', '2019-01-16 22:11:18', NULL),
(3, 3, 1, '2019-03-06 20:36:08', '2019-03-06 20:55:51', NULL),
(4, 4, 1, '2019-03-06 20:49:38', '2019-03-12 19:44:43', NULL),
(5, 5, 3, '2019-03-12 18:33:43', '2019-04-02 22:37:24', NULL),
(6, 6, 1, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(7, 7, 4, '2019-03-20 20:31:01', NULL, NULL),
(8, 8, 1, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_evaluaciones`
--

CREATE TABLE `programa_evaluaciones` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `cumplimiento_id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cumplimiento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valoracion` text COLLATE utf8_unicode_ci,
  `numero` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `programa_evaluaciones`
--

INSERT INTO `programa_evaluaciones` (`id`, `programa_id`, `cumplimiento_id`, `evaluador_id`, `estatus`, `fecha`, `cumplimiento`, `valoracion`, `numero`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 9, 2, 2, NULL, '100', 'muy bien', 306, '2019-01-17 05:25:45', '2019-01-17 05:43:07', NULL),
(2, 3, 5, 2, 2, NULL, '100', 'Evaluación de prueba', 352, '2019-03-13 02:30:22', '2019-03-15 04:57:52', NULL),
(3, 4, 4, 2, 1, NULL, NULL, NULL, NULL, '2019-03-13 05:23:24', NULL, NULL),
(4, 6, 4, 2, 1, NULL, NULL, NULL, NULL, '2019-03-21 03:47:13', NULL, NULL),
(5, 6, 4, 2, 1, NULL, NULL, NULL, NULL, '2019-03-21 03:48:28', NULL, NULL),
(6, 5, 4, 2, 1, NULL, NULL, NULL, NULL, '2019-04-04 06:31:30', NULL, NULL),
(7, 8, 4, 2, 1, NULL, NULL, NULL, NULL, '2019-06-14 05:09:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `volumen` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editorial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otros` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `persona_id`, `anio`, `volumen`, `pais`, `titulo`, `editorial`, `otros`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1999, 111, 'mexico', 'aaa', 'aaa', NULL, '2019-01-16 00:30:19', '2019-01-16 00:49:18', NULL),
(2, 46, 2011, 11111, 'mexico', 'publicacion prueba', 'editorial prubliecaicon prueba', NULL, '2019-03-21 02:55:38', '2019-03-21 02:57:56', NULL),
(3, 34, 0, 0, 'xx', 'xxx', 'xxx', 'xx', '2019-03-21 03:31:01', NULL, NULL),
(4, 50, 0, 0, 'xxxx', 'xxxx', 'dxxxx', NULL, '2019-06-14 04:56:38', '2019-06-14 05:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ratificacion_nombres`
--

CREATE TABLE `ratificacion_nombres` (
  `id` int(11) NOT NULL,
  `institucion_id` int(11) NOT NULL,
  `acuerdo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autoridad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_propuesto1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_propuesto2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_propuesto3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_solicitado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_autorizado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_autorizacion` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ratificacion_nombres`
--

INSERT INTO `ratificacion_nombres` (`id`, `institucion_id`, `acuerdo`, `autoridad`, `nombre_propuesto1`, `nombre_propuesto2`, `nombre_propuesto3`, `nombre_solicitado`, `nombre_autorizado`, `fecha_autorizacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, NULL, 'aaa', 'aa222', 'aa2', NULL, NULL, NULL, '2019-01-15 17:30:19', NULL, NULL),
(2, 1, NULL, NULL, 'aaa', 'aa222', 'aa2', NULL, NULL, NULL, '2019-01-15 17:49:18', NULL, NULL),
(3, 2, '123', 'X', NULL, NULL, NULL, NULL, 'UAG', '2011-01-01', '2019-01-16 21:43:02', NULL, NULL),
(6, 5, NULL, NULL, 'INSTITUTO VANCOUVER', 'INSTITUTO CERVANTES', 'INSTITUTO MATUTE REMUS', NULL, NULL, NULL, '2019-03-06 20:36:08', NULL, NULL),
(7, 5, NULL, NULL, 'INSTITUTO VANCOUVER', 'INSTITUTO CERVANTES', 'INSTITUTO MATUTE REMUS', NULL, NULL, NULL, '2019-03-06 20:49:38', NULL, NULL),
(8, 5, NULL, NULL, 'INSTITUTO VANCOUVER', 'INSTITUTO CERVANTES', 'INSTITUTO MATUTE REMUS', NULL, NULL, NULL, '2019-03-06 20:50:39', NULL, NULL),
(9, 5, NULL, NULL, 'INSTITUTO VANCOUVER', 'INSTITUTO CERVANTES', 'INSTITUTO MATUTE REMUS', NULL, NULL, NULL, '2019-03-06 20:55:51', NULL, NULL),
(10, 5, NULL, NULL, 'INSTITUTO VANCOUVER', 'INSTITUTO CERVANTES', 'INSTITUTO MATUTE REMUS', NULL, NULL, NULL, '2019-03-12 19:44:33', NULL, NULL),
(11, 5, NULL, NULL, 'INSTITUTO VANCOUVER', 'INSTITUTO CERVANTES', 'INSTITUTO MATUTE REMUS', NULL, NULL, NULL, '2019-03-12 19:44:43', NULL, NULL),
(12, 4, NULL, NULL, 'nombreprueba2', 'nombreprueba3', 'nombreprueba4', NULL, NULL, NULL, '2019-03-20 19:55:38', NULL, NULL),
(13, 4, NULL, NULL, 'nombreprueba2', 'nombreprueba3', 'nombreprueba4', NULL, NULL, NULL, '2019-03-20 19:57:56', NULL, NULL),
(14, 3, NULL, NULL, 'xxx1', 'xxx2', 'xx3', NULL, NULL, NULL, '2019-03-20 20:31:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respaldos`
--

CREATE TABLE `respaldos` (
  `id` int(11) NOT NULL,
  `mixta_noescolarizada_id` int(11) NOT NULL,
  `proceso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodicidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medios_almacenamiento` text COLLATE utf8_unicode_ci,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `respaldos`
--

INSERT INTO `respaldos` (`id`, `mixta_noescolarizada_id`, `proceso`, `periodicidad`, `medios_almacenamiento`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'PENDIENTE', '0', 'PENDIENTE', 'PENDIENTE', '2019-03-06 20:36:08', '2019-03-06 20:50:39', NULL),
(2, 5, 'el area de TI respalda cada mes', '1 al mes', 'discos duros ', 'el area de TI respalda cada mes', '2019-03-12 19:44:33', '2019-03-12 19:44:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'nuevo', 'Usuario Nuevo', '2018-09-12 23:00:00', NULL, NULL),
(2, 'admin', 'Administrador', '2018-09-12 23:00:00', NULL, NULL),
(3, 'representante', 'Representante Legal', '2018-09-12 23:00:00', NULL, NULL),
(4, 'gestor', 'Gestor', '2018-09-12 23:00:00', NULL, NULL),
(5, 'evaluador', 'Evaluador', '2018-09-12 23:00:00', NULL, NULL),
(6, 'inspector', 'Inspector', '2018-09-12 23:00:00', NULL, NULL),
(7, 'control_documental', 'Revisión de documentos', '2018-09-18 00:00:00', NULL, NULL),
(8, 'sicyt_lectura', 'Sicyt de consulta', '2018-09-17 23:00:00', NULL, NULL),
(9, 'sicyt_editar', 'Sicyt para editar', '2018-09-17 23:00:00', NULL, NULL),
(10, 'comite_evaluacion', 'Comité de evaluación', '2018-11-11 14:00:00', NULL, NULL),
(11, 'jefe_inspector', 'Jefe de inspectores', '2018-11-11 14:00:00', NULL, NULL),
(12, 'ce_ies', 'Control Escolar IES', '2018-11-11 14:00:00', NULL, NULL),
(13, 'ce_sicyt', 'Control Escolar SICYT', '2018-11-11 14:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud_instituciones`
--

CREATE TABLE `salud_instituciones` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguridad_sistemas`
--

CREATE TABLE `seguridad_sistemas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situaciones`
--

CREATE TABLE `situaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `letra` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `situaciones`
--

INSERT INTO `situaciones` (`id`, `nombre`, `descripcion`, `letra`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Activo', 'Activo', 'A', '2018-09-18 00:00:00', NULL, NULL),
(2, 'Inactivo', 'Inactivo', 'I', '2018-09-18 00:00:00', NULL, NULL),
(3, 'Egresado', 'Egresado', 'E', '2018-09-18 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `tipo_solicitud_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `estatus_solicitud_id` int(11) NOT NULL,
  `cita` datetime DEFAULT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `tipo_solicitud_id`, `usuario_id`, `fecha`, `estatus_solicitud_id`, `cita`, `folio`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 6, NULL, 100, '2019-01-22 13:35:52', 'ESLI142019001', '2019-01-15 17:30:19', '2019-01-16 23:15:12', NULL),
(2, 1, 15, NULL, 8, '2019-01-22 15:35:52', 'ESLI142019002', '2019-01-16 22:01:55', '2019-01-17 05:25:28', NULL),
(3, 1, 29, NULL, 7, '2019-03-15 09:00:00', 'ESLI142019003', '2019-03-06 20:36:08', '2019-03-14 22:02:25', NULL),
(4, 1, 29, NULL, 5, '2019-03-15 10:00:00', 'ESLI142019004', '2019-03-06 20:49:38', '2019-03-12 22:23:24', NULL),
(5, 1, 15, NULL, 5, '2019-04-05 09:00:00', 'ESM142019005', '2019-03-12 18:33:42', '2019-04-03 23:31:30', NULL),
(6, 1, 24, NULL, 5, '2019-03-25 09:00:00', 'ESLI142019006', '2019-03-20 19:55:38', '2019-03-20 20:48:28', NULL),
(7, 1, 20, NULL, 1, NULL, 'ESM142019007', '2019-03-20 20:31:01', '2019-03-20 20:31:01', NULL),
(8, 1, 15, NULL, 5, '2019-06-17 09:00:00', 'ESLI142019008', '2019-06-13 21:56:39', '2019-06-13 22:09:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_estatus_solicitudes`
--

CREATE TABLE `solicitudes_estatus_solicitudes` (
  `id` int(11) NOT NULL,
  `estatus_solicitud_id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudes_estatus_solicitudes`
--

INSERT INTO `solicitudes_estatus_solicitudes` (`id`, `estatus_solicitud_id`, `solicitud_id`, `comentario`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, '2019-01-15 17:49:18', '2019-01-15 18:35:52', NULL),
(2, 3, 1, NULL, '2019-01-15 18:35:52', NULL, NULL),
(3, 2, 2, '-falta x\r\n-falta y\r\n-estuvo mal x', '2019-01-16 22:03:03', '2019-01-16 22:05:46', NULL),
(4, 200, 2, NULL, '2019-01-16 22:05:46', NULL, NULL),
(5, 2, 2, NULL, '2019-01-16 22:11:18', '2019-01-16 22:13:07', NULL),
(6, 3, 2, NULL, '2019-01-16 22:13:07', '2019-01-16 22:15:36', NULL),
(7, 4, 2, 'Asignación evaluación 2019-01-16', '2019-01-16 22:15:36', '2019-01-16 22:25:45', NULL),
(8, 5, 2, '100% de cumplimiento.', '2019-01-16 22:25:45', '2019-01-16 22:43:07', NULL),
(9, 6, 2, 'Visita de inspeccion programada para: 2011-10-11', '2019-01-16 22:43:07', '2019-01-16 22:45:22', NULL),
(10, 7, 2, 'Su solicitud obtuvo un resultado favorable en la inspección física.', '2019-01-16 22:45:22', '2019-01-17 05:25:28', NULL),
(11, 100, 1, 'adsad', '2019-01-16 23:15:12', NULL, NULL),
(12, 8, 2, NULL, '2019-01-16 23:26:38', NULL, NULL),
(13, 9, 2, 'Documento emitido con fecha de 2019-01-16 y oficio 123', '2019-01-16 23:29:16', NULL, NULL),
(14, 10, 2, 'Documento emitido con fecha de 2019-01-16 y oficio RVOE1234', '2019-01-16 23:30:12', NULL, NULL),
(15, 11, 2, 'dtadftf satftasft satfaradsf', '2019-01-16 23:31:42', NULL, NULL),
(16, 8, 2, NULL, '2019-01-17 05:25:28', NULL, NULL),
(17, 2, 3, 'Historia: \r\nRecargar un poco mas detalles historicos de creación, ', '2019-03-06 20:55:51', '2019-03-12 19:10:04', NULL),
(18, 3, 3, 'XXXXXXX', '2019-03-12 19:10:04', '2019-03-12 19:13:07', NULL),
(19, 4, 3, 'Asignación evaluación 2019-03-12', '2019-03-12 19:13:07', '2019-03-12 19:30:22', NULL),
(20, 5, 3, '100% de cumplimiento.', '2019-03-12 19:30:22', '2019-03-14 21:57:52', NULL),
(21, 2, 4, NULL, '2019-03-12 19:44:43', '2019-03-12 19:46:26', NULL),
(22, 3, 4, 'XXXXXX', '2019-03-12 19:46:26', '2019-03-12 21:53:04', NULL),
(23, 4, 4, 'Asignación evaluación 2019-03-12', '2019-03-12 21:53:04', '2019-03-12 22:23:24', NULL),
(24, 5, 4, NULL, '2019-03-12 22:23:24', NULL, NULL),
(25, 6, 3, 'Visita de inspeccion programada para: 2019-04-10', '2019-03-14 21:57:52', '2019-03-14 22:02:25', NULL),
(26, 7, 3, NULL, '2019-03-14 22:01:53', NULL, NULL),
(27, 7, 3, NULL, '2019-03-14 22:02:25', NULL, NULL),
(28, 2, 6, 'No es el mismo representante legal que se espcifica en la acta constitutitva.\r\n\r\ncreditos necesarios esta mal el nunmero\r\n\r\n\r\n', '2019-03-20 19:57:56', '2019-03-20 20:37:13', NULL),
(29, 3, 6, 'se le olvido FDA01\r\n', '2019-03-20 20:37:13', '2019-03-20 20:41:41', NULL),
(30, 4, 6, 'Asignación evaluación 2019-03-20', '2019-03-20 20:41:41', '2019-03-20 20:48:28', NULL),
(31, 5, 6, NULL, '2019-03-20 20:47:13', NULL, NULL),
(32, 5, 6, NULL, '2019-03-20 20:48:28', NULL, NULL),
(33, 2, 5, NULL, '2019-04-02 22:37:24', '2019-04-02 22:38:02', NULL),
(34, 3, 5, NULL, '2019-04-02 22:38:02', '2019-04-03 23:00:51', NULL),
(35, 4, 5, 'Asignación evaluación 2019-04-03', '2019-04-03 23:00:51', '2019-04-03 23:31:30', NULL),
(36, 5, 5, NULL, '2019-04-03 23:31:30', NULL, NULL),
(37, 2, 8, NULL, '2019-06-13 22:04:39', '2019-06-13 22:05:08', NULL),
(38, 3, 8, 'xx', '2019-06-13 22:05:08', '2019-06-13 22:06:47', NULL),
(39, 4, 8, 'Asignación evaluación 2019-06-13', '2019-06-13 22:06:47', '2019-06-13 22:09:37', NULL),
(40, 5, 8, NULL, '2019-06-13 22:09:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_usuarios`
--

CREATE TABLE `solicitudes_usuarios` (
  `id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudes_usuarios`
--

INSERT INTO `solicitudes_usuarios` (`id`, `solicitud_id`, `usuario_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 8, '2019-01-15 17:30:19', NULL, NULL),
(2, 2, 20, '2019-01-16 22:01:55', NULL, NULL),
(3, 3, 39, '2019-03-06 20:36:08', NULL, NULL),
(4, 4, 42, '2019-03-06 20:49:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testigos`
--

CREATE TABLE `testigos` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_instalaciones`
--

CREATE TABLE `tipo_instalaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_instalaciones`
--

INSERT INTO `tipo_instalaciones` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aula', 'Aulas', '2018-08-08 00:00:00', NULL, NULL),
(2, 'Cubículo', 'Área administrativa', '2018-08-08 00:00:00', NULL, NULL),
(3, 'Auditorio', 'Área administrativa', '2018-08-08 00:00:00', NULL, NULL),
(4, 'Laboratorio físico', 'Otros laboratorios y/o talleres', '2018-08-08 00:00:00', NULL, NULL),
(5, 'Laboratorio virtual', 'Laboratorio virtual', '2018-08-08 00:00:00', NULL, NULL),
(6, 'Taller físico', 'Otros talleres', '2018-08-08 00:00:00', NULL, NULL),
(7, 'Taller virtual', 'Taller virtual', '2018-08-08 00:00:00', NULL, NULL),
(8, 'Laboratorio de cómputo', 'Centro de cómputo', '2018-08-08 00:00:00', NULL, NULL),
(9, 'Biblioteca física', 'Centro de documentación o biblioteca', '2018-08-08 00:00:00', NULL, NULL),
(10, 'Biblioteca virtual', 'Biblioteca virtual', '2018-08-08 00:00:00', NULL, NULL),
(11, 'Otros', 'Otras áreas', '2018-09-11 00:00:00', NULL, NULL),
(12, 'Área administrativa', 'Área administrativa', '2018-09-11 00:00:00', NULL, NULL),
(13, 'Archivo muerto', 'Área para el archivo muerto', '2018-09-11 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solicitudes`
--

CREATE TABLE `tipo_solicitudes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_solicitudes`
--

INSERT INTO `tipo_solicitudes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nueva solicitud', 'Trámite para un nuevo RVOE', '2018-08-08 00:00:00', NULL, NULL),
(2, 'Modificación del plan de estudios', 'Modificación a planes y programas de estudios', '2018-08-08 00:00:00', NULL, NULL),
(3, 'Cambio domicilio', 'Cambio de domicilio de un RVOE ya existente', '2018-08-08 00:00:00', NULL, NULL),
(4, 'Cambio de representante legal', 'Cambio de representante legal', '2018-08-08 00:00:00', NULL, '2018-11-23 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trayectorias`
--

CREATE TABLE `trayectorias` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `programa_seguimiento` text COLLATE utf8_unicode_ci,
  `tipo_tutoria` text COLLATE utf8_unicode_ci,
  `estadisticas_titulacion` text COLLATE utf8_unicode_ci,
  `funcion_tutorial` text COLLATE utf8_unicode_ci,
  `modalidades_titulacion` text COLLATE utf8_unicode_ci,
  `tasa_egreso` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `trayectorias`
--

INSERT INTO `trayectorias` (`id`, `programa_id`, `programa_seguimiento`, `tipo_tutoria`, `estadisticas_titulacion`, `funcion_tutorial`, `modalidades_titulacion`, `tasa_egreso`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-15 17:49:18', NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-16 22:01:55', '2019-01-16 22:11:18', NULL),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-06 20:36:08', '2019-03-06 20:55:51', NULL),
(4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-12 18:33:43', '2019-04-02 22:37:24', NULL),
(5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-12 19:44:33', '2019-03-12 19:44:43', NULL),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-20 19:55:38', '2019-03-20 19:57:56', NULL),
(7, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-20 20:31:01', NULL, NULL),
(8, 8, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-13 21:56:39', '2019-06-13 22:04:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Matutino', 'Turno matutino', '2018-08-20 00:00:00', NULL, NULL),
(2, 'Vespertino', 'Turno vespertino', '2018-08-20 00:00:00', NULL, NULL),
(3, 'Nocturno', 'Turno nocturno', '2018-08-20 00:00:00', NULL, NULL),
(4, 'Mixto', 'Turno mixto', '2018-08-20 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `token_notificaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `persona_id`, `rol_id`, `usuario`, `contrasena`, `estatus`, `token_notificaciones`, `created_at`, `updated_at`, `deleted_at`) VALUES
(-1, -1, 1, 'WEBSERVICE', 'WEBSERVICE', 0, 'WEBSERVICE', '2018-11-28 15:00:00', NULL, NULL),
(1, 1, 1, 'SIN DATO', 'SIN DATO', 0, 'SIN DATO', '2018-11-28 15:00:00', '2018-12-25 00:02:01', NULL),
(2, 1, 2, 'admin', '21ecf30e0825fdbd43711873343f5dc2', 3, '0', '2018-11-28 15:00:00', '2019-05-30 02:11:21', NULL),
(3, 2, 9, 'alicia.alvarez@jalisco.gob.mx', 'c7d27fcddc2dbc00ad533b5ecb379676', 3, NULL, '2018-12-25 00:13:38', '2018-12-25 00:18:52', NULL),
(4, 3, 3, 'TEST01', '3fc0a7acf087f549ac2b266baf94b8b1', 3, NULL, '2019-01-08 03:51:26', '2019-01-08 03:53:38', '2019-01-08 04:56:09'),
(5, 4, 3, 'UTEG', '78bdc0cf0bc99864204f78b8f738fe26', 2, NULL, '2019-01-09 02:09:37', NULL, '2019-01-09 02:15:37'),
(6, 5, 3, 'prueba', '3fc0a7acf087f549ac2b266baf94b8b1', 3, NULL, '2019-01-09 02:16:31', '2019-01-12 03:00:53', NULL),
(7, 7, 4, 'GESTORPRUEBA', 'a35676b4a72d88ea33b77ffead936aea', 3, NULL, '2019-01-16 00:12:45', '2019-01-16 01:40:25', '2019-02-09 02:44:42'),
(8, 11, 7, 'controldoc', '3fc0a7acf087f549ac2b266baf94b8b1', 3, NULL, '2019-01-16 01:34:46', '2019-02-15 01:31:28', NULL),
(9, 12, 11, 'JEFEDEINSPECCIONPRUEBA', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, NULL, '2019-01-16 23:11:11', '2019-01-17 02:04:23', NULL),
(10, 13, 6, 'INSPECTORPRUEBA', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, '-1', '2019-01-16 23:31:42', '2019-04-12 02:23:17', NULL),
(11, 14, 8, 'CONSULTAPRUEBA', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, NULL, '2019-01-17 00:05:58', '2019-02-20 00:05:19', NULL),
(12, 15, 10, 'EVALUADORPRUEBA', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, '-1', '2019-01-17 00:08:21', '2019-02-28 04:34:08', NULL),
(13, 16, 12, 'CONTROLESCOLARIESPRUEBA', '58b4e38f66bcdb546380845d6af27187', 2, NULL, '2019-01-17 00:10:51', NULL, NULL),
(14, 17, 13, 'CONTROLESCOLARSICYTPRUEBA', '58b4e38f66bcdb546380845d6af27187', 2, NULL, '2019-01-17 00:14:40', NULL, NULL),
(15, 18, 3, 'PRUEBAUAG', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, '-1', '2019-01-17 04:40:10', '2019-02-28 04:27:38', NULL),
(16, 23, 5, 'EVALUADOR2PRUEBA', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, '-1', '2019-01-17 05:24:04', '2019-02-28 02:48:03', NULL),
(17, 24, 3, 'prbazteca', '7c79dd68b400e6b0c9f99f8f221dae26', 1, NULL, '2019-02-06 02:46:05', NULL, '2019-02-07 02:16:54'),
(18, 25, 3, 'cristian', '3fc0a7acf087f549ac2b266baf94b8b1', 1, NULL, '2019-02-07 02:15:59', NULL, '2019-02-07 02:16:51'),
(19, 26, 3, 'Erick', '602ff49890c2812c1042234179869f65', 1, NULL, '2019-02-21 23:21:19', '2019-02-21 23:24:53', '2019-02-21 23:25:38'),
(20, 27, 3, 'erickPrueba', '2af9b1ba42dc5eb01743e6b3759b6e4b', 3, NULL, '2019-02-21 23:26:40', '2019-02-22 01:25:30', NULL),
(21, 28, 3, 'MargaritaPrueba', '2af9b1ba42dc5eb01743e6b3759b6e4b', 2, NULL, '2019-02-21 23:27:45', NULL, '2019-02-21 23:30:10'),
(22, 29, 3, 'Margarita', '3fc0a7acf087f549ac2b266baf94b8b1', 2, NULL, '2019-02-21 23:30:52', NULL, '2019-02-21 23:33:37'),
(23, 30, 3, 'Maggie', '2c178ee0867adc5e6e0a320db6c80e96', 0, NULL, '2019-02-21 23:40:42', '2019-02-21 23:43:30', '2019-02-21 23:43:37'),
(24, 31, 3, 'Mag', '3fc0a7acf087f549ac2b266baf94b8b1', 3, NULL, '2019-02-21 23:46:01', '2019-02-22 00:11:05', NULL),
(25, 32, 3, 'Sergio Davalos', 'e31a4afb390b7ec20b25518ebcf58dfa', 1, NULL, '2019-02-22 00:23:22', NULL, NULL),
(27, 33, 4, 'Dulceprueba', '915a8e90380fe3a15be31ea085e83574', 3, NULL, '2019-02-22 00:40:25', '2019-02-22 01:26:34', NULL),
(28, 36, 3, 'TEST02', '2c178ee0867adc5e6e0a320db6c80e96', 0, NULL, '2019-02-28 01:02:43', '2019-02-28 01:07:35', '2019-02-28 01:07:39'),
(29, 37, 3, 'prueba03', '3fc0a7acf087f549ac2b266baf94b8b1', 3, NULL, '2019-03-07 00:35:32', '2019-03-07 03:39:56', NULL),
(30, 49, 3, 'edelacruz', 'ea4c300a96204088490431d3f71358b1', 1, NULL, '2019-05-25 21:20:11', NULL, NULL),
(31, 52, 3, 'REPRESENTANTE', '2fa82b8fb16144c3c39cdf5b5bfe4b86', 3, NULL, '2019-06-18 02:24:26', '2019-06-18 02:24:58', NULL),
(32, 53, 3, 'Hector Roberto Cervantes Torres', '8fb8f0a46461f62823f94a23f0e1d2da', 1, NULL, '2019-06-22 01:26:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuarios`
--

CREATE TABLE `usuario_usuarios` (
  `id` int(11) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `secundario_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_usuarios`
--

INSERT INTO `usuario_usuarios` (`id`, `principal_id`, `secundario_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 6, 7, '2019-01-15 17:12:45', NULL, NULL),
(5, 20, 27, '2019-02-21 17:40:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validaciones`
--

CREATE TABLE `validaciones` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_institucion_emisora` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_expedicion` date DEFAULT NULL,
  `documento_retenido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oficio_respuesta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oficio_envio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_acreditacion` date DEFAULT NULL,
  `plan_anterior` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clave_centro_trabajo_emisor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_envio_oficio` date DEFAULT NULL,
  `fecha_respuesta` date DEFAULT NULL,
  `situacion_documento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `fecha_actualizacion` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `valumnos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `valumnos` (
`clave_ies` varchar(255)
,`clave_centro_trabajo` varchar(255)
,`nombre_ies` varchar(255)
,`alumno_id` int(11)
,`matricula` varchar(255)
,`nombre` varchar(255)
,`apellido_paterno` varchar(255)
,`apellido_materno` varchar(255)
,`curp` varchar(255)
,`carrera` varchar(255)
,`total_creditos` int(11)
,`total_asignaturas` bigint(21)
,`tipo_ciclo` varchar(255)
,`plan_estudios` varchar(4)
,`acuerdo_rvoe` varchar(255)
,`modalidad` varchar(255)
,`acreditacion` varchar(16)
,`promedio` double
,`fecha_inicio` varchar(10)
,`fecha_fin` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vkardex`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vkardex` (
`grado` varchar(255)
,`alumno_id` int(11)
,`fecha_examen` date
,`asignatura_id` int(11)
,`asignatura` varchar(255)
,`calificacion` varchar(255)
,`tipo` int(11)
,`ciclo_escolar_id` int(11)
,`ciclo_escolar_nombre` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vpagos_instituciones_solicitudes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vpagos_instituciones_solicitudes` (
`institucion_id` int(11)
,`nombre_institucion` varchar(255)
,`usuario_id` int(11)
,`solicitud_id` int(11)
,`folio_solicitud` varchar(255)
,`pago_id` int(11)
,`concepto` varchar(255)
,`monto` decimal(10,2)
,`cobertura` int(11)
,`fecha_pago` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `valumnos`
--
DROP TABLE IF EXISTS `valumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`uk55ea5yigkp`@`localhost` SQL SECURITY DEFINER VIEW `valumnos`  AS  select `instituciones`.`clave_ies` AS `clave_ies`,`planteles`.`clave_centro_trabajo` AS `clave_centro_trabajo`,`instituciones`.`nombre` AS `nombre_ies`,`alumnos`.`id` AS `alumno_id`,`alumnos`.`matricula` AS `matricula`,`personas`.`nombre` AS `nombre`,`personas`.`apellido_paterno` AS `apellido_paterno`,`personas`.`apellido_materno` AS `apellido_materno`,`personas`.`curp` AS `curp`,`programas`.`nombre` AS `carrera`,`programas`.`creditos` AS `total_creditos`,(select count(0) from `asignaturas` where (`asignaturas`.`programa_id` = `alumnos`.`programa_id`)) AS `total_asignaturas`,`ciclos`.`nombre` AS `tipo_ciclo`,substr(`programas`.`vigencia`,1,4) AS `plan_estudios`,`programas`.`acuerdo_rvoe` AS `acuerdo_rvoe`,`modalidades`.`nombre` AS `modalidad`,concat('BASE/',`programas`.`calificacion_maxima`) AS `acreditacion`,avg(`calificaciones`.`calificacion`) AS `promedio`,substr(`alumnos`.`created_at`,1,10) AS `fecha_inicio`,(select `calificaciones`.`fecha_examen` from `calificaciones` where (`calificaciones`.`alumno_id` = `alumnos`.`id`) order by `calificaciones`.`fecha_examen` desc limit 1) AS `fecha_fin` from (((((((`alumnos` join `personas` on((`alumnos`.`persona_id` = `personas`.`id`))) join `programas` on((`alumnos`.`programa_id` = `programas`.`id`))) join `planteles` on((`programas`.`plantel_id` = `planteles`.`id`))) join `instituciones` on((`planteles`.`institucion_id` = `instituciones`.`id`))) join `modalidades` on((`programas`.`modalidad_id` = `modalidades`.`id`))) join `ciclos` on((`programas`.`ciclo_id` = `ciclos`.`id`))) join `calificaciones` on((`alumnos`.`id` = `calificaciones`.`alumno_id`))) where (isnull(`alumnos`.`deleted_at`) and isnull(`calificaciones`.`deleted_at`)) group by `calificaciones`.`alumno_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vkardex`
--
DROP TABLE IF EXISTS `vkardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`uk55ea5yigkp`@`localhost` SQL SECURITY DEFINER VIEW `vkardex`  AS  select `asignaturas`.`grado` AS `grado`,`calificaciones`.`alumno_id` AS `alumno_id`,`calificaciones`.`fecha_examen` AS `fecha_examen`,`asignaturas`.`id` AS `asignatura_id`,`asignaturas`.`nombre` AS `asignatura`,`calificaciones`.`calificacion` AS `calificacion`,`calificaciones`.`tipo` AS `tipo`,`ciclos_escolares`.`id` AS `ciclo_escolar_id`,`ciclos_escolares`.`nombre` AS `ciclo_escolar_nombre` from (((`calificaciones` join `asignaturas` on((`calificaciones`.`asignatura_id` = `asignaturas`.`id`))) join `grupos` on((`calificaciones`.`grupo_id` = `grupos`.`id`))) join `ciclos_escolares` on((`grupos`.`ciclo_escolar_id` = `ciclos_escolares`.`id`))) where isnull(`calificaciones`.`deleted_at`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vpagos_instituciones_solicitudes`
--
DROP TABLE IF EXISTS `vpagos_instituciones_solicitudes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`uk55ea5yigkp`@`localhost` SQL SECURITY DEFINER VIEW `vpagos_instituciones_solicitudes`  AS  select `i`.`id` AS `institucion_id`,`i`.`nombre` AS `nombre_institucion`,`i`.`usuario_id` AS `usuario_id`,`s`.`id` AS `solicitud_id`,`s`.`folio` AS `folio_solicitud`,`p`.`id` AS `pago_id`,`p`.`concepto` AS `concepto`,`p`.`monto` AS `monto`,`p`.`cobertura` AS `cobertura`,`p`.`fecha_pago` AS `fecha_pago` from ((`instituciones` `i` join `solicitudes` `s`) join `pagos` `p`) where (isnull(`i`.`deleted_at`) and isnull(`s`.`deleted_at`) and isnull(`p`.`deleted_at`) and (`i`.`usuario_id` = `s`.`usuario_id`) and (`s`.`id` = `p`.`solicitud_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academias`
--
ALTER TABLE `academias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `situacion_id` (`situacion_id`);

--
-- Indices de la tabla `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `alumno_observaciones`
--
ALTER TABLE `alumno_observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infraestructura_id` (`infraestructura_id`),
  ADD KEY `docente_id` (`docente_id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `asignaturas_hemerobibliograficas`
--
ALTER TABLE `asignaturas_hemerobibliograficas`
  ADD KEY `asignatura_id` (`asignatura_id`),
  ADD KEY `hemerobibliografica_id` (`hemerobibliografica_id`);

--
-- Indices de la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `asignatura_id` (`asignatura_id`),
  ADD KEY `estatus_calificacion_id` (`estatus_calificacion_id`);

--
-- Indices de la tabla `categorias_evaluacion_pregunta`
--
ALTER TABLE `categorias_evaluacion_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclos_escolares`
--
ALTER TABLE `ciclos_escolares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cumplimientos`
--
ALTER TABLE `cumplimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modalidad_id` (`modalidad_id`);

--
-- Indices de la tabla `dictamenes`
--
ALTER TABLE `dictamenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_evaluacion_id` (`programa_evaluacion_id`),
  ADD KEY `evaluacion_apartado_id` (`evaluacion_apartado_id`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `edificios_niveles`
--
ALTER TABLE `edificios_niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `escalas`
--
ALTER TABLE `escalas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `espejos`
--
ALTER TABLE `espejos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mixta_noescolarizada_id` (`mixta_noescolarizada_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus_calificaciones`
--
ALTER TABLE `estatus_calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus_inspeccion`
--
ALTER TABLE `estatus_inspeccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus_solicitudes`
--
ALTER TABLE `estatus_solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `evaluaciones_evaluacion_preguntas`
--
ALTER TABLE `evaluaciones_evaluacion_preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion_apartados`
--
ALTER TABLE `evaluacion_apartados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion_preguntas`
--
ALTER TABLE `evaluacion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluacion_apartado_id` (`evaluacion_apartado_id`),
  ADD KEY `modalidad_id` (`modalidad_id`),
  ADD KEY `categoria_evaluacion_pregunta_id` (`categoria_evaluacion_pregunta_id`),
  ADD KEY `escala_id` (`escala_id`);

--
-- Indices de la tabla `evaluacion_procesos`
--
ALTER TABLE `evaluacion_procesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `evaluadores_modalidades`
--
ALTER TABLE `evaluadores_modalidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`),
  ADD KEY `modalidad_id` (`modalidad_id`);

--
-- Indices de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `formaciones`
--
ALTER TABLE `formaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turno_id` (`turno_id`);

--
-- Indices de la tabla `hemerobibliograficas`
--
ALTER TABLE `hemerobibliograficas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`);

--
-- Indices de la tabla `higienes`
--
ALTER TABLE `higienes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `infraestructuras`
--
ALTER TABLE `infraestructuras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`),
  ADD KEY `tipo_instalacion_id` (`tipo_instalacion_id`);

--
-- Indices de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspecciones_inspeccion_preguntas`
--
ALTER TABLE `inspecciones_inspeccion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inspeccion_id` (`inspeccion_id`),
  ADD KEY `inspeccion_pregunta_id` (`inspeccion_pregunta_id`);

--
-- Indices de la tabla `inspeccion_apartados`
--
ALTER TABLE `inspeccion_apartados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspeccion_categorias`
--
ALTER TABLE `inspeccion_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspeccion_observaciones`
--
ALTER TABLE `inspeccion_observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inspeccion_id` (`inspeccion_id`),
  ADD KEY `inspeccion_apartado_id` (`inspeccion_apartado_id`);

--
-- Indices de la tabla `inspeccion_preguntas`
--
ALTER TABLE `inspeccion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_inspeccion_tipo_pregunta` (`id_inspeccion_tipo_pregunta`),
  ADD KEY `id_inspeccion_categoria` (`id_inspeccion_categoria`),
  ADD KEY `id_inspeccion_apartado` (`id_inspeccion_apartado`);

--
-- Indices de la tabla `inspeccion_tipo_preguntas`
--
ALTER TABLE `inspeccion_tipo_preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspectores`
--
ALTER TABLE `inspectores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `institucionales`
--
ALTER TABLE `institucionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `mixta_noescolarizadas`
--
ALTER TABLE `mixta_noescolarizadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos_roles`
--
ALTER TABLE `modulos_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modulo_id` (`modulo_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficios`
--
ALTER TABLE `oficios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficio_detalles`
--
ALTER TABLE `oficio_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitud_id` (`solicitud_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domicilio_id` (`domicilio_id`);

--
-- Indices de la tabla `planteles`
--
ALTER TABLE `planteles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institucion_id` (`institucion_id`),
  ADD KEY `domicilio_id` (`domicilio_id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `planteles_edificios_niveles`
--
ALTER TABLE `planteles_edificios_niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planteles_higienes`
--
ALTER TABLE `planteles_higienes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planteles_seguridad_sistemas`
--
ALTER TABLE `planteles_seguridad_sistemas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantel_dictamenes`
--
ALTER TABLE `plantel_dictamenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`),
  ADD KEY `ciclo_id` (`ciclo_id`),
  ADD KEY `nivel_id` (`nivel_id`),
  ADD KEY `solicitud_id` (`solicitud_id`),
  ADD KEY `modalidad_id` (`modalidad_id`),
  ADD KEY `plantel_id` (`plantel_id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `programas_turnos`
--
ALTER TABLE `programas_turnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_id` (`programa_id`),
  ADD KEY `turno_id` (`turno_id`);

--
-- Indices de la tabla `programa_evaluaciones`
--
ALTER TABLE `programa_evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cumplimiento_id` (`cumplimiento_id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `ratificacion_nombres`
--
ALTER TABLE `ratificacion_nombres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institucion_id` (`institucion_id`);

--
-- Indices de la tabla `respaldos`
--
ALTER TABLE `respaldos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mixta_noescolarizada_id` (`mixta_noescolarizada_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salud_instituciones`
--
ALTER TABLE `salud_instituciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`);

--
-- Indices de la tabla `seguridad_sistemas`
--
ALTER TABLE `seguridad_sistemas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `situaciones`
--
ALTER TABLE `situaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_solicitud_id` (`tipo_solicitud_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `estatus_solicitud_id` (`estatus_solicitud_id`);

--
-- Indices de la tabla `solicitudes_estatus_solicitudes`
--
ALTER TABLE `solicitudes_estatus_solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estatus_solicitud_id` (`estatus_solicitud_id`),
  ADD KEY `solicitud_id` (`solicitud_id`);

--
-- Indices de la tabla `solicitudes_usuarios`
--
ALTER TABLE `solicitudes_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `testigos`
--
ALTER TABLE `testigos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `inspeccion_id` (`inspeccion_id`);

--
-- Indices de la tabla `tipo_instalaciones`
--
ALTER TABLE `tipo_instalaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_solicitudes`
--
ALTER TABLE `tipo_solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trayectorias`
--
ALTER TABLE `trayectorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_usuario_unique` (`usuario`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `usuario_usuarios`
--
ALTER TABLE `usuario_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `validaciones`
--
ALTER TABLE `validaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academias`
--
ALTER TABLE `academias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumno_observaciones`
--
ALTER TABLE `alumno_observaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3506;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_evaluacion_pregunta`
--
ALTER TABLE `categorias_evaluacion_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ciclos_escolares`
--
ALTER TABLE `ciclos_escolares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cumplimientos`
--
ALTER TABLE `cumplimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `dictamenes`
--
ALTER TABLE `dictamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `edificios_niveles`
--
ALTER TABLE `edificios_niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `escalas`
--
ALTER TABLE `escalas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `espejos`
--
ALTER TABLE `espejos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `estatus_calificaciones`
--
ALTER TABLE `estatus_calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatus_inspeccion`
--
ALTER TABLE `estatus_inspeccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estatus_solicitudes`
--
ALTER TABLE `estatus_solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluaciones_evaluacion_preguntas`
--
ALTER TABLE `evaluaciones_evaluacion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=612;

--
-- AUTO_INCREMENT de la tabla `evaluacion_apartados`
--
ALTER TABLE `evaluacion_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `evaluacion_preguntas`
--
ALTER TABLE `evaluacion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `evaluacion_procesos`
--
ALTER TABLE `evaluacion_procesos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evaluadores_modalidades`
--
ALTER TABLE `evaluadores_modalidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `formaciones`
--
ALTER TABLE `formaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hemerobibliograficas`
--
ALTER TABLE `hemerobibliograficas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `higienes`
--
ALTER TABLE `higienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `infraestructuras`
--
ALTER TABLE `infraestructuras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inspecciones_inspeccion_preguntas`
--
ALTER TABLE `inspecciones_inspeccion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `inspeccion_apartados`
--
ALTER TABLE `inspeccion_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inspeccion_categorias`
--
ALTER TABLE `inspeccion_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `inspeccion_observaciones`
--
ALTER TABLE `inspeccion_observaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inspeccion_preguntas`
--
ALTER TABLE `inspeccion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `inspeccion_tipo_preguntas`
--
ALTER TABLE `inspeccion_tipo_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inspectores`
--
ALTER TABLE `inspectores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `institucionales`
--
ALTER TABLE `institucionales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mixta_noescolarizadas`
--
ALTER TABLE `mixta_noescolarizadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `modulos_roles`
--
ALTER TABLE `modulos_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `oficios`
--
ALTER TABLE `oficios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `oficio_detalles`
--
ALTER TABLE `oficio_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `planteles`
--
ALTER TABLE `planteles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `planteles_edificios_niveles`
--
ALTER TABLE `planteles_edificios_niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planteles_higienes`
--
ALTER TABLE `planteles_higienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `planteles_seguridad_sistemas`
--
ALTER TABLE `planteles_seguridad_sistemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `plantel_dictamenes`
--
ALTER TABLE `plantel_dictamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `programas_turnos`
--
ALTER TABLE `programas_turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `programa_evaluaciones`
--
ALTER TABLE `programa_evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ratificacion_nombres`
--
ALTER TABLE `ratificacion_nombres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `respaldos`
--
ALTER TABLE `respaldos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `salud_instituciones`
--
ALTER TABLE `salud_instituciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seguridad_sistemas`
--
ALTER TABLE `seguridad_sistemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `situaciones`
--
ALTER TABLE `situaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `solicitudes_estatus_solicitudes`
--
ALTER TABLE `solicitudes_estatus_solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `solicitudes_usuarios`
--
ALTER TABLE `solicitudes_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `testigos`
--
ALTER TABLE `testigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_instalaciones`
--
ALTER TABLE `tipo_instalaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipo_solicitudes`
--
ALTER TABLE `tipo_solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `trayectorias`
--
ALTER TABLE `trayectorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `usuario_usuarios`
--
ALTER TABLE `usuario_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `validaciones`
--
ALTER TABLE `validaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`situacion_id`) REFERENCES `situaciones` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_3` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_4` FOREIGN KEY (`situacion_id`) REFERENCES `situaciones` (`id`);

--
-- Filtros para la tabla `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  ADD CONSTRAINT `alumnos_grupos_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_3` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_4` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`);

--
-- Filtros para la tabla `alumno_observaciones`
--
ALTER TABLE `alumno_observaciones`
  ADD CONSTRAINT `alumno_observaciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumno_observaciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `alumno_observaciones_ibfk_3` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumno_observaciones_ibfk_4` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`infraestructura_id`) REFERENCES `infraestructuras` (`id`),
  ADD CONSTRAINT `asignaturas_ibfk_2` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`);

--
-- Filtros para la tabla `asignaturas_hemerobibliograficas`
--
ALTER TABLE `asignaturas_hemerobibliograficas`
  ADD CONSTRAINT `asignaturas_hemerobibliograficas_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `asignaturas_hemerobibliograficas_ibfk_2` FOREIGN KEY (`hemerobibliografica_id`) REFERENCES `hemerobibliograficas` (`id`);

--
-- Filtros para la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  ADD CONSTRAINT `asociaciones_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD CONSTRAINT `bitacoras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_3` FOREIGN KEY (`estatus_calificacion_id`) REFERENCES `estatus_calificaciones` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_4` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_5` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_6` FOREIGN KEY (`estatus_calificacion_id`) REFERENCES `estatus_calificaciones` (`id`);

--
-- Filtros para la tabla `cumplimientos`
--
ALTER TABLE `cumplimientos`
  ADD CONSTRAINT `cumplimientos_ibfk_1` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidades` (`id`);

--
-- Filtros para la tabla `dictamenes`
--
ALTER TABLE `dictamenes`
  ADD CONSTRAINT `dictamenes_ibfk_1` FOREIGN KEY (`programa_evaluacion_id`) REFERENCES `programa_evaluaciones` (`id`),
  ADD CONSTRAINT `dictamenes_ibfk_2` FOREIGN KEY (`evaluacion_apartado_id`) REFERENCES `evaluacion_apartados` (`id`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `docentes_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `espejos`
--
ALTER TABLE `espejos`
  ADD CONSTRAINT `espejos_ibfk_1` FOREIGN KEY (`mixta_noescolarizada_id`) REFERENCES `mixta_noescolarizadas` (`id`);

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `evaluaciones_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`);

--
-- Filtros para la tabla `evaluacion_procesos`
--
ALTER TABLE `evaluacion_procesos`
  ADD CONSTRAINT `evaluacion_procesos_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  ADD CONSTRAINT `evaluadores_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `evaluadores_modalidades`
--
ALTER TABLE `evaluadores_modalidades`
  ADD CONSTRAINT `evaluadores_modalidades_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`),
  ADD CONSTRAINT `evaluadores_modalidades_ibfk_2` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidades` (`id`);

--
-- Filtros para la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD CONSTRAINT `experiencias_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `formaciones`
--
ALTER TABLE `formaciones`
  ADD CONSTRAINT `formaciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`);

--
-- Filtros para la tabla `hemerobibliograficas`
--
ALTER TABLE `hemerobibliograficas`
  ADD CONSTRAINT `hemerobibliograficas_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`),
  ADD CONSTRAINT `hemerobibliograficas_ibfk_2` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`);

--
-- Filtros para la tabla `infraestructuras`
--
ALTER TABLE `infraestructuras`
  ADD CONSTRAINT `infraestructuras_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`),
  ADD CONSTRAINT `infraestructuras_ibfk_2` FOREIGN KEY (`tipo_instalacion_id`) REFERENCES `tipo_instalaciones` (`id`);

--
-- Filtros para la tabla `inspecciones_inspeccion_preguntas`
--
ALTER TABLE `inspecciones_inspeccion_preguntas`
  ADD CONSTRAINT `inspecciones_inspeccion_preguntas_ibfk_1` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`),
  ADD CONSTRAINT `inspecciones_inspeccion_preguntas_ibfk_2` FOREIGN KEY (`inspeccion_pregunta_id`) REFERENCES `inspeccion_preguntas` (`id`);

--
-- Filtros para la tabla `inspeccion_observaciones`
--
ALTER TABLE `inspeccion_observaciones`
  ADD CONSTRAINT `inspeccion_observaciones_ibfk_1` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`),
  ADD CONSTRAINT `inspeccion_observaciones_ibfk_2` FOREIGN KEY (`inspeccion_apartado_id`) REFERENCES `inspeccion_apartados` (`id`);

--
-- Filtros para la tabla `inspeccion_preguntas`
--
ALTER TABLE `inspeccion_preguntas`
  ADD CONSTRAINT `inspeccion_preguntas_ibfk_1` FOREIGN KEY (`id_inspeccion_tipo_pregunta`) REFERENCES `inspeccion_tipo_preguntas` (`id`),
  ADD CONSTRAINT `inspeccion_preguntas_ibfk_2` FOREIGN KEY (`id_inspeccion_apartado`) REFERENCES `inspeccion_apartados` (`id`),
  ADD CONSTRAINT `inspeccion_preguntas_ibfk_3` FOREIGN KEY (`id_inspeccion_categoria`) REFERENCES `inspeccion_categorias` (`id`);

--
-- Filtros para la tabla `inspectores`
--
ALTER TABLE `inspectores`
  ADD CONSTRAINT `inspectores_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `institucionales`
--
ALTER TABLE `institucionales`
  ADD CONSTRAINT `institucionales_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD CONSTRAINT `instituciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `modulos_roles`
--
ALTER TABLE `modulos_roles`
  ADD CONSTRAINT `modulos_roles_ibfk_1` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `modulos_roles_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id`);

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilios` (`id`);

--
-- Filtros para la tabla `planteles`
--
ALTER TABLE `planteles`
  ADD CONSTRAINT `planteles_ibfk_1` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id`),
  ADD CONSTRAINT `planteles_ibfk_2` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilios` (`id`),
  ADD CONSTRAINT `planteles_ibfk_3` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `plantel_dictamenes`
--
ALTER TABLE `plantel_dictamenes`
  ADD CONSTRAINT `plantel_dictamenes_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`);

--
-- Filtros para la tabla `programas_turnos`
--
ALTER TABLE `programas_turnos`
  ADD CONSTRAINT `programas_turnos_ibfk_2` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `ratificacion_nombres`
--
ALTER TABLE `ratificacion_nombres`
  ADD CONSTRAINT `ratificacion_nombres_ibfk_1` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id`);

--
-- Filtros para la tabla `respaldos`
--
ALTER TABLE `respaldos`
  ADD CONSTRAINT `respaldos_ibfk_1` FOREIGN KEY (`mixta_noescolarizada_id`) REFERENCES `mixta_noescolarizadas` (`id`);

--
-- Filtros para la tabla `salud_instituciones`
--
ALTER TABLE `salud_instituciones`
  ADD CONSTRAINT `salud_instituciones_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`tipo_solicitud_id`) REFERENCES `tipo_solicitudes` (`id`),
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`estatus_solicitud_id`) REFERENCES `estatus_solicitudes` (`id`);

--
-- Filtros para la tabla `solicitudes_estatus_solicitudes`
--
ALTER TABLE `solicitudes_estatus_solicitudes`
  ADD CONSTRAINT `solicitudes_estatus_solicitudes_ibfk_1` FOREIGN KEY (`estatus_solicitud_id`) REFERENCES `estatus_solicitudes` (`id`),
  ADD CONSTRAINT `solicitudes_estatus_solicitudes_ibfk_2` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id`);

--
-- Filtros para la tabla `testigos`
--
ALTER TABLE `testigos`
  ADD CONSTRAINT `testigos_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `testigos_ibfk_2` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `validaciones`
--
ALTER TABLE `validaciones`
  ADD CONSTRAINT `validaciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `validaciones_ibfk_2` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
