#TRUNCATAR una tabla consiste en vaciar la tabla de datos y reiniciar el indice primario
TRUNCATE TABLE nombreTabla;

#BORRAR una tabla consiste en eliminar datos y estructura
DROP TABLE nombreTabla;

#INSERTAR 3 PROFESORES
INSERT INTO gimnasioCodehouse.profesores VALUES (NULL, 'Lucia', 10),(NULL, 'Pepe', 30),(NULL, 'Marcos', 5);

#INSERTAR 5 CLIENTES
INSERT INTO gimnasioCodehouse.clientes VALUES 
(NULL, 'Juan Antonio','Pérez Jarillo', 'Calle desengaño 23', 'jj@gmail.com', 39, 'm', NOW(), 39.90, '1982-03-05', '56789123B', 1);

#Borrar un cliente por id el querais
DELETE FROM gimnasioCodehouse.clientes WHERE clientes.id = 1;

#Borrar todos los clientes que sean menores de 20 años (que tenemos que tener varios clientes con menos de 20 años)
DELETE FROM gimnasioCodehouse.clientes WHERE clientes.edad <= 20;

# actualizar todos clientes cuyo genero sea masculino a la cuota a 39.90
UPDATE gimnasioCodehouse.clientes SET clientes.cuota = 39.90 WHERE clientes.genero = 'm'; 

# actualizar el cliente que querais su direccion.
UPDATE gimnasioCodehouse.clientes SET clientes.direccion = 'Calle Granvia 29, 28013 Madrid'
WHERE clientes.id = 3;

#CREAR UNA BASE DE DATOS POR SENTENCIAS SQL
CREATE DATABASE IF NOT EXISTS pruebaBBDD CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pruebaBBDD;

#Borrar una base de datos
DROP DATABASE pruebaBBDD;

#CREAR UNA TABLA DENTRO DE UNA BASE DE DATOS de GIMNASIO
CREATE TABLE salas(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    capacidad BIGINT NOT NULL, 
    profesor_id INT(11),
    FOREIGN KEY (profesor_id)
		REFERENCES profesores (id)        
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

#Crear el indice de tabla para poder proteger las relaciones.
CREATE INDEX fk_profesor ON salas(profesor_id);


