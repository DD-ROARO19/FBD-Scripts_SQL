---------------------------------------------------
--					 CLASE 2					 --
---------------------------------------------------
create database PCI_Turismo_temporal;

drop database PCI_Turismo_temporal;


-- Crear Tabla Temporal
create table destinos_temp(
	id serial primary key not null,
	descripcion text
);

drop table destinos_temp;


-- Eliminar "fecha_nacimiento" de 'usuarios'
alter table usuarios drop column if exists fecha_nacimiento;


-- Eliminar la restricción "unique_num_contacto" de 'usuarios'
alter table usuarios drop constraint if exists unique_num_contacto;


-- Renombrar la column "nombre_destinos" a "nombre" en la tabla 'destinos'
alter table destinos rename column nombre_destinos to nombre;

alter table usuarios rename column nombre_cliente to nombre;


/* --##		Inserts		##-- */
insert into usuarios(nombre, apellido, num_contacto)
values ('John', 'Doe', '3322345678');

--> Select todos
select * from usuarios;

--> Alterar para funcionar con los 47 registros
alter table usuarios drop column apellido;

--> Insert multiples
insert into usuarios(nombre, num_contacto)
values
	('Luis Gonzáles', '6671987654'),
	('Ana Torres', '6671554433'),
	('Jorge Castillo', '6671345678');

--Inserta 47 clientes
INSERT INTO usuarios (nombre, num_contacto) 
VALUES
('Ana Torres', '6671554433'),
('Carla Ramírez', '6671456123'),
('Ricardo Moreno', '6671654321'),
('Andrea López', '6671765432'),
('Pedro Sánchez', '6671876543'),
('Lucía Fernández', '6671987655'),
('Héctor Pérez', '6671234561'),
('Daniela Cruz', '6671234562'),
('Raúl Hernández', '6671234563'),
('Isabel Vargas', '6671234564'),
('Sergio Flores', '6671234565'),
('Paola Reyes', '6671234566'),
('Fernando Ruiz', '6671234567'),
('Adriana Navarro', '6671234568'),
('Mauricio Díaz', '6671234569'),
('Gabriela Soto', '6671234570'),
('César López', '6671234571'),
('Laura Jiménez', '6671234572'),
('Javier Robles', '6671234573'),
('Nancy Pérez', '6671234574'),
('Carlos Martínez', '6671234575'),
('Verónica Castro', '6671234576'),
('Rafael Estrada', '6671234577'),
('Liliana García', '6671234578'),
('Francisco León', '6671234579'),
('Carmen Vega', '6671234580'),
('David Álvarez', '6671234581'),
('Sofía Mendoza', '6671234582'),
('Emilio Castro', '6671234583'),
('Silvia Romero', '6671234584'),
('Marco Ríos', '6671234585'),
('Alejandra Reyes', '6671234586'),
('Tomás Salazar', '6671234587'),
('Gloria Luna', '6671234588'),
('Hugo Duarte', '6671234589'),
('Patricia Vázquez', '6671234590'),
('Miguel Ochoa', '6671234591'),
('Raquel Rivera', '6671234592'),
('Iván Castañeda', '6671234593'),
('Diana Campos', '6671234594'),
('Manuel Rojas', '6671234595'),
('Rebeca Ramos', '6671234596'),
('Antonio Serrano', '6671234597'),
('Paty Zamora', '6671234598'),
('Rogelio Aguilar', '6671234599'),
('Elena Juárez', '6671234600'),
('Gerardo Rivas', '6671234601');

select * from usuarios;

