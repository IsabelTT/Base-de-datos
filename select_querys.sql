#SELECT, son aquellas que me permiten extraer informacion de mis tablas del BBDD.
#No solo me permite extraer información de una tabla sino juntar o crear tablas virtuales
# (tablas que no existe en mi modelo), juntando datos de varias tablas.

/* Seleccionar todos los datos de una tabla cualquiera */
SELECT * FROM gimnasioCodehouse.clientes;

/* Seleccionar todos los datos de la tabla profesores */
SELECT * FROM gimnasioCodehouse.profesores;

/* Seleccionar solo el nombre y apellido de todos los clientes */
SELECT clientes.nombre, clientes.apellidos FROM gimnasioCodehouse.clientes;

/* ALIAS DE CAMPO */
SELECT clientes.nombre, clientes.fecha_inscripcion as 'inscripcion' 
FROM gimnasioCodehouse.clientes;

/* ALIAS DE TABLA */
SELECT c.nombre, c.edad, c.cuota, c.direccion FROM gimnasioCodehouse.clientes as c;

/* Quiero el apellido, la edad y la cuota 'mensualidad' de clientes 
por ese orden. USAR ALIAS TABLA Y DE CAMPO */

SELECT c.apellidos, c.edad, c.cuota as 'mensualidad' FROM gimnasioCodehouse.clientes as c;

/* FUNCIONES DENTRO DE CONSULTAS */

/* Quiero saber cuantos clientes tiene mi gimnasio COUNT()*/

/* COUNT es un funcion que me permite contar registros unicos, no repetidos */

SELECT COUNT(*) as 'clientes_totales' FROM gimnasioCodehouse.clientes;
SELECT COUNT(clientes.id) as 'clientes_totales' FROM gimnasioCodehouse.clientes;

/* Quiero saber cuantos clientes tiene son mujeres COUNT()*/
SELECT COUNT(clientes.id) as 'mujeres' FROM gimnasioCodehouse.clientes 
WHERE clientes.genero = 'f';

/* Quiero saber los ingresos totales por mes SUM() */

SELECT SUM(clientes.cuota) as 'ingresos_mensuales' FROM gimnasioCodehouse.clientes;

/* Vamos a obtener la edad media de mis clientes AVG() */
SELECT CEIL(AVG(clientes.edad)) as 'edad_media' FROM gimnasioCodehouse.clientes;

/*
	CEIL() redondeo a la alta
    FLOOR() redondeo a la baja
    ROUND() redondeo matematico
    TRUNCATE(numero, decimales) TRUNCATE(3.14151617, 2) -> 3.14
    POWER(numero, exponente) - POWER(2,3) -> 8
    SQRT() -> raiz cuadrada
*/

/* obtener el valor MAX y MIN de algo por ejemplo la edad MAX() y MIN() */

SELECT MAX(clientes.edad) as 'edad_max' , MIN(clientes.edad) as 'edad_min' 
FROM gimnasioCodehouse.clientes;

/* WHERE sirve para condicionar mis consultas */

/* Quiero obtener los clientes que tengan 31 años */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.edad = 31;

/* Quiero obtener los clientes que tengan entre 40 y 60 años AND y &&, OR o || */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.edad >= 40 AND clientes.edad <= 60;

/* Quiero saber la edad y la cuota del cliente cuyo email es dquemby3@tumblr.com */

SELECT c.edad, c.cuota FROM gimnasioCodehouse.clientes as c 
WHERE c.email= "dquemby3@tumblr.com";

/* Quiero saber el nombre y la fecha_nacimiento de los clientes que tengan direccion */

SELECT c.nombre, c.fecha_nacimiento FROM gimnasioCodehouse.clientes as c
WHERE c.direccion != "";

/* Quiero saber todos los datos de los clientes cuyo profesor sea Nora Contreras */

/* opcion facil sería a traves de profesor_id */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.profesor_id = 5;

/* SUBCONSULTAS - consultas dentro de consultas */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.profesor_id = 
(SELECT id FROM gimnasioCodehouse.profesores WHERE profesores.nombre = "Nora Contreras");

/* Quiero todos los clientes que sean mayores que la media de edad del gimnasio */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.edad > 
( SELECT AVG(clientes.edad) FROM gimnasioCodehouse.clientes);

/* cuantos hombres hay en el gimnasio */
SELECT COUNT(*) as 'hombres' FROM gimnasioCodehouse.clientes WHERE clientes.genero = "m";

/* Sacar la lista de clientes que se han inscrito el los ultimo 12 meses */

/* opcion 1 */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.fecha_inscripcion > '2020-12-01' 
AND clientes.fecha_inscripcion < '2021-12-01';

/* opcion 2 NOW() */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.fecha_inscripcion > '2020-12-01' 
AND clientes.fecha_inscripcion < NOW();

/* opcion 3 PRO */
SELECT * FROM gimnasioCodehouse.clientes 
WHERE clientes.fecha_inscripcion > adddate(NOW(), INTERVAL - 12 MONTH);

/* Consultar a mas de una tabla */

/* Quiero los datos de de nombre, cuota, el nombre del profesor de cada cliente 
con el que da clase */

