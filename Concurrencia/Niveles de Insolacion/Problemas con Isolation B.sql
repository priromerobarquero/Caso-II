
-- ################################## READ UNCOMMITTED ############################

-- DISMINUCION DE PRECIO (PARTE B)
-- LECTURA SUCIA: Se lee un precio del plan que realmente nunca existió o llegó a commit, entonces al cliente en la suscripcion
--	se le cobra un precio que no correspondía, esto representa una perdida para soltura

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
	SELECT p.name, p.totalAmount FROM dbo.caipi_subscriptions s 
	JOIN dbo.caipi_plans p ON s.idPlan = p.idPlan WHERE s.idPlan = 1;
COMMIT


-------------------------------------------------------------------------------------------------------------------------------------

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE A)
-- PHANTOM: Se va a realizar un cobro con el ultimo tipo de cambio registrado en el sistema pero mientras se hace el cobro se 
-- inserta un nuevo tipo de cambio lo que hace es hacerse el cobro con un monto más bajo lo que implica una perdida para soltura

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION 
	DECLARE @rate DECIMAL(10,4);
	DECLARE @id int;
	SELECT TOP 1 @rate = exchangeRate, @id = exchangeRateId FROM dbo.caipi_ExchangeRates -- Tomamos el ultimo tipo de cambio para realizar el pago en CRC
	WHERE currencyId = 2 ORDER BY startDate DESC;

	WAITFOR DELAY '00:00:07' -- Aqui se ejecuta la parte B


	INSERT INTO [dbo].[caipi_transactions]
           ([amount],[description],[date],[postTime],[refNumber],[checksum],[convertedAmount],[paymentId]
           ,[transactionSubTypeId],[transTypeId],[currencyId],[exchangeRateId])
     VALUES(100.00, 'Description', '2025-05-05', '2025-05-05', 'TRW28290', HASHBYTES('SHA2_512', 'fbsdinaldkna3193'), 100.00 * @rate, 1,
			1,101,2, @id);
COMMIT



select transactionId, exchangeRateId, convertedAmount from caipi_transactions


-------------------------------------------------------------------------------------------------------------------------------------

-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE A)
-- NON REPEATEBLE READ: Se hace el calculo de las ganancia con los planes activos, sin embargo se hace una actualizacion donde 
-- se cambian los estados de las subscripciones y ahora tengo otras ganancias entonces hace incorrect summary problem y dirty read

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION 

	DECLARE @gananciaAntes DECIMAL(10,2);
	DECLARE @gananciasDespues DECIMAL (10,2);

	SELECT @gananciaAntes = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas

	WAITFOR DELAY '00:00:07'  --Se debe ejecutar parte B

	SELECT @gananciasDespues = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas
	
	SELECT @gananciaAntes AS GananciasAntes
	SELECT @gananciasDespues AS GananciasDespues

COMMIT

-----------------------------------------------------------------------------------------------------------------------------------------





-- ########################## READ COMMITTED ##############################


-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE A)
-- PHANTOM: Se va a realizar un cobro con el ultimo tipo de cambio registrado en el sistema pero mientras se hace el cobro se inserta un nuevo tipo de cambio
-- lo que hace es hacerse el cobro con un monto más bajo lo que implica una perdida para soltura

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
	DECLARE @ratee DECIMAL(10,4);
	DECLARE @idd int;
	SELECT TOP 1 @ratee = exchangeRate, @idd = exchangeRateId FROM dbo.caipi_ExchangeRates -- Tomamos el ultimo tipo de cambio para realizar el pago en CRC
	WHERE currencyId = 2 ORDER BY startDate DESC;

	WAITFOR DELAY '00:00:07'


	INSERT INTO [dbo].[caipi_transactions]
           ([amount],[description],[date],[postTime],[refNumber],[checksum],[convertedAmount],[paymentId]
           ,[transactionSubTypeId],[transTypeId],[currencyId],[exchangeRateId])
     VALUES(100.00, 'Description', '2025-05-05', '2025-05-05', 'TRW28290', HASHBYTES('SHA2_512', 'fbsdinaldkna3193'), 100.00 * @ratee, 1,
			1,101,2, @idd);
COMMIT

select transactionId, exchangeRateId, convertedAmount from caipi_transactions

----------------------------------------------------------------------------------------------

