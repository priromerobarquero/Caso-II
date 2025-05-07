
-- T1 - Generacion de Deadlocks

-- En esta transacccion se plantea el caso en el que el ususario haya hecho n canjeo sin embargo se dio mal el monto canjeado,
-- entonces se procede a hacer la correccion del monto del redemption, y despues generar algun mensaje indicando que se ha canjeado
-- x monto en cierto proveedor usando el SELECT
-- Sin embargo las cosas no salen porque cuando se actualiza la redemption dura un tiempo en cargar y sigue con el select de ese proveedor,
-- pero no puede hacerse porque la T1 tiene bloqueado al proveedor y despues T2 está esperando que T1 deje de bloquear al user.

-- Esto hace que las dos transacciones se necesiten entre ellas y ninguna llega a termino y alguna tendrá que ser victima y
-- ser eliminada por SQL Server.
BEGIN TRANSACTION;

    -- bloquea el 
    UPDATE dbo.caipi_redemptionTransactions 
    SET amount = 300.00 
    WHERE idUser = 4;

    -- Simulacion 
    WAITFOR DELAY '00:00:07';

    -- Se bloque el primer recurso de T2
    SELECT name FROM dbo.caipi_suppliers 
    WHERE idSupplier = 4;

COMMIT;




