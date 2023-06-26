--trigger para cuando se crea una cita

CREATE TRIGGER TRG_CrearHistorialClinico
ON Cita
AFTER INSERT
AS
BEGIN
  DECLARE @FechaCreacion DATE, @NombreDoctor VARCHAR(60), @Consultorio INT, @Costo DECIMAL(10, 2), @Horario VARCHAR(8), @NSS VARCHAR(20), @IDCita INT, @operacion VARCHAR(30);

  -- Obtener los valores de la nueva cita
  SELECT @FechaCreacion = Fecha, @NSS = NSS, @IDCita = ID_C
  FROM inserted;

  -- Obtener el nombre del médico y el consultorio
  SELECT @NombreDoctor = Medico.Nombre, @Consultorio = Consultorios.ID_Consultorio
  FROM Medico
  INNER JOIN Cita ON Medico.Cedula = Cita.Cedula
  INNER JOIN Consultorios ON Cita.ID_C = Consultorios.ID_Consultorio
  WHERE Cita.Fecha = @FechaCreacion AND Cita.NSS = @NSS AND Cita.ID_C = @IDCita;

  -- Obtener el costo y horario de la cita
  SELECT @Costo = Cita.Costo, @Horario = Cita.HORA
  FROM Cita
  WHERE Cita.Fecha = @FechaCreacion AND Cita.NSS = @NSS AND Cita.ID_C = @IDCita;

  -- Insertar los datos en la tabla Historial_clinico
  INSERT INTO Historial_clinico (Fecha_creacion, Nombre_Doc, Consultorio, Costo, horario, NSS, ID_C,Operacion)
  VALUES (@FechaCreacion, @NombreDoctor, @Consultorio, @Costo, @Horario, @NSS, @IDCita,'Creada');
END;
DROP TRIGGER TRG_CrearHistorialClinico;









--asociar la receta con la cita correcta
CREATE TRIGGER TRG_InsertarRecetaEnHC
ON Receta
AFTER INSERT
AS
BEGIN
  -- Declarar variables locales
  DECLARE @ID_R INT, @ID_C INT;

  -- Obtener el ID_R de la nueva receta insertada
  SELECT @ID_R = ID_R, @ID_C = ID_C
  FROM inserted;

  -- Actualizar el registro correspondiente en la tabla Historial_clinico
  UPDATE Historial_clinico
  SET ID_R = @ID_R
  WHERE ID_C = @ID_C;
END;


--EXEC dbo.InsertarCita '98765432109876543210', 'E12345678901234568', '2023-06-23', '12:30', 'Pendiente', 50.00;

--

--EXEC dbo.AgregarCita14 @NSS = '98765432109876543210', @Cedula = 'E12345678901234568', @Fecha = '2070-06-23', @Hora = '8:30', @ID_Servicio = 3, @costo = 50;




--EXEC InsertarReceta 
 -- @Diagnostico = 'Valor del diagnóstico',
 -- @FechaCreacion = '2050-06-23',
 -- @Observaciones = 'Valor de las observaciones',
 -- @CedulaMedico = 'E12345678901234568',
 -- @NSSPaciente = '98765432109876543210',
 -- @IDCita = 5;



--modificar recetas

CREATE TRIGGER ModificarReceta
ON Receta
AFTER UPDATE
AS
BEGIN
  -- Insertar un nuevo registro por cada fila modificada en Receta
  INSERT INTO Receta (Diagnostico, Fecha_creacion, Observaciones, Cedula, NSS, ID_C)
  SELECT Diagnostico, Fecha_creacion, Observaciones, Cedula, NSS, ID_C
  FROM inserted;

  -- Obtener el ID del nuevo registro de Receta insertado
  DECLARE @ID_R INT;
  SET @ID_R = SCOPE_IDENTITY();

  -- Insertar los medicamentos asociados a la receta modificada
  INSERT INTO Receta_Medicamento (ID_R, ID_Medicamento, indicaciones)
  SELECT @ID_R, ID_Medicamento, indicaciones
  FROM Receta_Medicamento
  WHERE ID_R IN (SELECT ID_R FROM inserted);

  -- Actualizar el nuevo registro con los valores modificados
  UPDATE Receta
  SET Receta.Diagnostico = inserted.Diagnostico,
      Receta.Fecha_creacion = inserted.Fecha_creacion,
      Receta.Observaciones = inserted.Observaciones
  FROM Receta
  INNER JOIN inserted ON Receta.ID_R = inserted.ID_R
  WHERE Receta.ID_R = @ID_R;
END;





-- Actualizar una receta existente
--UPDATE Receta
--SET Diagnostico = 'Nuevo diagnóstico',
 --   Observaciones = 'Nuevas observaciones'
--WHERE ID_R = 13; -- ID de la receta que deseas actualizar

-- Verificar los resultados
--SELECT * FROM Receta;
