CREATE PROCEDURE dbo.obtenerInformacionDeCita
  (@ID_C INT)
AS
BEGIN

  Select * from Cita c join Cita_Servicio cs on c.ID_C = cs.ID_C
                                          join Servicios s on cs.ID_Servicio = s.ID_Servicio
                                          join Cita_Consultorio cc on c.ID_C = cc.ID_C
                                          join Consultorios co on cc.ID_Consultorio = co.ID_Consultorio
                                          join Cita_Piso cp on c.ID_C = cp.ID_C
                                          join Pisos p on cp.ID_Piso = p.ID_Piso where c.ID_C = 24 ;
  
END;
