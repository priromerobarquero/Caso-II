-------------------------------------------------------------------------------
-- Row‑Level Security: sólo ver miembros propios
-------------------------------------------------------------------------------
-- función de predicado
IF OBJECT_ID('dbo.caipiFN_MemberFilter','FN') IS NOT NULL
	DROP FUNCTION dbo.caipiFN_MemberFilter;  
GO
CREATE FUNCTION dbo.caipiFN_MemberFilter(@userid INT)
RETURNS TABLE
WITH SCHEMABINDING
AS
    RETURN SELECT 1 AS fn_ok
           WHERE @userid = USER_ID();  -- solo pasa filas si el userid coincide con el usuario de contexto
GO

-- política de seguridad
IF OBJECT_ID('dbo.caipiSecurityPolicy_Members','POL') IS NOT NULL 
	DROP SECURITY POLICY dbo.caipiSecurityPolicy_Members;  
GO
CREATE SECURITY POLICY dbo.caipiSecurityPolicy_Members
    ADD FILTER PREDICATE dbo.caipiFN_MemberFilter(userid) ON dbo.caipi_members  -- aplicar el filtro a caipi_members
    WITH (STATE = ON);      -- activar la política
GO

-- probar RLS
EXECUTE AS USER = 'user_solo_lectura';  
SELECT * FROM dbo.caipi_members;  -- sólo verá sus propias filas
REVERT;
GO

EXECUTE AS USER = 'user_solo_lectura';  
print USER_ID();
revert;


