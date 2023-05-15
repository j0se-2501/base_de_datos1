/*1.- Crea un usuario de nombre “alumno1” y contraseña “20alumno22”.*/

CREATE USER 'alumno1JL'@'localhost' IDENTIFIED BY '20alumno22';

/*2.- Crea otro usuario de nombre “alumno2” y contraseña “Ilerna.Sevilla”.*/

CREATE USER 'alumno2JL'@'localhost' IDENTIFIED BY 'Ilerna.Sevilla';

/*3.- Crear un tercer usuario de nombre “alumno3” y contraseña “SoyElAlumno3”*/

CREATE USER 'alumno3JL'@'localhost' IDENTIFIED BY 'SoyElAlumno3';

/*4.- Modifica la contraseña del usuario “alumno3” por “alumno.3pass”.*/

ALTER USER 'alumno3JL'@'localhost' IDENTIFIED BY 'alumno.3pass';

/*5.- Muestra el listado de todos los usuarios que tiene el SGBD ahora mismo.*/

SELECT * FROM mysql.user;

/*6.- Elimina el usuario “alumno3”.*/

DROP USER 'alumno3JL'@'localhost';

/*7.- Asigna todos los privilegios posibles al usuario “alumno1” para todas las tablas de la bd.*/

GRANT ALL ON table * TO 'alumno1JL'@'localhost';

/*8.- Asigna los privilegios de insertar, consultar y actualizar datos al usuario “alumno2” en la
tabla “actor” de la base de datos “Sakila”.*/

GRANT INSERT, UPDATE, SELECT ON table sakila.actor TO 'alumno2JL'@'localhost';

/*9.- Asigna los privilegios de insertar, crear TRIGGERS, y poder visualizar las vistas, al usuario
“alumno2” en la tabla “film” de la base de datos.*/

GRANT INSERT, TRIGGER, SHOW VIEW ON table sakila.film TO 'alumno2JL'@'localhost';

/*10.- Elimina todos los privilegios sobre la base de datos para el usuario “alumno1*/

REVOKE ALL ON sakila.* FROM 'alumno1JL'@'localhost';

/*11.- Crea un nuevo rol de nombre “full_alumnos”.*/

CREATE ROLE full_alumnosJL;

/*12.- Crea otro rol de nombre “limited_alumnos”.*/

CREATE ROLE limited_alumnosJL;

/*13.- Asigna todos los privilegios sobre la base de datos al rol “full_alumnos”.*/

GRANT ALL ON table * TO full_alumnos;

/*14.- Asigna los privilegios de la creación de claves ajenas, crear vistas y eliminar la tabla
sobre la tabla “actor” de la base de datos para el rol “limited_alumnos”*/

GRANT REFERENCES, SHOW VIEW, DROP ON table sakila.actor TO full_alumnos;

/*15.- Asigna el usuario “alumno2” al rol “limited_alumnos”.*/

GRANT limited_alumnos TO 'alumno2JL'@'localhost';


