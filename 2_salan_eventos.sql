-- Crear base de datos 'Salon_Eventos'
/* Crear las tablas:
	- usuario
	- evento
	- sala
	*/
-- usuario: id, nombre, direccion, telefono, correo
-- eventos: id, nombre, direccion, fecha, costo
-- salas: id, nombre, capacidad,

/* Nota:
	descargar e installar zotero (gestor de referencias)
*/


-- ##	Creación de la tabla de 'usuarios'	## --
create table usuarios(
	id serial not null primary key,
	nombre text not null,
	direccion varchar(100) not null,
	telefono text not null,
	correo text not null
);

-- ##	Creación de la tabla 'eventos'	## --
create table eventos(
	id serial not null primary key,
	nombre text not null,
	direccion varchar(100) not null,
	fecha date not null default current_date,
	costo numeric(10,2) not null
);

-- ## Creación de la tabla 'salas'	## --
create table salas(
	id serial not null primary key,
	nombre text not null,
	capacidad int not null
);