--Este trigger se ejecutará después de que se realice una inserción en la tabla "Cita". Extrae los valores de "ID_C", "NSS" y "COSTO" de la fila insertada en la tabla "Cita"

CREATE TRIGGER TR_CrearHistorialClinico
ON Cita
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  -- Declarar variables
  DECLARE @ID_C INT, @NSS VARCHAR(20), @Costo DECIMAL(10, 2);

  -- Obtener valores de la fila insertada
  SELECT @ID_C = ID_C, @NSS = NSS, @Costo = COSTO
  FROM inserted;

  -- Insertar valores en Historial_clinico
  INSERT INTO Historial_clinico (ID_C, NSS, Costo)
  VALUES (@ID_C, @NSS, @Costo);
END;


--Este nuevo trigger se ejecutará después de que se realice una inserción en la tabla "Receta". Actualiza los valores de "Diagnistico", "Fecha_creacion" y "Observaciones" en la tabla "Historial_clinico" 
--basándose en la coincidencia de "ID_C" y "NSS" entre la tabla "Historial_clinico" y la tabla "Cita

CREATE TRIGGER TR_CrearHistorialClinicoReceta
ON Receta
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  -- Declarar variables
  DECLARE @ID_C INT, @NSS VARCHAR(20), @Diagnostico VARCHAR(100), @FechaCreacion DATE, @Observaciones VARCHAR(200);

  -- Obtener valores de la fila insertada en Receta
  SELECT @ID_C = r.ID_C, @NSS = c.NSS, @Diagnostico = r.Diagnistico, @FechaCreacion = r.Fecha_creacion, @Observaciones = r.Observaciones
  FROM inserted AS r
  JOIN Cita AS c ON r.ID_C = c.ID_C;

  -- Actualizar valores en Historial_clinico
  UPDATE Historial_clinico
  SET Diagnistico = @Diagnostico, Fecha_creacion = @FechaCreacion, Observaciones = @Observaciones
  WHERE ID_C = @ID_C AND NSS = @NSS;
END;



--Este trigger se ejecutará después de cada actualización en la tabla "Historial_clinico". Verifica si el campo "horario" en la fila actualizada es nulo y, si es así, actualiza el campo "horario" con la fecha y hora actual.

CREATE TRIGGER ActualizarHorario
ON Historial_clinico
AFTER UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  -- Verificar si el campo "horario" en la fila actualizada es nulo
  IF EXISTS (SELECT horario FROM inserted WHERE horario IS NULL)
  BEGIN
    -- Actualizar el campo "horario" con la fecha y hora actual
    UPDATE Historial_clinico
    SET horario = CONVERT(TIME, GETDATE())
    WHERE No_HC IN (SELECT No_HC FROM inserted WHERE horario IS NULL);
  END;
END;
