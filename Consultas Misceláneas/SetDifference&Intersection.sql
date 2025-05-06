-----------------------------------------------------------
-- 1) INTERSECT:
-- Usuarios con suscripci�n activa a planes que ofrecen servicios
-- Y que adem�s tuvieron al menos una transacci�n en los �ltimos 30 d�as
-----------------------------------------------------------
SELECT
    u.userid,
    u.username,
	s.created_at,
	pl.totalAmount,
	pl.name
FROM caipi_users u
    JOIN caipi_subscriptions s     ON u.userid = s.userid
    JOIN caipi_plans         pl    ON pl.idPlan = s.idPlan
    JOIN caipi_redemptions   re    ON re.idPlan = pl.idPlan
	JOIN caipi_services      se    ON se.serviceId = re.idPlan

WHERE 
    s.enable = 1

INTERSECT

SELECT 
    u.userid,
    u.username,
	s.created_at,
	pl.totalAmount,
	pl.name
FROM caipi_users u
    JOIN caipi_transactions t    ON u.userid = t.userid
    JOIN caipi_payments p        ON t.paymentid = p.paymentid
    JOIN caipi_subscriptions s   ON u.userid = s.userid
    JOIN caipi_plans pl          ON s.idPlan = pl.idPlan
WHERE 
    t.date >= DATEADD(DAY, -30, GETDATE());
GO

-----------------------------------------------------------
-- 2) EXCEPT:
-- Usuarios con suscripci�n activa a planes que ofrecen servicios
-- Que NO hayan tenido ninguna transacci�n en los �ltimos 30 d�as
-----------------------------------------------------------
SELECT 
    u.userid,
    u.username,
	s.created_at,
	pl.totalAmount,
	pl.name
FROM caipi_users u
    JOIN caipi_transactions t    ON u.userid = t.userid
    JOIN caipi_payments p        ON t.paymentid = p.paymentid
    JOIN caipi_subscriptions s   ON u.userid = s.userid
    JOIN caipi_plans pl          ON s.idPlan = pl.idPlan
WHERE 
    s.enable = 1

EXCEPT

SELECT 
    u.userid,
    u.username,
	s.created_at,
	pl.totalAmount,
	pl.name
FROM caipi_users u
    JOIN caipi_transactions t    ON u.userid = t.userid
    JOIN caipi_payments p        ON t.paymentid = p.paymentid
    JOIN caipi_subscriptions s   ON u.userid = s.userid
    JOIN caipi_plans pl          ON s.idPlan = pl.idPlan
WHERE 
    t.date >= DATEADD(DAY, -30, GETDATE());
GO