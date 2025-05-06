ALTER VIEW VistaIndexadaSoltura -- Sin SCHEMABINDING
WITH SCHEMABINDING
AS
SELECT
    u.username,
    u.name,
    u.lastname,
    u.registerdate,
    s.social,
    s.enable,
    s.auto_renew,
    s.created_at,
    p.amount,
    p.result,
    p.error,
    p.description,
    p.date,
    e.name AS Servicio,
	COUNT_BIG(*) AS CountBig
FROM
    dbo.caipi_users u
INNER JOIN
    dbo.caipi_subscriptions s ON u.userid = s.userid
INNER JOIN
    dbo.caipi_payments p ON s.subscriptionid = s.userid
INNER JOIN
    dbo.caipi_redemptions e1 ON u.userid = e1.idUser
INNER JOIN
    dbo.caipi_services e ON e1.idService = e.serviceId
GROUP BY
    u.username,
    u.name,
    u.lastname,
    u.registerdate,
    s.social,
    s.enable,
    s.auto_renew,
    s.created_at,
    p.amount,
    p.result,
    p.error,
    p.description,
    p.date,
    e.name;
GO

CREATE UNIQUE CLUSTERED INDEX IX_VistaIndexadaSoltura
ON VistaIndexadaSoltura (username, created_at, amount, description, Servicio);
GO

--=======================================================
-- Prueba de que es dinámica 
-- Ejecutamos la lista de persona con nombre 'cgonzalez015' y aparece un monto con 2.00 con descripción propina
--=======================================================

SELECT name, amount, description
FROM VistaIndexadaSoltura
WHERE username = 'cgonzalez015' AND description = 'Propina'

-- Ahora actualizamos el monto
UPDATE dbo.caipi_payments
SET amount = 8.00
WHERE userId = 29 AND description = 'Propina'

-- Llamamos otra la lista
SELECT name, amount, description
FROM VistaIndexadaSoltura
WHERE username = 'cgonzalez015' AND description = 'Propina'

-- El resultado terminó siendo 8.00



