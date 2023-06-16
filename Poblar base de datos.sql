INSERT INTO Tipo_usuario (ID_u, Tipo)
VALUES
  (1, 'Administrador'),
  (2, 'Recepcionista'),
  (3, 'Médico'),
  (4, 'Paciente');

-- Recepcionista 1
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno,  D_u)
VALUES ('Ruben', 'Mercado', 'Flores',2);

-- Recepcionista 2
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno, D_u)
VALUES ('Yahir', 'Martinez', 'Gomez',2);

-- Recepcionista 3
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno, D_u)
VALUES ('Carlos', 'Lico', 'Martinez', 2);


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

-- Servicios asociados a Especialidad 2
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio1Generales2', 150.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio2Generales2', 250.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio3Generales2', 350.00);

-- Servicios asociados a Especialidad 3
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio1Pediatria3', 180.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio2Pediatria3', 280.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Servicio3Pediatria3', 380.00);
-- Insertar los valores en la tabla "Horarios"
INSERT INTO Horarios (nombre) VALUES ('matutino');
INSERT INTO Horarios (nombre) VALUES ('vespertino');
INSERT INTO Horarios (nombre) VALUES ('nocturno');

INSERT INTO Pisos (ID_Piso, Numero_Piso)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

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



-- Médico 1
INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u)
VALUES ('E12345678901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1, 3);

-- Médico 2
INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u)
VALUES ('F98765432109876543', 'Camilo', 'Medico2ApellidoMaterno', 'Medico2ApellidoPaterno', 2, 2, 2, 3);

-- Médico 3
INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u)
VALUES ('G24681357902468135', 'Medico3Nombre', 'Medico3ApellidoMaterno', 'Medico3ApellidoPaterno', 3, 3, 3, 3);

-- Paciente 1
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno,  D_u)
VALUES ('12345678901234567890', 'Paciente1Nombre', 'Paciente1ApellidoPaterno', 'Paciente1ApellidoMaterno', 4);

-- Paciente 2
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno,  D_u)
VALUES ('98765432109876543210', 'Paciente2Nombre', 'Paciente2ApellidoPaterno', 'Paciente2ApellidoMaterno', 4);

-- Paciente 3
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno, D_u)
VALUES ('24681357902468135790', 'Paciente3Nombre', 'Paciente3ApellidoPaterno', 'Paciente3ApellidoMaterno', 4);

-- Administrador 1
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u)
VALUES ('Administrador1Nombre', 'Administrador1ApellidoPaterno', 'Administrador1ApellidoMaterno',  1);

-- Administrador 2
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u)
VALUES ('Administrador2Nombre', 'Administrador2ApellidoPaterno', 'Administrador2ApellidoMaterno',  1);

-- Administrador 3
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u)
VALUES ('Administrador3Nombre', 'Administrador3ApellidoPaterno', 'Administrador3ApellidoMaterno',  1);