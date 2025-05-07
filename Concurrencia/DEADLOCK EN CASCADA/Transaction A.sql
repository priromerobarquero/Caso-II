-- Transaccion A
-- Objetivo: Bloquear a B
-- Se intenta bloquear el primer recurso que usará B

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
	--Utilizo el ultimo recurso utilizado en C
	UPDATE caipi_suppliers SET name = 'Condovac la Costa' WHERE idSupplier = 1 

	WAITFOR DELAY '00:00:10'

	--Bloque el primer recurso que utilizará Tran B
	UPDATE caipi_suppliers SET name = 'Gym Kyros' WHERE idSupplier = 7 

COMMIT




