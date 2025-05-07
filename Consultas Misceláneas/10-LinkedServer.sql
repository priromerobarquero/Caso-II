-- Configurar una tabla de bitácora en otro servidor SQL Server accesible vía Linked Servers 
-- con impersonación segura desde los SP del sistema. Ahora haga un SP genérico para que cualquier 
-- SP en el servidor principal, pueda dejar bitácora en la nueva tabla que se hizo en el Linked Server.

EXEC sp_addlinkedserver 
    @server = 'SQLBITACORA',
    @srvproduct = '',
    @provider = 'SQLNCLI',
    @datasrc = 'localhost\SQLBITACORA';
GO

EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'SQLBITACORA',
    @useself = 'TRUE'; -- Usa el contexto del usuario que ejecuta el SP
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'caipiSP_LogToBackupBitacora')
BEGIN
    DROP PROCEDURE dbo.caipiSP_LogToBackupBitacora;
END
GO

CREATE PROCEDURE dbo.caipiSP_LogToBackupBitacora
	@description VARCHAR(80),
	@computer NVARCHAR(100),
	@username VARCHAR(70),
	@trace VARCHAR(300),
	@referenceId1 BIGINT,
	@referenceId2 BIGINT,
	@value1 VARCHAR(300),
	@value2 VARCHAR(300),
	@chechsum VARBINARY(256),
	@logSeverityId INT,
	@logSourceId INT,
	@logTypeId INT
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN;
	BEGIN TRY

	INSERT INTO SQLBITACORA.caipiLogs.dbo.caipi_logs 
		(description, postime, computer, username, trace, referenceId1, referenceId2, value1, value2, chechsum, logSeverityId, logSourceId, logTypeId)
	VALUES
		(@description, GETDATE(), @computer, @username, @trace, @referenceId1, @referenceId2, @value1, @value2, @chechsum, @logSeverityId, @logSourceId, @logTypeId);

    COMMIT;  -- si todo OK
	END TRY
	BEGIN CATCH
		ROLLBACK;
	-- relanzo el error real
	THROW;
	END CATCH
END;
GO



EXEC dbo.caipiSP_LogToBackupBitacora
    @description     = 'Error en proceso de carga',
    @computer        = 'Prueba',
    @username        = 'Preuba',
    @trace           = 'StackTrace o detalle del error',
    @referenceId1    = 12345,
    @referenceId2    = 67890,
    @value1          = 'valor1',
    @value2          = 'valor2',
    @chechsum        = 0xDEADBEEF, -- ejemplo binario
    @logSeverityId   = 2,
    @logSourceId     = 1,
    @logTypeId       = 3;
