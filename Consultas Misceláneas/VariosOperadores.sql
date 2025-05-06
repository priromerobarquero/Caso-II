USE caipiIAdb;
GO

-----------------------------------------------------------
-- 1) CTE: Usuarios con suscripción activa
-----------------------------------------------------------
WITH ActiveSubs AS (
    SELECT 
        s.userid,
        s.idPlan,
        s.startDate
    FROM caipi_subscriptions s
    WHERE s.enable = 1
),

-----------------------------------------------------------
-- 2) CTE: Estadísticas de pagos por usuario (último mes)
--    - SUM(amount) y AVG(amount), 
--    - sólo aquellos con SUM(amount) > 1000
-----------------------------------------------------------
PaymentStats AS (
    SELECT 
        p.userid,
        SUM(p.amount)  AS totalPaid,
        AVG(p.amount)  AS avgPaid
    FROM caipi_payments p
    WHERE p.date >= DATEADD(MONTH, -1, GETDATE())
    GROUP BY p.userid
    HAVING SUM(p.amount) > 1000
),

-----------------------------------------------------------
-- 3) CTE: Usuarios que han hecho transacción en últimos 30 días
-----------------------------------------------------------
RecentTx AS (
    SELECT DISTINCT
        t.userid
    FROM caipi_transactions t
    WHERE t.date >= DATEADD(DAY, -30, GETDATE())
)

-----------------------------------------------------------
-- Consulta final: combina los 3 CTEs + tablas
-- 4 JOINs, CASE, CONVERT, IN, NOT IN, EXISTS, ORDER BY
-----------------------------------------------------------
SELECT
    u.userid,
    u.username,
    pl.name             AS planName,
    CONVERT(VARCHAR(10), a.startDate, 23) AS subscriptionDate,
    ps.totalPaid,
    ps.avgPaid,
    CASE 
      WHEN ps.avgPaid > 2000 THEN 'VIP'
      ELSE 'STANDARD'
    END AS customerTier
FROM caipi_users      u
    JOIN ActiveSubs      a ON u.userid = a.userid          -- 1
    JOIN caipi_plans     pl ON a.idPlan   = pl.idPlan       -- 2
    JOIN PaymentStats    ps ON u.userid   = ps.userid       -- 3
    JOIN RecentTx        r  ON u.userid   = r.userid        -- 4
WHERE
    -- Incluyo solo usuarios NO dados de baja (active = 0)
    u.active = 1
    -- Y me aseguro de que existan pagos OK
    AND EXISTS (
        SELECT 1 
        FROM caipi_payments p2
        WHERE p2.userid = u.userid 
          AND p2.result = 'OK'
    )
ORDER BY ps.totalPaid DESC;

