-----------------------------------------------------------
-- Autor: Rnunez
-- Fecha: 04/25/2025
-- Descripcion: Registrar una nueva suscripción, pago y transacción
-- Otros detalles de los parametros
-----------------------------------------------------------
CREATE PROCEDURE [dbo].[SP_RegistrarSubscripcionConPagoYTransaccion]
    @UserId INT,
	@SubsTypeID INT,
    @PlanId INT,
	@Social INT,
    @Monto DECIMAL(10, 2),
    @MetodoPago VARCHAR(50),
    @Descripcion VARCHAR(100),
    @Error VARCHAR(100),
    @Fecha DATE,
	@ScheduleID INT,
	@ExchangeId INT,
	@Currency INT,
	@TransType INT,
	@TransSubType INT
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT

    DECLARE @SubscriptionId INT
    DECLARE @PaymentId INT
    DECLARE @TransactionId INT
    DECLARE @Checksum VARCHAR(100)

    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 
    BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION
    END

    BEGIN TRY
        SET @CustomError = 2001

        -- 1. Insertar en la tabla de pagos (con CAST a VARCHAR(36))
        INSERT INTO caipi_payments (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum, date, paymentMethodId, methodId, scheduleId, userId, personId)
        VALUES
            (@Monto, @Monto, 'OK', 
            'AUTH-' + CAST(NEWID() AS VARCHAR(36)),  -- Longitud adecuada
            'REF' + CAST(NEWID() AS VARCHAR(36)),     -- Longitud adecuada
            CONVERT(varbinary(100), 'token'), 
            @Descripcion, @Error, 
            CONVERT(varbinary(100), 'checksum'), 
            @Fecha, 1, 1, 1, @UserId, @UserId);

        SET @PaymentId = SCOPE_IDENTITY()

        -- 2. Insertar en suscripciones
        INSERT INTO caipi_subscriptions (userid, suscription_typeid, scheduleId, social, idPlan, startdate, enable, statusid, created_at)
        VALUES (@UserId, @SubsTypeID, @ScheduleID, @Social, @PlanId, @Fecha, 1, 1, GETDATE());

        SET @SubscriptionId = SCOPE_IDENTITY()

        -- 3. Insertar transacción
        SET @Checksum = CONCAT('TX-', CAST(NEWID() AS VARCHAR(36)))
        INSERT INTO caipi_transactions (paymentid, userid, checksum, date, personId, amount, description, postTime, refNumber, convertedAmount, transactionSubTypeId, transTypeId, currencyId, exchangeRateId)
        VALUES (@PaymentId, @UserId, CONVERT(VARBINARY(100), @Checksum), @Fecha, @UserId, @Monto, 'Transacción realizada', GETDATE(), 'ref-number123549', @Monto, 1, 101, 1, 10);

        SET @TransactionId = SCOPE_IDENTITY()

        IF @InicieTransaccion = 1 
        BEGIN
            COMMIT
        END
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()

        IF @InicieTransaccion = 1 
        BEGIN
            ROLLBACK
        END
        
        -- Corregido: 2 placeholders, 2 parámetros
        RAISERROR('Error: %s. Código de Error: %i', 
            @ErrorSeverity, 
            @ErrorState, 
            @Message, 
            @CustomError); 
    END CATCH	
END
RETURN 0
GO

EXEC [dbo].[SP_RegistrarSubscripcionConPagoYTransaccion] 
    @UserId = 10, 
	@SubsTypeID = 1,
	@Social = 1,
    @PlanId = 3, 
    @Monto = 500.00, 
    @MetodoPago = 'Tarjeta',
    @Descripcion = 'Suscripción mensual',
    @Error = 'Exitosa',
    @Fecha = '2025-05-05',
	@ScheduleID = 1

