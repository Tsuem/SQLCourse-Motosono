CREATE DATABASE IF NOT EXISTS sanifersac;

USE sanifersac;

CREATE TABLE medio_de_pago (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    medio_de_pago VARCHAR(50)
);

CREATE TABLE estado_de_venta (
	id INT NOT NULL PRIMARY KEY,
    descripcion_estado VARCHAR(20)
);

CREATE TABLE proveedor (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    telefono INT
);

CREATE TABLE fabrica (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_fabrica VARCHAR(50),
    telefono INT,
    direccion VARCHAR(100)
);

CREATE TABLE ciudad (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(40)
);

CREATE TABLE cliente (
	id INT NOT NULL PRIMARY KEY,
    razon_social VARCHAR(200) NOT NULL,
    telefono INT,
    direccion VARCHAR(100),
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id)
);

CREATE TABLE empleado (
	dni_empleado INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(40),
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    email VARCHAR(100) NOT NULL,
    telefono INT,
    id_ciudad INT NOT NULL,
    id_fabrica INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id),
    FOREIGN KEY (id_fabrica) REFERENCES fabrica(id)
);

CREATE TABLE producto (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    precio DECIMAL(5,2),
    stock INT,
    id_fabrica INT NOT NULL,
    FOREIGN KEY (id_fabrica) REFERENCES fabrica(id)
);

CREATE TABLE material (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    stock INT,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id)
);

CREATE TABLE detalle_factura_venta (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_estado_de_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    id_medio_de_pago INT,
    FOREIGN KEY (id_estado_de_venta) REFERENCES estado_de_venta(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id),
    FOREIGN KEY (id_medio_de_pago) REFERENCES medio_de_pago(id)
);

CREATE TABLE detalle_factura_compra (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    id_material INT NOT NULL,
    id_medio_de_pago INT,
    FOREIGN KEY (id_material) REFERENCES material(id),
    FOREIGN KEY (id_medio_de_pago) REFERENCES medio_de_pago(id)
);

CREATE TABLE venta_a_cliente (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_detalle_factura_venta INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_detalle_factura_venta) REFERENCES detalle_factura_venta(id)
);

CREATE TABLE compra_a_proveedor (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_detalle_factura_compra INT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
    FOREIGN KEY (id_detalle_factura_compra) REFERENCES detalle_factura_compra(id)
);

CREATE TABLE marcacion (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora_ingreso TIME,
    hora_salida TIME,
    dni_empleado INT,
    FOREIGN KEY (dni_empleado) REFERENCES empleado(dni_empleado)
);



