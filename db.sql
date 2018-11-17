-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-11-2018 a las 06:16:09
-- Versión del servidor: 5.6.35
-- Versión de PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `sis_sge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitEventos`
--

DROP TABLE IF EXISTS `BitEventos`;
CREATE TABLE IF NOT EXISTS `BitEventos` (
  `eCodEvento` int(11) NOT NULL AUTO_INCREMENT,
  `eCodUsuario` int(11) NOT NULL,
  `eCodCliente` int(11) NOT NULL,
  `fhFechaEvento` date NOT NULL,
  `tObservaciones` text NOT NULL,
  PRIMARY KEY (`eCodEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitTransacciones`
--

DROP TABLE IF EXISTS `BitTransacciones`;
CREATE TABLE IF NOT EXISTS `BitTransacciones` (
  `eCodTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `eCodCliente` int(11) DEFAULT NULL,
  `fhFecha` datetime DEFAULT NULL,
  PRIMARY KEY (`eCodTransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatClientes`
--

DROP TABLE IF EXISTS `CatClientes`;
CREATE TABLE IF NOT EXISTS `CatClientes` (
  `eCodCliente` int(11) NOT NULL AUTO_INCREMENT,
  `tTitulo` varchar(25) DEFAULT NULL,
  `tNombres` varchar(100) DEFAULT NULL,
  `tApellidos` varchar(100) DEFAULT NULL,
  `tCorreo` varchar(100) DEFAULT NULL,
  `tPassword` varchar(60) DEFAULT NULL,
  `tTelefonoFijo` varchar(15) DEFAULT NULL,
  `tTelefonoMovil` varchar(15) DEFAULT NULL,
  `fhFechaCreacion` datetime DEFAULT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`eCodCliente`),
  KEY `cliente_rel_estatus_fk_idx` (`eCodEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatClientes`
--

INSERT INTO `CatClientes` (`eCodCliente`, `tTitulo`, `tNombres`, `tApellidos`, `tCorreo`, `tPassword`, `tTelefonoFijo`, `tTelefonoMovil`, `fhFechaCreacion`, `eCodUsuario`, `eCodEstatus`) VALUES
(1, NULL, 'mario', 'basurto', 'ebasurtom@me.com', NULL, '56454756', '4564574', '2018-11-12 03:06:00', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatCombos`
--

DROP TABLE IF EXISTS `CatCombos`;
CREATE TABLE IF NOT EXISTS `CatCombos` (
  `eCodCombo` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioVenta` double NOT NULL,
  PRIMARY KEY (`eCodCombo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatEstatus`
--

DROP TABLE IF EXISTS `CatEstatus`;
CREATE TABLE IF NOT EXISTS `CatEstatus` (
  `eCodEstatus` int(11) NOT NULL AUTO_INCREMENT,
  `tCodEstatus` varchar(2) DEFAULT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tIcono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`eCodEstatus`),
  UNIQUE KEY `tCodEstatus_UNIQUE` (`tCodEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatEstatus`
--

INSERT INTO `CatEstatus` (`eCodEstatus`, `tCodEstatus`, `tNombre`, `tIcono`) VALUES
(1, 'NU', 'Nuevo', 'Nuevo.png'),
(2, 'PR', 'En proceso...', 'Proceso.png'),
(3, 'AC', 'Activo', 'Activo.png'),
(4, 'CA', 'Cancelado', 'Cancelado.png'),
(5, 'RE', 'Rechazado', 'Rechazado.png'),
(6, 'BL', 'Bloqueado', 'Bloqueado.png'),
(7, 'EL', 'Eliminado', 'Eliminado.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatInventario`
--

DROP TABLE IF EXISTS `CatInventario`;
CREATE TABLE IF NOT EXISTS `CatInventario` (
  `eCodInventario` int(11) NOT NULL AUTO_INCREMENT,
  `eCodTipoInventario` int(11) NOT NULL,
  `tNombre` varchar(100) NOT NULL,
  `tMarca` varchar(100) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioInterno` double NOT NULL,
  `dPrecioVenta` double NOT NULL,
  `ePiezas` int(11) NOT NULL,
  `tImagen` longblob NOT NULL,
  PRIMARY KEY (`eCodInventario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatServicios`
--

DROP TABLE IF EXISTS `CatServicios`;
CREATE TABLE IF NOT EXISTS `CatServicios` (
  `eCodServicio` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioVenta` double NOT NULL,
  PRIMARY KEY (`eCodServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatServicios`
--

INSERT INTO `CatServicios` (`eCodServicio`, `tNombre`, `tDescripcion`, `dPrecioVenta`) VALUES
(1, 'test', 'test', 1200),
(2, 'test', 'test', 1500),
(3, 'test 1', 'test 2', 2100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposInventario`
--

DROP TABLE IF EXISTS `CatTiposInventario`;
CREATE TABLE IF NOT EXISTS `CatTiposInventario` (
  `eCodTipoInventario` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(25) NOT NULL,
  PRIMARY KEY (`eCodTipoInventario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatTiposInventario`
--

INSERT INTO `CatTiposInventario` (`eCodTipoInventario`, `tNombre`) VALUES
(1, 'Equipo'),
(2, 'Mobiliario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelServiciosInventario`
--

DROP TABLE IF EXISTS `RelServiciosInventario`;
CREATE TABLE IF NOT EXISTS `RelServiciosInventario` (
  `eCodServicio` int(11) NOT NULL,
  `eCodInventario` int(11) NOT NULL,
  `ePiezas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `RelServiciosInventario`
--

INSERT INTO `RelServiciosInventario` (`eCodServicio`, `eCodInventario`, `ePiezas`) VALUES
(3, 1, 20),
(3, 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisBotones`
--

DROP TABLE IF EXISTS `SisBotones`;
CREATE TABLE IF NOT EXISTS `SisBotones` (
  `tCodBoton` varchar(2) NOT NULL,
  `tTitulo` varchar(10) DEFAULT NULL,
  `tFuncion` varchar(15) DEFAULT NULL,
  `tIcono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tCodBoton`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisBotones`
--

INSERT INTO `SisBotones` (`tCodBoton`, `tTitulo`, `tFuncion`, `tIcono`) VALUES
('CO', 'Historial', 'consultar(url);', 'Consultar.png'),
('EL', 'Eliminar', 'eliminas();', 'Eliminar.ong'),
('GU', 'Guardar', 'guardar();', 'Guardar.png'),
('IM', 'Imprimir', 'imprimir();', 'Imprimir.png'),
('RE', 'Rechazar', 'rechazar();', 'Rechazar.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisPerfiles`
--

DROP TABLE IF EXISTS `SisPerfiles`;
CREATE TABLE IF NOT EXISTS `SisPerfiles` (
  `eCodPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(15) DEFAULT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`eCodPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisPerfiles`
--

INSERT INTO `SisPerfiles` (`eCodPerfil`, `tNombre`, `tCodEstatus`) VALUES
(1, 'Administrador', 'AC'),
(2, 'Coordinador', 'AC'),
(3, 'Ventas', 'AC'),
(4, 'Pagos', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSecciones`
--

DROP TABLE IF EXISTS `SisSecciones`;
CREATE TABLE IF NOT EXISTS `SisSecciones` (
  `tCodSeccion` varchar(20) NOT NULL,
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tTitulo` varchar(60) DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL,
  `bFiltro` int(11) NOT NULL,
  `tIcono` varchar(30) NOT NULL,
  PRIMARY KEY (`tCodSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSecciones`
--

INSERT INTO `SisSecciones` (`tCodSeccion`, `tCodPadre`, `tTitulo`, `eCodEstatus`, `ePosicion`, `bFiltro`, `tIcono`) VALUES
('cata-cli-con', 'inicio', 'Clientes', 3, 3, 1, 'fa fa-file-text-o'),
('cata-cli-det', 'cata-cli-con', 'Detalles de Clientes', 3, 2, 0, 'fa fa-file-text-o'),
('cata-cli-reg', 'cata-cli-con', '+ Clientes', 3, 1, 0, 'fa fa-file-text-o'),
('cata-eve-con', 'inicio', 'Eventos', 3, 2, 0, 'fa fa-file-text-o'),
('cata-eve-reg', 'cata-eve-con', '+ Eventos', 3, 1, 0, 'fa fa-file-text-o'),
('cata-inv-con', 'inicio', 'Inventario', 3, 3, 0, 'fa fa-file-text-o'),
('cata-inv-det', 'cata-inv-con', 'Detalles de Inventario', 3, 2, 0, 'fa fa-file-text-o'),
('cata-inv-reg', 'cata-inv-con', '+ Inventario', 3, 1, 0, 'fa fa-file-text-o'),
('cata-per-reg', 'cata-per-sis', '+ Perfiles', 3, 5, 0, 'fa fa-file-text-o'),
('cata-per-sis', 'inicio', 'Perfiles', 3, 6, 0, 'fa fa-file-text-o'),
('cata-ser-con', 'inicio', 'Servicios', 3, 3, 0, 'fa fa-file-text-o'),
('cata-ser-det', 'cata-ser-con', 'Detalles de Servicios', 3, 2, 0, 'fa fa-file-text-o'),
('cata-ser-reg', 'cata-ser-con', '+ Servicios', 3, 1, 0, 'fa fa-file-text-o'),
('cata-tra-con', 'inicio', 'Transacciones', 3, 4, 1, 'fa fa-file-text-o'),
('cata-usr-reg', 'cata-usr-sis', '+ Usuarios', 3, 5, 0, 'fa fa-file-text-o'),
('cata-usr-sis', 'inicio', 'Usuarios', 3, 5, 0, 'fa fa-file-text-o'),
('inicio', NULL, 'Inicio', 3, 1, 0, 'fa-tachometer-alt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesBotones`
--

DROP TABLE IF EXISTS `SisSeccionesBotones`;
CREATE TABLE IF NOT EXISTS `SisSeccionesBotones` (
  `tCodPadre` varchar(15) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `tCodBoton` varchar(2) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  KEY `tCodPadre_rel_fk_botones_idx` (`tCodPadre`),
  KEY `tCodBoton_rel_fk_botones_idx` (`tCodBoton`),
  KEY `eCodEstatus_rel_estatus_fk_idx` (`eCodEstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesMenusEmergentes`
--

DROP TABLE IF EXISTS `SisSeccionesMenusEmergentes`;
CREATE TABLE IF NOT EXISTS `SisSeccionesMenusEmergentes` (
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tCodSeccion` varchar(20) DEFAULT NULL,
  `tFuncion` varchar(50) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfiles`
--

DROP TABLE IF EXISTS `SisSeccionesPerfiles`;
CREATE TABLE IF NOT EXISTS `SisSeccionesPerfiles` (
  `eCodPerfil` int(11) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `bAll` int(11) NOT NULL,
  KEY `perfil_rel_seccion_fk_idx` (`eCodPerfil`),
  KEY `seccion_rel_perfil_idx` (`tCodSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesPerfiles`
--

INSERT INTO `SisSeccionesPerfiles` (`eCodPerfil`, `tCodSeccion`, `bAll`) VALUES
(1, 'cata-eve-con', 1),
(1, 'cata-eve-reg', 0),
(1, 'cata-cli-con', 1),
(1, 'cata-usr-sis', 1),
(1, 'cata-usr-reg', 0),
(1, 'cata-per-reg', 0),
(2, 'cata-eve-con', 1),
(2, 'cata-cli-con', 1),
(2, 'cata-tra-con', 1),
(2, 'cata-usr-sis', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisVariables`
--

DROP TABLE IF EXISTS `SisVariables`;
CREATE TABLE IF NOT EXISTS `SisVariables` (
  `eCodVariable` int(11) NOT NULL AUTO_INCREMENT,
  `tNombreVariable` varchar(100) DEFAULT NULL,
  `tValorVariable` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`eCodVariable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  ADD CONSTRAINT `eCodEstatus_rel_estatus_fk` FOREIGN KEY (`eCodEstatus`) REFERENCES `CatEstatus` (`eCodEstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tCodBoton_rel_fk_botones` FOREIGN KEY (`tCodBoton`) REFERENCES `SisBotones` (`tCodBoton`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tCodPadre_rel_fk_botones` FOREIGN KEY (`tCodPadre`) REFERENCES `SisSecciones` (`tCodSeccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `SisSeccionesPerfiles`
--
ALTER TABLE `SisSeccionesPerfiles`
  ADD CONSTRAINT `perfil_rel_seccion_fk` FOREIGN KEY (`eCodPerfil`) REFERENCES `SisPerfiles` (`eCodPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `seccion_rel_perfil` FOREIGN KEY (`tCodSeccion`) REFERENCES `SisSecciones` (`tCodSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

