-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2023 a las 13:19:10
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asistencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `id` int(11) NOT NULL,
  `ingreso` datetime NOT NULL,
  `salida` datetime DEFAULT NULL,
  `fecha` date NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `estado` enum('1','2','3','4') COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`id`, `ingreso`, `salida`, `fecha`, `id_estudiante`, `estado`) VALUES
(1, '2023-10-10 00:17:32', '2023-10-10 00:57:20', '2023-10-10', 1, '1'),
(2, '2023-10-10 00:18:04', '2023-10-10 00:55:06', '2023-10-10', 2, '1'),
(3, '2023-10-10 00:49:32', '2023-10-10 00:57:32', '2023-10-10', 3, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `estado`) VALUES
(1, 'Temprano', 1),
(2, 'Tarde', 1),
(3, 'Noche', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'CALDERIA BUEN SABOR', '948747767', 'elbuensabor@gmail.com', 'MAZAMARI - PERÚ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_carrera` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `codigo`, `nombre`, `apellido`, `telefono`, `direccion`, `estado`, `id_carrera`, `id_nivel`) VALUES
(1, '20989270', 'CELEDONIA', 'GOMEZ', '948747767', 'Av. el pangoa', 1, 1, 5),
(2, '70469856', 'ALVIERE', 'CABELLO', '973151312', 'Av. Los Sinchis Psj. Quiñonez', 1, 3, 2),
(3, '60605050', 'DESYSI', 'TINEO', '984522134', 'Av. malvinas 123', 1, 2, 3),
(4, '75467684', 'CIELO', 'TORRES', '980942534', 'Av. el pangoa', 1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `estado`) VALUES
(1, 'Gerente', 1),
(2, 'Cajero', 1),
(3, 'Mozo', 1),
(4, 'Ayudante de Cocina', 1),
(5, 'Cocinera', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `perfil` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `clave`, `direccion`, `perfil`, `estado`) VALUES
(1, 'CALDERIA BUEN SABOR', 'elbuensabor@gmail.com', '$2y$10$VWAkY6.6U3RLfGKLTCVQv.GXNyXMVcXoDOn5BboKDvIRIa5En4QAK', 'Av. Cultura', '', 1),
(2, 'ANA LOPEZ', 'juliolopez12@gmail.com', '$2y$10$fSc7hlUVkqcGCR.9iLw6eeMnuy9Nz50Wf3C13yJtqrb2RUviQtrqK', 'home', NULL, 0),
(3, 'ADRIAN CABELLO ', 'adriancabello@gmail.com', '$2y$10$Rzc3NekK1Mgcv9dy7BDQ..oGm2v3DcdvQ5OWduwQidGIqavU7IWrW', 'Av. primer de mayo', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
