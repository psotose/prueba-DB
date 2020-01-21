CREATE DATABASE prueba;
\c prueba

CREATE TABLE clientes(id SERIAL PRIMARY KEY,
	rut VARCHAR(12),
	nombre VARCHAR(40),
	apellido_paterno VARCHAR(40),
	apellido_materno VARCHAR(40),
	direccion VARCHAR(100));

CREATE TABLE categorias(id SERIAL PRIMARY KEY,
	nombre VARCHAR(40),
	descripcion VARCHAR(150));

CREATE TABLE productos(id SERIAL PRIMARY KEY,
	nombre VARCHAR(40),
	descripcion VARCHAR(40),
	valor_unitario FLOAT,
	categoria_id INT REFERENCES categorias(id));

CREATE TABLE facturas(id SERIAL PRIMARY KEY,
	fecha DATE,
	clientes_id INT REFERENCES clientes(id),
	subtotal FLOAT,
	iva FLOAT,
	total_factura FLOAT);

CREATE TABLE detalle_factura(id SERIAL,
	facturas_id INT REFERENCES facturas(id),
	productos_id INT REFERENCES productos(id),
	valor_unitario FLOAT,
	cantidad FLOAT,
	valor_total_por_producto FLOAT,
	PRIMARY KEY(id, facturas_id));

INSERT INTO clientes(rut, nombre, apellido_paterno, 		apellido_materno, direccion) VALUES('1234567', 'Laura', 'Parez', 'Perez', 'porahi nomas 12'), ('2345678', 'Mingo', 'Cuasi', 'Lopez', 'vive mas cerca 356 ap.3'), ('1345689', 'Juan', 'Pasa', 'De La Rua', 'un poco mas lejos 67 piso 8'), ('41236578', 'Yihi','Puig', 'Sera', 'alejandose un poco'), ('9465273', 'Pasara', 'Pronto', 'Serres', 'estamos ahi 123'); 

INSERT INTO categorias(nombre, descripcion) VALUES ('Hogar', 'productos para el hogar'), ('Viajes', 'paquetes de viajes'), ('Celulares', 'telefonia movil');

INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES ('ropero', 'ropero de 6 puertas', '20', '1'), ('China', 'paquete aereo+hotel a China', '100', '2'), ('Kenya', 'vuelo a Kenya', '150', '2'), ('F100So', 'celular analogico So', '25', '3'), ('juego comedor', ' juego comedor 6 sillas', '40', '1'), ('sillon', 'sillon reclinable', '30', '1'), ('reposera', 'reposera outdoor', '23', '1'), ('lampara', 'lampara de pie', '15', '1'); 

INSERT INTO facturas(fecha, clientes_id, subtotal, iva, total_factura) VALUES ('2020-01-01', '1', '40', '4', '44'), ('2020-01-02', '1', '85', '8.5', '93.5');

INSERT INTO detalle_factura(facturas_id, productos_id, valor_unitario, cantidad, valor_total_por_producto) VALUES ('1', '1', '20', '2', '40'), ('2', '5', '40', '1', '40'), ('2', '6', '30', '1', '30'), ('2', '8', '15', '1', '15');

INSERT INTO facturas(fecha, clientes_id, subtotal, iva, total_factura) VALUES ('2020-01-02', '2', '75', '7.5', '84.5'), ('2020-01-02', '2', '200', '20', '220'), ('2020-01-02', '2', '100', '10', '110');

INSERT INTO detalle_factura(facturas_id, productos_id, valor_unitario, cantidad, valor_total_por_producto) VALUES ('3', '4', '25', '3', '75'), ('4', '2', '100', '2', '200'), ('5', '5', '40', '1', '40'), ('5', '6', '30', '2', '60');

INSERT INTO facturas(fecha, clientes_id, subtotal, iva, total_factura) VALUES ('2020-01-02', '3', '150', '15', '165');

INSERT INTO detalle_factura(facturas_id, productos_id, valor_unitario, cantidad, valor_total_por_producto) VALUES ('6', '3', '150', '1', '150');

INSERT INTO facturas(fecha, clientes_id, subtotal, iva, total_factura) VALUES ('2020-01-02', '4', '46', '4.6', '50.6'), ('2020-01-02', '4', '55', '5.5', '60.5'), ('2020-01-02', '4', '210', '21', '231'), ('2020-01-02', '4', '25', '2.5', '27.5');

INSERT INTO detalle_factura(facturas_id, productos_id, valor_unitario, cantidad, valor_total_por_producto) VALUES ('7', '7', '23', '2', '46'), ('8', '8', '15', '1', '15'), ('8', '1', '20', '2', '40'), ('9', '2', '100', '1', '100'), ('9', '5', '40', '2', '80'), ('9', '6', '30', '1', '30'), ('10', '4', '25', '1', '25');

