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
CREATE PROCEDURE InsertarReceta
  @Diagnostico VARCHAR(200),
  @FechaCreacion DATE,
  @Observaciones VARCHAR(200),
  @CedulaMedico VARCHAR(20),
  @NSSPaciente VARCHAR(20),
  @IDCita INT
AS
BEGIN
  INSERT INTO Receta (Diagnostico, Fecha_creacion, Observaciones,  Cedula, NSS, ID_C)
  VALUES (@Diagnostico, @FechaCreacion, @Observaciones,  @CedulaMedico, @NSSPaciente, @IDCita);

  SELECT 'Receta creada exitosamente' AS Mensaje;
END;

