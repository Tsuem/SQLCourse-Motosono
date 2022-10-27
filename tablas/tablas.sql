CREATE DATABASE IF NOT EXISTS sanifersac;

USE sanifersac;

CREATE TABLE ciudad (
	id_ciudad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(40)
);

CREATE TABLE fabrica (
	id_fabrica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_fabrica VARCHAR(50),
    telefono INT,
    direccion VARCHAR(100)
);

CREATE TABLE proveedor (
	id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    telefono INT
);

CREATE TABLE estado_de_venta (
	id_estado_de_venta INT NOT NULL PRIMARY KEY,
    descripcion_estado VARCHAR(20)
);

CREATE TABLE medio_de_pago (
	id_medio_de_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    medio_de_pago VARCHAR(20)
);

CREATE TABLE cliente (
	dni_cliente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(40),
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono_movil INT,
    direccion VARCHAR(100),
    codigo_postal INT,
    id_ciudad INT NOT NULL,
    CONSTRAINT `FK_CLIENTE_CIUDAD` FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE empleado (
	dni_empleado INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(40),
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    email VARCHAR(100) NOT NULL,
    telefono_movil INT,
    direccion VARCHAR(100),
    id_ciudad INT NOT NULL,
    id_fabrica INT NOT NULL,
    CONSTRAINT `FK_EMPLEADO_CIUDAD` FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
    CONSTRAINT `FK_EMPLEADO_FABRICA` FOREIGN KEY (id_fabrica) REFERENCES fabrica(id_fabrica)
);

CREATE TABLE producto (
	id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100),
    precio DECIMAL(5,2),
    stock INT,
    id_fabrica INT NOT NULL,
    CONSTRAINT `FK_PRODUCTO_FABRICA` FOREIGN KEY (id_fabrica) REFERENCES fabrica(id_fabrica)
);

CREATE TABLE material (
	id_material	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    stock INT,
    id_proveedor INT NOT NULL,
    CONSTRAINT `FK_MATERIAL_PROVEEDOR` FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE venta_a_cliente (
	id_venta_a_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_detalle_factura_venta INT NOT NULL,
    CONSTRAINT `FK_VENTA_CLIENTE` FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT `FK_VENTA_FACTURA` FOREIGN KEY (id_detalle_factura_venta) REFERENCES detalle_factura_venta(id_detalle_factura_venta)
);

CREATE TABLE compra_a_proveedor (
	id_compra_a_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_detalle_factura_compra INT NOT NULL,
    CONSTRAINT `FK_COMPRA_PROVEEDOR` FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    CONSTRAINT `FK_COMPRA_FACTURA` FOREIGN KEY (id_detalle_factura_compra) REFERENCES detalle_factura_compra(id_detalle_factura_compra)
);

CREATE TABLE detalle_factura_venta (
	id_detalle_factura_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_estado_de_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    id_medio_de_pago INT,
    CONSTRAINT `FK_FACTURA_VENTA_ESTADO` FOREIGN KEY (id_estado_de_venta) REFERENCES estado_de_venta(id_estado_de_venta),
    CONSTRAINT `FK_FACTURA_PRODUCTO` FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    CONSTRAINT `FK_FACTURA_VENTA_MEDIO` FOREIGN KEY (id_medio_de_pago) REFERENCES medio_de_pago(id_medio_de_pago)
);

CREATE TABLE detalle_factura_compra (
	id_detalle_factura_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    id_material INT NOT NULL,
    id_medio_de_pago INT,
    CONSTRAINT `FK_FACTURA_MATERIAL` FOREIGN KEY (id_material) REFERENCES material(id_material),
    CONSTRAINT `FK_FACTURA_COMPRA_MEDIO` FOREIGN KEY (id_medio_de_pago) REFERENCES medio_de_pago(id_medio_de_pago)
);



CREATE TABLE marcacion (
	id_marcacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora_ingreso TIME,
    hora_salida TIME,
    dni_empleado INT,
    CONSTRAINT `FK_MARCACION_EMPLEADO` FOREIGN KEY (dni_empleado) REFERENCES empleado(id_empleado)
);



