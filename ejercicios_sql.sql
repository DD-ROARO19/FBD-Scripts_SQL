/* EJERCICIOS SQL */

-- Mostrar solamente el identificador y el nombre de cada usuario.
SELECT id, nombre FROM usuarios;

-- Mostrar nombre y teléfono utilizando los alias cliente y contacto.
SELECT nombre as cliente, num_contacto as contacto FROM usuarios;

-- Ordenar los usuarios de la Z a la A.
SELECT * FROM usuarios ORDER BY nombre DESC;

-- Mostrar destino y precio, ordenados del más económico al más caro.
SELECT nombre as destino, precio FROM destinos ORDER BY precio;

-- Mostrar país y destino, ordenando primero por país y después por destino.
SELECT pais as país, nombre as destino FROM destinos ORDER BY pais, nombre;

-- Mostrar los siete destinos más caros.
SELECT * FROM destinos ORDER BY precio DESC LIMIT 7;

-- Mostrar los ocho destinos más económicos.
SELECT * FROM destinos ORDER BY precio ASC LIMIT 8;

-- Calcular el precio de cada destino para tres personas.
SELECT *, (precio * 3) as precio_3_personas FROM destinos;

-- Calcular el precio de cada destino con un descuento del 15%.
SELECT id, nombre, pais, (precio*0.85) as precio FROM destinos;

-- Calcular cuánto se pagaría mensualmente durante diez meses.
SELECT *, TRUNC(precio/10, 2) as diez_mensualidades FROM destinos;

-- Mostrar destino y país unidos en una columna llamada informacion_destino.
SELECT CONCAT(nombre, ' se encuentra en ', pais) AS informacion_destino FROM destinos;

-- Generar una descripción con el formato: El viaje a París cuesta 14500 pesos.
SELECT CONCAT('Un viaje a ', nombre, ' cuesta $', precio, ' pesos.') as descripción FROM destinos;

-- Mostrar los primeros quince usuarios.
SELECT * FROM usuarios ORDER BY id ASC OFFSET 15;

-- Mostrar los usuarios comprendidos entre las posiciones 16 y 30.
SELECT * FROM usuarios OFFSET 15 LIMIT 15;

-- Dividir los destinos en cuatro páginas de diez registros.
SELECT * FROM destinos LIMIT 10 OFFSET (10*3);

-- Mostrar los destinos ordenados por país y, dentro de cada país, del más caro al más económico.
SELECT * FROM destinos ORDER BY pais ASC, precio DESC;

-- Mostrar el precio original, el descuento del 20% y el precio final.
SELECT id, nombre, pais, 
	precio as precio_original, 
	'20%' as descuento, 
	TRUNC(precio*0.80, 2) as precio_final 
FROM destinos;

-- Mostrar el costo individual, para dos personas y para cuatro personas.
SELECT id, nombre, pais, 
	precio as precio_individual, 
	precio*2 as precio_2_personas, 
	precio*4 as precio_4_personas 
FROM destinos;

-- Mostrar los diez primeros destinos ordenados alfabéticamente.
SELECT * FROM destinos ORDER BY nombre ASC LIMIT 10;

-- Mostrar solamente tres columnas de destinos, utilizando alias diferentes a los nombres originales.
SELECT 
	nombre as ubicación, 
	pais as localidad,
	precio as costo
FROM destinos;