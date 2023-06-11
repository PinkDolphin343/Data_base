--Este trigger se ejecutará después de que se realice una inserción en la tabla "Cita". Extrae los valores de "ID_C", "NSS" y "COSTO" de la fila insertada en la tabla "Cita"

CREATE TRIGGER TR_CrearHistorialClinico
ON Cita
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  -- Insertar valores en Historial_clinico
  INSERT INTO Historial_clinico (ID_C, NSS, Costo)
  SELECT inserted.ID_C, inserted.NSS, inserted.COSTO
  FROM inserted;
END;

--Este nuevo trigger se ejecutará después de que se realice una inserción en la tabla "Receta". Actualiza los valores de "Diagnistico", "Fecha_creacion" y "Observaciones" en la tabla "Historial_clinico" 
--basándose en la coincidencia de "ID_C" y "NSS" entre la tabla "Historial_clinico" y la tabla "Cita

CREATE TRIGGER TR_CrearHistorialClinicoReceta
ON Receta
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  -- Insertar valores en Historial_clinico
  UPDATE Historial_clinico
  SET Diagnistico = inserted.Diagnistico,
      Fecha_creacion = inserted.Fecha_creacion,
      Observaciones = inserted.Observaciones
  FROM Historial_clinico
  JOIN Cita ON Historial_clinico.ID_C = Cita.ID_C
  WHERE Historial_clinico.NSS = Cita.NSS
    AND Historial_clinico.ID_C = inserted.ID_C;
END;



--Este trigger se ejecutará después de cada actualización en la tabla "Historial_clinico". Verifica si el campo "horario" en la fila actualizada es nulo y, si es así, actualiza el campo "horario" con la fecha y hora actual.

CREATE TRIGGER ActualizarHorario
AFTER UPDATE ON Historial_clinico
FOR EACH ROW
BEGIN
  IF NEW.horario IS NULL THEN
    UPDATE Historial_clinico
    SET horario = CONVERT(TIME, GETDATE())
    WHERE No_HC = NEW.No_HC;
  END IF;
END;
