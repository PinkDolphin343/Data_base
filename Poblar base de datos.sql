INSERT INTO Tipo_usuario (ID_u, Tipo)
VALUES
  (1, 'Administrador'),
  (2, 'Recepcionista'),
  (3, 'M�dico'),
  (4, 'Paciente');



INSERT INTO Informacion_Contacto (Telefono, Email)  VALUES
  ('1234567890', 'a@a.com'),
  ('2345678901', 'b@b.com'),
  ('3456789012', 'c@c.com'),
  ('4567890123', 'd@d.com'),
  ('5678901234', 'e@e.com');

-- Recepcionista 1
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno,  D_u, password, ID_info_contacto)
VALUES ('Ruben', 'Mercado', 'Flores',2,'123456','1234567890');


-- Especialidad 1
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Nutricion');

-- Especialidad 2
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Generales');

-- Especialidad 3
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Pediatria');

-- Servicios asociados a Especialidad 1
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio1Nutricion1', 100.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio2Nutricion1', 200.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio3Nutricion1', 300.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (1, 1), (2, 1), (3, 1);

-- Servicios asociados a Especialidad 2
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio1Generales2', 150.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio2Generales2', 250.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio3Generales2', 350.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (4, 2), (5, 2), (6, 2);

-- Servicios asociados a Especialidad 3
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio1Pediatria3', 180.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio2Pediatria3', 280.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio3Pediatria3', 380.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (7, 3), (8, 3), (9, 3);
-- Insertar los valores en la tabla "Horarios"
INSERT INTO Horarios (nombre) VALUES ('matutino');
INSERT INTO Horarios (nombre) VALUES ('vespertino');
INSERT INTO Horarios (nombre) VALUES ('nocturno');


INSERT INTO Pisos (ID_Piso, Numero_Piso, ID_Especialidad)
VALUES
  (1, 1, 1), -- Asocia el primer piso con la primera especialidad
  (2, 2, 2), -- Asocia el segundo piso con la segunda especialidad
  (3, 3, 3); -- Asocia el tercer piso con la tercera especialidad
  -- Continúa con el resto de pisos y especialidades


INSERT INTO Consultorios (ID_Consultorio, Numero_Consultorio, ID_Piso)
VALUES
  (1, 101, 1),
  (2, 102, 1),
  (3, 201, 2),
  (4, 202, 2),
  (5, 301, 3),
  (6, 302, 3),
  (7, 401, 4),
  (8, 402, 4),
  (9, 501, 5),
  (10, 502, 5);

-- M�dico 1
INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u, password, ID_info_contacto)
VALUES ('E12345678901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1, 3,'123456','2345678901');

-- Paciente 1
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno,  D_u, password, ID_info_contacto)
VALUES ('12345678901234567890', 'Paciente1Nombre', 'Paciente1ApellidoPaterno', 'Paciente1ApellidoMaterno', 4,'123456','3456789012');

-- Administrador 1
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u, password, ID_info_contacto)
VALUES ('Administrador1Nombre', 'Administrador1ApellidoPaterno', 'Administrador1ApellidoMaterno',  1,'123456','4567890123');

insert into Presentacion (ID_P,Presentacion, Disponibilidad) values (1, 'Tabletas 300 mg', 'Disponible'), (2,'Tabletas 500 mg', 'Disponible'), (3,'Tabletas 1000 mg', 'Disponible'), (4,'Tabletas 200 mg', 'Disponible'), (5,'Tabletas 400 mg', 'Disponible'), (6,'Tabletas 600 mg', 'Disponible'), (7,'Tabletas 800 mg', 'Disponible'), (8,'Tabletas 100 mg', 'Disponible'), (9,'Tabletas 200 mg', 'Disponible'), (10,'Tabletas 400 mg', 'Disponible'), (11,'Tabletas 600 mg', 'Disponible'), (12,'Tabletas 800 mg', 'Disponible'), (13, 'Tabletas 100 mg', 'Disponible'), (14,'Tabletas 200 mg', 'Disponible');
insert into Medicamentos (Nombre_Medicamento, ID_Presentacion) values ('Medicamento1', 1), ('Medicamento2', 2), ('Medicamento3', 3), ('Medicamento4', 4), ('Medicamento5', 5), ('Medicamento6', 6), ('Medicamento7', 7), ('Medicamento8', 8), ('Medicamento9', 9), ('Medicamento10', 10), ('Medicamento11', 11), ('Medicamento12', 12), ('Medicamento13', 13), ('Medicamento14', 14);

-- hasta aqui

-- M�dico 2
INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u, password)
VALUES ('F98765432109876543', 'Camilo', 'Medico2ApellidoMaterno', 'Medico2ApellidoPaterno', 2, 2, 2, 3,'123456');

-- M�dico 3
INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u, password)
VALUES ('G24681357902468135', 'Medico3Nombre', 'Medico3ApellidoMaterno', 'Medico3ApellidoPaterno', 3, 3, 3, 3,'123456');



-- Paciente 2
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno,  D_u, password)
VALUES ('98765432109876543210', 'Paciente2Nombre', 'Paciente2ApellidoPaterno', 'Paciente2ApellidoMaterno', 4,'123456');

-- Paciente 3
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno, D_u, password)
VALUES ('24681357902468135790', 'Paciente3Nombre', 'Paciente3ApellidoPaterno', 'Paciente3ApellidoMaterno', 4,'123456');



-- Administrador 2
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u, password)
VALUES ('Administrador2Nombre', 'Administrador2ApellidoPaterno', 'Administrador2ApellidoMaterno',  1,'123456');

-- Administrador 3
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u, password)
VALUES ('Administrador3Nombre', 'Administrador3ApellidoPaterno', 'Administrador3ApellidoMaterno',  1,'123456');

-- Recepcionista 2
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno, D_u, password)
VALUES ('Yahir', 'Martinez', 'Gomez',2,'123456');

-- Recepcionista 3
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno, D_u, password)
VALUES ('Carlos', 'Lico', 'Martinez', 2,'123456');
