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
CREATE PROCEDURE InsertarMedicamentosEnReceta
  @IDReceta INT,
  @MedicamentosIDs VARCHAR(MAX)
AS
BEGIN
  -- Verificar si la receta existe
  IF EXISTS (SELECT 1 FROM Receta WHERE ID_R = @IDReceta)
  BEGIN
    -- Insertar medicamentos en Receta_Medicamento
    INSERT INTO Receta_Medicamento (ID_R, ID_Medicamento)
    SELECT @IDReceta, ID_Medicamento
    FROM Medicamentos
    WHERE ID_Medicamento IN (SELECT value FROM STRING_SPLIT(@MedicamentosIDs, ','));

    -- Mostrar mensaje de �xito
    SELECT 'Medicamentos insertados en Receta_Medicamento' AS Mensaje;
  END
  ELSE
  BEGIN
    -- Mostrar mensaje de error si la receta no existe
    SELECT 'La receta especificada no existe' AS Mensaje;
  END
END;

