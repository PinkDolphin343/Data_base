--Funciones
--Funcion para obttener informacion de cita 

SELECT * FROM ObtenerInformacionCita(4);





--funcion para obtener informacion receta
SELECT *
FROM dbo.ObtenerInformacionReceta(3);






--Funcion para obttener COSTO de cita 
--SELECT dbo.CalcularCostoTotalCita(4) AS CostoTotalCita;
--SELECT dbo.obtenerIDEspecialidadCita(@ID_C) AS IDEspecialidadCita;












--SPs

--SP crear cita
EXEC dbo.AgregarCita14 @NSS = '98765432109876543210', @Cedula = 'E12345678901234568', @Fecha = '2070-06-23', @Hora = '8:30', @ID_Servicio = 3, @costo = 50;

--SP insertar receta


EXEC InsertarReceta @Diagnostico = 'Valor del diagn�stico',@FechaCreacion = '2050-06-23', @Observaciones = 'Valor de las observaciones', @CedulaMedico = 'E12345678901234568', @NSSPaciente = '98765432109876543210', @IDCita = 5;

INSERT INTO Receta_Medicamento(ID_R,ID_medicamento)
VALUES (,);



--TTRIGGGGEEEEEEEERS

-- Actualizar una receta existente
-UPDATE Receta
SET Diagnostico = 'Nuevo diagn�stico',
  Observaciones = 'Nuevas observaciones'
WHERE ID_R = 13; -- ID de la receta que deseas actualizar

 --Verificar los resultados
SELECT * FROM Receta;

/*

INSERT INTO Informacion_Contacto (Telefono, Email) 
VALUES

  ('5525550807', 'z@z.com'),
  ('5512345678', 'x@x.com'),
  ('5509876543', 'y@y.com');

  INSERT INTO Recepcionista (Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES ('flor', 'Mercado', 'de la ttorre',2,'contrasenarep4','5525550807');


INSERT INTO Especialidades (Nombre_Especialidad)
VALUES ('Radiologia');

INSERT INTO Servicios (Servicio, Costo)
VALUES ('servicioradiologia1', 300.00);
INSERT INTO Servicios (Servicio, Costo)
VALUES ('servicioradiologia2', 300.00);

insert into servicio_especialidad (ID_Servicio, ID_Especialidad) values (13, 4), (14, 4);


INSERT INTO Pisos (ID_Piso, Numero_Piso, ID_Especialidad) VALUES  (5, 5, 5);

INSERT INTO Consultorios (ID_Consultorio, Numero_Consultorio, ID_Piso) 
(21, 501, 5);


INSERT INTO Medico (Cedula, Nombre, A_materno, A_Paterno, ID_Especialidad, ID_H,  Id_Consultorio, D_u, password, Telefono)
VALUES
-- Medico R1 matutino
  ('E1234567897654377', 'rodrigo', 'monreal', 'rivera', 1, 1, 1,3, '1234as','5512345678');


  
INSERT INTO Paciente (NSS, Nombre, A_paterno, A_materno,  D_u, password, Telefono)
VALUES 
   ('12345678901234777777', 'Marco', 'perez', 'cruz', 4,'123456','5509876543');


   


 SELECT *
FROM Medico
INNER JOIN Horarios ON Medico.ID_H = Horarios.ID_H
WHERE Horarios.Nombre = 'Matutino';


   SELECT *
FROM Medicamentos
WHERE ID_Presentacion = 5;


   SELECT Cita.ID_C, Cita.NSS, Cita.Cedula, Cita.Fecha, Cita.Estatus, Cita.COSTO, Cita.HORA
FROM Cita
INNER JOIN Medico ON Cita.Cedula = Medico.Cedula
INNER JOIN Especialidades ON Medico.ID_Especialidad = Especialidades.ID_Especialidad
WHERE Especialidades.Nombre_Especialidad = 'Nutricion';



   */

