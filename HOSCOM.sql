
--1 Tabla Tipo_usuario
CREATE TABLE Tipo_usuario (
  ID_u INT PRIMARY KEY,
  Tipo VARCHAR(50)
);

-- 2Tabla Direccion
CREATE TABLE Direccion (
  ID_dir INT IDENTITY(1,1)  PRIMARY KEY,
  Estado VARCHAR(20),
  Delegacion VARCHAR(30),
  Colonia VARCHAR(30),
  CP INT,
  Calle VARCHAR(80),
  Numero INT,
);

-- 3Tabla Informacion_Contacto
-- CREATE TABLE Informacion_Contacto (
--   ID_info_contacto INT PRIMARY KEY,
--   Telefono INT,
--   Email VARCHAR(60)
-- );

CREATE TABLE Informacion_Contacto (
  Telefono VARCHAR(10) PRIMARY KEY,
  Email VARCHAR(60)
);
--6 Tabla Especialidades
CREATE TABLE Especialidades (
  ID_Especialidad INT IDENTITY(1,1)  PRIMARY KEY,
  Nombre_Especialidad VARCHAR(100)
);
--4 Tabla Pisos
CREATE TABLE Pisos (
  ID_Piso INT PRIMARY KEY,
  Numero_Piso INT,
  ID_Especialidad INT,
  CONSTRAINT FK_Pisos_Especialidades FOREIGN KEY (ID_Especialidad) REFERENCES Especialidades (ID_Especialidad)
);

--5 Tabla Consultorios
CREATE TABLE Consultorios (
  ID_Consultorio INT PRIMARY KEY,
  Numero_Consultorio INT,
  ID_Piso INT,
  CONSTRAINT FK_Consultorios_Pisos FOREIGN KEY (ID_Piso) REFERENCES Pisos (ID_Piso)
);



--7 Tabla Horarios
CREATE TABLE Horarios (
  ID_H INT IDENTITY(1,1)  PRIMARY KEY,
  Nombre VARCHAR(50),
  Diasemana VARCHAR(80)
);




--9 Tabla Servicios
CREATE TABLE Servicios (
  ID_Servicio INT IDENTITY(1,1)  PRIMARY KEY,
  Servicio VARCHAR(100),
  Costo DECIMAL(10, 2)
);
--9 Tabla Servicios_especialidad
CREATE TABLE servicio_especialidad(
  ID_Servicio INT,
  ID_Especialidad INT,
  CONSTRAINT FK_ServicioEspecialidad_Servicio FOREIGN KEY (ID_Servicio) REFERENCES Servicios (ID_Servicio),
  CONSTRAINT FK_ServicioEspecialidad_Especialidad FOREIGN KEY (ID_Especialidad) REFERENCES Especialidades (ID_Especialidad),
  PRIMARY KEY (ID_Servicio, ID_Especialidad)
)

--10 Tabla Administradores
CREATE TABLE Administradores (
  ID_admin INT IDENTITY(1,1)  PRIMARY KEY,
  Nombre VARCHAR(60),
  A_paterno VARCHAR(60),
  A_materno VARCHAR(60),
  ID_dir INT,
  D_u INT,
  Telefono VARCHAR(10) NOT NULL,
  password VARCHAR(50),
  CONSTRAINT FK_Admin_Direccion FOREIGN KEY (ID_dir) REFERENCES Direccion (ID_dir),
  CONSTRAINT FK_Admin_TipoUsuario FOREIGN KEY (D_u) REFERENCES Tipo_usuario (ID_u),
  CONSTRAINT FK_Admin_InfoContacto FOREIGN KEY (Telefono) REFERENCES Informacion_Contacto (Telefono)
);

--11 Tabla Recepcionista
CREATE TABLE Recepcionista (
  ID_rep INT IDENTITY(1,1)  PRIMARY KEY,
  Nombre VARCHAR(60),
  A_paterno VARCHAR(60),
  A_materno VARCHAR(60),
  ID_dir INT,
  Telefono VARCHAR(10) NOT NULL,
  D_u INT,
  password VARCHAR(50),
  CONSTRAINT FK_Recepcionista_Direccion FOREIGN KEY (ID_dir) REFERENCES Direccion (ID_dir),
  CONSTRAINT FK_Recepcionista_InfoContacto FOREIGN KEY (Telefono) REFERENCES Informacion_Contacto (Telefono),
  CONSTRAINT FK_Recepcionista_TipoUsuario FOREIGN KEY (D_u) REFERENCES Tipo_usuario (ID_u)
);

