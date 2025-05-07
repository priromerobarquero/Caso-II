USE [caipiIAdb];

IF OBJECT_ID('dbo.caipi_VW_UserAvgPayFamilyPlan','V') IS NOT NULL
    DROP VIEW dbo.caipi_VW_UserAvgPayFamilyPlan;
GO

CREATE VIEW dbo.caipi_VW_UserAvgPayFamilyPlan
WITH SCHEMABINDING
AS
  SELECT 
	  u.userid AS id, SUBSTRING(u.username,3,9) AS userName,
	  LTRIM(u.name) + ' ' + LTRIM(u.lastname) AS nombre,
	  AVG(p.totalAmount) AS promedio
  FROM dbo.caipi_users AS u
  JOIN dbo.caipi_members AS m ON u.userid = m.userid
  JOIN dbo.caipi_subscriptions AS s ON m.subscriptionid = s.subscriptionid
  JOIN dbo.caipi_plans AS p ON s.idPlan = p.idPlan
  JOIN dbo.caipi_planTypes AS pt ON p.idplanTypes = pt.idplanTypes
  WHERE
	pt.name = 'Familiar'
    	AND u.active = 1
    	AND m.enabled = 1
    	AND s.enable = 1
    	AND p.enable = 1
  GROUP BY u.userid, u.username, u.name, u.lastname;
GO


SELECT TOP(20) id, nombre, promedio, userName
FROM dbo.caipi_VW_UserAvgPayFamilyPlan
ORDER BY promedio DESC;


EXEC sp_rename 
  'dbo.caipi_users.name', 
  'name_', 
  'COLUMN';

-- Msg 15336, Level 16, State 1, Procedure sp_rename, Line 612 [Batch Start Line 77]
-- Object 'dbo.caipi_users.name' cannot be renamed because the object participates in enforced dependencies.