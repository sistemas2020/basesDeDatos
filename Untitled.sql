CREATE TABLE `cliente` (
  `IDCliente` integer[PK],
  `nombre` varchar(255),
  `direccion` varchar(255),
  `correoElectronico` varchar(255)
);

CREATE TABLE `producto` (
  `IDProducto` integer[PK],
  `nombre` varchar(255),
  `precio` decimal,
  `descripcion` text,
  `Categoria_ID` integer[FK],
  `Proveedor_ID` integer[FK]
);

CREATE TABLE `orden` (
  `IDOrden` integer[PK],
  `fechaOrden` date,
  `Cliente_ID` integer[FK]
);

CREATE TABLE `categoria` (
  `IDCategoria` integer[PK],
  `nombre` varchar(255)
);

CREATE TABLE `proveedor` (
  `IDProveedor` integer[PK],
  `nombre` varchar(255),
  `direccion` varchar(255),
  `correoElectronico` varchar(255)
);

CREATE TABLE `resena` (
  `IDResena` integer[PK],
  `Cliente_ID` integer[FK],
  `Producto_ID` integer[FK],
  `puntuacion` integer,
  `comentario` text
);

ALTER TABLE `cliente` ADD FOREIGN KEY (`IDCliente`) REFERENCES `orden` (`IDOrden`);

ALTER TABLE `categoria` ADD FOREIGN KEY (`IDCategoria`) REFERENCES `producto` (`IDProducto`);

ALTER TABLE `categoria` ADD FOREIGN KEY (`IDCategoria`) REFERENCES `producto` (`Categoria_ID`);

ALTER TABLE `proveedor` ADD FOREIGN KEY (`IDProveedor`) REFERENCES `producto` (`Proveedor_ID`);

ALTER TABLE `resena` ADD FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`IDCliente`);

ALTER TABLE `resena` ADD FOREIGN KEY (`Producto_ID`) REFERENCES `cliente` (`IDCliente`);