SELECT c.nombre as 'cliente' , c.cuota, p.nombre as 'profesor'
FROM gimnasioCodehouse.clientes as c, gimnasioCodehouse.profesores as p
WHERE p.id = c.profesor_id;

/* Quiero una lista de clientes con nombre, email, cuota, y nombre del profesor, experiencia pero solo quiero aquellos datos cuyo profesor 
tenga mas de 10 años de experiencia*/

SELECT c.nombre as 'cliente' , c.cuota, c.email, p.nombre as 'profesor', p.experiencia 
FROM gimnasioCodehouse.clientes as c, gimnasioCodehouse.profesores as p
WHERE p.id = c.profesor_id AND p.experiencia > 10; 

/* ORDENAR RESULTADOS - ORDER BY ASC/DESC, siempre va despues del WHERE */

/* Quiero sacar los clientes ordenados por edad de mayor a menor */

SELECT * FROM gimnasioCodehouse.clientes ORDER BY clientes.edad DESC; 

/* Quiero sacar los clientes ordenador alfabeticamente por nombre de la Z a A - ASC A-Z DESC Z-A  */

SELECT * FROM gimnasioCodehouse.clientes ORDER BY clientes.nombre DESC;

/*	Quiero una lista de clientes ordenados por edad de mayor a menor y en caso de tener la
misma edad me las ordenas de por nombre de la A-Z */

SELECT * FROM gimnasioCodehouse.clientes ORDER BY clientes.edad DESC, clientes.nombre ASC;

/* Quiero sacar lista de clientes con nombre, apellidos, email y cuota, nombre del profesor,
cuya cuota sea de 16.90, ordenados de Z-A por el apellido del cliente */

SELECT c.nombre as 'cliente', c.apellidos, c.email, c.cuota, p.nombre as 'profesor'
FROM gimnasioCodehouse.clientes as c, gimnasioCodehouse.profesores as p
WHERE p.id = c.profesor_id AND c.cuota = 16.90 ORDER BY c.apellidos DESC;

/* Quiero un listado de datos de los clientes con solo el nombre del profesor */

/* tabla.* me devuelve todos los campos de esa tabla */

SELECT clientes.*, profesores.nombre 
FROM gimnasioCodehouse.clientes, gimnasioCodehouse.profesores
WHERE clientes.profesor_id = profesores.id ;

/* AGRUPACION DE DATOS - GROUP BY agrupar datos por consulta*/

/* Quiero el listado de profesores con el numero de alumnos que tienen */

SELECT profesores.* , COUNT(clientes.id) as 'numero_clientes'
FROM gimnasioCodehouse.profesores, gimnasioCodehouse.clientes
WHERE profesores.id= clientes.profesor_id GROUP BY clientes.profesor_id;

/* Quiero numero de clientes por cuota mensual */

SELECT clientes.cuota, COUNT(clientes.id) as 'numero_clientes'
FROM gimnasioCodehouse.clientes GROUP BY clientes.cuota;

/* Quiero numero de clientes agrupados por genero */
SELECT clientes.genero, COUNT(clientes.id) as 'numero_clientes' 
FROM gimnasioCodehouse.clientes GROUP BY clientes.genero;

/* CONCATENACIONES DE RESULTADOS (CONCAT, CONCAT_WS) */

/* Quiero saber lo clientes con nombre y apellido en un sola columna (juntos) 
en otra columna la edad y el email */

SELECT CONCAT(c.nombre, " ", c.apellidos, ": ", c.edad) as 'nombre_completo', c.email 
FROM gimnasioCodehouse.clientes as c;

SELECT CONCAT_WS(' - ' ,c.nombre, c.apellidos, c.edad) as 'nombre_completo', c.email 
FROM gimnasioCodehouse.clientes as c;

/* GROUP_CONCAT me permite agrupar por valores separados por comas */

/* Quiero una lista profesores con los nombres de todos sus alumnos */

SELECT profesores.*, GROUP_CONCAT(clientes.nombre) as 'clientes'
FROM gimnasioCodehouse.profesores, gimnasioCodehouse.clientes
WHERE profesores.id = clientes.profesor_id
GROUP BY profesores.id;

/* CONSULTAS CON RANGOS - BETWEEN AND */

/* Quiero una lista de clientes cuya edad este entre 30 y 40 años */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.edad >= 30 AND clientes.edad <= 40;

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.edad BETWEEN 30 AND 40;

/* los contrarios */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.edad NOT BETWEEN 30 AND 40;

/* BUSQUEDAS SEMANTICAS */

/* Quiero buscar un cliente por nombre concreto Flemming, no es semantica */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.nombre = "Flemming";

/* LIKE busca dentro de cadenas de texto el valor que le designemos, 
o las caracteres obtenido en l a busqueda, puede ser que empiece por , acabe por, o contenga.
*/

/* Quiero saber los clientes que empiecen su nombre por `l` */
/* Mysql no es case sensitive */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.nombre LIKE 'l%';

/* Quiero saber los clientes que terminen su nombre por `l` */
SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.nombre LIKE '%l';

