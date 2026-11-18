-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-11-2026 a las 18:54:28
-- Versión del servidor: 8.0.41
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corresponde a`
--

CREATE TABLE `corresponde a` (
  `id_solicitud` int NOT NULL,
  `id_servicio` int NOT NULL,
  `perfil` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id_material` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `costo_unitario` float NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `id_usuario` int NOT NULL,
  `id_solicitud` int NOT NULL,
  `perfil` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `categoria` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `precio_base` float NOT NULL,
  `imagen` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `categoria`, `descripcion`, `precio_base`, `imagen`) VALUES
(1, 'Tapizado completo de asientos', 'TapicerÃ­a automotriz', 'Cambio total del forro de asientos delanteros y traseros en vinil o piel sintÃ©tica con costuras reforzadas.', 8500, 'tapiza_asientos.jpg'),
(2, 'Retapizado de volante', 'TapicerÃ­a automotriz', 'Forrado del volante en piel con costura a mano y agarre antiderrapante.', 1200, 'volante_piel.jpg'),
(3, 'Cambio de cielo de auto', 'TapicerÃ­a automotriz', 'Reemplazo del forro del techo interior con espuma nueva para eliminar hundimientos.', 2300, 'cielo_auto.jpg'),
(4, 'Tapizado de puertas', 'TapicerÃ­a automotriz', 'RenovaciÃ³n de paneles de puertas con vinil o tela automotriz a elecciÃ³n.', 3200, 'puertas_auto.jpg'),
(5, 'Fundas a la medida', 'TapicerÃ­a automotriz', 'Fundas ajustadas para asientos en neopreno o vinil con diseÃ±o personalizado.', 2800, 'fundas_medida.jpg'),
(6, 'ReparaciÃ³n de rasgaduras', 'TapicerÃ­a automotriz', 'ReparaciÃ³n y resane de rasgaduras o quemaduras en asientos de piel o vinil.', 650, 'repara_asiento.jpg'),
(7, 'Tapizado de consola central', 'TapicerÃ­a automotriz', 'Forrado de consola y descansabrazos con material y costura a juego.', 1400, 'consola_central.jpg'),
(8, 'Alfombrado interior completo', 'TapicerÃ­a automotriz', 'InstalaciÃ³n de alfombra moldeada nueva en piso y cajuela del vehÃ­culo.', 3600, 'alfombra_auto.jpg'),
(9, 'Tapizado de cabecera', 'TapicerÃ­a automotriz', 'RenovaciÃ³n de cabeceras con relleno nuevo y forro de piel sintÃ©tica.', 450, 'cabeceras.jpg'),
(10, 'Tapizado de pick-up', 'TapicerÃ­a automotriz', 'Forrado de asientos de camioneta pick-up con vinil de alto trÃ¡fico.', 7200, 'asientos_pickup.jpg'),
(11, 'Tapizado de motocicleta', 'TapicerÃ­a automotriz', 'Retapizado de asiento de moto con vinil antiderrapante e impermeable.', 950, 'asiento_moto.jpg'),
(12, 'Tapizado de auto clÃ¡sico', 'TapicerÃ­a automotriz', 'RestauraciÃ³n de interiores de autos clÃ¡sicos con materiales de Ã©poca.', 15000, 'auto_clasico.jpg'),
(13, 'Tapizado de van', 'TapicerÃ­a automotriz', 'Forrado de asientos y paneles de van o camioneta de pasajeros.', 11500, 'tapizado_van.jpg'),
(14, 'Tapizado de tablero', 'TapicerÃ­a automotriz', 'Forrado de tablero con vinil texturizado y costura decorativa.', 2600, 'tablero_auto.jpg'),
(15, 'Cambio de espuma de asiento', 'TapicerÃ­a automotriz', 'SustituciÃ³n de espuma desgastada para recuperar comodidad y soporte.', 1500, 'espuma_asiento.jpg'),
(16, 'Asientos deportivos', 'TapicerÃ­a automotriz', 'Tapizado estilo deportivo con costura en contraste y logotipo bordado.', 9800, 'asiento_sport.jpg'),
(17, 'Tapizado de cajuela', 'TapicerÃ­a automotriz', 'Forrado de interior de cajuela con tela resistente y acabado limpio.', 1800, 'cajuela_auto.jpg'),
(18, 'Retapizado de sillÃ³n', 'TapicerÃ­a de muebles', 'Cambio de tela y relleno de sillÃ³n individual con acabado profesional.', 2800, 'retapiza_sillon.jpg'),
(19, 'Tapizado de sala completa', 'TapicerÃ­a de muebles', 'Retapizado de sala de tres piezas con tela antimanchas a elecciÃ³n.', 12500, 'sala_completa.jpg'),
(20, 'Tapizado de comedor', 'TapicerÃ­a de muebles', 'RenovaciÃ³n de asientos de sillas de comedor con tela o vinil lavable.', 1600, 'sillas_comedor.jpg'),
(21, 'Cabecera acolchada', 'TapicerÃ­a de muebles', 'FabricaciÃ³n de cabecera de cama con capitonÃ© y botones forrados.', 3400, 'cabecera_cama.jpg'),
(22, 'Tapizado de sofÃ¡ cama', 'TapicerÃ­a de muebles', 'Retapizado de sofÃ¡ cama con revisiÃ³n del mecanismo y relleno nuevo.', 6800, 'sofa_cama.jpg'),
(23, 'Tapizado de silla de oficina', 'TapicerÃ­a de muebles', 'Cambio de forro y espuma en sillas ejecutivas y de escritorio.', 900, 'silla_oficina.jpg'),
(24, 'Tapizado de puff', 'TapicerÃ­a de muebles', 'FabricaciÃ³n y forrado de puff decorativo en tela o piel sintÃ©tica.', 750, 'puff.jpg'),
(25, 'Tapizado de banca', 'TapicerÃ­a de muebles', 'Forrado de bancas para recibidor o pie de cama con espuma de alta densidad.', 2100, 'banca_tapizada.jpg'),
(26, 'RestauraciÃ³n de antigÃŒedades', 'TapicerÃ­a de muebles', 'RestauraciÃ³n de muebles antiguos con tÃ©cnicas tradicionales y materiales finos.', 9500, 'restaura_antigua.jpg'),
(27, 'Tapizado de taburetes', 'TapicerÃ­a de muebles', 'Forrado de taburetes de barra o cocina con vinil resistente al uso.', 550, 'taburetes.jpg'),
(28, 'Tapizado de reposet', 'TapicerÃ­a de muebles', 'Retapizado de reposet reclinable con revisiÃ³n de mecanismo.', 4200, 'reposet.jpg'),
(29, 'Cambio de resortes de sillÃ³n', 'TapicerÃ­a de muebles', 'Reemplazo de resortes y cinchas daÃ±adas para devolver firmeza al sillÃ³n.', 1900, 'resortes_sillon.jpg'),
(30, 'Tapizado de cojines', 'TapicerÃ­a de muebles', 'FabricaciÃ³n de cojines con relleno de fibra o espuma a la medida.', 350, 'cojines.jpg'),
(31, 'Tapizado de recibidor', 'TapicerÃ­a de muebles', 'Forrado de mueble recibidor con tela decorativa y costuras limpias.', 2500, 'recibidor.jpg'),
(32, 'Tapizado de pared acolchada', 'TapicerÃ­a de muebles', 'Paneles de pared acolchados decorativos con tela o piel sintÃ©tica.', 5800, 'pared_acolchada.jpg'),
(33, 'Tapizado de sillÃ³n orejero', 'TapicerÃ­a de muebles', 'Retapizado de sillÃ³n orejero con tela de diseÃ±o y patas restauradas.', 5200, 'sillon_orejero.jpg'),
(34, 'Tapizado de sillas para restaurante', 'TapicerÃ­a de muebles', 'Retapizado de sillas por lote con vinil de uso rudo y fÃ¡cil limpieza.', 4800, 'sillas_restaur.jpg'),
(35, 'Tapizado de asientos de lancha', 'TapicerÃ­a nÃ¡utica', 'Retapizado de asientos de lancha con vinil marino resistente a rayos UV.', 9200, 'asientos_lancha.jpg'),
(36, 'Cojines de proa', 'TapicerÃ­a nÃ¡utica', 'FabricaciÃ³n de cojines de proa impermeables con espuma de celda cerrada.', 3800, 'cojines_proa.jpg'),
(37, 'Cubierta de bimini', 'TapicerÃ­a nÃ¡utica', 'ConfecciÃ³n de toldo bimini en lona acrÃ­lica con estructura reforzada.', 7500, 'bimini.jpg'),
(38, 'Cubierta de lancha a la medida', 'TapicerÃ­a nÃ¡utica', 'Cubierta protectora con ojillos y correas ajustada al casco de la embarcaciÃ³n.', 6400, 'cubierta_lancha.jpg'),
(39, 'Tapizado de camarote', 'TapicerÃ­a nÃ¡utica', 'Forrado de literas y cojines de camarote con tela marina antihumedad.', 13500, 'camarote.jpg'),
(40, 'Tapizado de yate', 'TapicerÃ­a nÃ¡utica', 'Retapizado integral de salÃ³n y cabina de yate con materiales de lujo.', 48000, 'tapizado_yate.jpg'),
(41, 'Tapizado de timÃ³n', 'TapicerÃ­a nÃ¡utica', 'Forrado del timÃ³n con piel marina y costura doble resistente al agua.', 1100, 'timon.jpg'),
(42, 'Tapizado de asiento de capitÃ¡n', 'TapicerÃ­a nÃ¡utica', 'Retapizado de asiento del piloto con espuma antihumedad y vinil marino.', 3100, 'asiento_capitan.jpg'),
(43, 'Cojines para cubierta', 'TapicerÃ­a nÃ¡utica', 'Juego de cojines de cubierta con tela acrÃ­lica de secado rÃ¡pido.', 5600, 'cojines_cubierta.jpg'),
(44, 'Toldo para pontÃ³n', 'TapicerÃ­a nÃ¡utica', 'Toldo completo para pontÃ³n con estructura de aluminio y lona resistente.', 12800, 'toldo_ponton.jpg'),
(45, 'Fundas de consola nÃ¡utica', 'TapicerÃ­a nÃ¡utica', 'Fundas ajustadas para consolas de mando con cierre y refuerzo impermeable.', 2400, 'funda_consola.jpg'),
(46, 'Tapizado de sofÃ¡ de popa', 'TapicerÃ­a nÃ¡utica', 'Retapizado de sofÃ¡ de popa con vinil marino antimoho y espuma drenante.', 8700, 'sofa_popa.jpg'),
(47, 'ReparaciÃ³n de costuras marinas', 'TapicerÃ­a nÃ¡utica', 'ReparaciÃ³n de costuras y sellado en tapicerÃ­a marina expuesta al sol.', 850, 'costuras_marinas.jpg'),
(48, 'Alfombra nÃ¡utica', 'TapicerÃ­a nÃ¡utica', 'InstalaciÃ³n de alfombra marina antiderrapante en cubierta y cabina.', 4300, 'alfombra_nautica.jpg'),
(49, 'Cortinas marinas', 'TapicerÃ­a nÃ¡utica', 'Cortinas y cubiertas de ventanas para embarcaciÃ³n en tela de secado rÃ¡pido.', 3900, 'cortinas_marinas.jpg'),
(50, 'Tapizado de velero', 'TapicerÃ­a nÃ¡utica', 'Retapizado de cojines de cabina y cockpit para velero con tela marina.', 16500, 'tapizado_velero.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id_solicitud` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_servicio` int NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `costo_estimado` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `clave` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `perfil` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `clave`, `perfil`) VALUES
(1, 'Daniel Santana', 'daniel.santana3465@alumnos.udg.mx', 'scrypt:32768:8:1$Sg3G3oguQiNonJqk$5bb26acad412b9db25ef3278b0aa5c1708af6e701953dc5bb64e87cbe186da057c261c2bde551146c9d68d79ba6bf8e81e279bfe653036115f5391fb3b3b6c40', 'A'),
(2, 'Adan Torres Carbajal', 'adan.torres3477@alumnos.udg.mx', 'scrypt:32768:8:1$4cNW2uY8WcsxuuiE$4189e0f051161e01da16dcf33176815470404c928ecf01fbfe009fa1c7a2f8b881f99601d0adb158c96fe8eaa4cb359877236bf3a1a99716e882dad91af2d583', 'U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utiliza`
--

CREATE TABLE `utiliza` (
  `id_servicio` int NOT NULL,
  `id_material` int NOT NULL,
  `cantidad_requerida` int NOT NULL,
  `perfil` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `corresponde a`
--
ALTER TABLE `corresponde a`
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_solicitud` (`id_solicitud`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `utiliza`
--
ALTER TABLE `utiliza`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_material` (`id_material`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `corresponde a`
--
ALTER TABLE `corresponde a`
  MODIFY `id_solicitud` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `id_material` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `realiza`
--
ALTER TABLE `realiza`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id_solicitud` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `utiliza`
--
ALTER TABLE `utiliza`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `corresponde a`
--
ALTER TABLE `corresponde a`
  ADD CONSTRAINT `corresponde a_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `utiliza`
--
ALTER TABLE `utiliza`
  ADD CONSTRAINT `utiliza_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