-- T30 que se corre con T31 (PARTE A)
-- NON REPEATEBLE READ: Se hace el calculo de las ganancia con los planes activos, sin embargo se hace una actualizacion donde se cambian los estados 
-- de las subscripciones y ahora tengo otras ganancias entonces hace incorrect summary problem y dirty read

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 

	DECLARE @gananciasAntes DECIMAL(10,2);
	DECLARE @gananciaDespues DECIMAL (10,2);

	SELECT @gananciasAntes = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas

	WAITFOR DELAY '00:00:07'  --Se debe ejecutar parte B

	SELECT @gananciaDespues = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas
	
	SELECT @gananciasAntes AS GananciasAntes
	SELECT @gananciaDespues AS GananciasDespues

COMMIT

-----------------------------------------------------------------------------------------------------------------


--T2 que se corre con T1 (PARTE B)
-- LECTURA SUCIA: Se lee un precio del plan que realmente nunca existió o llegó a commit. Sin embargo, NO sucede nada pues Read commited NO 
-- PASA la lectura sucia 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
	SELECT p.name, p.totalAmount FROM dbo.caipi_subscriptions s 
	JOIN dbo.caipi_plans p ON s.idPlan = p.idPlan WHERE s.idPlan = 1;
COMMIT



--############################ REPEATEBLE READ ###########################

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE A)
-- PHANTOM: Se va a realizar un cobro con el ultimo tipo de cambio registrado en el sistema pero mientras se hace el cobro se inserta un nuevo tipo de cambio
-- lo que hace es hacerse el cobro con un monto más bajo lo que implica una perdida para soltura

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 
	DECLARE @ratte DECIMAL(10,4);
	DECLARE @iid int;
	SELECT TOP 1 @ratte = exchangeRate, @iid = exchangeRateId FROM dbo.caipi_ExchangeRates -- Tomamos el ultimo tipo de cambio para realizar el pago en CRC
	WHERE currencyId = 2 ORDER BY startDate DESC;

	WAITFOR DELAY '00:00:07'


	INSERT INTO [dbo].[caipi_transactions]
           ([amount],[description],[date],[postTime],[refNumber],[checksum],[convertedAmount],[paymentId]
           ,[transactionSubTypeId],[transTypeId],[currencyId],[exchangeRateId])
     VALUES(100.00, 'Description', '2025-05-05', '2025-05-05', 'TRW28290', HASHBYTES('SHA2_512', 'fbsdinaldkna3193'), 100.00 * @ratte, 1,
			1,101,2, @iid);
COMMIT

select transactionId, exchangeRateId, convertedAmount from caipi_transactions

----------------------------------------------------------------------------------------------------------------------------------------

-- DISMINUCION DE PRECIO (PARTE B)
-- LECTURA SUCIA: Se lee un precio del plan que realmente nunca existió o llegó a commit, entonces al cliente en la suscripcion
-- se le cobra un precio que no correspondía, esto representa una perdida para soltura.  
-- PERO ESTO DA ERROR EN LECTURA SUSCIA PUES REPEATBLE READ NO LO PERMITE

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
	SELECT p.name, p.totalAmount FROM dbo.caipi_subscriptions s 
	JOIN dbo.caipi_plans p ON s.idPlan = p.idPlan WHERE s.idPlan = 1;
COMMIT

---------------------------------------------------------------------------------------------------------------------------------------

-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE A)
-- NON REPEATEBLE READ: Se hace el calculo de las ganancia con los planes activos, sin embargo se hace una actualizacion donde 
-- se cambian los estados de las subscripciones y ahora tengo otras ganancias entonces hace incorrect summary problem y dirty read
-- NO FUNCIONA PUES REPEATEBLE READ NO PERMITE NON REAPEATEBLE READ

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 

	DECLARE @gananciaAntess DECIMAL(10,2);
	DECLARE @gananciasDespuess DECIMAL (10,2);

	SELECT @gananciaAntess = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas

	WAITFOR DELAY '00:00:07'  --Se debe ejecutar parte B

	SELECT @gananciasDespuess = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas
	
	SELECT @gananciaAntess AS GananciasAntes
	SELECT @gananciasDespuess AS GananciasDespues

COMMIT
-----------------------------------------------------------------------------------------------------------------------------------


-- ################################ SERIALIZABLE ############################

