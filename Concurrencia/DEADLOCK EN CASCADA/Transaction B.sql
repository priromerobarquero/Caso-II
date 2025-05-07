-- Transaccion B
-- Objetivo: Bloquear a C
-- -- Se intenta bloquear el primer recurso que usará C

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
	-- Utiloza el ultimo recurso utilizado en A
	UPDATE caipi_suppliers SET name = 'U-Wellness Center' WHERE idSupplier = 7

	WAITFOR DELAY '00:00:010'

	--Bloque el primer recurso que utilizará Tran C
	UPDATE caipi_suppliers SET name = 'RIU Hotel' WHERE idSupplier = 3 

COMMIT
