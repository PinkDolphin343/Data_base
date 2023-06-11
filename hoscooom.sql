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
CREATE PROCEDURE dbo.AgregarCita
  @NSS VARCHAR(20),
  @Cedula VARCHAR(20),
  @Fecha DATE,
  @Hora TIME,
  @ID_Servicio INT
AS
BEGIN
  -- Insertar registro en la tabla Cita
  INSERT INTO Cita (NSS, Cedula, Fecha, HORA, Estatus)
  VALUES (@NSS, @Cedula, @Fecha, @Hora, 'Pendiente');

  -- Obtener el ID_C de la nueva cita insertada
  DECLARE @ID_C INT;
  SET @ID_C = SCOPE_IDENTITY();

  -- Insertar registros en la tabla Cita_Servicio
  INSERT INTO Cita_Servicio (ID_C, ID_Servicio)
  VALUES (@ID_C, @ID_Servicio);

  -- Insertar registros en la tabla Cita_Consultorio
  INSERT INTO Cita_Consultorio (ID_C, ID_Consultorio)
  SELECT @ID_C, ID_Consultorio
  FROM Consultorios;

  -- Insertar registros en la tabla Cita_Piso
  INSERT INTO Cita_Piso (ID_C, ID_Piso)
  SELECT @ID_C, ID_Piso
  FROM Pisos;

END;
