--------------------------------------------------
--					CLASE 3 					--
--------------------------------------------------

/* CONCATENACIÓN */

-- Mostrar nombre y telefono de usuario en una sola columna
SELECT CONCAT(nombre, '-', num_contacto) AS datos_usuario
FROM usuarios;

-- Mostrar destino y pais
SELECT CONCAT(nombre, '-', pais) AS ubicación
FROM destinos;

-- Crear descripción del destino
SELECT CONCAT(
	'El destino ', nombre,
	' se encuentra en ', pais
) AS descripción FROM destinos;

-- Crear una descripción que incluya preico
SELECT CONCAT(
	'El destino ', nombre,
	' se encuentra en ', pais,
	', con un costo de $', precio
) AS descripción FROM destinos;


/* LIMIT */

-- Solo mostrar los primeros 5 usuarios
SELECT * FROM usuarios LIMIT 5;

-- Mostrar los 5 destinos más caros
SELECT * FROM destinos 
ORDER BY precio DESC LIMIT 5;

-- 10 primeros destinos por orden alfabetico
SELECT * FROM destinos 
ORDER BY nombre LIMIT 10;


/* Paginación */
-- Mostrar los primeros 10 usuarios (1 AL 10 ~)
SELECT * FROM usuarios
LIMIT 10 OFFSET 0;

-- Mostrar los primeros 10 usuarios (11 AL 20 ~)
SELECT * FROM usuarios
LIMIT 10 OFFSET 10;

-- Mostrar los destinos del 31 AL 40 ~
SELECT * FROM usuarios
LIMIT 10 OFFSET 30;


/* WHERE */
-- Mostrar destinos con precio mayor a 15k
SELECT * FROM destinos WHERE precio > 15000 ORDER BY precio DESC;

-- Mostrar destinos con precio menor a 5k
SELECT * FROM destinos WHERE precio < 5000 ORDER BY precio DESC;

-- Mostrar destinos con precio mayor o igual a 18k
SELECT * FROM destinos WHERE precio >= 18000 ORDER BY precio DESC;

-- Mostrar destinos con precio sea distinto a 16.5k
SELECT * FROM destinos WHERE precio != 16500 ORDER BY precio DESC;

-- Mostrar destinos ubicados en México
SELECT * FROM destinos WHERE pais = 'México';

-- Mostrar destinos ubicados en Estados Unidos
SELECT * FROM destinos WHERE pais = 'Estados Unidos';


-- Destinos a México del más caro al más barato
SELECT * FROM destinos WHERE pais = 'México' ORDER BY precio DESC;

-- Destinos entre 12,000 y 17,000 ordenados por pais y precio
SELECT * FROM destinos 
WHERE precio BETWEEN 12000 AND 17000
ORDER BY pais ASC, precio DESC;

-- Buscar los 3 destinos más caros de EE.UU.
SELECT * FROM destinos WHERE pais = 'Estados Unidos' ORDER BY precio DESC LIMIT 3;


