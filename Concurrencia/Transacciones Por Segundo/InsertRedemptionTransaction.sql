

-----------------------------------------------------------
-- Autor: Carol Araya
-- Fecha: 05/03/2025
-- Descripcion: genera las rendenciones de los servicios ofrecidos por los planes de soltura
	/*
	@numberTag INT- Número identificador del tag o usuario que realiza la redención.
	@redemptionTransactionTypeId INT - Identificador del tipo de transacción de redención (por ejemplo: puntos, efectivo, regalo).
	@idModule INT  - Identificador del módulo o sistema donde ocurre la transacción (app, kiosko, etc.).
	@idSupplierBranch INT - Identificador de la sucursal o proveedor donde se realiza la redención.
	@quantity INT = NULL  - Cantidad de artículos o servicios redimidos. Puede ser NULL si no aplica.
	@amount DECIMAL(5,2) = NULL  - Monto involucrado en la transacción. Puede ser NULL si no aplica.
	@validation BIT = NULL  - Indicador de validación (1 = validado, 0 = no validado). Puede ser NULL si no se requiere validación.

	*/
-----------------------------------------------------------
CREATE OR ALTER PROCEDURE [dbo].[CaipiSP_InsertRedemptionTransaction]
	--PARAMETROS
	@numberTag VARCHAR(100),
    @redemptionTransactionTypeId INT,
    @idModule INT,
    @idSupplierBranch INT,
    @quantity INT = NULL,
    @amount DECIMAL(18,4) = NULL,
    @validation BIT = NULL,
	@agreementTermId INT = NULL,
	@userACanjearId  INT = NULL,
	@idPerson  INT = NULL
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;

    --variables locales para el insert
    DECLARE @idPlan INT, @idRedemptionSubType INT, @idBenefit INT, @idUser INT = NULL;
    DECLARE @idSupplier INT = NULL, @idService INT = NULL, @idRedemption INT = NULL;
    DECLARE @redemptionSubTypeName VARCHAR(50);
    DECLARE @agreementType VARCHAR(50) = NULL, @agreementPerPlan INT;
    DECLARE @checkSum VARBINARY(500), @agreementDescription VARCHAR(100);
    DECLARE @limit VARCHAR(100), @idPlanLimit INT, @unitMeasure INT;

    -- Validación de parámetros
    IF @numberTag IS NULL OR @idModule IS NULL OR @redemptionTransactionTypeId IS NULL
        RETURN 99;

    -- Obtener la información de la redención de una sola consulta con JOIN
    SELECT 
        r.idPlan, r.idRedemptionSubType, r.idBenefit, r.idRedemptions, r.idUser, r.idSupplier,
        rs.name AS redemptionSubTypeName
    INTO #RedemptionData
    FROM caipi_redemptions r
    JOIN caipi_redemptionSubType rs ON r.idRedemptionSubType = rs.idRedemptionSubType
    WHERE r.enable = 1 AND r.numberTag = @numberTag;

    -- Si no se encuentra la redención
    IF NOT EXISTS (SELECT 1 FROM #RedemptionData)
        RETURN 10;

    SELECT 
        @idPlan = idPlan, 
        @idRedemptionSubType = idRedemptionSubType, 
        @idBenefit = idBenefit,
        @idRedemption = idRedemptions, 
        @idUser = idUser, 
        @idSupplier = idSupplier, 
        @redemptionSubTypeName = redemptionSubTypeName
    FROM #RedemptionData;

    -- Obtener el acuerdo solo si es necesario
    IF @redemptionSubTypeName = 'Usuario'
    BEGIN
        SELECT 
            @agreementType = tp.name, 
            @agreementPerPlan = ap.benefitPerPlanId, 
            @agreementDescription = at.description
        FROM caipi_AgreementsPerPlan ap
        JOIN caipi_agreementTerms at ON at.idagreementTerm = ap.idAgreementTerm
        JOIN caipi_AgreementType tp ON tp.idAgreementType = at.idAgreementType
        WHERE ap.idAgreementTerm = @agreementTermId AND ap.idPlans = @idPlan;
    END
    ELSE IF @redemptionSubTypeName IN ('Proveedor', 'Servicio')
    BEGIN
        SELECT 
            @idPlan = subs.idPlan, 
            @agreementType = tp.name, 
            @agreementPerPlan = ap.benefitPerPlanId
        FROM caipi_subscriptions subs
        JOIN caipi_AgreementsPerPlan ap ON subs.idPlan = ap.idPlans
        JOIN caipi_agreementTerms at ON at.idagreementTerm = ap.idAgreementTerm
        JOIN caipi_AgreementType tp ON tp.idAgreementType = at.idAgreementType
        WHERE subs.enable = 1 AND subs.userid = @userACanjearId;
    END

    -- Checksum de la transacción
    SET @checkSum = HASHBYTES('SHA2_256', 
        CONCAT(
            CAST(@idRedemption AS VARCHAR),
            CAST(@idUser AS VARCHAR),
            CAST(@idSupplierBranch AS VARCHAR),
            CAST(@idModule AS VARCHAR),
            CAST(@idPerson AS VARCHAR),
            CAST(@redemptionTransactionTypeId AS VARCHAR),
            CAST(@quantity AS VARCHAR),
            CAST(@amount AS VARCHAR),
            CAST(@validation AS VARCHAR),
            CAST(@agreementTermId AS VARCHAR),
            CONVERT(VARCHAR, GETDATE(), 121)
        )
    );

    -- Si no hay transacción abierta, iniciar una
    SET @InicieTransaccion = 0;
    IF @@TRANCOUNT = 0
    BEGIN
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
        BEGIN TRANSACTION;        
    END
    
    BEGIN TRY
        -- Verificación de acuerdo
        IF @agreementType IS NULL
            RETURN 2; -- No existe un acuerdo relacionado

        -- Verificar límites disponibles para el canje
        SELECT 
            @idPlanLimit = idPlansLimits, 
            @unitMeasure = idMeasureUnit, 
            @limit = [limit]
        FROM caipi_plansLimits
        WHERE benefitPerPlanId = @agreementPerPlan
          AND idMember = @idUser
          AND [current] = 1
          AND (
              (@agreementType = 'Quantity' AND TRY_CAST([limit] AS INT) >= @quantity)
              OR (@agreementType = 'Amount' AND TRY_CAST([limit] AS DECIMAL(18,4)) >= @amount)
              OR (@agreementType = 'Validation' AND [limit] NOT IN ('False', 'false', '0', 'No', 'no'))
          );

        IF @idPlanLimit IS NOT NULL
        BEGIN
            -- Insertar la transacción de canje
            INSERT INTO [dbo].[caipi_redemptionTransactions]
            ([idRedemption], [idUser], [idSupplierBranch], [checkSum], [creationDate], [idModule], [description], [idPerson],
             [idRedemptionTransactionTypes], [quantity], [amount], [validation], [idAgreementTerm])
            VALUES
            (@idRedemption, @idUser, @idSupplierBranch, @checkSum, GETDATE(), @idModule, 
             'Canjeo de un servicio de ' + @agreementDescription, @idPerson, 
             @redemptionTransactionTypeId, @quantity, @amount, @validation, @agreementTermId);

            -- Actualizar el límite
            IF @agreementType = 'Validation'
                SET @limit = 0;
            ELSE IF @agreementType = 'Quantity'
                SET @limit = ISNULL(CAST(@limit AS INT), 0) - ISNULL(@quantity, 0);
            ELSE IF @agreementType = 'Amount'
                SET @limit = ISNULL(CAST(@limit AS DECIMAL(18,4)), 0.0) - ISNULL(@amount, 0.0);

            -- Insertar el nuevo límite
            INSERT INTO [dbo].[caipi_plansLimits]
            ([limit], [dateUsed], [current], [checkSum], [idPlans], [benefitPerPlanId], [idMeasureUnit], [idMember])
            VALUES
            (@limit, GETDATE(), 1,
             HASHBYTES('SHA2_256', CONCAT(@limit, '|', CONVERT(VARCHAR, GETDATE(), 126), '|', @idPlan, '|', 
                                         @agreementPerPlan, '|', @unitMeasure, '|', @idUser)),
             @idPlan, @agreementPerPlan, @unitMeasure, @idUser);

            -- Actualizar el estado del límite anterior
            UPDATE [dbo].[caipi_plansLimits]
            SET [current] = 0
            WHERE idPlansLimits = @idPlanLimit;
        END
        ELSE
            RETURN 7;

        -- Commit de la transacción si fue iniciada
        IF @InicieTransaccion = 1
            COMMIT;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @ErrorNumber = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        SET @Message = ERROR_MESSAGE();

        IF @InicieTransaccion = 1
            ROLLBACK;

        RAISERROR('%s - Error Number: %i', @ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH;
END;

DROP PROCEDURE IF EXISTS [dbo].[SolturaSP_InsertRedemptionTransaction];

SELECT * FROM caipi_redemptionTransactions

DECLARE @returnValue INT;

EXEC @returnValue = [dbo].[CaipiSP_InsertRedemptionTransaction]
    @numberTag = '1234',
    @redemptionTransactionTypeId = 1,
    @idModule = 1,
    @idSupplierBranch = 0,
    @quantity = null,
    @amount = 1,
    @validation = null,
    @agreementTermId = 10,
    @userACanjearId = 15,
    @idPerson = 10;


-- Ver el valor de retorno
SELECT @returnValue AS 'ReturnValue';





