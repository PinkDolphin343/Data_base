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
    SELECT Receta.ID_R, Receta.Diagnostico, Receta.Fecha_creacion, Receta.Observaciones, Receta.Cantidad,
           CONCAT(Paciente.Nombre, ' ', Paciente.A_paterno, ' ', Paciente.A_materno) AS NombrePaciente,
           CONCAT(Medico.Nombre, ' ', Medico.A_Paterno, ' ', Medico.A_materno) AS NombreMedico,
           Medicamentos.ID_Medicamento, Medicamentos.Nombre_Medicamento, Presentacion.Presentacion,
           Receta_Medicamento.indicaciones
    FROM Receta
    INNER JOIN Receta_Medicamento ON Receta.ID_R = Receta_Medicamento.ID_R
    INNER JOIN Medicamentos ON Receta_Medicamento.ID_Medicamento = Medicamentos.ID_Medicamento
    INNER JOIN Presentacion ON Medicamentos.ID_Presentacion = Presentacion.ID_P
    INNER JOIN Paciente ON Receta.NSS = Paciente.NSS
    INNER JOIN Medico ON Receta.Cedula = Medico.Cedula
    WHERE Receta.ID_R = @IDReceta
)
