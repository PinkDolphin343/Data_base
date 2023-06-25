
--Esta funci�n retorna una tabla que contiene todos los registros del historial cl�nico del paciente correspondiente al NSS proporcionado.
-- CREATE FUNCTION dbo.ObtenerHistorialClinico(@NSS VARCHAR(20))
-- RETURNS TABLE
-- AS
-- RETURN (
--   SELECT *
--   FROM Historial_clinico
--   WHERE NSS = @NSS
-- );


CREATE FUNCTION dbo.obtenerEspecialidadCita(@ID_C INT)
RETURNS VARCHAR(50)
AS
BEGIN
  DECLARE @Especialidad VARCHAR(50);

  SET @Especialidad = (SELECT TOP 1 e.Nombre_Especialidad from Cita c join Medico m on c.Cedula = m.Cedula join Especialidades e on m.ID_Especialidad= e.ID_Especialidad where c.ID_C = @ID_C);

  RETURN @Especialidad;
END;


CREATE FUNCTION dbo.obtenerIDEspecialidadCita(@ID_C INT)
RETURNS Int
AS
BEGIN
  DECLARE @Especialidad Int;

  SET @Especialidad = (SELECT e.ID_Especialidad from Cita c join Medico m on c.Cedula = m.Cedula join Especialidades e on m.ID_Especialidad= e.ID_Especialidad where c.ID_C = @ID_C);

  RETURN @Especialidad;
END;

--Esta funci�n calcular� el costo total de una cita en funci�n de los servicios seleccionados. Puedes utilizarla de la siguiente manera:
CREATE FUNCTION dbo.CalcularCostoTotalCita(@ID_C INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @CostoTotal DECIMAL(10, 2);

  SELECT @CostoTotal = SUM(Servicios.Costo)
  FROM Servicios
  JOIN Cita_Servicio ON Servicios.ID_Servicio = Cita_Servicio.ID_Servicio
  WHERE Cita_Servicio.ID_C = @ID_C;

  RETURN @CostoTotal;
END;