/* Quiero saber los clientes que contengan en su nombre por `ear` */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.nombre LIKE '%ear%';

/* quiero saber clientes cuyo apellido empiece por h y termine por z */

SELECT * FROM gimnasioCodehouse.clientes 
WHERE clientes.apellidos LIKE 'h%' AND clientes.apellidos like '%z';

SELECT * FROM gimnasioCodehouse.clientes 
WHERE clientes.apellidos LIKE 'h%z';

/* quiero un listado de clientes cuyo nombre tenga como tercera letra una r */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.nombre LIKE '__r%';

/* quiero un listado de clientes cuyo email contenga un _: caracteres de escape con la \ */ 

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.email LIKE '%\_%';

/* personalizar el caracter de escape */

SELECT * FROM gimnasioCodehouse.clientes WHERE clientes.email LIKE '%*_%' ESCAPE '*';

/* HAVING - me permite condicionar agrupaciones de consultas */

/* Quiero saber que genero es mas comun en mi gimnasio */

SELECT clientes.genero, COUNT(clientes.id) as 'cantidad' FROM gimnasioCodehouse.clientes
GROUP BY clientes.genero HAVING cantidad >= ( SELECT CEIL(COUNT(*)/2) 
FROM gimnasioCodehouse.clientes);

/* CONSULTAS A MAS DE DOS TABLAS */

/* quiero una lista de clientes con sus ejercicios asignados con sus tiempos y repeticiones.*/

SELECT c.*, e.titulo, ce.repeticiones, ce.minutos 
FROM gimnasioCodehouse.tbi_clientes_ejercicios as ce
JOIN gimnasioCodehouse.clientes as c ON c.id = ce.cliente_id
JOIN gimnasioCodehouse.ejercicios as e ON e.id = ce.ejercicio_id;

/* quiero una lista de Nolan con sus ejercicios asignados con sus tiempos y repeticiones.*/

SELECT c.*, e.titulo, ce.repeticiones, ce.minutos 
FROM gimnasioCodehouse.tbi_clientes_ejercicios as ce
INNER JOIN gimnasioCodehouse.clientes as c ON c.id = ce.cliente_id
INNER JOIN gimnasioCodehouse.ejercicios as e ON e.id = ce.ejercicio_id
WHERE c.id = (
SELECT c.id FROM gimnasioCodehouse.clientes as c WHERE c.email='nlovekin19@printfriendly.com');

 /* lista de clientes con un campo con sus ejercicio separado comas */
SELECT c.nombre, c.apellidos, GROUP_CONCAT(e.titulo) as 'ejercicios'
FROM gimnasioCodehouse.tbi_clientes_ejercicios as ce
JOIN gimnasioCodehouse.clientes as c ON c.id = ce.cliente_id
JOIN gimnasioCodehouse.ejercicios as e ON e.id = ce.ejercicio_id
GROUP BY c.nombre, c.apellidos;

/* quiero nombre, apellidos de cliente con un listado de ejercicios 
separado por comas y nombre del profesor que los supervisa */

SELECT c.nombre, c.apellidos, GROUP_CONCAT(e.titulo) as 'ejercicios', p.nombre
FROM gimnasioCodehouse.tbi_clientes_ejercicios as ce
JOIN gimnasioCodehouse.clientes as c ON c.id = ce.cliente_id
JOIN gimnasioCodehouse.ejercicios as e ON e.id = ce.ejercicio_id
JOIN gimnasioCodehouse.profesores as p ON p.id = c.profesor_id
GROUP BY c.nombre, c.apellidos, p.nombre;


SELECT c.nombre, c.apellidos, GROUP_CONCAT(e.titulo) as 'ejercicios', p.nombre
FROM gimnasioCodehouse.clientes as c
JOIN gimnasioCodehouse.tbi_clientes_ejercicios as ce ON c.id = ce.cliente_id
JOIN gimnasioCodehouse.ejercicios as e ON e.id = ce.ejercicio_id
JOIN gimnasioCodehouse.profesores as p ON p.id = c.profesor_id
GROUP BY c.nombre, c.apellidos, p.nombre;

/* quiero una lista de clientes, nombre y apellidos con numero de repeticion totales 
que tiene que hacer cuando va al gimnasio */

SELECT c.nombre, c.apellidos, SUM(ce.repeticiones) as 'repeticiones_totales'
FROM gimnasioCodehouse.tbi_clientes_ejercicios as ce
JOIN gimnasioCodehouse.clientes as c ON c.id = ce.cliente_id
GROUP BY c.nombre, c.apellidos;

/* quiero un listado de todos los clientes tenga o no tenga ejercicios, 
El listado de ejercicio estará separado por comas */

SELECT c.nombre, c.apellidos, GROUP_CONCAT(e.titulo) as 'ejercicios'
FROM gimnasioCodehouse.clientes as c
LEFT JOIN gimnasioCodehouse.tbi_clientes_ejercicios as ce ON ce.cliente_id = c.id
LEFT JOIN gimnasioCodehouse.ejercicios as e ON ce.ejercicio_id = e.id
GROUP BY c.nombre, c.apellidos;







