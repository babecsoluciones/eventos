-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-02-2019 a las 18:06:53
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
-- Base de datos: `xhanorg_sge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitEventos`
--

CREATE TABLE `BitEventos` (
  `eCodEvento` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL DEFAULT '1',
  `eCodUsuario` int(11) NOT NULL,
  `eCodCliente` int(11) NOT NULL,
  `fhFechaEvento` datetime NOT NULL,
  `tmHoraMontaje` time DEFAULT NULL,
  `tDireccion` text NOT NULL,
  `tObservaciones` text NOT NULL,
  `eCodTipoDocumento` int(11) NOT NULL DEFAULT '1',
  `bIVA` int(11) DEFAULT NULL,
  `fhFecha` datetime NOT NULL,
  `tOperadorEntrega` varchar(100) DEFAULT NULL,
  `tOperadorRecoleccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `BitEventos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitTransacciones`
--

CREATE TABLE `BitTransacciones` (
  `eCodTransaccion` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `eCodEvento` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `dMonto` double NOT NULL,
  `eCodTipoPago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `BitTransacciones`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatClientes`
--

CREATE TABLE `CatClientes` (
  `eCodCliente` int(11) NOT NULL,
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
  `tComentarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatClientes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatCombos`
--

CREATE TABLE `CatCombos` (
  `eCodCombo` int(11) NOT NULL,
  `tNombre` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioVenta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatEstatus`
--

CREATE TABLE `CatEstatus` (
  `eCodEstatus` int(11) NOT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tIcono` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatEstatus`
--

INSERT INTO `CatEstatus` (`eCodEstatus`, `tCodEstatus`, `tNombre`, `tIcono`) VALUES
(1, 'NU', 'Nuevo', 'far fa-question-circle'),
(2, 'PR', 'En proceso...', 'fas fa-cogs'),
(3, 'AC', 'Activo', 'fa-check'),
(4, 'CA', 'Cancelado', 'fas fa-ban'),
(5, 'RE', 'Rechazado', 'fas fa-minus-circle'),
(6, 'BL', 'Bloqueado', 'fas fa-lock'),
(7, 'EL', 'Eliminado', 'far fa-trash-alt'),
(8, 'FI', 'Finalizado', 'fas fa-check-double');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatInventario`
--

CREATE TABLE `CatInventario` (
  `eCodInventario` int(11) NOT NULL,
  `eCodTipoInventario` int(11) NOT NULL,
  `tNombre` varchar(100) NOT NULL,
  `tMarca` varchar(100) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioInterno` double NOT NULL,
  `dPrecioVenta` double NOT NULL,
  `ePiezas` int(11) NOT NULL,
  `tImagen` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatInventario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatServicios`
--

CREATE TABLE `CatServicios` (
  `eCodServicio` int(11) NOT NULL,
  `tNombre` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `dPrecioVenta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatServicios`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposInventario`
--

CREATE TABLE `CatTiposInventario` (
  `eCodTipoInventario` int(11) NOT NULL,
  `tNombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatTiposInventario`
--

INSERT INTO `CatTiposInventario` (`eCodTipoInventario`, `tNombre`) VALUES
(1, 'Equipo'),
(2, 'Mobiliario'),
(3, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposPagos`
--

CREATE TABLE `CatTiposPagos` (
  `eCodTipoPago` int(11) NOT NULL,
  `tNombre` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `CatTiposPagos`
--

INSERT INTO `CatTiposPagos` (`eCodTipoPago`, `tNombre`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta'),
(3, 'Cheque'),
(4, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelEventosPaquetes`
--

CREATE TABLE `RelEventosPaquetes` (
  `eCodEvento` int(11) NOT NULL,
  `eCodServicio` int(11) NOT NULL,
  `eCantidad` int(11) NOT NULL,
  `eCodTipo` int(11) NOT NULL,
  `dMonto` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `RelEventosPaquetes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelEventosRutas`
--

CREATE TABLE `RelEventosRutas` (
  `eCodEvento` int(11) NOT NULL,
  `eCodUsuarioEntrega` int(11) NOT NULL,
  `eCodUsuarioRecoleccion` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelServiciosInventario`
--

CREATE TABLE `RelServiciosInventario` (
  `eCodServicio` int(11) NOT NULL,
  `eCodInventario` int(11) NOT NULL,
  `ePiezas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `RelServiciosInventario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisBotones`
--

CREATE TABLE `SisBotones` (
  `tCodBoton` varchar(2) NOT NULL,
  `tTitulo` varchar(10) DEFAULT NULL,
  `tFuncion` varchar(15) DEFAULT NULL,
  `tIcono` varchar(45) DEFAULT NULL
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
-- Estructura de tabla para la tabla `SisLogs`
--

CREATE TABLE `SisLogs` (
  `eCodEvento` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `tDescripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisLogs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisPerfiles`
--

CREATE TABLE `SisPerfiles` (
  `eCodPerfil` int(11) NOT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisPerfiles`
--

INSERT INTO `SisPerfiles` (`eCodPerfil`, `tNombre`, `tCodEstatus`) VALUES
(1, 'Administrador', 'AC'),
(2, 'Coordinador', 'AC'),
(3, 'Ventas', 'AC'),
(4, 'Pagos', 'AC'),
(5, 'Bodega', NULL),
(6, 'Entregas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSecciones`
--

CREATE TABLE `SisSecciones` (
  `tCodSeccion` varchar(20) NOT NULL,
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tTitulo` varchar(60) DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL,
  `bFiltro` int(11) NOT NULL,
  `tIcono` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSecciones`
--

INSERT INTO `SisSecciones` (`tCodSeccion`, `tCodPadre`, `tTitulo`, `eCodEstatus`, `ePosicion`, `bFiltro`, `tIcono`) VALUES
('bodega', 'inicio', 'Bodega', 3, 1, 1, 'fa-tachometer-alt'),
('cata-cli-con', 'inicio', 'Clientes', 3, 3, 1, 'fa fa-file-text-o'),
('cata-cli-det', 'cata-cli-con', 'Detalles de Clientes', 3, 2, 0, 'fa fa-file-text-o'),
('cata-cli-reg', 'cata-cli-con', '+ Clientes', 3, 1, 0, 'fa fa-file-text-o'),
('cata-eve-con', 'inicio', 'Eventos', 3, 2, 1, 'fa fa-file-text-o'),
('cata-eve-det', 'cata-eve-con', 'Detalles de Eventos', 3, 1, 0, 'fa fa-file-text-o'),
('cata-inv-con', 'inicio', 'Inventario', 3, 3, 0, 'fa fa-file-text-o'),
('cata-inv-det', 'cata-inv-con', 'Detalles de Inventario', 3, 2, 0, 'fa fa-file-text-o'),
('cata-inv-reg', 'cata-inv-con', '+ Inventario', 3, 1, 0, 'fa fa-file-text-o'),
('cata-log-usr', 'inicio', 'Logs', 3, 15, 0, 'fa fa-file-text-o'),
('cata-per-reg', 'cata-per-sis', '+ Perfiles', 3, 5, 0, 'fa fa-file-text-o'),
('cata-per-sis', 'inicio', 'Perfiles', 3, 6, 0, 'fa fa-file-text-o'),
('cata-ren-con', 'inicio', 'Rentas', 3, 2, 1, 'fa fa-file-text-o'),
('cata-ren-det', 'cata-ren-con', 'Detalles de Rentas', 3, 1, 0, 'fa fa-file-text-o'),
('cata-ser-con', 'inicio', 'Paquetes', 3, 3, 0, 'fa fa-file-text-o'),
('cata-ser-det', 'cata-ser-con', 'Detalles de Paquetes', 3, 2, 0, 'fa fa-file-text-o'),
('cata-ser-reg', 'cata-ser-con', '+ Paquetes', 3, 1, 0, 'fa fa-file-text-o'),
('cata-tra-con', 'inicio', 'Transacciones', 3, 4, 1, 'fa fa-file-text-o'),
('cata-usr-reg', 'cata-usr-sis', '+ Usuarios', 3, 5, 0, 'fa fa-file-text-o'),
('cata-usr-sis', 'inicio', 'Usuarios', 3, 5, 0, 'fa fa-file-text-o'),
('inicio', NULL, 'Inicio', 3, 1, 1, 'fa-tachometer-alt'),
('oper-eve-reg', 'cata-eve-con', '+ Eventos', 3, 1, 0, 'fa fa-file-text-o'),
('oper-ren-reg', 'cata-ren-con', '+ Rentas', 3, 1, 0, 'fa fa-file-text-o'),
('rutas', 'inicio', 'Rutas', 3, 1, 1, 'fa-tachometer-alt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesBotones`
--

CREATE TABLE `SisSeccionesBotones` (
  `tCodPadre` varchar(15) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `tCodBoton` varchar(2) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesMenusEmergentes`
--

CREATE TABLE `SisSeccionesMenusEmergentes` (
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tCodSeccion` varchar(20) DEFAULT NULL,
  `tFuncion` varchar(50) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfiles`
--

CREATE TABLE `SisSeccionesPerfiles` (
  `eCodPerfil` int(11) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `bAll` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesPerfiles`
--

INSERT INTO `SisSeccionesPerfiles` (`eCodPerfil`, `tCodSeccion`, `bAll`) VALUES
(3, 'inicio', 1),
(3, 'cata-eve-con', 0),
(3, 'cata-eve-det', 0),
(3, 'oper-eve-reg', 0),
(3, 'cata-cli-reg', 0),
(3, 'cata-cli-det', 0),
(3, 'cata-inv-con', 0),
(3, 'cata-inv-det', 0),
(3, 'cata-ser-con', 0),
(3, 'cata-ser-det', 0),
(4, 'inicio', 1),
(4, 'cata-eve-con', 0),
(4, 'cata-eve-det', 0),
(4, 'cata-tra-con', 1),
(5, 'cata-eve-det', 0),
(2, 'inicio', 1),
(2, 'cata-eve-con', 1),
(2, 'cata-eve-det', 0),
(2, 'oper-eve-reg', 0),
(2, 'cata-cli-con', 1),
(2, 'cata-cli-reg', 0),
(2, 'cata-cli-det', 0),
(2, 'cata-inv-con', 0),
(2, 'cata-inv-reg', 0),
(2, 'cata-inv-det', 0),
(2, 'cata-ser-con', 0),
(2, 'cata-ser-reg', 0),
(2, 'cata-ser-det', 0),
(2, 'cata-tra-con', 1),
(1, 'inicio', 1),
(1, 'cata-eve-det', 0),
(1, 'oper-eve-reg', 0),
(1, 'cata-cli-con', 1),
(1, 'cata-cli-reg', 0),
(1, 'cata-cli-det', 0),
(1, 'cata-inv-con', 0),
(1, 'cata-inv-reg', 0),
(1, 'cata-inv-det', 0),
(1, 'cata-ser-con', 0),
(1, 'cata-ser-reg', 0),
(1, 'cata-ser-det', 0),
(1, 'cata-tra-con', 1),
(1, 'cata-usr-sis', 0),
(1, 'cata-usr-reg', 0),
(1, 'cata-per-sis', 0),
(1, 'cata-per-reg', 0),
(1, 'cata-log-usr', 0),
(6, 'rutas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfilesInicio`
--

CREATE TABLE `SisSeccionesPerfilesInicio` (
  `eCodPerfil` int(11) NOT NULL,
  `tCodSeccion` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `SisSeccionesPerfilesInicio`
--

INSERT INTO `SisSeccionesPerfilesInicio` (`eCodPerfil`, `tCodSeccion`) VALUES
(1, 'inicio'),
(6, 'rutas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisUsuarios`
--

CREATE TABLE `SisUsuarios` (
  `eCodUsuario` int(11) NOT NULL,
  `eCodEntidad` int(11) DEFAULT NULL,
  `tNombre` varchar(50) DEFAULT NULL,
  `tApellidos` varchar(50) DEFAULT NULL,
  `tCorreo` varchar(100) DEFAULT NULL,
  `tPasswordAcceso` varchar(60) DEFAULT NULL,
  `tPasswordOperaciones` varchar(60) DEFAULT NULL,
  `fhFechaCreacion` datetime DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `eCodPerfil` int(11) DEFAULT NULL,
  `bAll` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisUsuarios`
--

INSERT INTO `SisUsuarios` (`eCodUsuario`, `eCodEntidad`, `tNombre`, `tApellidos`, `tCorreo`, `tPasswordAcceso`, `tPasswordOperaciones`, `fhFechaCreacion`, `eCodEstatus`, `eCodPerfil`, `bAll`) VALUES
(1, NULL, 'Mario Ernesto', 'Basurto Medrano', 'babec.soluciones@gmail.com', 'MjgwMjkx', 'MjgwMjkx', '2018-07-29 00:00:00', 3, 1, 1),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisVariables`
--

CREATE TABLE `SisVariables` (
  `eCodVariable` int(11) NOT NULL,
  `tNombreVariable` varchar(100) DEFAULT NULL,
  `tValorVariable` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `BitEventos`
--
ALTER TABLE `BitEventos`
  ADD PRIMARY KEY (`eCodEvento`);

--
-- Indices de la tabla `BitTransacciones`
--
ALTER TABLE `BitTransacciones`
  ADD PRIMARY KEY (`eCodTransaccion`);

--
-- Indices de la tabla `CatClientes`
--
ALTER TABLE `CatClientes`
  ADD PRIMARY KEY (`eCodCliente`),
  ADD KEY `cliente_rel_estatus_fk_idx` (`eCodEstatus`);

--
-- Indices de la tabla `CatCombos`
--
ALTER TABLE `CatCombos`
  ADD PRIMARY KEY (`eCodCombo`);

--
-- Indices de la tabla `CatEstatus`
--
ALTER TABLE `CatEstatus`
  ADD PRIMARY KEY (`eCodEstatus`),
  ADD UNIQUE KEY `tCodEstatus_UNIQUE` (`tCodEstatus`);

--
-- Indices de la tabla `CatInventario`
--
ALTER TABLE `CatInventario`
  ADD PRIMARY KEY (`eCodInventario`);

--
-- Indices de la tabla `CatServicios`
--
ALTER TABLE `CatServicios`
  ADD PRIMARY KEY (`eCodServicio`);

--
-- Indices de la tabla `CatTiposInventario`
--
ALTER TABLE `CatTiposInventario`
  ADD PRIMARY KEY (`eCodTipoInventario`);

--
-- Indices de la tabla `CatTiposPagos`
--
ALTER TABLE `CatTiposPagos`
  ADD PRIMARY KEY (`eCodTipoPago`);

--
-- Indices de la tabla `SisBotones`
--
ALTER TABLE `SisBotones`
  ADD PRIMARY KEY (`tCodBoton`);

--
-- Indices de la tabla `SisLogs`
--
ALTER TABLE `SisLogs`
  ADD PRIMARY KEY (`eCodEvento`);

--
-- Indices de la tabla `SisPerfiles`
--
ALTER TABLE `SisPerfiles`
  ADD PRIMARY KEY (`eCodPerfil`);

--
-- Indices de la tabla `SisSecciones`
--
ALTER TABLE `SisSecciones`
  ADD PRIMARY KEY (`tCodSeccion`);

--
-- Indices de la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  ADD KEY `tCodPadre_rel_fk_botones_idx` (`tCodPadre`),
  ADD KEY `tCodBoton_rel_fk_botones_idx` (`tCodBoton`),
  ADD KEY `eCodEstatus_rel_estatus_fk_idx` (`eCodEstatus`);

--
-- Indices de la tabla `SisSeccionesPerfiles`
--
ALTER TABLE `SisSeccionesPerfiles`
  ADD KEY `perfil_rel_seccion_fk_idx` (`eCodPerfil`),
  ADD KEY `seccion_rel_perfil_idx` (`tCodSeccion`);

--
-- Indices de la tabla `SisUsuarios`
--
ALTER TABLE `SisUsuarios`
  ADD PRIMARY KEY (`eCodUsuario`),
  ADD KEY `SisUsuarios_rel_perfiles_fk_idx` (`eCodPerfil`),
  ADD KEY `CatEstatus_rel_usuarios_fk_idx` (`eCodEstatus`);

--
-- Indices de la tabla `SisVariables`
--
ALTER TABLE `SisVariables`
  ADD PRIMARY KEY (`eCodVariable`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `BitEventos`
--
ALTER TABLE `BitEventos`
  MODIFY `eCodEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `BitTransacciones`
--
ALTER TABLE `BitTransacciones`
  MODIFY `eCodTransaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `CatClientes`
--
ALTER TABLE `CatClientes`
  MODIFY `eCodCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `CatCombos`
--
ALTER TABLE `CatCombos`
  MODIFY `eCodCombo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatEstatus`
--
ALTER TABLE `CatEstatus`
  MODIFY `eCodEstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `CatInventario`
--
ALTER TABLE `CatInventario`
  MODIFY `eCodInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `CatServicios`
--
ALTER TABLE `CatServicios`
  MODIFY `eCodServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `CatTiposInventario`
--
ALTER TABLE `CatTiposInventario`
  MODIFY `eCodTipoInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `CatTiposPagos`
--
ALTER TABLE `CatTiposPagos`
  MODIFY `eCodTipoPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `SisLogs`
--
ALTER TABLE `SisLogs`
  MODIFY `eCodEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `SisPerfiles`
--
ALTER TABLE `SisPerfiles`
  MODIFY `eCodPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `SisUsuarios`
--
ALTER TABLE `SisUsuarios`
  MODIFY `eCodUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `SisVariables`
--
ALTER TABLE `SisVariables`
  MODIFY `eCodVariable` int(11) NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
