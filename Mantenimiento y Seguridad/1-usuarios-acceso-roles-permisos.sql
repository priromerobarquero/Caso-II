-- Crear usuarios de prueba y:
-- Mostrar cómo permitir o denegar acceso a la base de datos, del todo poder verla o no, poder conectarse o no
-- Conceder solo permisos de SELECT sobre una tabla a un usuario específico. Será posible crear roles 
-- y que existan roles que si puedan hacer ese select sobre esa tabla y otros Roles que no puedan? Demuestrelo con usuarios y roles pertinentes.
-- Permitir ejecución de ciertos SPs y denegar acceso directo a las tablas que ese SP utiliza, será que aunque tengo las tablas restringidas, puedo ejecutar el SP?
-- habrá alguna forma de implementar RLS, row level security

-------------------------------------------------------------------------------
-- Usuarios y acceso a la db
-------------------------------------------------------------------------------

USE master;  -- cambiar al contexto de servidor
GO

-- crear logins a nivel servidor
CREATE LOGIN login_solo_lectura   WITH PASSWORD = 'password1';  -- login con contraseña para usuario de solo lectura
CREATE LOGIN login_sin_acceso   WITH PASSWORD = 'password2';  -- login que no podrá conectar
CREATE LOGIN login_solo_sp     WITH PASSWORD = 'password3';  -- login que sólo ejecutará SP
GO

USE caipiIAdb;  -- cambiar al contexto de la base de datos deseada
GO

-- crear usuarios de base de datos asociados a los logins
CREATE USER user_solo_lectura   FOR LOGIN login_solo_lectura;  -- usuario que verá datos
CREATE USER user_sin_acceso   FOR LOGIN login_sin_acceso;  -- usuario sin acceso
CREATE USER user_solo_sp     FOR LOGIN login_solo_sp;    -- usuario que sólo puede ejecutar SP
GO

-- controlar CONNECT a la base
DENY CONNECT TO user_sin_acceso;       -- denegar conexión completamente
GRANT CONNECT TO user_solo_lectura;      -- permitir conexión
GRANT CONNECT TO user_solo_sp;        -- permitir conexión
GO

-------------------------------------------------------------------------------
-- Roles y permisos SELECT sobre dbo.caipi_users
-------------------------------------------------------------------------------

CREATE ROLE rol_si_select;           -- rol que podrá hacer SELECT
CREATE ROLE rol_no_select;        -- rol que no podrá hacer SELECT
GO

ALTER ROLE rol_si_select ADD MEMBER user_solo_lectura;  -- asignar ReadOnly al rol con SELECT
ALTER ROLE rol_no_select ADD MEMBER user_solo_sp;    -- asignar SPOnly al rol sin SELECT
GO

GRANT SELECT ON dbo.caipi_users TO rol_si_select;   -- conceder SELECT al rol
DENY  SELECT ON dbo.caipi_users TO rol_no_select;-- denegar SELECT al otro rol
GO

-- probar permisos de SELECT
EXECUTE AS USER = 'user_solo_lectura';  
SELECT TOP(1) * FROM dbo.caipi_users;   -- funciona porque tiene SELECT
REVERT;
-- REVERT restaura el contexto al usuario original, es decir, el que ejecutó originalmente el script.
-- Si no usas REVERT, seguirás "siendo" ese usuario dentro de esa sesión, lo que puede causar confusión o errores de permisos después.
EXECUTE AS USER = 'user_solo_sp';  
SELECT TOP(1) * FROM dbo.caipi_users;   -- falla por DENY
REVERT;
GO
-- Msg 229, Level 14, State 5, Line 51
-- The SELECT permission was denied on the object 'caipi_users', database 'caipiIAdb', schema 'dbo'.
EXECUTE AS USER = 'user_sin_acceso';  
SELECT TOP(1) * FROM dbo.caipi_users;   -- falla por DENY
REVERT;
GO
-- Msg 916, Level 14, State 4, Line 57
-- The server principal "login_sin_acceso" is not able to access the database "caipiIAdb" under the current security context.

-------------------------------------------------------------------------------
-- SP que expone datos y oculta acceso directo a tablas
-------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE dbo.caipiSP_ObtenerUsuariosOWNER
WITH EXECUTE AS OWNER -- ejecuta con permisos de propietario, sin importar el invocador
AS
BEGIN
	SELECT userid, username FROM dbo.caipi_users;
END;
GO

CREATE OR ALTER PROCEDURE dbo.caipiSP_ObtenerUsuariosREGULAR
AS
BEGIN
	SELECT userid, username FROM dbo.caipi_users;
END;
GO

-- configurar permisos para user_solo_sp
DENY SELECT ON dbo.caipi_users TO user_solo_sp;
GRANT EXECUTE ON dbo.caipiSP_ObtenerUsuariosOWNER TO user_solo_sp;

-- probar ejecución de los sp
EXECUTE AS USER = 'user_solo_sp';
SELECT * FROM dbo.caipi_users;
EXEC dbo.caipiSP_ObtenerUsuariosREGULAR;
EXEC dbo.caipiSP_ObtenerUsuariosOWNER;
REVERT;
GO

