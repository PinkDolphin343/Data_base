CREATE FUNCTION dbo.obtenerEspecialidadCita(@ID_C INT)
RETURNS VARCHAR(50)
AS
BEGIN
  DECLARE @Especialidad VARCHAR(50);

  SET @Especialidad = (SELECT TOP 1 e.Nombre_Especialidad from Cita c join Medico m on c.Cedula = m.Cedula join Especialidades e on m.ID_Especialidad= e.ID_Especialidad);

  RETURN @Especialidad;
END;

-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION ObtenerInformacionCita(@ID_C INT)
RETURNS TABLE
AS
RETURN
(
  SELECT Cita.ID_C, Cita.NSS, Cita.Cedula, Cita.Fecha, Cita.Estatus, Cita.Costo, Cita.HORA,
         Cita_Servicio.ID_Servicio, Servicios.Servicio, Servicios.Costo AS CostoServicio,
         Cita_Consultorio.ID_Consultorio, Consultorios.Numero_Consultorio,
         Cita_Piso.ID_Piso, Pisos.Numero_Piso, dbo.obtenerEspecialidadCita(@ID_C) AS Especialidad,
         CONCAT(Medico.Nombre, ' ', Medico.A_Paterno, ' ', Medico.A_materno) AS NombreMedico,
         dbo.obtenerIDEspecialidadCita(@ID_C) AS ID_Especialidad
  FROM Cita
  LEFT JOIN Cita_Servicio ON Cita.ID_C = Cita_Servicio.ID_C
  LEFT JOIN Servicios ON Cita_Servicio.ID_Servicio = Servicios.ID_Servicio
  LEFT JOIN Cita_Consultorio ON Cita.ID_C = Cita_Consultorio.ID_C
  LEFT JOIN Consultorios ON Cita_Consultorio.ID_Consultorio = Consultorios.ID_Consultorio
  LEFT JOIN Cita_Piso ON Cita.ID_C = Cita_Piso.ID_C
  LEFT JOIN Pisos ON Cita_Piso.ID_Piso = Pisos.ID_Piso
  join Medico on Cita.Cedula = Medico.Cedula
  WHERE Cita.ID_C = @ID_C
);

-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION ObtenerInformacionReceta (@IDReceta INT)
RETURNS TABLE
AS
RETURN
(
    SELECT Receta.ID_R, Receta.Diagnostico, Receta.Fecha_creacion, Receta.Observaciones,
           CONCAT(Paciente.Nombre, ' ', Paciente.A_paterno, ' ', Paciente.A_materno) AS NombrePaciente,
           CONCAT(Medico.Nombre, ' ', Medico.A_Paterno, ' ', Medico.A_materno) AS NombreMedico,
           Medicamentos.ID_Medicamento, Medicamentos.Nombre_Medicamento, Presentacion.Presentacion
    FROM Receta
    INNER JOIN Receta_Medicamento ON Receta.ID_R = Receta_Medicamento.ID_R
    INNER JOIN Medicamentos ON Receta_Medicamento.ID_Medicamento = Medicamentos.ID_Medicamento
    INNER JOIN Presentacion ON Medicamentos.ID_Presentacion = Presentacion.ID_P
    INNER JOIN Paciente ON Receta.NSS = Paciente.NSS
    INNER JOIN Medico ON Receta.Cedula = Medico.Cedula
    WHERE Receta.ID_R = @IDReceta
)


CREATE FUNCTION dbo.obtenerIDEspecialidadCita(@ID_C INT)
RETURNS VARCHAR(50)
AS
BEGIN
  DECLARE @Especialidad VARCHAR(50);

  SET @Especialidad = (SELECT e.ID_Especialidad from Cita c join Medico m on c.Cedula = m.Cedula join Especialidades e on m.ID_Especialidad= e.ID_Especialidad where c.ID_C = @ID_C);

  RETURN @Especialidad;
END;