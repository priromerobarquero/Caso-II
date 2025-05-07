
-- ######################## PARA READ UNCOMMITTED ############################

-- DISMINUCION DE PRECIO (PARTE A)
-- Se realiza una disminución en el precio del plan pero al final eso no era lo que tenía que pasar y hace rollback
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	update dbo.caipi_plans SET totalAmount = 120.00  WHERE idPlan = 1	-- Problema Dirty read
	WAITFOR DELAY '00:00:10'
ROLLBACK

SELECT idPlan, name, totalAmount FROM caipi_plans

-----------------------------------------------------------------------------------------------------------------------------------------

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE B)
-- Se hace una inserción en el tipo de cambio CRC para simular un fantasma en la insercion de una transaction
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	INSERT INTO [dbo].[caipi_ExchangeRates]
           ([startDate],[endDate],[exchangeRate],[enable],[currentExchangeRate],[currencyId])
     VALUES('2025-04-22','2025-05-10', 580.00, 1, 1, 2)
COMMIT



---------------------------------------------------------------------------------------------------------------------------------------


-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE B)
-- Se hace un update en las suscripciones, suponiendo que algunas suscripciones que estaban expiradas fueron pagadas entonces cambian
-- de status, solo las ultimas 5 suscripciones que tenian expiración cambian a activas.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

UPDATE caipi_subscriptions
	SET statusid = 1 WHERE statusid = 5
	AND subscriptionid IN (SELECT TOP 5 subscriptionid FROM caipi_subscriptions WHERE statusid = 5);

COMMIT



----------------------------------------------------------------------------------------------------------------------------------------




-- ################################### PARA READ COMMITTED ##################################

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE B)
-- Se hace una inserción en el tipo de cambio CRC para simular un fantasma en T5
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	INSERT INTO [dbo].[caipi_ExchangeRates]
           ([startDate],[endDate],[exchangeRate],[enable],[currentExchangeRate],[currencyId])
     VALUES('2025-04-22','2025-05-10', 580.00, 1, 1, 2)
COMMIT



---------------------------------------------------------------------------------------------

-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE B)
-- Se hace un update en las suscripciones, suponiendo que algunas suscripciones que estaban expiradas fueron pagadas entonces cambian
-- de status, solo las ultimas 5 suscripciones que tenian expiración cambian a activas.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

UPDATE caipi_subscriptions
	SET statusid = 1 WHERE statusid = 5
	AND subscriptionid IN (SELECT TOP 5 subscriptionid FROM caipi_subscriptions WHERE statusid = 5);

COMMIT



------------------------------------------------------------------------------------------------------------------------

-- DISMINUCION DE PRECIO (PARTE A)
-- Se realiza una disminución en el precio del plan pero al final eso no era lo que tenía que pasar y hace rollback
-- NO FUNCIONA PUES SE TRABAJA EN READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	update dbo.caipi_plans SET totalAmount = 120.00  WHERE idPlan = 1	-- Problema PHANTOM
	WAITFOR DELAY '00:00:10'
ROLLBACK

SELECT idPlan, name, totalAmount FROM caipi_plans

------------------------------------------------------------------------------------------------------------------------





-- ################################## PARA REPEATEBLE READ ############################

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE B)
-- Se hace una inserción en el tipo de cambio CRC para simular un fantasma en la insercion de una transaction
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	INSERT INTO [dbo].[caipi_ExchangeRates]
           ([startDate],[endDate],[exchangeRate],[enable],[currentExchangeRate],[currencyId])
     VALUES('2025-04-22','2025-05-10', 580.00, 1, 1, 2)
COMMIT



-------------------------------------------------------------------------------------------------------------------------

-- DISMINUCION DE PRECIO (PARTE A)
-- Se realiza una disminución en el precio del plan pero al final eso no era lo que tenía que pasar y hace rollback
-- NO FUNCIONA PUES SE TRABAJA EN REPEATEBLE READ
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	update dbo.caipi_plans SET totalAmount = 120.00  WHERE idPlan = 1	-- Problema Dirty read
	WAITFOR DELAY '00:00:10'
ROLLBACK

SELECT idPlan, name, totalAmount FROM caipi_plans

-------------------------------------------------------------------------------------------------------------------------

-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE B)
-- Se hace un update en las suscripciones, suponiendo que algunas suscripciones que estaban expiradas fueron pagadas entonces cambian
-- de status, solo las ultimas 5 suscripciones que tenian expiración cambian a activas.
-- NO FUNCIONA PUES  SE TRABAJA EN REPEATEBLE READ
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

UPDATE caipi_subscriptions
	SET statusid = 1 WHERE statusid = 5
	AND subscriptionid IN (SELECT TOP 5 subscriptionid FROM caipi_subscriptions WHERE statusid = 5);

COMMIT

SELECT * FROM caipi_subscription_status
--------------------------------------------------------------------------------------------------------------------------





-- ################################### PARA SERIALIZABLE ################################

-- USUARIO CONSULTA UN TIPO DE PLAN (PARTE B)
-- Un administrador del sistema desea hacer cambios en un plan en especifico pero no puede pues la T35 bloquea ese campo del plan 3.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
	UPDATE caipi_plans SET totalAmount = 200.00 , name = 'Joven Deportista SUPER PRO' WHERE idPlan = 3;
COMMIT

-------------------------------------------------------------------------------------------------------------------------------------------


-- DISMINUCION DE PRECIO (PARTE A)
-- Se realiza una disminución en el precio del plan pero al final eso no era lo que tenía que pasar y hace rollback
-- NO FUNCIONA PORQUE SE TRABAJA EN SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	update dbo.caipi_plans SET totalAmount = 120.00  WHERE idPlan = 1	-- Problema Dirty read
	WAITFOR DELAY '00:00:10'
ROLLBACK

SELECT idPlan, name, totalAmount FROM caipi_plans

-----------------------------------------------------------------------------------------------------------------------------------------

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE B)
-- Se hace una inserción en el tipo de cambio CRC para simular un fantasma en la insercion de una transaction
-- NO FUNCIONA PORQUE SE TRABAJA EN SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	INSERT INTO [dbo].[caipi_ExchangeRates]
           ([startDate],[endDate],[exchangeRate],[enable],[currentExchangeRate],[currencyId])
     VALUES('2025-04-22','2025-05-10', 580.00, 1, 1, 2)
COMMIT



---------------------------------------------------------------------------------------------------------------------------------------


-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE B)
-- Se hace un update en las suscripciones, suponiendo que algunas suscripciones que estaban expiradas fueron pagadas entonces cambian
-- de status, solo las ultimas 5 suscripciones que tenian expiración cambian a activas.
-- NO FUNCIONA PORQUE SE TRABAJA EN SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

UPDATE caipi_subscriptions
	SET statusid = 1 WHERE statusid = 5
	AND subscriptionid IN (SELECT TOP 5 subscriptionid FROM caipi_subscriptions WHERE statusid = 5);

COMMIT



----------------------------------------------------------------------------------------------------------------------------------------
