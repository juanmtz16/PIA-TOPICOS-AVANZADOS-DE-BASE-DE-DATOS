USE FRUTERIASTORY;
CREATE TABLE IF NOT EXISTS `FRUTERIASTORY`.`producto` (
  `idProducto` BIGINT NOT NULL,
  `nombreProducto` VARCHAR(60) NOT NULL,
  `precio` FLOAT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`idProducto`));

  CREATE TABLE IF NOT EXISTS `FRUTERIASTORY`.`cliente` (
  `idCliente` BIGINT NOT NULL,
  `nombreCliente` VARCHAR(60) NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`idCliente`));
  
  CREATE TABLE IF NOT EXISTS `FRUTERIASTORY`.`empleado` (
  `idEmpleado` BIGINT NOT NULL,
  `nombreEmpleado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEmpleado`));
  
  CREATE TABLE IF NOT EXISTS `FRUTERIASTORY`.`compra` (
  `idCompra` BIGINT NOT NULL,
  `idProducto` BIGINT NOT NULL,
  `idCliente` BIGINT NOT NULL,
  `idEmpleado` BIGINT NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idEmpleado_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `FRUTERIASTORY`.`producto` (`idProducto`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `FRUTERIASTORY`.`cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `FRUTERIASTORY`.`empleado` (`idEmpleado`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
  
INSERT INTO `FRUTERIASTORY`.`empleado` (`idEmpleado`, `nombreEmpleado`) VALUES (1670998, 'Luis Flores Ramirez');
INSERT INTO `FRUTERIASTORY`.`empleado` (`idEmpleado`, `nombreEmpleado`) VALUES (1988920, 'Juan Pablo Antonio Gtz');
INSERT INTO `FRUTERIASTORY`.`empleado` (`idEmpleado`, `nombreEmpleado`) VALUES (1852288, 'Jorge Alberto Martinez Estrada');

INSERT INTO `FRUTERIASTORY`.`producto` (`idProducto`, `nombreProducto`, `precio`, `cantidad`) VALUES (100001, 'Platano', 15, 3);
INSERT INTO `FRUTERIASTORY`.`producto` (`idProducto`, `nombreProducto`, `precio`, `cantidad`) VALUES (100002, 'Manzana', 31, 5);
INSERT INTO `FRUTERIASTORY`.`producto` (`idProducto`, `nombreProducto`, `precio`, `cantidad`) VALUES (100003, 'Naranja', 18, 7);

INSERT INTO `FRUTERIASTORY`.`cliente` (`idCliente`, `nombreCliente`, `cantidad`) VALUES (1854691, 'Gabriela Zaragoza Perez', 5);
INSERT INTO `FRUTERIASTORY`.`cliente` (`idCliente`, `nombreCliente`, `cantidad`) VALUES (1853972, 'Jessy Ramos Torres', 4);
INSERT INTO `FRUTERIASTORY`.`cliente` (`idCliente`, `nombreCliente`, `cantidad`) VALUES (1487459, 'Antonio Juarez Mata', 2.5);

#SARGABLE
SELECT idCliente FROM cliente WHERE nombreCliente LIKE 'Ga%';
SELECT nombreProducto FROM Producto WHERE cantidad >= 1 AND cantidad <= 3;
SELECT nombreCliente, cantidad FROM cliente WHERE cantidad > 4
