-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2023 a las 01:41:46
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `systemgym`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteMembresias` ()   BEGIN SELECT * from membresias;END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteVentas` ()   BEGIN
SELECT * from ventas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Genero` varchar(1) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `Nombre`, `Genero`, `FechaNacimiento`, `Email`, `Telefono`) VALUES
(1, 'FABRICIO', 'M', '2002-11-10', '@GMAIL.COM', '3411456773'),
(2, 'ALFREDO', 'M', '2002-11-20', '@HOTMIAL.COM', '3411456788'),
(3, 'PEPE', 'M', '2023-04-13', '@OUTLOOK.COM', '3411456772'),
(5, 'ISAMAR', 'F', '2023-04-16', 'ISA@OUTLOOK.COM', '3412235');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `IdCompra` int(11) NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  `Factura` varchar(10) NOT NULL,
  `Fecha` varchar(50) NOT NULL,
  `Subtotal` float NOT NULL,
  `Iva` float NOT NULL,
  `Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`IdCompra`, `IdProveedor`, `Factura`, `Fecha`, `Subtotal`, `Iva`, `Total`) VALUES
(1, 3, '4555', '2023-04-23', 2912.5, 466, 3378.5),
(2, 1, '1147', '2023-04-24', 393.572, 62.9715, 456.543),
(3, 3, '01178631', '2023-04-24', 1016.67, 162.667, 1179.33),
(4, 3, '110084', '2023-04-24', 4660, 745.6, 5405.6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptogasto`
--

CREATE TABLE `conceptogasto` (
  `IdConcepto` int(11) NOT NULL,
  `Descripcion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conceptogasto`
--

INSERT INTO `conceptogasto` (`IdConcepto`, `Descripcion`) VALUES
(1, 'Pago de Luz'),
(2, 'Pago de agua potable'),
(3, 'Pago de predial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `IdCompra` int(11) NOT NULL,
  `IdProducto` varchar(25) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallecompra`
--

INSERT INTO `detallecompra` (`IdCompra`, `IdProducto`, `Cantidad`, `Costo`) VALUES
(1, '11599', 5, 582.5006),
(0, '', 0, 0),
(2, '11788', 1, 393.5718),
(0, '', 0, 0),
(3, '11599', 2, 508.33334),
(0, '', 0, 0),
(4, '558877', 4, 1165),
(0, '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `IdVenta` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`IdVenta`, `IdProducto`, `Cantidad`, `Precio`) VALUES
(1, 11599, 2, 600),
(1, 11788, 1, 500),
(2, 11788, 3, 500),
(3, 11599, 5, 600),
(3, 11788, 5, 500),
(4, 202403, 5, 859),
(4, 88996, 2, 599),
(5, 11599, 7, 600),
(5, 888866, 3, 1000),
(5, 88996, 1, 800),
(6, 11599, 2, 600),
(6, 558877, 6, 1750),
(6, 996654, 4, 659),
(7, 558877, 2, 1750),
(8, 558877, 2, 1750),
(9, 558877, 2, 1750),
(10, 558877, 3, 1750);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `IdGasto` int(11) NOT NULL,
  `IdConcepto` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`IdGasto`, `IdConcepto`, `Fecha`, `Importe`) VALUES
(1, 3, '2023-04-24', 1200),
(2, 1, '2023-04-24', 855),
(3, 2, '2023-04-24', 6.54354e16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresodiario`
--

CREATE TABLE `ingresodiario` (
  `IdIngreso` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresodiario`
--

INSERT INTO `ingresodiario` (`IdIngreso`, `IdCliente`, `Fecha`, `Importe`) VALUES
(1, 1, '2023-03-24', 379),
(2, 3, '2023-03-29', 500),
(3, 3, '2023-03-29', 1250),
(4, 4, '2023-03-29', 2580),
(5, 5, '2023-04-24', 14),
(6, 5, '2023-04-24', 14),
(7, 1, '2023-04-24', 30),
(8, 2, '2023-04-24', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `IdMembresia` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `FechaDeExpedicion` date NOT NULL,
  `FechaDeVencimiento` date NOT NULL,
  `Importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`IdMembresia`, `IdCliente`, `FechaDeExpedicion`, `FechaDeVencimiento`, `Importe`) VALUES
(1, 1, '2023-04-24', '2023-05-24', 329),
(2, 2, '2023-04-24', '2023-04-05', 13),
(3, 2, '2023-04-24', '2023-04-05', 13),
(4, 3, '2023-04-24', '2023-06-25', 1200),
(5, 4, '2023-03-29', '2023-04-29', 579),
(6, 5, '2023-04-27', '2023-03-20', 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` varchar(20) NOT NULL,
  `IdTipo` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Costo` float NOT NULL,
  `Existencia` int(11) NOT NULL,
  `Maximo` int(11) NOT NULL,
  `Minimo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `IdTipo`, `Descripcion`, `Precio`, `Costo`, `Existencia`, `Maximo`, `Minimo`) VALUES
('11599', 1, 'Venom', 600, 508.333, 10, 25, 8),
('11788', 1, 'TOTAL WAR', 500, 400, 12, 30, 2),
('202403', 2, 'NUTRI', 859, 520, 14, 30, 2),
('558877', 2, 'WHEYGOLD', 1750, 1420, 11, 30, 2),
('888866', 4, 'TESTROL', 1000, 1100, 18, 30, 1),
('88996', 3, 'NITRAFLEX', 800, 650, 20, 30, 5),
('996654', 3, 'PHYSCO', 659, 500, 18, 40, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `IdProveedor` int(11) NOT NULL,
  `Empresa` varchar(30) NOT NULL,
  `Contacto` varchar(40) NOT NULL,
  `Domicilio` varchar(40) NOT NULL,
  `Colonia` varchar(30) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `Ciudad` varchar(30) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`IdProveedor`, `Empresa`, `Contacto`, `Domicilio`, `Colonia`, `CP`, `Ciudad`, `Telefono`, `Email`) VALUES
(1, 'CBUMLL', 'JUANCARLOS', 'LOMAS', 'CENTRO', '49650', 'TAMAZULA', '3411456773', '@GMAIL.COM'),
(2, 'CLEMBUNOX', 'PEPE@', 'LOMAS DEL MONTE', 'CENTRO', '46859', 'GDL', '3411456788', '@HOTMIAL.COM'),
(3, 'DRAGON', 'JUANREPA', 'LOMAS DEL SUR', 'NORTE', '49688', 'JUAREZ', '3415589776', '@OUTLOOK.COM'),
(4, 'RTX`', 'GEFORCE', 'LOMAS DEL VALLE', 'CENTRO', '49650', 'TAMAZULA', '3411456773', '@GMAIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroes`
--

CREATE TABLE `registroes` (
  `IdRegistro` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Tipo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registroes`
--

INSERT INTO `registroes` (`IdRegistro`, `IdCliente`, `Fecha`, `Hora`, `Tipo`) VALUES
(1, 1, '2023-04-24', '04:26:00', 'E'),
(2, 3, '2023-04-24', '10:21:00', 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproductos`
--

CREATE TABLE `tipoproductos` (
  `IdTipo` int(11) NOT NULL,
  `Categoria` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoproductos`
--

INSERT INTO `tipoproductos` (`IdTipo`, `Categoria`) VALUES
(1, 'PRE-WORKOUT'),
(2, 'PROTEINA'),
(3, 'AMINOACIDOS'),
(4, 'CLEMBU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IdVenta` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Subtotal` float NOT NULL,
  `Iva` float NOT NULL,
  `Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IdVenta`, `IdCliente`, `Fecha`, `Subtotal`, `Iva`, `Total`) VALUES
(1, 1, '2023-03-24', 1700, 272, 1972),
(2, 1, '2023-03-25', 1500, 240, 1740),
(3, 2, '2023-04-01', 5500, 880, 6380),
(4, 1, '2023-03-29', 5493, 878.88, 6371.88),
(5, 1, '2023-04-25', 8000, 1280, 9280),
(6, 1, '2023-04-24', 14336, 2293.76, 16629.8),
(7, 2, '2023-04-24', 17836, 2853.76, 20689.8),
(8, 0, '2023-04-24', 21336, 3413.76, 24749.8),
(9, 0, '2023-04-24', 24836, 3973.76, 28809.8),
(10, 0, '2023-04-24', 30086, 4813.76, 34899.8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`IdCompra`);

--
-- Indices de la tabla `conceptogasto`
--
ALTER TABLE `conceptogasto`
  ADD PRIMARY KEY (`IdConcepto`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD KEY `IdCompra` (`IdCompra`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`IdGasto`);

--
-- Indices de la tabla `ingresodiario`
--
ALTER TABLE `ingresodiario`
  ADD PRIMARY KEY (`IdIngreso`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`IdMembresia`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indices de la tabla `registroes`
--
ALTER TABLE `registroes`
  ADD PRIMARY KEY (`IdRegistro`);

--
-- Indices de la tabla `tipoproductos`
--
ALTER TABLE `tipoproductos`
  ADD PRIMARY KEY (`IdTipo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IdVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `IdCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `conceptogasto`
--
ALTER TABLE `conceptogasto`
  MODIFY `IdConcepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `IdGasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingresodiario`
--
ALTER TABLE `ingresodiario`
  MODIFY `IdIngreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `IdMembresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `IdProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `registroes`
--
ALTER TABLE `registroes`
  MODIFY `IdRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoproductos`
--
ALTER TABLE `tipoproductos`
  MODIFY `IdTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IdVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
