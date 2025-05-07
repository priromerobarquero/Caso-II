IF OBJECT_ID('dbo.CrearUsuarioEspecial', 'P') IS NOT NULL
    DROP PROCEDURE dbo.CrearUsuarioEspecial;
GO

CREATE PROCEDURE dbo.CrearUsuarioEspecial
WITH ENCRYPTION
AS
BEGIN
    SET NOCOUNT ON;

    SET IDENTITY_INSERT dbo.caipi_users ON;

    INSERT INTO dbo.caipi_users
        (userid, username, [name], lastname, birth, [password], deleted, active, last_update, role, registerdate, profile_url, img_profile_url)
    VALUES
        (
            101,
            'admin101',
            'Admin',
            'Especial',
            DATEADD(YEAR, -30, GETDATE()),
            HASHBYTES('SHA2_256', 'admin101pass'),
            0,
            1,
            GETDATE(),
            1,
            GETDATE(),
            'https://example.com/users/admin101',
            'https://example.com/images/admin101.jpg'
        );

    SET IDENTITY_INSERT dbo.caipi_users OFF;
END;
GO

EXECUTE AS USER = 'dbo'; -- o tu usuario admin
EXEC dbo.CrearUsuarioEspecial;
REVERT;



