/*Creación de tablas*/
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='rol usuario estandar y administrador ';

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rol_usuarios_idx` (`id_rol`),
  CONSTRAINT `id_rol_usuarios` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*mostrar desde la tabla usuarios los atributos de este*/
SELECT u.id, u.nombre, u.apellido, u.dni, u.email, u.clave, r.id, r.descripcion FROM traveled_code.usuarios as u
/*con join convinamos filas de 2 o mas tablas basandonos en una relación*/
join traveled_code.roles as r
on u.id_rol = r.id 
order by u.id;
/*insertamos los atributos para los usuarios*/
INSERT INTO `traveled_code`.`usuarios`
(`nombre`,
`apellido`,
`dni`,
`email`,
`clave`,
`id_rol`)
VALUES
('Thomas',
 'Cabrera',
 41441410,
'root@gmail.com',
'root1234',
2),
('Raul',
'Gonzales',
40566219,
'mateconcedron.gonzalez@gamil.com',
'burritoconmenta1',
1),
('Malen',
'Villareal',
 38333320,
'malendanza80@gmail.com',
'Dancing08',
1),
('Andres',
'Raffaeli',
 33414200,
'andresraffa2025@gmail.com',
'TalleresAzulyBlanco',
 2), 
 ('Natalia',
 'Martorina',
  34542698,
 'martorina@gmail.com',
 'naty1234',
 1);
 /*insertar atibuto para rol*/
INSERT INTO `traveled_code`.`roles`
(`descripcion`)
VALUES
('usuario'),('admin');

/*begin nos permite evitar problemas a la hora de realizar cambios en la base de datos*/
begin;
/*update nos permite modificar datos existentes*/
UPDATE `traveled_code`.`usuarios`
SET
`id_rol` = 2
WHERE `id` = 4;
/*rollback*/ 
commit


