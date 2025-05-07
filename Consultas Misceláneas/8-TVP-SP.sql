-- Podrá su base de datos soportar un SP transaccional que actualice los contratos 
-- de servicio de un proveedor, el proveedor podría ya existir o ser nuevo, 
-- si es nuevo, solo se inserta. Las condiciones del contrato del proveedor, 
-- deben ser suministradas por un Table-Valued Parameter (TVP), 
-- si las condiciones son sobre items existentes, entonces se actualiza o inserta 
-- realizando las modificacinoes que su diseño requiera, si son condiciones nuevas, entonces se insertan.

-- 1. Crear el tipo TVP
CREATE TYPE dbo.caipiTVP_CondicionesProveedor AS TABLE (
	[idagreementTerm] [int] IDENTITY(1,1) NOT NULL,
	[enable] [bit] NOT NULL,
	[checkSum] [varbinary](255) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[idMeasureUnit] [int] NOT NULL,
	[idService] [int] NULL,
	[finalDate] [datetime] NOT NULL,
	[idSupplier] [int] NULL,
	[signedDate] [datetime] NULL,
	[deleted] [bit] NOT NULL,
	[access] [bit] NULL,
	[disccountPercentage] [decimal](5, 2) NULL,
	[originalPrice] [decimal](5, 2) NOT NULL,
	[agreementPrice] [decimal](5, 2) NOT NULL,
	[salePrice] [decimal](5, 2) NOT NULL,
	[IVA] [bit] NOT NULL,
	[idAgreementType] [int] NOT NULL,
	[currencyId] [int] NULL,
	[quantity] [int] NULL,
	[scheduleId] [int] NULL,
	[userDisccount] [decimal](5, 2) NULL
);
GO

CREATE OR ALTER PROCEDURE [dbo].[caipiSP_ActualizarCondiciones]
	@supplierID INT,
	@name VARCHAR(30),
	@enable BIT,
	@categoryID INT,
	@mediafileID INT,
	@agreementID INT,
	@deleted BIT,
	@condiciones dbo.caipiTVP_CondicionesProveedor READONLY
AS 
BEGIN
	
	SET NOCOUNT ON;
	SET XACT_ABORT ON;    -- << importante

	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @supplier_exist BIT = 1

	-- operaciones de select que no tengan que ser bloqueadas
	IF NOT EXISTS (SELECT 1 FROM dbo.caipi_suppliers WHERE idSupplier = @supplierID)
	BEGIN
		SET @supplier_exist = 0;
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

		IF @supplier_exist = 0
		BEGIN
			INSERT INTO dbo.caipi_suppliers
				(name, enable, idsupplierCategories, idmediaFiles, idagreementTerms, deleted)
			VALUES
				(@name, @enable, @categoryID, @mediafileID, @agreementID, @deleted);
			SET @supplierID = SCOPE_IDENTITY();
		END
		
		MERGE dbo.caipi_agreementTerms AS destino
        USING @condiciones AS origen
        ON destino.idSupplier = @supplierID AND destino.idSupplier = origen.idSupplier AND destino.checkSum = origen.checkSum
        WHEN MATCHED THEN 
			UPDATE SET
				enable = origen.enable,
				checkSum = origen.checkSum,
				startDate = origen.startDate,
				idMeasureUnit = origen.idMeasureUnit,
				idService = origen.idService,
				finalDate = origen.finalDate,
				idSupplier = @supplierID,
				signedDate = origen.signedDate,
				deleted = origen.deleted,
				access = origen.access,
				disccountPercentage = origen.disccountPercentage,
				originalPrice = origen.originalPrice,
				agreementPrice = origen.agreementPrice,
				salePrice = origen.salePrice,
				IVA = origen.IVA,
				idAgreementType = origen.idAgreementType,
				currencyId = origen.currencyId,
				quantity = origen.quantity,
				scheduleId = origen.scheduleId,
				userDisccount = origen.userDisccount
        WHEN NOT MATCHED THEN
            INSERT
				(
					enable, checkSum, startDate, idMeasureUnit, idService, finalDate, 
					idSupplier, signedDate, deleted, access, disccountPercentage, originalPrice, 
					agreementPrice, salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount
				)
			VALUES
				(
					origen.enable, origen.checkSum, origen.startDate, origen.idMeasureUnit, origen.idService, origen.finalDate, 
					@SupplierID, origen.signedDate, origen.deleted, origen.access, origen.disccountPercentage, origen.originalPrice, 
					origen.agreementPrice, origen.salePrice, origen.IVA, origen.idAgreementType, origen.currencyId, origen.quantity, origen.scheduleId, origen.userDisccount
				);



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

select * from dbo.caipi_suppliers;


-- 1) preparar TVP con dos condiciones: 
DECLARE @tvp dbo.caipiTVP_CondicionesProveedor;

INSERT INTO @tvp
  (enable, checkSum, startDate, idMeasureUnit, idService, finalDate,
   idSupplier, signedDate, deleted, access, disccountPercentage, originalPrice,
   agreementPrice, salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount)
VALUES
  (1, 0xABCDEF, '2025-05-01', 1, 10, '2025-12-31', 16, '2025-05-01', 0, 1, 5.00, 100.00, 95.00, 890.00, 1, 2, 1, 10, 1, 0.00),
  (1, 0x123456, '2025-06-01', 2, 14, '2025-12-31', 16, '2025-06-01', 0, 1, 0.00,  200.00,180.00, 230.00, 1, 3, 2,  5, 2, 10.00);

-- 2) ejecutar SP
EXEC dbo.caipiSP_ActualizarCondiciones
  @supplierID   = 16,
  @name         = 'Proveedor X',
  @enable       = 1,
  @categoryID   = 5,
  @mediafileID  = 3,
  @agreementID  = 0,
  @deleted      = 0,
  @condiciones  = @tvp;

-- 3) verificar
SELECT * FROM dbo.caipi_suppliers    WHERE name = 'Proveedor X';
SELECT * FROM dbo.caipi_agreementTerms WHERE idSupplier = 16;
