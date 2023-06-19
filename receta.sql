-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
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
CREATE PROCEDURE dbo.ObtenerMedicamentosRecetados
  (@NSS VARCHAR(20),
   @ID_R INT)
AS
BEGIN
  SELECT Receta.ID_R, Medicamentos.Nombre_Medicamento, Receta_Medicamento.Cantidad, Receta.Cedula
  FROM Receta
  INNER JOIN Receta_Medicamento ON Receta.ID_R = Receta_Medicamento.ID_R
  INNER JOIN Medicamentos ON Receta_Medicamento.ID_Medicamento = Medicamentos.ID_Medicamento
  WHERE Receta.NSS = @NSS AND Receta.ID_R = @ID_R;
END;

