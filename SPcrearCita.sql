
CREATE PROCEDURE dbo.AgregarCita14
  @NSS VARCHAR(20),
  @Cedula VARCHAR(20),
  @Fecha DATE,
  @Hora varchar(8),
  @ID_Servicio INT
AS
BEGIN

  -- Insertar registro en la tabla Cita
  INSERT INTO Cita (NSS, Cedula, Fecha, HORA, Estatus)
  VALUES (@NSS, @Cedula, @Fecha, @Hora, 'Pendiente');

  -- Obtener el ID_C de la nueva cita insertada
  DECLARE @ID_C INT;
  SET @ID_C = SCOPE_IDENTITY();

  -- Obtener el ID_Piso asociado a la especialidad
  DECLARE @ID_Piso INT;
  SET @ID_Piso = (SELECT ID_Piso FROM Especialidades WHERE ID_Especialidad = (SELECT ID_Especialidad FROM Medico WHERE Cedula = @Cedula));

  -- Obtener el ID_Consultorio disponible en el piso asociado a la especialidad
  DECLARE @ID_Consultorio INT;
  SET @ID_Consultorio = (SELECT TOP 1 ID_Consultorio FROM Consultorios WHERE ID_Piso = @ID_Piso AND ID_Consultorio NOT IN (SELECT ID_Consultorio FROM Cita_Consultorio WHERE ID_C IN (SELECT ID_C FROM Cita WHERE Fecha = @Fecha)));

  -- Insertar registro en la tabla Cita_Consultorio
  INSERT INTO Cita_Consultorio (ID_C, ID_Consultorio)
  VALUES (@ID_C, @ID_Consultorio);

  -- Insertar registro en la tabla Cita_Piso
  INSERT INTO Cita_Piso (ID_C, ID_Piso)
  VALUES (@ID_C, @ID_Piso);

  -- Insertar registro en la tabla Cita_Servicio
  INSERT INTO Cita_Servicio (ID_C, ID_Servicio)
  VALUES (@ID_C, @ID_Servicio);
 
END;