--12 Tabla Medico
CREATE TABLE Medico (
  Cedula VARCHAR(20) PRIMARY KEY,
  Nombre VARCHAR(60),
  A_materno VARCHAR(60),
  A_Paterno VARCHAR(60),
  ID_Especialidad INT,
  ID_H INT,
  ID_dir INT,
 Telefono VARCHAR(10) NOT NULL,
  Id_Consultorio INT,
  D_u INT,
  password VARCHAR(50),
  CONSTRAINT FK_Medico_Especialidad FOREIGN KEY (ID_Especialidad) REFERENCES Especialidades (ID_Especialidad),
  CONSTRAINT FK_Medico_Horarios FOREIGN KEY (ID_H) REFERENCES Horarios (ID_H),
  CONSTRAINT FK_Medico_Direccion FOREIGN KEY (ID_dir) REFERENCES Direccion (ID_dir),
  CONSTRAINT FK_Medico_InfoContacto FOREIGN KEY (Telefono) REFERENCES Informacion_Contacto (Telefono),
  CONSTRAINT FK_Medico_Consultorio FOREIGN KEY (Id_Consultorio) REFERENCES Consultorios (ID_Consultorio),
  CONSTRAINT FK_Medico_TipoUsuario FOREIGN KEY (D_u) REFERENCES Tipo_usuario (ID_u)
);

--13 Tabla Historial_clinico
CREATE TABLE Historial_clinico (
  No_HC INT IDENTITY(1,1)  PRIMARY KEY,
  Diagnostico VARCHAR(200),
  Fecha_creacion DATE,
  Observaciones VARCHAR(200),
  Nombre_Doc VARCHAR(60),
  Consultorio INT,
  Costo DECIMAL(10, 2),
  horario TIME,
  NSS VARCHAR(20),
  ID_C INT,);




--14 Tabla Paciente
CREATE TABLE Paciente (
  NSS VARCHAR(20) PRIMARY KEY,
  Nombre VARCHAR(60),
  A_paterno VARCHAR(60),
  A_materno VARCHAR(60),
  No_HC INT,
  ID_dir INT,
  Telefono VARCHAR(10) NOT NULL,
  D_u INT,
  password VARCHAR(50),
  CONSTRAINT FK_Paciente_Direccion FOREIGN KEY (ID_dir) REFERENCES Direccion (ID_dir),
  CONSTRAINT FK_Paciente_InfoContacto FOREIGN KEY (Telefono) REFERENCES Informacion_Contacto (Telefono),
  CONSTRAINT FK_Paciente_TipoUsuario FOREIGN KEY (D_u) REFERENCES Tipo_usuario (ID_u)
);






--15 Tabla Cita
CREATE TABLE Cita (
  ID_C INT IDENTITY(1,1)  PRIMARY KEY,
  NSS VARCHAR(20),
  Cedula VARCHAR(20),
  Fecha DATE,
  Estatus VARCHAR(50),
  COSTO DECIMAL(10, 2),
  HORA varchar(8),
  CONSTRAINT FK_Cita_Paciente FOREIGN KEY (NSS) REFERENCES Paciente (NSS),
  CONSTRAINT FK_Cita_Medico FOREIGN KEY (Cedula) REFERENCES Medico (Cedula),
);

--16 Tabla Cita_Servicio
CREATE TABLE Cita_Servicio (
  ID_C INT,
  ID_Servicio INT,
  CONSTRAINT FK_CitaServicio_Cita FOREIGN KEY (ID_C) REFERENCES Cita (ID_C),
  CONSTRAINT FK_CitaServicio_Servicio FOREIGN KEY (ID_Servicio) REFERENCES Servicios (ID_Servicio),
  PRIMARY KEY (ID_C, ID_Servicio)
);

