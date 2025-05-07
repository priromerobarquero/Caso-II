-- Transaccion C
-- Objetivo: Bloquear a A
-- Se intenta bloquear el primer recurso que usará C

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
	-- Utilizo el ultimo recurso utilizado en B
	UPDATE caipi_suppliers SET name = 'La Granjita Vet' WHERE idSupplier = 3 

	WAITFOR DELAY '00:00:10'

	--Bloque el primer recurso que utilizará Tran A
	UPDATE caipi_suppliers SET name = 'Sonrisas Vet' WHERE idSupplier = 1 

COMMIT