-- USUARIO CONSULTA UN TIPO DE PLAN (PARTE A)
-- SERIALIZABLE: Va a bloquear los campos que el usuario esté consultando, pero esto va a ser que no se puedan hacer modificaciones o algun mantenimiento
-- en la plataforma, si el cliente permanece ahí la transaccion va a durar mucho en terminar

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION 

	SELECT name, totalAmount FROM caipi_plans where idplan = 3
	
	WAITFOR DELAY '00:00:15' -- El usuario podria pasar ahí hasta 2 horas

	-- El ususario paga la suscrcipcion
	INSERT INTO caipi_subscriptions (suscription_typeid,userid,social,enable,startdate,deleted,
			statusid,scheduleId,auto_renew,created_at,idPlan)
	VALUES(1,15,0,1,'2025-05-05', 0, 1,1,1,'2025-05-05',3);

COMMIT

---------------------------------------------------------------------------------------------------------------------

-- DISMINUCION DE PRECIO (PARTE B)
-- LECTURA SUCIA: Se lee un precio del plan que realmente nunca existió o llegó a commit, entonces al cliente en la suscripcion
--	se le cobra un precio que no correspondía, esto representa una perdida para soltura
-- NO FUNCIONA PUES SERIALIZABLE NO PASA LECTURA SUCIA

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
	SELECT p.name, p.totalAmount FROM dbo.caipi_subscriptions s 
	JOIN dbo.caipi_plans p ON s.idPlan = p.idPlan WHERE s.idPlan = 1;
COMMIT

-------------------------------------------------------------------------------------------------------------------------------------

-- NUEVO INGRESO DE TIPO DE CAMBIO (PARTE A)
-- PHANTOM: Se va a realizar un cobro con el ultimo tipo de cambio registrado en el sistema pero mientras se hace el cobro se 
-- inserta un nuevo tipo de cambio lo que hace es hacerse el cobro con un monto más bajo lo que implica una perdida para soltura
-- NO FUNCIONA PUES SERIALIZABLE NO PASA PHANTOM

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION 
	DECLARE @rate DECIMAL(10,4);
	DECLARE @id int;
	SELECT TOP 1 @rate = exchangeRate, @id = exchangeRateId FROM dbo.caipi_ExchangeRates -- Tomamos el ultimo tipo de cambio para realizar el pago en CRC
	WHERE currencyId = 2 ORDER BY startDate DESC;

	WAITFOR DELAY '00:00:07' -- Aqui se ejecuta la parte B


	INSERT INTO [dbo].[caipi_transactions]
           ([amount],[description],[date],[postTime],[refNumber],[checksum],[convertedAmount],[paymentId]
           ,[transactionSubTypeId],[transTypeId],[currencyId],[exchangeRateId])
     VALUES(100.00, 'Description', '2025-05-05', '2025-05-05', 'TRW28290', HASHBYTES('SHA2_512', 'fbsdinaldkna3193'), 100.00 * @rate, 1,
			1,101,2, @id);
COMMIT

select transactionId, exchangeRateId, convertedAmount from caipi_transactions

-------------------------------------------------------------------------------------------------------------------------------------

-- ACTUALIZACION EN EL ESTADO DE SUSCRIPCIONES (PARTE A)
-- NON REPEATEBLE READ: Se hace el calculo de las ganancia con los planes activos, sin embargo se hace una actualizacion donde 
-- se cambian los estados de las subscripciones y ahora tengo otras ganancias entonces hace incorrect summary problem y dirty read
-- NO FUNCIONA PUES SERIALIZABLE NO PASA NON REPEATABLE READ

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION 

	DECLARE @gananciaAntes DECIMAL(10,2);
	DECLARE @gananciasDespues DECIMAL (10,2);

	SELECT @gananciaAntes = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas

	WAITFOR DELAY '00:00:07'  --Se debe ejecutar parte B

	SELECT @gananciasDespues = SUM(p.totalAmount) FROM caipi_subscriptions s
	JOIN caipi_plans p ON s.idPlan = p.idPlan where statusid = 1 -- Total de ganancia de subs activas
	
	SELECT @gananciaAntes AS GananciasAntes
	SELECT @gananciasDespues AS GananciasDespues

COMMIT

-----------------------------------------------------------------------------------------------------------------------------------------

