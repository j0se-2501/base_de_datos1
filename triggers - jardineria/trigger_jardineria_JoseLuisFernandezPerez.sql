-- Creación de tabla HISTORICO_PRODUCTOS
CREATE TABLE HISTORICO_PRODUCTOS (
codigo INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
gama VARCHAR(50) NOT NULL,
precio_venta DECIMAL(10,2) NOT NULL,
tipo_registro ENUM('ALTA', 'BAJA', 'MODIFICACION') NOT NULL,
fecha_registro DATETIME NOT NULL
);

-- Creación de tabla HISTORICO_CLIENTES
CREATE TABLE HISTORICO_CLIENTES (
codigo INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
cod_postal VARCHAR(10) NOT NULL,
tipo_registro ENUM('ALTA', 'BAJA', 'MODIFICACION') NOT NULL,
fecha_registro DATETIME NOT NULL
);

-- Trigger para insertar en HISTORICO_PRODUCTOS
CREATE TRIGGER trg_insert_producto AFTER INSERT ON PRODUCTO
FOR EACH ROW
INSERT INTO HISTORICO_PRODUCTOS (codigo, nombre, gama, precio_venta, tipo_registro, fecha_registro)
VALUES (new.codigo_producto, new.nombre, new.gama, new.precio_venta, 'ALTA', now());

-- Trigger para actualizar en HISTORICO_PRODUCTOS
CREATE TRIGGER trg_update_producto BEFORE UPDATE ON PRODUCTO
FOR EACH ROW
INSERT INTO HISTORICO_PRODUCTOS (codigo, nombre, gama, precio_venta, tipo_registro, fecha_registro)
VALUES (OLD.codigo_producto, OLD.nombre, OLD.gama, OLD.precio_venta, 'MODIFICACION', now());

-- Trigger para borrar en HISTORICO_PRODUCTOS
CREATE TRIGGER trg_delete_producto BEFORE DELETE ON PRODUCTO
FOR EACH ROW
INSERT INTO HISTORICO_PRODUCTOS (codigo, nombre, gama, precio_venta, tipo_registro, fecha_registro)
VALUES (OLD.codigo_producto, OLD.nombre, OLD.gama, OLD.precio_venta, 'BAJA',now());

-- Trigger para insertar en HISTORICO_CLIENTES
CREATE TRIGGER trg_insert_cliente AFTER INSERT ON CLIENTE
FOR EACH ROW
INSERT INTO HISTORICO_CLIENTES (codigo, nombre, apellido, cod_postal, tipo_registro, fecha_registro)
VALUES (NEW.codigo_cliente, NEW.nombre_contacto, NEW.apellido_contacto, NEW.codigo_postal, 'ALTA', now());

-- Trigger para actualizar en HISTORICO_CLIENTES
CREATE TRIGGER trg_update_cliente AFTER UPDATE ON CLIENTE
FOR EACH ROW
INSERT INTO HISTORICO_CLIENTES (codigo, nombre, apellido, cod_postal, tipo_registro, fecha_registro)
VALUES (OLD.codigo_cliente, OLD.nombre_contacto, OLD.apellido_contacto, OLD.codigo_postal, 'MODIFICACION', now());

-- Trigger para borrar en HISTORICO_CLIENTES
CREATE TRIGGER trg_delete_cliente BEFORE DELETE ON CLIENTE
FOR EACH ROW
INSERT INTO HISTORICO_CLIENTES (codigo, nombre, apellido, cod_postal, tipo_registro, fecha_registro)
VALUES (OLD.codigo_cliente, OLD.nombre_contacto, OLD.apellido_contacto, OLD.codigo_postal, 'BAJA', now());

-- Inserción de datos de prueba en PRODUCTO
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES
('1', 'Producto 1', 'Herramientas', '200x300', 'Proveedor 1', 'Descripcion 1', 100, 20.00, 10.00),
('2', 'Producto 2', 'Frutales', '300x400', 'Proveedor 2', 'Descripcion 2', 200, 30.00, 20.00),
('3', 'Producto 3', 'Ornamentales', '400x500', 'Proveedor 3', 'Descripcion 3', 300, 40.00, 30.00);

-- Modificación de datos de prueba en PRODUCTO
-- Hay que desactivar el safe update mode en preferences\sql editor(abajo del todo)
UPDATE producto SET nombre = 'Nombre modificado 1' WHERE codigo_producto = '1';
UPDATE producto SET gama = 'Herramientas' WHERE codigo_producto = '2';
UPDATE producto SET precio_venta = 50.00 WHERE codigo_producto = '2';
UPDATE producto SET gama = 'Herramientas' WHERE codigo_producto = '3';

-- Borrado de datos de prueba en PRODUCTO
DELETE FROM producto WHERE codigo_producto = '1';
DELETE FROM producto WHERE codigo_producto = '2';

-- Inserción de datos de prueba en CLIENTE
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, ciudad, codigo_postal) VALUES
(39, 'Pepito', 'Pepe', 'Gomez', '954010101', 'fax1', 'direccion1', 'ciudad1', 41001),
(40, 'Manuel', 'Manu', 'GC', '954020202', 'fax2', 'direccion2', 'ciudad2', 41002),
(41, 'Godserra', 'God', 'Serra', '954030303', 'fax3', 'direccion3', 'ciudad3', 41003);

-- Modificación de datos de prueba en CLIENTE
UPDATE cliente SET nombre_contacto = 'Pepito' WHERE codigo_cliente = 39;
UPDATE cliente SET codigo_postal = '50001' WHERE codigo_cliente = 40;
UPDATE cliente SET apellido_contacto = 'C3' WHERE codigo_cliente = 40;
UPDATE cliente SET nombre_contacto = 'Jo' WHERE codigo_cliente = 41;

-- Borrado de datos de prueba en CLIENTE
DELETE FROM cliente WHERE codigo_cliente = 39;
DELETE FROM cliente WHERE codigo_cliente = 40;

