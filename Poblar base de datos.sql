INSERT INTO Tipo_usuario (ID_u, Tipo)
VALUES
  (1, 'Administrador'),
  (2, 'Recepcionista'),
  (3, 'Medico'),
  (4, 'Paciente');



INSERT INTO Informacion_Contacto (Telefono, Email) 
VALUES
  --rep
  ('9876543210', 'a@a.com'),
  ('1234567891', 'b@b.com'),
  ('8765432109', 'c@c.com'),
  --med nut
  ('2345678555', 'd@d.com'),
  ('7654321098', 'e@e.com'),
  ('3456789777', 'f@f.com'),  
  
  ('1111111111', 't@t.com'),
  ('2222222222', 'u@u.com'),
  ('3333333333', 'v@v.com'),
  ('4444444444', 'w@w.com'),

  ('5555555555', 'x@x.com'),
  ('6666666666', 'y@y.com'),
   ('7777777777', 'z@z.com'),
  ('8888888888', 'aa@aza.com'),

  ('9999999999', 'bb@bb.com'),
  ('0000000001', 'cc@cc.com'),
  ('8888888000', 'aza@aawa.com'),
  ('9999999997', 'bfqb@bfqwb.com'),
  ('0000000000', 'ccfa@cqc.com'),
    --med general
  ('6543210987', 'g@g.com'),
  ('4567890123', 'h@h.com'),
  ('5432109876', 'i@i.com'),
  ('1111222233', 'dd@dd.com'),
  ('4444555566', 'ee@ee.com'),
  ('7777888899', 'ff@ff.com'),

 
  ('2222333344', 'gg@gg.com'),
  ('5555666777', 'hh@hh.com'),
  ('8888999900', 'ii@ii.com'),
    ('1111000011', 'jj@jj.com'),
  ('4444333322', 'kk@kk.com'),
  ('7777666655', 'll@ll.com'),

  ('2222111133', 'mm@mm.com'),
    --med pediatria
  ('5678901234', 'j@j.com'),
  ('6789012345', 'k@k.com'),
  ('7890123456', 'l@l.com'),

    ('5555444466', 'nn@nn.com'),
  ('8888777799', 'oo@oo.com'),
  ('1111222288', 'pp@pp.com'),

  ('4444555533', 'qq@qq.com'),
  ('7777888866', 'rr@rr.com'),

  ('2222333355', 'ss@ss.com'),
 
 ('5555666788', 'tt@tt.com'),
  ('8888999911', 'uu@uu.com'),
  ('1111000022', 'vv@vv.com'),
 
 ('4444333344', 'ww@ww.com'),
    --med odont
	('8901234567', 'm@m.com'),
  ('9012345678', 'n@n.com'),
  ('0123456789', 'o@o.com'),  
  ('7777666677', 'xx@xx.com'),
    
  ('1111666677', 'aaa@aa.com'),
  ('2222333388', 'bbb@bb.com'),
  ('4444555599', 'ccc@cc.com'),


  ('3333222211', 'ddd@dd.com'),
  ('5555444422', 'eee@ee.com'),
  ('6666777799', 'fff@ff.com'),

 
  ('7777111133', 'ggg@gg.com'),
  ('8888444433', 'hhh@hh.com'),
  ('9999888899', 'iii@ii.com')
  --admin
  ('1234567890', 'p@p.com'),
  --pacientes
  ('2345678901', 'q@q.com'),
  ('3456789012', 'r@r.com'),
  ('4567899999', 's@s.com');


 
  





-- Recepcionista 1
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES ('Ruben', 'Mercado', 'Flores',2,'contrasenarep1','9876543210');

-- Recepcionista 2
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES ('Carlos', 'Lopez', 'Cruz',2,'contrasenarep2','1234567891');

