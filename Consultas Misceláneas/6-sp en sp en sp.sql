-- Crear un procedimiento almacenado transaccional que llame a otro SP transaccional, 
-- el cual a su vez llame a otro SP transaccional. Cada uno debe modificar al menos 2 tablas. 
-- Se debe demostrar que es posible hacer COMMIT y ROLLBACK con ejemplos exitosos y fallidos 
-- sin que haya interrumpción de la ejecución correcta de ninguno de los SP en ninguno de los niveles del llamado.

-- NIVEL 3
CREATE  OR ALTER PROCEDURE [dbo].[caipiSP_NIVEL3]
	@userid INT,
	@direccion VARCHAR(200),
	@payMethod INT
AS 
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		UPDATE TOP(1) a
		SET a.line1 = @direccion
		FROM dbo.caipi_Adresses AS a
		JOIN dbo.caipi_AdressessPerUser AS apu ON a.adressId = apu.adressId
		WHERE apu.userid = @userid;

		UPDATE TOP(1) pm
		SET pm.paymentMethodId = @payMethod
		FROM dbo.caipi_AvailiablePaymentMethodsPerUser AS pm
		WHERE pm.idUser = @userid;

		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO




-- NIVEL 2
CREATE OR ALTER PROCEDURE [dbo].[caipiSP_NIVEL2]
	@userid INT,
	@membershipEnabled BIT,
	@subscriptionEnable BIT,
	@direccion VARCHAR(200),
	@payMethod INT
AS 
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		UPDATE dbo.caipi_subscriptions
		SET enable = @subscriptionEnable
		WHERE userid = @userid;

		UPDATE dbo.caipi_members
		SET enabled = @membershipEnabled		
		WHERE userid = @userid;

		EXEC dbo.caipiSP_NIVEL3 
			@userid = @userid,
			@direccion = @direccion,
			@payMethod = @payMethod;

		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO


-- NIVEL 1
CREATE OR ALTER PROCEDURE [dbo].[caipiSP_NIVEL1]
	@userid INT,
	@lastname VARCHAR(50),
	@contact VARCHAR(100),
	@membershipEnabled BIT,
	@subscriptionEnable BIT,
	@direccion VARCHAR(200),
	@payMethod INT
AS 
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	
	-- verifico existencia
	IF NOT EXISTS (SELECT 1 FROM dbo.caipi_users WHERE userid = @userid)
	BEGIN
		-- genero un error de usuario, severidad 16 (fallo), estado 1
		RAISERROR('usuario con id %d no encontrado.', 16, 1, @userid);
		RETURN;  -- salgo del SP
	END

	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		UPDATE dbo.caipi_users
		SET lastname = @lastname, last_update = GETDATE()
		WHERE userid = @userid;

		UPDATE dbo.caipi_contactInfoPerUsers
		SET value = @contact, lastUpdate = GETDATE()
		WHERE userid = @userid AND contactInfoTypeId = 1;

		EXEC dbo.caipiSP_NIVEL2
			@userid = @userid,
			@membershipEnabled = @membershipEnabled,
			@subscriptionEnable = @subscriptionEnable,
			@direccion = @direccion,
			@payMethod = @payMethod;

		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO

--#############################
-- Caso exitoso
--#############################

DECLARE @userid INT = 10                                    -- nivel 1
DECLARE @lastname VARCHAR(50) = 'sequeira'                   -- nivel 1
DECLARE @contact VARCHAR(100) = 'prueba@gmail.com'           -- nivel 1
DECLARE @membershipEnabled BIT = 1                           -- nivel 2
DECLARE @subscriptionEnable BIT = 1                          -- nivel 2
DECLARE @direccion VARCHAR(200) = 'cartago'                  -- nivel 3
DECLARE @payMethod INT = 2                                   -- nivel 3

--select * from dbo.caipi_users where userid = @userid;
--select * from caipi_contactInfoPerUsers as c where c.userid = @userid;
--select * from caipi_members as m where m.userid = @userid;
--select * from caipi_subscriptions as s where s.userid = @userid;
--select * from caipi_Adresses as a join caipi_AdressessPerUser as ap on a.adressId = ap.adressId where ap.userid = @userid;
--select * from caipi_AvailiablePaymentMethodsPerUser as apm where apm.idUser = @userid;

EXEC dbo.caipiSP_NIVEL1
	@userid = @userid,
	@lastname = @lastname,
	@contact = @contact,
	@membershipEnabled = @membershipEnabled,
	@subscriptionEnable = @subscriptionEnable,
	@direccion = @direccion,
	@payMethod = @payMethod;


--#############################
-- Caso fallido
--#############################


EXEC dbo.caipiSP_NIVEL1
	@userid = 10,
	@lastname = 'requenes',
	@contact = 'prueba@gmail.com',
	@membershipEnabled = 1,
	@subscriptionEnable = 1,
	@direccion = NULL,
	@payMethod = 2;

--select * from dbo.caipi_users where userid = 10;
--select * from caipi_contactInfoPerUsers as c where c.userid = @userid;
--select * from caipi_members as m where m.userid = @userid;
--select * from caipi_subscriptions as s where s.userid = @userid;
--select * from caipi_Adresses as a join caipi_AdressessPerUser as ap on a.adressId = ap.adressId where ap.userid = @userid;
--select * from caipi_AvailiablePaymentMethodsPerUser as apm where apm.idUser = @userid;