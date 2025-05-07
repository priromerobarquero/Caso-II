
-- T2 - Generando deadlocks

-- En esta transacción se plantea el caso que se quiera hacer algun mantenimiento de supplliers en el que ese proveedor se establece
-- como eliminado o temporalmente inactivo y también se corrige el monto de una redemption mal ejecutada
-- Cuando T2 bloquea el usuario para poder cambiarlo ya T1 no puede terminar pero T2 tampoco porque está esperando que T1
-- desbloquee al usuario. 

-- Esto hace que las dos transacciones se necesiten entre ellas y ninguna llega a termino y alguna tendrá que ser victima
-- y ser eliminada por SQL Server.
BEGIN TRANSACTION;

    -- Bloquear para T2
    UPDATE dbo.caipi_suppliers 
    SET deleted = 1 
    WHERE idSupplier = 4;
    

    -- Se bloquea el primer recurso de T1
    UPDATE dbo.caipi_redemptionTransactions 
    SET amount = 200.00 
    WHERE idUser = 4;

COMMIT;



-- HAY QUE VERIFICAR QUE EXISTAN REDEMPTIONS CON USERS ID 4 Y QUE EXISTAN SUPPLIER CON ID 4 



