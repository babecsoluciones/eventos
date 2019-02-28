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
  `fhFecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `BitEventos`
--

INSERT INTO `BitEventos` (`eCodEvento`, `eCodEstatus`, `eCodUsuario`, `eCodCliente`, `fhFechaEvento`, `tmHoraMontaje`, `tDireccion`, `tObservaciones`, `eCodTipoDocumento`, `bIVA`, `fhFecha`) VALUES
(1, 4, 1, 2, '2018-12-12 18:00:00', '00:00:00', 'TW9kZXJuYQ==', 'cmVjYWxlbnRhZG8gbmF2aWRhZA==', 1, NULL, '0000-00-00 00:00:00'),
(2, 4, 1, 3, '2018-12-12 18:00:00', '00:00:00', 'TG9tYXMgMTM=', 'Qm9zcXVlcw==', 1, NULL, '0000-00-00 00:00:00'),
(3, 4, 1, 1, '2018-12-12 18:00:00', '00:00:00', 'bmluZ3VuYQ==', 'YWNlbnR1YWNpw7NuIHkgY2FyYWN0w6lyZXMgZXNwZWNpYWxlcyDDscOxw7EgJiYmICcnJw==', 1, NULL, '0000-00-00 00:00:00'),
(4, 4, 1, 4, '2018-12-12 18:00:00', '00:00:00', 'cGFsbWFzIDUw', 'bGxlZ2FyIHVuYSBob3JhIGFudGVzIGZpZXN0YSBzb3JwcmVzYQ==', 1, NULL, '0000-00-00 00:00:00'),
(5, 4, 1, 1, '2018-12-18 10:00:00', '00:00:00', 'TmluZ3VuYQ==', 'VGVzdGVv', 1, NULL, '0000-00-00 00:00:00'),
(6, 4, 1, 4, '2018-12-18 18:00:00', '00:00:00', 'UGFsbWFzICMgNTAgcGlzbyA0', 'UHJ1ZWJhIGRhc2hib2FyZA==', 1, NULL, '0000-00-00 00:00:00'),
(7, 4, 2, 5, '1969-12-31 19:00:00', '00:00:00', 'Q29mcmUgZGUgUGVyb3RlIDI0NSAtIEQgOTAxIENvbC4gIExvbWFzIGRlIENoYXB1bHRlcGVjLiA=', 'THVnYXIgZGUgc2VydmljaW8gc2Fsw7NuIGRlIGV2ZW50b3MsIGluZGljYSBjbGllbnRlIHNlIHVzYSBlbGV2YWRvciBhbCBsdWdhci4gDQpTaW4gcHJvYmxlbWEgZGUgYWNjZXNvLg==', 1, NULL, '0000-00-00 00:00:00'),
(8, 2, 1, 4, '2019-08-03 12:00:00', '00:00:00', 'VHVsYSBIaWRhbGdv', 'Qm9kYSBkZSAxNTAgcGVyc29uYXMgVmludGFnZSBtb250YWplIHVuIGTDrWEgYW50ZXMsIGNhbWlvbmV0YSByb2phLCAg', 1, NULL, '0000-00-00 00:00:00'),
(9, 4, 2, 8, '2019-02-16 11:00:00', '00:00:00', 'SW5kdXN0cmlhIDI0IGNhc2EgMTQNCkNvbC4gQXhpb3RsYQ0KRW50cmFyIHBvciBBdi4gVW5pdmVyc2lkYWQNCkRlbGcuIEEuIE9ibnJlZ8Ozbg==', 'SW5kaWNhIGNsaWVudGUgYWNjZXNvIHN1YmlyICA3IGVzY2Fsb25lcywgZGFyw6EgcHJvcGlvbmEu', 1, NULL, '0000-00-00 00:00:00'),
(10, 4, 2, 8, '1969-12-31 18:00:00', '00:00:00', 'SW5kdXN0cmlhICAyNCBjYXNhIDE0DQpDb2wuIEF4aW90bGENCkVudHJhciBwb3IgQXYuIFVuaXZlcnNpZGFkLg0KRGVsZy4gQS4gT2JyZWfDs24=', 'SW5kaWNhIGNsaWVudGUgc3ViaXIgNyBlc2NhbG9uZXMsIGRhcsOhIHByb3BpbmEu', 1, NULL, '0000-00-00 00:00:00'),
(11, 8, 2, 9, '2019-01-24 11:00:00', '00:00:00', 'Q2FsemFkYSBkZWwgSHVlc28gIzExMDAgRWRpZmljaW8gQSBDb2xvbmlhIFZpbGxhIFF1aWV0dWQgRGVsZWdhY2nDs24gQ295b2FjYW4uIA==', 'c2VydmljaW8gZW4gcGxhbnRhIGJhamEu', 1, NULL, '0000-00-00 00:00:00'),
(12, 8, 2, 10, '2019-12-11 18:00:00', '00:00:00', 'UGF0cmljaW8gU2FueiAjMTM1MSBUbGFjb3F1ZW1lY2F0bCBDb2wgRGVsIFZhbGxlIERlbGVnYWNpb24gQmVuaXRvIEp1YXJleiA=', 'U3ViaXIgMyBwaXNvcyBwb3IgZWxldmFkb3IgeSAxIHBvciBlc2NhbGVyYSA=', 1, NULL, '0000-00-00 00:00:00'),
(13, 2, 2, 11, '2019-01-19 16:00:00', '00:00:00', 'Q2VycmFkYSA1IGRlIE1heW8gIzUyNyBjYXNhIDcgQ29sLiBNZXJjZWQgR8OzbWV6', 'RW50cmFyIHBvciBsYSBjYWxsZSBkZSBwcm92ZWVkb3JlcyBkZSBCb2RlZ2EgQXVycmVyYSBDZW50ZW5hcmlv', 1, NULL, '0000-00-00 00:00:00'),
(14, 8, 2, 6, '2019-01-12 09:00:00', '00:00:00', 'UGxheWEgTG9yZW5hICMxMTUgY29sIFNhbiBBbmRyw6lzIFRldGVwaWxjbw==', 'RW50cmUgZWplIDYgeSBQb3J0byBBbGVncmU=', 1, NULL, '0000-00-00 00:00:00'),
(15, 8, 2, 12, '2019-01-12 16:00:00', '00:00:00', 'Q2FsbGUgVyAjMyBDb2wgQWxpYW56YSBQb3B1bGFyIFJldm9sdWNpb25hcmlhLCBDb3lvYWPDoW4=', 'RW50cmFyIHBvciBUZXBldGxhcGE=', 1, NULL, '0000-00-00 00:00:00'),
(16, 2, 2, 13, '2019-01-12 13:00:00', '00:00:00', 'U2FsdGlsbG8gIzI4ICBkZXB0by4gIDExMDEgQ29sIEhpcMOzZHJvbW8gQ29uZGVzYQ==', 'UGlzbyAxMSBwb3IgZWxldmFkb3I=', 1, NULL, '0000-00-00 00:00:00'),
(17, 1, 2, 14, '2019-01-18 20:00:00', '00:00:00', 'WcOhY2F0YXMgIzM5NiBDb2wgTmFydmFydGU=', 'Q2xpZW50ZSBjb25vY2lkbw==', 1, NULL, '0000-00-00 00:00:00'),
(18, 4, 2, 15, '2019-01-19 18:00:00', '00:00:00', 'SmVzw7pzIGRlbCBNb250ZSAyNjgsIENvbC4gSmVzw7pzIGRlIE1vbnRlLCBIdWl4cXVpbHVjYW4NClNhbMOzbiBkZSBFdmVudG9zLg==', 'Q2xpZW50ZSBmcmVjdWVudGUuDQpMbGV2YSBjdWF0cm8ganVlZ29zIHBlcmlxdWVyYSBjcm9tbyBibGFuY28gY29uIDUgc2lsbGFzLCBwZXJvIGxsZXZhIDIgZGUgY29ydGVzw61hLg0K', 1, NULL, '0000-00-00 00:00:00'),
(19, 4, 2, 15, '2019-01-19 18:00:00', '00:00:00', 'SmVzw7pzIGRlbCBNb250ZSAyOTgsIENvbC4gSmVzw7pzIGRlbCBNb250ZSwgSHVpeHF1aWx1Y2FuDQpTYWzDs24gZGUgRXZlbnRvcy4=', 'Q2xpZW50ZSBmcmVjdWVudGUuDQpMbGV2YSBjdWF0cm8ganVlZ29zIHBlcmlxdWVyYSBjcm9tbyBibGFuY28gY29uIDUgc2lsbGFzLCBwZXJvIDIgc29uIGRlIGNvcnRlc8OtYS4=', 1, NULL, '0000-00-00 00:00:00'),
(20, 4, 2, 15, '2019-01-19 18:00:00', '00:00:00', 'SmVzw7pzIGRlbCBNb250ZSAgMjY4IENvbC4gSmVzw7pzIGRlbCBNb250ZSwgSHVpeHF1aWx1Y2FuLg0KU2Fsw7NuIGRlIGV2ZW50b3M=', 'Q2xpZW50ZSBmcmVjdWVudGUuDQpMbGV2YSA0IGp1ZWdvcyBwZXJpcXVlcmEgY3JvbW8gYmxhbmNvIGNvbiA1IHNpbGxhcywgcGVybyAyIHNvbiBkZSBjb3J0ZXPDrWEu', 1, NULL, '0000-00-00 00:00:00'),
(21, 4, 1, 1, '2018-12-18 18:00:00', '00:00:00', 'WmVtcG9hbGEgMTM=', 'cHJ1ZWJhIGRlIFBERg==', 1, NULL, '0000-00-00 00:00:00'),
(22, 4, 1, 1, '2019-01-19 18:00:00', '00:00:00', 'U2FuIGplcm9uaW1vICMz', 'ZW50cmFyIHBvciBjYWxsZSBpZ2xlc2lh', 1, NULL, '0000-00-00 00:00:00'),
(23, 1, 1, 3, '2019-01-21 12:00:00', '00:00:00', 'TmluZ3VuYQ==', 'RXMgdW5hIHBydWViYSBkZSBjYXJnYQ==', 1, NULL, '0000-00-00 00:00:00'),
(24, 4, 1, 2, '2019-01-19 10:00:00', '00:00:00', 'bW9uYWNvIDIxMw==', 'cGxhdGFuaXRvIHNob3c=', 1, NULL, '0000-00-00 00:00:00'),
(25, 4, 1, 2, '1969-12-31 23:00:00', '00:00:00', 'TW9uYWNvIDIxMw==', 'cHJ1ZWJhICBkZSBzaXN0ZW1h', 1, NULL, '0000-00-00 00:00:00'),
(26, 4, 1, 2, '1969-12-31 23:00:00', '00:00:00', 'TW9uYWNvIDIxMw==', 'cHJ1ZWJhIDI=', 1, NULL, '0000-00-00 00:00:00'),
(27, 4, 1, 2, '1969-12-31 23:00:00', '00:00:00', 'bW9uYWNvIDIzNA==', 'cHJ1ZWJh', 1, NULL, '0000-00-00 00:00:00'),
(28, 4, 1, 2, '2019-01-26 23:00:00', '00:00:00', 'bW9uYWNvIDMyNA==', 'cHJ1ZWJhIDIgY29uIGd7dWlvbiBlbiBmZWNoYQ==', 1, NULL, '0000-00-00 00:00:00'),
(29, 4, 1, 2, '2019-01-26 22:00:00', '00:00:00', 'bW9uYWNvIDQ1Ng==', 'cHJ1ZWJhIDI=', 1, NULL, '0000-00-00 00:00:00'),
(30, 4, 1, 2, '2019-01-26 21:00:00', '00:00:00', 'QWxkYWNvICMgNyBjZW50cm8=', 'MiBDYWxlbnRhZG9yZXMgY29ydGVzaWEsIDIgbHV6IG5lZ3JhIGNvcnRlc2lhLCAgYmFybWFuIGV4dHJh', 1, NULL, '0000-00-00 00:00:00'),
(31, 4, 1, 4, '2019-01-26 13:00:00', '00:00:00', 'UG9sYW5jbyAjMjEz', 'UHJ1ZWJhIHNpbiBjb3J0ZXN1YQ==', 1, NULL, '0000-00-00 00:00:00'),
(32, 4, 1, 2, '2019-01-25 12:00:00', '00:00:00', 'TW9uYWNvICMyMTMgZGVsIENhcm1lbiBCZW5pdG8gSnVhcmV6', 'QWNjZXNvIGNvbiBlbGV2YWRvciAzIHBpc28sIHBlcnNvbmFsIEFsb25zbywgR2VyYXJkbywgRGFuaWVsICx0cmFuc3BvcnRlIENhbWlvbmV0YSAxMywgY29ydGVzaWEgcHJvbW90b3IgVmlja3k=', 1, NULL, '0000-00-00 00:00:00'),
(33, 4, 1, 2, '2019-01-25 12:00:00', '00:00:00', 'TW9uYWNvIDIxMw==', 'YWNjZXNvIDMgcGlzbywgcGVyc29uYWwgQWxvbnNvLCBqdWxpbywgZGFuaWVsLCBsZXNz', 1, NULL, '0000-00-00 00:00:00'),
(34, 1, 1, 1, '2019-02-28 12:00:00', '00:00:00', 'TmluZ3VuYQ==', 'TmluZ3VuYQ==', 1, NULL, '0000-00-00 00:00:00'),
(35, 1, 1, 1, '2019-01-30 11:30:00', '00:00:00', 'bmluZ3VuYQ==', 'bmluYWd1Zw==', 1, NULL, '0000-00-00 00:00:00'),
(36, 4, 1, 2, '2019-01-25 13:30:00', '00:00:00', 'TW9uYWNvIDIxMw==', 'U3ViaXIgNCBwaXNvcyBwZW5hbGl6YWNpw7NuLCBwZXJzb25hbCBKdWxpbywgTWVtbyBNLCBHZXJhcmRvLCBjYW1pb25ldGEgMTMsIGNvc3J0ZXNpYXMgcHJvbW90b3Igdmlja3k=', 1, NULL, '0000-00-00 00:00:00'),
(37, 8, 2, 16, '2019-01-26 13:00:00', '00:00:00', 'cmV0b3JubyBBbGRhbWEgIzM4IGNvbCBzYW4ganVhbiBUZXBlcGFuIGRlbGVnYWNpw7NuIFhvY2hpbWlsY28g', 'Y2FzYSBhbWFyaWxsYSBwb3J0w7NuIG5lZ3Jv', 1, NULL, '0000-00-00 00:00:00'),
(38, 8, 2, 17, '2019-01-26 16:00:00', '00:00:00', 'QXJrYW5zYXMgIzE0IENvbCBOw6Fwb2xlcy4=', 'U2VydmljaW8gZW4gUGxhbnRhIEJhamEuIA==', 1, NULL, '0000-00-00 00:00:00'),
(39, 8, 2, 18, '2019-01-26 18:00:00', '00:00:00', 'RHIuIEppbcOpbmV6ICMyOTQgQ29sIERvY3RvcmVzLiBEZWxlZ2FjacOzbiBDdWF1aHTDqW1vYw==', 'THVnYXIgRmVvIHkgZGUgYWx0byByaWVzZ28uIA==', 1, NULL, '0000-00-00 00:00:00'),
(40, 4, 1, 2, '2019-02-01 18:00:00', '00:00:00', 'cG9ydGFsZXMgb3JpZW50ZSAyMTIz', 'ZXNwZXJhbiByZW50YSBtZWRpbyBkw61hIA==', 1, NULL, '0000-00-00 00:00:00'),
(41, 4, 1, 2, '2019-02-01 18:00:00', '00:00:00', 'Y2FuYXJpYXMgMjEz', 'cHJ1ZWJhIGRlIGNhcmdhIHJlbnRhcyA=', 1, NULL, '0000-00-00 00:00:00'),
(42, 4, 1, 2, '2019-02-02 13:00:00', '00:00:00', 'cm9ibGVzIDUw', 'cHJ1ZWJhIGNhcmdhIGRlIHJlbnRhIA==', 2, NULL, '0000-00-00 00:00:00'),
(43, 2, 1, 2, '2019-02-01 18:00:00', '00:00:00', 'eHh4eA==', 'Z3J1w7Fvbg==', 1, NULL, '0000-00-00 00:00:00'),
(44, 2, 1, 20, '2019-02-05 14:00:00', '00:00:00', 'TGEgUGxhY2UgIzMzIENvbC4gQW56dXJleiBEZWw6IE1pZ3VlbCBIaWRhbGdv', 'TWFydGVzIGFudGVzIGRlIGxhcyAxODowMCBtb250YWpl', 2, NULL, '0000-00-00 00:00:00'),
(45, 1, 1, 20, '2019-02-06 18:00:00', '00:00:00', 'bGEgUGxhY2UgIzMzICA=', 'cmVudGEgY2FsZW50YWRvciBzZSByZWxsZW5hIHRhbnF1ZQ==', 2, NULL, '0000-00-00 00:00:00'),
(46, 2, 2, 22, '2019-02-08 12:00:00', '00:00:00', 'UmlvIE5pbG8gIzcxIENvbC4gQ3VhdWh0w6ltb2MsIERlbGVnYWNpw7NuIEN1YXVodMOpbW9jIA==', 'UGxhbnRhIEJhamEuIA==', 1, NULL, '0000-00-00 00:00:00'),
(47, 8, 2, 23, '2019-02-08 16:00:00', '00:00:00', 'Y2hpaHVhaHVhICMyMzAgY29sIHJvbWEgbm9ydGUgZGVsZWdhY2nDs24gQ3VhdWh0w6ltb2Mg', 'c3ViaXIgMSBwaXNv', 1, NULL, '0000-00-00 00:00:00'),
(48, 2, 2, 24, '2019-02-09 18:00:00', '00:00:00', 'U2VjY2nDs24gMzIgIEx0IDIxIE16IDY1IFLDrW8gZGUgbGEgTHV6LCBFY2F0ZXBlYy4gRWRvLiBNw6l4LiAgZW50cmUgU3V0ZXJtIGUgSW5kdXN0cmlhLg0K', 'YSBsYSBhbHR1cmEgZGVsIE1leGlidXMgSW5kdXN0cmlhbC4NCkN1bXBsZSAxNCBhw7FvcywgRXF1aXBvIGRlIGNvY3RlbGVyaWEuDQo=', 1, NULL, '0000-00-00 00:00:00'),
(49, 2, 2, 26, '2019-02-09 16:00:00', '00:00:00', 'VGFtYW5nbyAyNTggaW50IDcgQ29sLiBWYWxsZWpvLCBBbGNhbGTDrWEgR3VzdGF2byBBLiBNYWRlcm8gZW50cmUgU2h1cm1hbm4geSBEb25pemV0dGku', 'Q29udHJhdG8gcG9yIGNvcnJlbywgaW5kaWNhIGNsaWVudGUgc3ViaXIgNiBwaXNvcyBwb3IgZXNjYWxlcmEgaGFzdGEgUm9vZmdhcmRlbi4NClByb21vdG9yYSBTdGVwaGFueSBWaWxsZWdhcw0KU2UgbGUgY29icm8gYWNjZXNvIDYwMC4wMA==', 1, NULL, '0000-00-00 00:00:00'),
(50, 2, 2, 27, '2019-02-09 16:00:00', '00:00:00', 'TGEgTWFsaW5jaGUgMjYxIENvbGluYXMgZGVsIEJvc3F1ZSwgVGxhbHBhbg0KRW50cmUgTGFzIFRvcnJlcyB5IFZpYWR1Y3RvIFRsYWxwYW4sIGVudHJhciBwb3IgQXJlbmFsLg==', 'QWNjZXNvIFAuQi4gaGFicsOhIGNhcnBhIDIwIHggMTAsIG1vbnRhamUgZW4gcGFzdG8uDQpTZXJ2aWNpbyBjb24gZmFjdHVyYS4NCkV2ZW50byBwYWdhZG8u', 1, 1, '0000-00-00 00:00:00'),
(51, 2, 2, 34, '2019-02-09 17:00:00', '00:00:00', 'VHJhc2ZpZ3VyYWNpw7NuIDE1NTYgRCwgQ29sLiBTYW4gTG9yZW56byBUZXpvbmNvLCBBbGNhcmRpYSBJenRhcGFsYXBhLg0KRW50cmUgQmVuaXRvIEp1w6FyZXogeSBOZXphaHVhbGNveW90bCwgcGFzYW5kbyBtZXRybyBwZXJpZsOpcmljbyBvcmllbnRlLg==', 'U2VydmljaW8gZW4gUC5CLiwgTHVnYXIgeSBjbGllbnRlIGNvbm9jaWRvLg0K', 1, NULL, '0000-00-00 00:00:00'),
(52, 8, 2, 28, '2019-02-09 16:00:00', '00:00:00', 'RGl2aXNpw7NuIGRlbCBOb3J0ZSAjMjc0ICBDb2wgTG9tYXMgZGUgTWVtZXRsYSAsIEN1YWppbWFscGEuDQo=', 'c2Ugc3ViZSBwb3IgZXNjYWxlcmFzIHkgZWxldmFkb3IgMSBwaXNvIA==', 2, NULL, '0000-00-00 00:00:00'),
(53, 2, 2, 35, '2019-02-09 17:00:00', '00:00:00', 'VGVwb3p0ZWNvICBNeiA2NDAgTHQgMjYgQ2l1ZGFkIEF6dGVjYSwgM3JhIFNlY2Npw7NuLiBFY2F0ZXBlYywgRWRvLiBNZXguDQpFbnRyZSAgQmx2ZC4gZGUgbG9zIEF6dGVjYXMgeSBCbHZkLiBkZSBsb3MgU2FjZXJkb3Rlcy4NCkZhY2hhZGEgYmxhbmNhLCB6YWd1w6FuIGNhZsOpLg==', 'Q2xpZW50ZSBjb25vY2lkby4gRXZlbnRvIFBhZ2Fkby4NClNlcnZpY2lvIGVuIFAuQi4sIGVzcGFjaW8gZGUgN3g2LCBoYWJyw6EgY2FycGEu', 1, NULL, '0000-00-00 00:00:00'),
(54, 2, 2, 36, '2019-02-09 19:00:00', '00:00:00', 'R2VuZXJhbCBBbmF5YSAgMjAyIENvbC4gU2FuIERpZWdvIENodXJ1YnVzY28sIEFsY2FsZMOtYSBDb3lvYWPDoW4uDQpFc3F1aW5hIERpdmlzaW9uIGRlbCBOb3J0ZSB5IFhpY290ZWNhbnRsLg0K', 'Q29udHJhdG8gcG9yIGNvcnJlbywgaW5kaWNhIGNsaWVudGUgc2VydmNpbyBQLkIuLCBtb250YWplIGVuIGphcmTDrW4u', 1, NULL, '0000-00-00 00:00:00'),
(55, 2, 2, 37, '2019-02-16 13:00:00', '00:00:00', 'RGVzaWVydG8gZGUgbG9zIExlb25lcyAjNDg4MiBDb2wuIFRldGVscGFuLCDDgWx2YXJvIE9icmVnw7Nu', 'UGxhbnRhIEJhamEsIGx1Z2FyIHkgY2xpZW50ZSBjb25vY2lkbw==', 1, NULL, '0000-00-00 00:00:00'),
(56, 1, 2, 38, '2019-02-16 14:00:00', '00:00:00', 'QWxsZW5kZSAjMTU2IENvbC4gRGVsIENhcm1lbiwgQ295b2Fjw6Fu', 'RW50cmUgTG9uZHJlcyB5IEJlcmzDrW4=', 1, NULL, '0000-00-00 00:00:00'),
(57, 2, 2, 39, '2019-02-16 16:00:00', '00:00:00', 'QmVybmFyZG8gUXVpbnRhbmEgIzQwMCwgRWRpZiBCLCBkZXB0by4uIDEyMDQsIGNvbC4gTGEgTG9tYSBTYW50YSBGZQ==', 'U2Fsw7NuIGRlIGV2ZW50b3M=', 1, NULL, '0000-00-00 00:00:00'),
(58, 2, 2, 40, '2019-02-16 18:00:00', '00:00:00', 'Q2lyY3VpdG8gRnVlbnRlcyBkZWwgUGVkcmVnYWwgIzMxOCBDb2wuIEZ1ZW50ZXMgZGVsIFBlZHJlZ2FsLiAgVGxhbHBhbg==', 'Q3VtcGxlYcOxb3MgNDAgYcOxb3M=', 1, NULL, '0000-00-00 00:00:00'),
(59, 2, 2, 41, '2019-02-16 18:00:00', '00:00:00', 'TWlndWVsIE5lZ3JldGUgIzcwLCBDb2wuIE5pw7FvcyBIw6lyb2VzIGRlIENoYXB1bHRlcGVjLCBCZW5pdG8gSnXDoXJleg==', 'RW50cmUgZWplIDUgeSBSb21lcm8sIFBC', 1, NULL, '0000-00-00 00:00:00'),
(60, 2, 2, 42, '2019-02-16 19:00:00', '00:00:00', 'Q2Vycm8gZGVsIGFyYm9saXRvICMyMCwgQ29sLiBDb3BpbGNvIFVuaXZlcnNpZGFkLCBDb3lvYWPDoW4=', 'RW50cmUgIGVqZSAxMCBhbnRlcyBSZXNpZGVuY2lhbCBDb3BpbGNvLCB0b2RvIGNlcnJvIGRlbCBhZ3VhLCB2dWVsdGEgYSBsYSBkZXJlY2hh', 1, NULL, '0000-00-00 00:00:00'),
(61, 8, 2, 28, '2019-02-15 16:00:00', '00:00:00', 'RGl2aXNpw7NuIGRlbCBOb3J0ZSAjIDI3NCwgQ29sLiBMb21hcyBkZSBNZW1ldGxhLCBDdWFqaW1hbHBh', 'U3ViZW4gcG9yIGVsdmFkb3I=', 2, NULL, '0000-00-00 00:00:00'),
(62, 8, 2, 43, '2019-02-15 15:00:00', '00:00:00', 'UmVpbXMjMzQwIGNhc2EgMzIgQ29sLiBWaWxsYSBWZXJkw7puLCDDgWx2YXJvIE9icmVnw7Nu', 'RW50cmFyIHBvciBjYXNldGEgMg==', 2, NULL, '0000-00-00 00:00:00'),
(63, 8, 2, 44, '2019-02-15 12:00:00', '00:00:00', 'UsOtbyBOaWxvICM3MSBDb2wuIEN1YXVodMOpbW9jLCBFc3EuIFLDrW8gTGVybWE=', 'UGxhbnRhIEJhamE=', 2, NULL, '0000-00-00 00:00:00'),
(64, 8, 2, 45, '2019-02-15 11:00:00', '00:00:00', 'QW1vcmVzICMyMDYgQ29sLiBEZWwgVmFsbGUsIGFsIGxhZG8gIzE1NCwgQmVuaXRvIEp1w6FyZXo=', 'RW50cmUgRWxlbmEgQXJpem1lbmRpIHkgWG9sYSwgZGVsIGxhZG8gZGVsIE9YWE8=', 2, NULL, '0000-00-00 00:00:00'),
(65, 8, 2, 46, '2019-02-15 12:00:00', '00:00:00', 'QXF1aWxlcyBFbG9yZHV5ICMzMzgsIENvbC4gRWxlY3RyaWNpc3RhcywgQXpjYXBvdHphbGNv', 'SWdsZXNpYSBDcmlzdGlhbmEgTnVldmEgR2VuZXJhY2nDs24=', 2, NULL, '0000-00-00 00:00:00'),
(66, 1, 2, 47, '2019-02-15 11:00:00', '00:00:00', 'Q2hpY2FnbyBzL24gVG9ycmUgQSBNb2R1bG8gQi0yMDMsIGNvbC4gTsOhcG9sZXMgcmVzaWRlbmNpYWwgV1RD', 'U2Fsw7NuIHRvcnJlIEMsIGRlIHVzb3MgbcO6bHRpcGxlcw==', 2, NULL, '0000-00-00 00:00:00'),
(67, 2, 2, 53, '2019-02-15 15:00:00', '00:00:00', 'R3VpbGxlcm1vIE1hc3NpZXUgIzEwNCBjYXNhIDExLCBjb2wuIFJlc2lkZW5jaWFsIEVzY2FsZXJhLCBHdXN0YXZvIGEgTWFkZXJv', 'RW50cmUgQXYuIE1pZ3VlbCBCZXJuYWwgeSBBcnJveW8gWmFjYXRlbmNv', 1, NULL, '0000-00-00 00:00:00'),
(68, 2, 2, 54, '2019-02-15 18:30:00', '00:00:00', 'UGFzZW8gZGVsIEZhaXNhbiAjNzUsIExvbWFzIFZlcmRlcyAxcmEuIHNlY2Mu', 'UGFzZW8gZGVsIENvbGlicsOtLCByZWphIGNvbG9yIHBsYXRh', 1, NULL, '0000-00-00 00:00:00'),
(69, 4, 2, 55, '2019-02-16 18:00:00', '00:00:00', 'TmFyY2lzb3MgIzEzNywgSmFyZGluZXMgZGUgQ295b2Fjw6FuLiBDb3lvYWPDoW4=', 'RXF1aXBvIGRlIGNvY3RlbGVyw61hLCBubyBzZSBvY3VwYXJhbiBjZW5pY2Vyb3M=', 1, NULL, '0000-00-00 00:00:00'),
(70, 8, 2, 48, '2019-02-16 10:00:00', '00:00:00', 'UGl0w6Fnb3JhcyAtIzQxNSBDb2wgTmFydmFydGUsIEJlbml0byBKdcOhcmV6LiA=', 'UGxhbnRhIGJhamE=', 2, NULL, '0000-00-00 00:00:00'),
(71, 2, 2, 55, '2019-02-16 18:00:00', '00:00:00', 'TmFyY2lzbyAjMzcgQ29sLiBKYXJkaW5lcyAgZGUgQ295b2Fjw6FuLCBDb3lvYWPDoW4=', 'Tm8gc2Ugb2N1cGFyYW4gY2VuaWNlcm9zLCBkYXLDoSBwbGF5ZXJhcyBwYXJhIHBlcnNvbmFs', 1, NULL, '0000-00-00 00:00:00'),
(72, 8, 2, 49, '2019-02-16 16:00:00', '00:00:00', 'TGEgQ29ydcOxYSAjNTQgQ29sIMOBbGFtb3MgQmVuaXRvIEp1w6FyZXog', 'RW50cmUgSm9zZSBTaW1vbiBCb2zDrXZhciB5IENhc3RpbGxhcyA=', 2, NULL, '0000-00-00 00:00:00'),
(73, 8, 2, 8, '2019-02-16 11:00:00', '00:00:00', 'aW5kdXN0cmlhICMyNCBpbnQgNCBjb2wgQXhvdGxhIEFsdmFybyBPYnJlZ8OzbiA=', 'RW50cmFyIHBvciBBdi4gVW5pdmVyc2lkYWQg', 2, NULL, '0000-00-00 00:00:00'),
(74, 1, 2, 51, '2019-02-16 17:00:00', '00:00:00', 'UGV0ZW4gIzQ2NiBjb2wgVmVydGl6IE5hcnZhcnRlIA==', 'ZW50cmUgc2FuIEJvcmphIHkgZWplIDYgw6FuZ2VsIFVycmF6YSA=', 2, NULL, '0000-00-00 00:00:00'),
(75, 8, 2, 52, '2019-02-16 17:00:00', '00:00:00', 'RGlhZ29uYWwgUmVmb3JtYSBzL24gU2FuIEp1YW4gVG90b2x0ZXBlYyBOYXVjYWxwYW4uIA==', 'UGxhbnRhIEJhamE=', 2, NULL, '0000-00-00 00:00:00'),
(76, 8, 2, 56, '2019-02-16 18:00:00', '00:00:00', 'YXYgcHVlcnRvIEJlbml0byBKdcOhcmV6IGNvbCBwaWxvdG9zIEFkb2xmbyBMw7NwZXogbWF0ZW9zIMOBbHZhcm8gb2JyZWfDs24g', 'UGxhbnRhIEJhamEg', 2, NULL, '0000-00-00 00:00:00'),
(77, 8, 2, 33, '2019-02-16 18:00:00', '00:00:00', 'Q2FsbGUgUmVmb3JtYSAjODMgQ29sIFNhbiDDgW5nZWwgLCDDgWx2YXJvIG9icmVnw7NuIA==', 'cGxhbnRhIGJhamEg', 2, NULL, '0000-00-00 00:00:00'),
(78, 8, 2, 33, '2019-02-15 19:00:00', '00:00:00', 'Qmx2ZC4gZGUgbG9zIHZpcnJleWVzICMxMDc1IGNvbCBsb21hcyBkZSBDaGFwdWx0ZXBlYyBtaWd1ZWwgaGlkYWxnbyA=', 'UGxhbnRhIGJhamE=', 2, NULL, '0000-00-00 00:00:00'),
(79, 2, 2, 57, '2019-02-20 17:00:00', '00:00:00', 'RGlhZ29uYWwgU2FuIEFudG9uaW8gIzk0NSBpbnQgNSBDb2wgRGVsIFZhbGxlIEJlbml0byBKdcOhcmV6IEVudHJlIEdhYnJpZWwgTWFuY2VyYSB5IE5pY29sw6FzIHNhbiBKdWFuIA==', 'UmVudGEgcGFyYSBlbCBIb3RlbCBTaGVyYXRvbiBNYXLDrWEgSXNhYmVsIGRlIFJlZm9ybWEuIA==', 2, NULL, '0000-00-00 00:00:00'),
(80, 2, 2, 57, '2019-02-21 17:00:00', '00:00:00', 'RGlhZ29uYWwgU2FuIEFudG9uaW8gIzk0NSBpbnQgNSBDb2wgRGVsIFZhbGxlICwgQmVuaXRvIEp1w6FyZXouIGVudHJlIEdhYnJpZWwgTWFuY2VyYSB5IE5pY29sw6FzIHNhbiBKdWFuIA==', 'UGxhbnRhIEJhamEuIA==', 2, NULL, '0000-00-00 00:00:00'),
(81, 1, 2, 63, '2019-02-22 15:00:00', '00:00:00', 'Qm9zcXVlIFJlYWwgIFRvcnJlIFRvd2VycyAgQiBkZXB0byAgMjQwMiwgSHV4cXVpbHVjYW4uDQpTYWzDs24gZGUgZXZlbnRvcy4g', 'MTQgYcOxb3MsIERqIHF1ZSBsb3MgaGFnYSBiYWlsYXIuDQpQZXJtaXRpcsOhbiBhY2Nlc2FyIHBvciBlbnRyYWRhIHByaW5jaXBhbCBlbCBtb2JpbGlhcmlvLCB0cmF0YXIgZGUgbm8gcmF5YXIgZWwgcGlzby4=', 1, NULL, '0000-00-00 00:00:00'),
(82, 1, 2, 22, '2019-02-22 12:00:00', '00:00:00', 'UmlvIE5pbG8gIzcxIENvbC4gQ3VhdWh0w6ltb2MsIEFsY2FsZMOtYSBDdWF1aHTDqW1vYywgRXNxdWluYSBjb24gUmlvIExlcm1hICA=', 'UGIu', 2, NULL, '0000-00-00 00:00:00'),
(83, 2, 2, 58, '2019-02-22 13:00:00', '00:00:00', 'UmluY29uYWRhIGRlIFNhbnRhIFRlcmVzYSAjMTM2IENvbCBpbnN1cmdlbnRlcyBDdWljdWlsY28gLCBhbGNhbGTDrWEgVGxhbHBhbi4gRW50cmUgQm9zcXVlIGRlIFRsYWxwYW4geSBQZXJpZsOpcmljby4=', 'Q2FsbGUgY2VycmFkYSBjb24gY2FzZXRhIGRlIFZpZ2lsYW5jaWEgZW50cmEgY2FtaW9uZXRhIGRlIDMgeSBtZWRpYS4gUGxhbnRhIGJhamEuDQpNb250ZXNzb3JpIERlbCBQZWRyZWdhbC4gQS5DLiA=', 2, 1, '0000-00-00 00:00:00'),
(84, 2, 2, 59, '2019-02-22 17:30:00', '00:00:00', 'U3VyIDEwNyBBICM1MDMgQ29sIFNlY3RvciBQb3B1bGFyIEFsY2FsZMOtYSBJenRhcGFsYXBhLiBFbnRyZSBSb2RvbGZvIFVzaWdsaSB5IEFndXN0w61uIFnDocOxZXouIA==', 'UGIuIA==', 2, NULL, '0000-00-00 00:00:00'),
(85, 1, 2, 65, '2019-02-23 13:00:00', '00:00:00', 'R3V0acOpcnJleiBaYW1vcmEgMTczIC0gMzAxIENvbC4gTGFzIEFndcOtbGFzLCBBLiBPYnJlZ8Ozbg0KRW50cmUgQWxidWZlcmFzIHkgRXNwaWdvbmVz', 'SW5kaWNhIGNsaWVudGUgYWNjZXNvIHBvciBlbGV2YWRvciBhIHJvb2Ygc2luIHByb2JsZW1hLg0KTW9udGFqZSAxMyBocnMgcHVudHVhbGlkYWQu', 1, NULL, '0000-00-00 00:00:00'),
(86, 2, 2, 60, '2019-02-23 10:00:00', '00:00:00', 'Q2lyY3VpdG8gZGUgbG9zIFBhcnF1ZXMgIzMyOCBDb2wgRWwgcGFycXVlIENveW9hY8OhbiwgQWxjYWxkw61hIENveW9hY8Ohbi4gZW50cmUgUGFycXVlIGRlIExhIGNvbmRlc2EgeSBQYXJxdWUgZGVsIEVtcGVyYWRvci4g', 'UGxhbnRhIEJhamEsIEZyZW50ZSBhIGxvcyBjYW1wb3MgZGUgQ2x1YiBBbcOpcmljYS4gDQpTaWxsYXMgZW4gQ3JvbW8gUm9zYS4g', 2, NULL, '0000-00-00 00:00:00'),
(87, 1, 2, 64, '2019-02-23 15:00:00', '00:00:00', 'TGFnbyBMbG9wYW5nbyAjIDgxIENvbC4gVG9ycmUgQmxhbmNhDQpFbnRyZSBQYWdvIFBvbyB5IExhZ28gU3VwZXJpb3INCg==', 'SW5kaWNhIGNsaWVudGUgc2VydmljaW8gZW4gUC5CLg==', 1, NULL, '0000-00-00 00:00:00'),
(88, 2, 2, 61, '2019-02-23 17:00:00', '00:00:00', 'RmlsaXBpbmFzICMxODYgaW50IDQwNyBDb2wgU2FuIFNpbcOzIHRpY3VtYWMgQWxjYWxkw61hIEJlbml0byBKdcOhcmV6IEVudHJlIFNhbnRhIENydXogeSBFbGV1dGVyaW8gTcOpbmRleiA=', 'c3ViaXIgMyBwaXNvcyA=', 2, NULL, '0000-00-00 00:00:00'),
(89, 2, 2, 62, '2019-02-23 10:00:00', '00:00:00', 'TWFyIEVnZW8gIzI5MCBDb2wuIFBvcG90bGEsIEFsY2FsZMOtYSBNaWd1ZWwgSGlkYWxnby4gRW50cmUgbWFyIGRlIEJhbmRhIHkgTWFyIGRlIFNvbmRhIA==', 'UGxhbnRhIGJhamEg', 2, NULL, '0000-00-00 00:00:00'),
(90, 2, 2, 66, '2019-02-22 15:00:00', '00:00:00', 'QW50b25pbyBkZSBIYXJvIHkgVGFtYXJpeiAjNDAgNnRhIFNlY2Npw7NuIExvbWFzIFZlcmRlcyBBdGl6YXDDoW4gZGUgWmFyYWdvemEuIA==', 'UGxhbnRhIEJhamEu', 2, NULL, '0000-00-00 00:00:00'),
(91, 1, 2, 67, '2019-02-23 12:00:00', '00:00:00', 'QXYgU2FuIGplcsOzbmltbyAjNTAwIENvbCBKYXJkaW5lcyBkZWwgcGVkcmVnYWwsIMOBbHZhcm8gb2JyZWfDs24uIEVzcXVpbmEgY29uIEFndWEuIA0K', 'U2Ugc3ViZW4gNiBwaXNvcy4g', 2, NULL, '0000-00-00 00:00:00'),
(92, 4, 2, 68, '2019-03-01 00:00:00', '15:00:00', 'RW5jYW50byAgMjEgQ29sLiBGbG9yaWRhLCBBbGNhbGTDrWEgQWx2YXJvIE9icmVnw7NuLiBFc3F1aW5hIFRlY295b3RpdGxhLg==', 'Q29udHJhdG8gcG9yIGNvcnJlbywgaW5kaWNhIGNsaWVudGUgY29tbyBsYSB2ZXogYW50ZXJpb3IgZGVzb2N1cGEgc2FsYSB5IGNvbWVkb3IuDQpSZWd1bGFkb3IuIFZvbHRhamUgMTMyLg0K', 1, NULL, '2019-02-25 16:31:52'),
(93, 1, 2, 68, '2019-03-01 00:00:00', '15:00:00', 'RW5jYW50byAyMSBDb2wuIEZsb3JpZGEsIEFsY2FsZMOtYSBBbHZhcm8gT2JyZWfDs24sIGVzcXVpbmEgVGVjb3lvdGl0bGEuDQo=', 'Q2xpZW50ZSBwb3IgMmRhIG9jYXNpw7NuLg0KUmVndWxhZG9yIDEzMlYuDQo=', 1, NULL, '2019-02-25 16:52:42'),
(94, 2, 2, 69, '2019-03-02 00:00:00', '12:00:00', 'TWlndWVsIG5lZ3JldGUgMTA4IENvbC4gMmRhIGRlbCBQZXJpb2Rpc3RhLCBBbGNhbGRpYSBCLiBKdcOhcmV6DQpFbnRyZSBNb25vc2FiaW8geSAgRWplIENlbnRyYWwu', 'UmVzdGF1cmFudCBFbCBSYW5jaG8u', 1, NULL, '2019-02-25 17:02:31'),
(95, 2, 2, 70, '2019-03-02 00:00:00', '17:00:00', 'UHJvbG9uZ2FjacOzbiBOacOxb3MgSMOpcm9lcyAyNjYgY2FzYSAyLCBDb2wuIFNhbnRhIE1hcsOtYSBUZXBlcGFuLCBYb2NoaW1pbGNvLg0KRW50cmFyIHBvciBHdWFkYWx1cGUgUmFtw61yZXosIEhpZGFsZ28sIEFiYXNvbG8geSBOacOxb3MgSMOpcm9lcy4NCg==', 'Q2FsbGVzIEFuZ29zdGFzLg==', 1, NULL, '2019-02-25 17:20:33'),
(96, 1, 2, 71, '2019-02-28 00:00:00', '06:00:00', 'QW5kcmVzIEJlbGxvICMyOSBDb2wgUG9sYW5jbyAsIE1pZ3VlbCBIaWRhbGdvLiA=', 'UGxhbnRhIEJhamEuIERlY2lyIHF1ZSB2YW4gZGUgZ3J1cG8gY2FyaXNtYSBwYXJhIGV2ZW50byBtdWx0aWxhdGluLiAg', 2, NULL, '2019-02-26 11:03:07'),
(97, 1, 2, 72, '2019-03-01 00:00:00', '18:00:00', 'THVpcyBTcG90YSAjMTU1IENvbCBJbmRlcGVuZGVuY2lhLCBCZW5pdG8gSnXDoXJlei4=', 'UGxhbnRhIGJhamE=', 2, NULL, '2019-02-26 11:48:54'),
(98, 1, 2, 73, '2019-03-03 00:00:00', '12:00:00', 'Q29zdGEgIzIwMyBjb2wgQWxwZXMgLCDDgWx2YXJvIE9icmVnw7NuIA==', 'UGxhbnRhIEJhamEuIA==', 2, NULL, '2019-02-26 11:52:55');

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
