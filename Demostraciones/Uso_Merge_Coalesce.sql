
MERGE INTO caipi_reminders AS Destino	-- Tabla a actualizar

-- subconsulta para extraer solo las suscripciones con estado 'expirado' y que no hayan sido eliminadas
USING ( 
    SELECT S.statusid, S.subscriptionid, S.userid	
    FROM caipi_subscriptions S
    WHERE S.statusid = 4 AND S.deleted = 0 ) AS Origen	-- Tabla utilizada para generar los cambios

-- Se establecen las condiciones que se deben verificar antes de generar un nuevo mensaje
ON Destino.userid = Origen.userid  AND 
   Destino.ticketid = CAST(Origen.subscriptionid AS VARCHAR(10)) AND
   Destino.createddate >= DATEADD(DAY, -30, GETDATE())

-- En caso de que las condiciones no se encuentren en 'reminders' se genera un nuevo mensaje
WHEN NOT MATCHED BY TARGET THEN
    INSERT ( message, createddate, lastreminder, ticketid, requestid, expectedresult, successinfo, userid, 
        notificationmethods_notificationmethodid, remindertypeid)
    VALUES ('La suscripcion ha exiprado. Por favor renueve su plan', GETDATE(), 1, 
		CAST(Origen.subscriptionid AS VARCHAR(10)), NULL,  COALESCE(NULL, 'No expected res'), 
		COALESCE(NULL, 'No aplica'), Origen.userid, 1, 1);
