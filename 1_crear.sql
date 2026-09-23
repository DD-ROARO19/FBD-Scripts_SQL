--##	Tabla de destinos	##--
create table destinos(
	id serial not null primary key,
	nombre varchar(100) not null,
	pais varchar(50) not null,
	precio numeric(10,2) not null
);


-- Agregar columna "fecha_nacimiento" a 'clientes'
alter table clientes add column 
	fecha_nacimiento date;


-- Eliminar la columna "email" de 'clientes'
alter table clientes drop column email;


-- Renombrar la columna "telefono" a "num_contacto" en 'clientes'
alter table clientes rename column telefono to num_contacto;


-- Renombrar la tabla 'clientes' a 'usuarios'
alter table clientes rename to usuarios;


-- En 'destinos' agregar la restricción "not null" a pais y precio (primero la removere)
alter table destinos alter column pais drop not null;
alter table destinos alter column pais set not null;

alter table destinos alter column precio drop not null;
alter table destinos alter column precio set not null;


-- Agregar restricción unique a "num_contacto" en la tabla 'usuarios'
alter table usuarios add constraint unique_num_contacto unique(num_contacto);


-- Agregar un valor que por defecto a la columna "fecha_nacimiento"
alter table usuarios alter column fecha_nacimiento set default '2026/01/01';


-- Crear base de datos 'salon_eventos'
/* Crear las tablas:
	- usuario
	- evento
	- sala
	*/
-- usuario: id, nombre, direccion, telefono, correo
-- evento: id, nombre, direccion, fecha, costo
-- sala: id, nombre, capacidad,