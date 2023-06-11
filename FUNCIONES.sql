
--Esta función retorna una tabla que contiene todos los registros del historial clínico del paciente correspondiente al NSS proporcionado.
CREATE FUNCTION dbo.ObtenerHistorialClinico(@NSS VARCHAR(20))
RETURNS TABLE
AS
RETURN (
  SELECT *
  FROM Historial_clinico
  WHERE NSS = @NSS
);

--Esta función calculará el costo total de una cita en función de los servicios seleccionados. Puedes utilizarla de la siguiente manera:
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