-- Recepcionista 3
INSERT INTO Recepcionista (Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES ('Frida', 'Ramirez', 'Gutierrez',2,'contrasenarep3','8765432109');


-- Especialidad 1 nutricion
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Nutricion');

-- Especialidad 2 Medicina general
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Medicina general');

-- Especialidad 3 pediatria
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Pediatria');

-- Especialidad 4
INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Odontologia');


-- Servicios asociados a Nutricion
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Evaluación Nutricional', 100.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Seguimiento y Monitoreo Nutricional', 200.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Planificación de Dietas', 300.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (1, 1), (2, 1), (3, 1);

-- Servicios asociados a Medicina general
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Consulta médica general', 150.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Examen físico y diagnóstico', 250.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Seguimiento de enfermedades crónicas', 350.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (4, 2), (5, 2), (6, 2);

-- Servicios asociados a Pediatria
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Consulta pediátrica regular', 180.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Vacunación infantil', 280.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Seguimiento del desarrollo y crecimiento del niño', 380.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (7, 3), (8, 3), (9, 3);

-- Servicios asociados a Odontologia
INSERT INTO Servicios (Servicio, Costo)
VALUES ('Limpieza dental', 600.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Tratamiento de caries', 480.00);

INSERT INTO Servicios (Servicio, Costo)
VALUES ('Extracciones dentales', 1300.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (10, 4), (11, 4), (12, 4);


-- Insertar los valores en la tabla "Horarios"
INSERT INTO Horarios (nombre) VALUES ('matutino');
INSERT INTO Horarios (nombre) VALUES ('vespertino');
INSERT INTO Horarios (nombre) VALUES ('nocturno');


INSERT INTO Pisos (ID_Piso, Numero_Piso, ID_Especialidad)
VALUES
  (1, 1, 1), -- Asocia el primer piso con  Nutricion
  (2, 2, 2), -- Asocia el segundo piso con   Medicina General
  (3, 3, 3), -- Asocia el tercer piso con  Pediatria
  (4, 4, 4);  -- Asocia el tercer piso con  Odontologia
  -- Continúa con el resto de pisos y especialidades



INSERT INTO Consultorios (ID_Consultorio, Numero_Consultorio, ID_Piso)
VALUES
  -- Piso 1 nutricion
  (1, 101, 1),
  (2, 102, 1),
  (3, 103, 1),
  (4, 104, 1),
  (5, 105, 1),
  
  -- Piso 2 medicina genereal
  (6, 201, 2),
  (7, 202, 2),
  (8, 203, 2),
  (9, 204, 2),
  (10, 205, 2),
  
  -- Piso 3 pediatria
  (11, 301, 3),
  (12, 302, 3),
  (13, 303, 3),
  (14, 304, 3),
  (15, 305, 3),
  
  -- Piso 4 odontologia
  (16, 401, 4),
  (17, 402, 4),
  (18, 403, 4),
  (19, 404, 4),
  (20, 405, 4);


-- Medicos 

INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u, password, Telefono)
VALUES
-- Medico N1 matutino
  ('E12345678901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1,3, '123456','2345678555'),

   ('E123456y8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 2,3, 'a12345z','1111111111'),
    ('E123456p8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 3,3, 'b23456y','2222222222'),
	 ('E123456v8906234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 4,3, 'c34567x','3333333333'),
	  ('E123456x8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 5,3, 'd45678w','4444444444'),
  -- Medico N1 vespertino
  ('E12345678901234568', 'Juan', 'Gomez', 'Lopez', 1, 2, 1, 3, 'e56789v','7654321098'),

   ('E123456l8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 2, 2,3, 'f67890u','5555555555'),
    ('E123456m8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 2, 3,3, 'g78901t','6666666666'),
	 ('E123456t8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 2, 4,3, 'i90123r','7777777777'),
	  ('E123456s8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 2, 5,3, 'j01234q','8888888888'),
  -- Medico N1 nocturno
  ('E12345678901234569', 'Ana', 'Rodriguez', 'Hernandez', 1, 3, 3, 3, 'k54321p','3456789777'),

   ('E123456h8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1,3, 'l65432o','9999999999'),
    ('E123456n8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1,3, 'm76543n','0000000001'),
	 ('E123456g8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1,3, 'n87654m','8888888000'),
	  ('E123456f8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1,3, 'o98765l','9999999997'),
	   ('E123456a8901234567', 'Sugu', 'Chaidez', 'Perez', 1, 1, 1,3, 'p09876k','0000000000'),
	   











  --Medico MG1 matutino
  ('E12345678901234570', 'Pedro', 'Mendoza', 'Garcia', 2, 1, 6, 3, '456789', '6543210987'),
  -- Medico MG1 vespertino
  ('E12345678901234571', 'Luisa', 'Vargas', 'Soto', 2, 2, 7, 3, '567890', '4567890123'),
  -- Medico MG1 nocturno
  ('E12345678901234572', 'María', 'Fuentes', 'Paz', 2, 3, 8,3, '678901', '5432109876'),


 
  -- Medico P1 matutino
  ('E12345678901234573', 'Carlos', 'Rojas', 'Luna', 3, 1, 11, 3, '789012', '5678901234'),
  -- Medico P1 vespertino
  ('E12345678901234574', 'Laura', 'Torres', 'Díaz', 3, 2, 12, 3, '890123', '6789012345'),
  -- Medico P1 nocturno
  ('E12345678901234575', 'Roberto', 'González', 'Silva', 3, 3, 13, 3, '901234', '7890123456'),


   
  -- Medico OD1 matutino
  ('E12345678901234111', 'Julia', 'Hernández', 'Martínez', 4, 1, 16, 3, '012345', '8901234567'),
   -- Medico OD1 vespertino
  ('E12345678901234222', 'Fernanda', 'Martinez', 'Martínez', 4, 2, 17, 3, '012345', '9012345678'),
   -- Medico OD1 nocturno
  ('E12345678901234333', 'Maria', 'Zamora', 'De leon', 4, 3, 18, 3, '012345', '0123456789');

  

-- Paciente 1
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES 
   ('12345678901234567890', 'Marco', 'perez', 'cruz', 4,'123456','2345678901'),
 ('98765432109876543210', 'Fabiola', 'bernal', 'Mercado', 4, '654321', '3456789012'),
  ('24681357902468135790', 'Pamela', 'Flores', 'Valverde', 4, '987654', '4567899999');

  

-- Administrador 1
INSERT INTO Administradores (Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES ('Administrador1Nombre', 'Administrador1ApellidoPaterno', 'Administrador1ApellidoMaterno',  1,'123456','1234567890');
-- Insertar datos en la tabla Presentacion
INSERT INTO Presentacion (Presentacion)
VALUES
  ('Tabletas 500 mg'),
  ('Jarabe 200 ml'),
  ('Cápsulas 50 mg'),
  ('Crema 30 g'),
  ('Inyectable 10 mg'),
  ('Gotas 15 ml');

-- Insertar datos en la tabla Medicamentos
INSERT INTO Medicamentos (Nombre_Medicamento, ID_Presentacion, Disponibilidad)
VALUES
  ('Paracetamol', 1, 1),
  ('Ibuprofeno', 2, 1),
  ('Amoxicilina', 3, 1),
  ('Omeprazol', 4, 1),
  ('Loratadina', 5, 1),
  ('Aspirina', 6, 1),
  ('Dipirona', 1, 1),
  ('Diclofenaco', 2, 1),
  ('Metformina', 3, 1),
  ('Simvastatina', 4, 1),
  ('Prednisona', 5, 1),
  ('Sertralina', 6, 1),
  ('Fluoxetina', 1, 1),
  ('Losartán', 2, 1),
  ('Omeprazol', 4, 1),
  ('Loratadina', 4, 1),

  ('Ibuprofeno', 3, 1);

-- Medicamento con varias presentaciones
INSERT INTO Medicamentos (Nombre_Medicamento, ID_Presentacion, Disponibilidad)
VALUES ('Diclofenaco', 1, 1),
       ('Diclofenaco', 4, 1),
       ('Diclofenaco', 6, 1);


