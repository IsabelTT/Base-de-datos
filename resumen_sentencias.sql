#Vaciado de la tabla (borrado de datos y inicialización de id)
TRUNCATE TABLE codehouse.profesores;
TRUNCATE TABLE codehouse.alumnos;
TRUNCATE TABLE codehouse.tbi_alumnos_profesores;

# Sentencia de inserción formato largo.
INSERT INTO codehouse.profesores (nombre,id, experiencia, sede_id)
VALUES ('Juanan', NULL, 16, 3);
INSERT INTO codehouse.profesores (nombre,id, experiencia, sede_id)
VALUES ('Mario', NULL, 13, 1);

#Sentencia de insercion formato corto
INSERT INTO codehouse.profesores VALUES (NULL, 'Ivan', 12, 2),(NULL, 'Pablo', 10, 2);

#Insertar dos alumnos en la tabla alumnos.
INSERT INTO codehouse.alumnos VALUES 
(NULL, 'Carolina', 'Montero', '1994-07-20', 8, 'A12345', 'lacarol@gmail.com', 435678945, 3),
(NULL, 'Xavier', 'Pérez', '1992-03-12', 7.5, 'A23456', 'xavi@gmail.com', 123456789, 1);

#Insertar la relacion entre profesores y alumnos.
INSERT INTO codehouse.tbi_alumnos_profesores VALUES (NULL, 1, 1),(NULL, 2, 2);

## Quiero el nombre apellidos notamedia y nombre de profesor con el que trabajan de todos alumnos
SELECT alumnos.nombre, alumnos.apellidos, alumnos.notamedia, profesores.nombre 
FROM codehouse.tbi_alumnos_profesores 
INNER JOIN codehouse.alumnos ON alumnos.id = tbi_alumnos_profesores.alumno_id
INNER JOIN codehouse.profesores ON profesores.id = tbi_alumnos_profesores.profesor_id;

INSERT INTO codehouse.alumnos VALUES 
(NULL, 'Adrian', 'Aguer', '1995-01-23', 6, 'A12347', 'adrian@gmail.com', 54684222, 3),
(NULL, 'Cristina', 'Garcia', '1995-12-01', 8, 'A23444', 'cristina@gmail.com', 987654321, 2);
INSERT INTO codehouse.tbi_alumnos_profesores VALUES (NULL, 3, 1),(NULL, 4, 3);

#SENTENCIAS DE BORRADO. DELETE	
#borrar todos los campos de una tabla, CUIDADO que esta sentencia la carga el diablo.
# DELETE FROM codehouse.alumnos;

#Borrar un elemento unico,  por ID
DELETE FROM codehouse.alumnos WHERE alumnos.id=1;

#Borrar un elemento por un campo que puede existir en varios registros podemos limitar la consulta
#Haciendo que solo se borren un numero limitado de registros
DELETE FROM codehouse.alumnos WHERE alumnos.nombre="Juan" LIMIT 2;

#UPDATE o Actualización de datos.ALTER
# Esto actualiza toda la tabla alumnos con el nombre Juan.
UPDATE codehouse.alumnos SET alumnos.nombre = "Juan";

UPDATE codehouse.alumnos SET alumnos.nombre = "Xavi" WHERE alumnos.id=2;
UPDATE codehouse.alumnos SET alumnos.nombre = "Adrian" WHERE alumnos.id=3;
UPDATE codehouse.alumnos SET alumnos.nombre = "Cristina" WHERE alumnos.id=4;


#Que pasa si yo cojo y borra a Mario como profesor

DELETE FROM codehouse.profesores WHERE profesores.id=2; ##Mario





	





