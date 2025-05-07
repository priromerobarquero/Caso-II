--Cursor global
CREATE OR ALTER PROCEDURE Dec_Cursor_Services
AS
BEGIN
    -- Declaro el cursor global para obtener todos los servicios en el sistema de lo cuales solo los activos
    DECLARE Services_Cursor CURSOR GLOBAL
    FOR
    SELECT 
        s.serviceId,
        s.name AS service_name
    FROM 
        dbo.caipi_services s
    WHERE 
        s.enable = 1;  -- Solo servicios habilitados
    
    -- Abrir el cursor
    OPEN Services_Cursor;
END
GO

CREATE OR ALTER PROCEDURE Fetch_Cursor_Services
AS
BEGIN
    -- Variables para almacenar los datos del cursor
    DECLARE @serviceId INT;
    DECLARE @service_name VARCHAR(255);
    DECLARE @total_suppliers INT;

    -- Fetch inicial para obtener el primer servicio
    FETCH NEXT FROM Services_Cursor INTO @serviceId, @service_name;

    -- Mientras haya más filas, seguiran procesandose
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
        -- Se cuenta cuantos provedores tiene un contrato activos con el servicio
        SELECT 
            @total_suppliers = COUNT(DISTINCT at.idSupplier)
        FROM 
            dbo.caipi_agreementTerms at
        WHERE 
            at.idService = @serviceId
            AND at.enable = 1;  -- Solo relaciones activas

        -- Muestra el resultado directamente
        SELECT 
            @serviceId AS serviceId,
            @service_name AS service_name,
            @total_suppliers AS total_suppliers;

        -- Obtiene la siguiente fila
        FETCH NEXT FROM Services_Cursor INTO @serviceId, @service_name;
    END
END
GO


--Sesion 2
EXEC Dec_Cursor_Services
GO
EXEC Fetch_Cursor_Services
CLOSE Services_Cursor;
GO
DEALLOCATE Services_Cursor;
GO
