-- Crear un SELECT que genere un archivo CSV de datos basado en un JOIN entre dos tablas



SELECT 'username,plan,stardate' AS csv
UNION ALL
SELECT 
	u.username + ',' +
	p.name + ',' +
	CONVERT(VARCHAR(30), s.startdate) AS startdate
FROM dbo.caipi_users AS u
INNER JOIN dbo.caipi_subscriptions AS s ON u.userid = s.userid
INNER JOIN dbo.caipi_plans AS p ON s.idPlan = p.idPlan
WHERE
	u.active = 1
	AND s.enable = 1
	AND p.enable = 1;