--17 Tabla Cita_Consultorio
CREATE TABLE Cita_Consultorio (
  ID_C INT,
  ID_Consultorio INT,
  CONSTRAINT FK_CitaConsultorio_Cita FOREIGN KEY (ID_C) REFERENCES Cita (ID_C),
  CONSTRAINT FK_CitaConsultorio_Consultorio FOREIGN KEY (ID_Consultorio) REFERENCES Consultorios (ID_Consultorio),
  PRIMARY KEY (ID_C, ID_Consultorio)
);

--18 Tabla Cita_Piso
CREATE TABLE Cita_Piso (
  ID_C INT,
  ID_Piso INT,
  CONSTRAINT FK_CitaPiso_Cita FOREIGN KEY (ID_C) REFERENCES Cita (ID_C),
  CONSTRAINT FK_CitaPiso_Piso FOREIGN KEY (ID_Piso) REFERENCES Pisos (ID_Piso),
  PRIMARY KEY (ID_C, ID_Piso)
);

-- 19 Tabla Presentacion
CREATE TABLE Presentacion (
  ID_P INT IDENTITY(1,1) PRIMARY KEY ,
  Presentacion VARCHAR(60),
);


-- 20 Tabla Medicamentos
CREATE TABLE Medicamentos (
  ID_Medicamento INT IDENTITY(1,1)  PRIMARY KEY,
  Nombre_Medicamento VARCHAR(100),
  ID_Presentacion INT,
   Disponibilidad tinyint 
  CONSTRAINT FK_Medicamentos_Presentacion FOREIGN KEY (ID_Presentacion) REFERENCES Presentacion (ID_P)
);



-- 21 Tabla Receta
CREATE TABLE Receta (
  ID_R INT IDENTITY(1,1)  PRIMARY KEY,
  Diagnostico VARCHAR(200),
  Fecha_creacion DATE,
  Observaciones VARCHAR(200),
  Cedula VARCHAR(20),
  NSS VARCHAR(20),
  ID_C INT, -- Nueva columna para el ID de la cita
  CONSTRAINT FK_Receta_Medico FOREIGN KEY (Cedula) REFERENCES Medico (Cedula),
  CONSTRAINT FK_Receta_Paciente FOREIGN KEY (NSS) REFERENCES Paciente (NSS),
  CONSTRAINT FK_Receta_Cita FOREIGN KEY (ID_C) REFERENCES Cita (ID_C)
);

-- insert into Receta (Diagnostico, Fecha_creacion, Observaciones, Cedula, NSS, ID_C) values ('influenza', '2020-05-01', 'El paciente presenta dolor de pecho anormal',  'E12345678901234567', '12345678901234567890', 1);
-- insert into Receta (Diagnostico, Fecha_creacion, Observaciones, Cedula, NSS, ID_C) values ('influenza', '2020-05-01', 'El paciente presenta dolor de pecho anormal',  'E12345678901234567', '12345678901234567890', 2);
-- insert into Receta (Diagnostico, Fecha_creacion, Observaciones, Cedula, NSS, ID_C) values ('influenza', '2020-05-01', 'El paciente presenta dolor de pecho anormal',  'E12345678901234567', '12345678901234567890', 3);
-- insert into Receta (Diagnostico, Fecha_creacion, Observaciones, Cedula, NSS) values ('influenza', '2020-05-01', 'El paciente presenta dolor de pecho anormal',  'E12345678901234567', '12345678901234567890')

-- 22 Tabla Receta_Medicamento
CREATE TABLE Receta_Medicamento (
  ID_R INT,
  ID_Medicamento INT,
  indicaciones VARCHAR(200),
  CONSTRAINT FK_RecetaMedicamento_Receta FOREIGN KEY (ID_R) REFERENCES Receta (ID_R),
  CONSTRAINT FK_RecetaMedicamento_Medicamento FOREIGN KEY (ID_Medicamento) REFERENCES Medicamentos (ID_Medicamento),
  PRIMARY KEY (ID_R, ID_Medicamento)
);

 
 ALTER TABLE Historial_clinico ADD CONSTRAINT FK_HistorialClinico_Paciente FOREIGN KEY (NSS) REFERENCES Paciente (NSS);

