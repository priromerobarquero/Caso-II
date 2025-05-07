-- TRIGGER El cual dispara cuando un usuario es actualizado
--Realiza una comparacion de datos nuevos y antiguos con la finalidad de almacenar el el log los cambios hechos en la actualizacion

CREATE OR ALTER TRIGGER log_insertUserUpdate
ON caipi_users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
	--declara las variables que se van a utilizar en la consulta
    DECLARE @userId INT,
            @username NVARCHAR(100),
            @old_username NVARCHAR(100),
            @name NVARCHAR(100),
            @old_name NVARCHAR(100),
            @lastname NVARCHAR(100),
            @old_lastname NVARCHAR(100),
            @password NVARCHAR(100),
            @old_password NVARCHAR(100),
            @role NVARCHAR(100),
            @old_role NVARCHAR(100),
            @changedColumns NVARCHAR(MAX);

	--Utilza un cursor local para almacenar los datos de la consulta, del registro insertado y del registro eliminado
    DECLARE cur CURSOR FOR
        SELECT i.userId, i.username, d.username,
               i.name, d.name,
               i.lastname, d.lastname,
               i.password, d.password,
               i.role, d.role
        FROM INSERTED i
        INNER JOIN DELETED d ON i.userId = d.userId;

	--abre el cursor para comenzar a recorrer las filas de la consulta
    OPEN cur;
    FETCH NEXT FROM cur INTO @userId, @username, @old_username,
                            @name, @old_name,
                            @lastname, @old_lastname,
                            @password, @old_password,
                            @role, @old_role;

    WHILE @@FETCH_STATUS = 0
    BEGIN
		--validacion de cambio de datos almacena los cambios realizados en el usuario
        SET @changedColumns = '';
		
        IF @username <> @old_username SET @changedColumns += 'username, ';
        IF @name <> @old_name SET @changedColumns += 'name, ';
        IF @lastname <> @old_lastname SET @changedColumns += 'lastname, ';
        IF @password <> @old_password SET @changedColumns += 'password, ';
        IF @role <> @old_role SET @changedColumns += 'role, ';

        -- Quitar última coma si existe
        IF RIGHT(@changedColumns, 2) = ', ' 
            SET @changedColumns = LEFT(@changedColumns, LEN(@changedColumns) - 2);

	    --Ejecuta el SP que genera el log de actualizar usuario
        EXECUTE sp_LogUpdateUser
            @userId,
            @username,
            @name,
            @lastname,
            @password,
            @role,
            @changedColumns;

		-- recorre el siguiente registro actualizado
        FETCH NEXT FROM cur INTO @userId, @username, @old_username,
                                @name, @old_name,
                                @lastname, @old_lastname,
                                @password, @old_password,
                                @role, @old_role;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO

CREATE OR ALTER PROCEDURE sp_LogUpdateUser
    @userId INT,
    @username NVARCHAR(100),
    @name NVARCHAR(100),
    @lastname NVARCHAR(100),
    @password NVARCHAR(100),
    @role NVARCHAR(100),
    @changedColumns NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO caipi_logs (
        [description], [computer], [username], [trace],
        [referenceId1], [referenceId2], [value1], [value2],
        [chechsum], [logSeverityId], [logSourceId], [logTypeId]
    )
    VALUES (
        'Usuario Actualizado - UserName: ' + @username,
        HOST_NAME(),
        SYSTEM_USER,
        'TRACE-' + CAST(ABS(CHECKSUM(NEWID())) % 10000 AS VARCHAR(10)),
        'Id Usuario',
        'Cambios Realizados',
        @userId,
        @changedColumns,
        CHECKSUM(@userId, @name, @lastname, @password, @role,@username),
        3,
        5,
        1
    );
END;
GO