--inserta 40 destinos
INSERT INTO destinos (nombre, pais, precio) 
VALUES
('Acapulco', 'México', 4800),
('Ixtapa', 'México', 5300),
('Manzanillo', 'México', 4900),
('Huatulco', 'México', 5100),
('Veracruz', 'México', 4200),
('Guadalajara', 'México', 3900),
('CDMX', 'México', 3600),
('Monterrey', 'México', 4000),
('Puebla', 'México', 3700),
('Querétaro', 'México', 3800),
('París', 'Francia', 14500),
('Madrid', 'España', 13200),
('Barcelona', 'España', 13800),
('Roma', 'Italia', 15000),
('Venecia', 'Italia', 15500),
('Berlín', 'Alemania', 14000),
('Ámsterdam', 'Países Bajos', 14200),
('Londres', 'Reino Unido', 16000),
('Lisboa', 'Portugal', 13500),
('Praga', 'República Checa', 12800),
('Nueva York', 'Estados Unidos', 17000),
('Los Ángeles', 'Estados Unidos', 16500),
('Miami', 'Estados Unidos', 15800),
('Las Vegas', 'Estados Unidos', 16200),
('San Francisco', 'Estados Unidos', 16800),
('Buenos Aires', 'Argentina', 12500),
('Santiago', 'Chile', 12000),
('Lima', 'Perú', 11800),
('Bogotá', 'Colombia', 11000),
('Medellín', 'Colombia', 10800),
('Tokio', 'Japón', 18500),
('Kioto', 'Japón', 18000),
('Seúl', 'Corea del Sur', 17500),
('Bangkok', 'Tailandia', 16500),
('Singapur', 'Singapur', 19000),
('Sídney', 'Australia', 19500),
('Melbourne', 'Australia', 18800),
('El Cairo', 'Egipto', 15500),
('Marrakech', 'Marruecos', 14800),
('Dubái', 'Emiratos Árabes Unidos', 20000);

select * from destinos;

-- Mostrar una sola columna de 'usuarios'
select nombre from usuarios;

-- Cambiar el nombre de las columnas vistas
select 
	nombre as user, 
	num_contacto as telefono 
from usuarios;


select nombre from destinos;
select 
	nombre as lugar, 
	pais as ubicación, 
	precio as costo 
from destinos;

/* --##		Orden	 ##-- */
-- Ordenar a los usuarios de A a la Z
SELECT * FROM usuarios ORDER BY nombre ASC;

-- Ordenar por número de contacto de manera ascendente
SELECT * FROM usuarios ORDER BY num_contacto ASC;

-- Ordenar destinos de mayor a menor precio;
SELECT * FROM destinos ORDER BY precio DESC;

SELECT * FROM destinos 
ORDER BY pais ASC, precio DESC;

SELECT * FROM destinos 
ORDER BY precio ASC, nombre ASC;


/* --##		CONSULTAS CON COLUMNAS CALCULADAS	 ##-- */
-- Mostrar el precio original y el precio con el 16% de iva adicional:
SELECT nombre, precio AS precio_original, (precio*1.16) AS precio_iva 
FROM destinos;

SELECT nombre, precio AS precio_original, ROUND(precio*1.16, 2) AS precio_iva 
FROM destinos;
SELECT nombre, precio AS precio_original, TRUNC(precio*1.16, 2) AS precio_iva 
FROM destinos;

-- Calcular descuento del 10%
SELECT nombre, 
	precio AS precio_original, 
	ROUND(precio*0.10, 2) AS descuento,
	ROUND(precio*0.90) AS precio_descuento
FROM destinos;

-- Calcular precio para 2 personas 
SELECT nombre, precio as precio_por_persona,
	(precio*2) AS precio_dos_personas
FROM destinos;

-- Calcular precio para 6 personas 
SELECT nombre, precio as precio_por_persona,
	(precio*6) AS precio_dos_personas
FROM destinos;

-- Calcular precio pagando 6 mensualidades
SELECT nombre, precio, ROUND(precio/6, 2) AS pago_mensual FROM destinos;

-- Mostrar precio en dolares usando un tipo de cambio de $18 MXN por Dolar
select nombre, precio, ROUND(precio/18, 2) AS dolar FROM destinos;