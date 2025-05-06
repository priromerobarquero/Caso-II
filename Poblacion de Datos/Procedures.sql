/*
 procedimiento almacenado: dbo.crearusuarios
 descripcion: inserta 100 usuarios de ejemplo en dbo.caipi_users
*/
GO
CREATE OR ALTER PROCEDURE dbo.crearusuarios
AS
BEGIN
    -- este bloque desactiva mensajes de conteo de filas
    SET NOCOUNT ON;

    -- este bloque crea una tabla temporal con nombres comunes
    DECLARE @FirstNames TABLE (Name NVARCHAR(50));
    INSERT INTO @FirstNames (Name)
    VALUES ('Jose'),('Maria'),('Juan'),('Ana'),('Luis'),('Carmen'),('Miguel'),('Laura'),('Carlos'),('Lucia');

    -- este bloque crea una tabla temporal con apellidos comunes
    DECLARE @LastNames TABLE (Lastname NVARCHAR(50));
    INSERT INTO @LastNames (Lastname)
    VALUES ('Garcia'),('Rodriguez'),('Martinez'),('Hernandez'),('Lopez'),('Gonzalez'),('Perez'),('Sanchez'),('Ramirez'),('Torres');

    -- este bloque inicia el contador para insertar 100 usuarios
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        -- este bloque elige un nombre aleatorio
        DECLARE @FirstName NVARCHAR(50) = (
            SELECT TOP 1 Name FROM @FirstNames ORDER BY NEWID()
        );
        -- este bloque elige un apellido aleatorio
        DECLARE @LastName NVARCHAR(50) = (
            SELECT TOP 1 Lastname FROM @LastNames ORDER BY NEWID()
        );

        -- este bloque crea el username usando inicial del nombre, apellido y contador
        DECLARE @Username NVARCHAR(50) = LOWER(
            LEFT(@FirstName,1) + @LastName + RIGHT('00' + CAST(@i AS VARCHAR),3)
        );

        -- este bloque genera fecha de nacimiento entre 18 y 65 anos
        DECLARE @Birth DATE = DATEADD(
            DAY,
            - (ABS(CHECKSUM(NEWID())) % (47 * 365) + (18 * 365)),
            CAST(GETDATE() AS DATE)
        );

        -- este bloque genera contrasena como hash sha2_256 de pass + contador
        DECLARE @Password VARBINARY(255) = HASHBYTES('SHA2_256', 'pass' + CAST(@i AS NVARCHAR));

        -- este bloque define flags de estado eliminacion y activo
        DECLARE @Deleted BIT = 0;
        DECLARE @Active BIT = 1;

        -- este bloque crea fecha de registro aleatoria en el ultimo ano
        DECLARE @RegisterDate DATE = DATEADD(
            DAY,
            - (ABS(CHECKSUM(NEWID())) % 365),
            CAST(GETDATE() AS DATE)
        );
        -- este bloque asigna la fecha y hora actual como ultima actualizacion
        DECLARE @LastUpdate DATETIME = GETDATE();


        -- este bloque crea urls de perfil e imagen usando el username
        DECLARE @ProfileUrl NVARCHAR(200) = 'https://example.com/users/' + @Username;
        DECLARE @ImgProfileUrl NVARCHAR(200) = 'https://example.com/images/' + @Username + '.jpg';

        -- este bloque inserta el usuario generado en la tabla principal
        INSERT INTO dbo.caipi_users
            (username, [name], lastname, birth, [password], deleted, active, last_update,  registerdate, profile_url, img_profile_url)
        VALUES
            (@Username, @FirstName, @LastName, @Birth, @Password, @Deleted, @Active, @LastUpdate,  @RegisterDate, @ProfileUrl, @ImgProfileUrl);

        -- este bloque incrementa el contador
        SET @i = @i + 1;
    END
END
GO

/*
 procedimiento almacenado: dbo.insertsampleaddresses
 descripcion: inserta 100 direcciones de ejemplo en dbo.caipi_Adresses
*/
go
CREATE OR ALTER procedure dbo.insertardireccionesparausuarios
as
begin
    set nocount on;

    -- contador para crear 100 direcciones
    declare @i int = 1;
    while @i <= 100
    begin
        -- linea 1: calle + numero
        declare @line1 varchar(200) = 'calle ' + cast((abs(checksum(newid())) % 200 + 1) as varchar) + ' #' + cast((abs(checksum(newid())) % 1000 + 1) as varchar);
        
        -- linea 2: apto o null
        declare @line2 varchar(200);
        if (abs(checksum(newid())) % 2) = 0
            set @line2 = 'apto ' + cast((abs(checksum(newid())) % 100 + 1) as varchar);
        else
            set @line2 = null;

        -- codigo postal formato 5 digitos[-4]
        declare @zip varchar(9) = right('00000' + cast(abs(checksum(newid())) % 100000 as varchar),5)
                                 + '-' + right('0000' + cast(abs(checksum(newid())) % 10000 as varchar),4);

        -- generar punto geometrico con lat/lon en costa rica aproximado
        declare @rand float = rand(checksum(newid()));
        declare @lat float = 8 + @rand * 3;      -- entre 8 y 11 grados
        declare @lon float = -85 + @rand * 3;    -- entre -85 y -82 grados
        declare @location geometry = geometry::Point(@lon, @lat, 4326);

        -- habilitado aleatorio
        declare @enable bit = cast((abs(checksum(newid())) % 2) as bit);

        -- id de direccion secuencial
        declare @adressId int = @i;

        -- id de ciudad aleatorio entre 1 y 18
        declare @cityId int = abs(checksum(newid())) % 18 + 1;

        -- insertar registro
        insert into dbo.caipi_Adresses
            (line1, line2, zipcode, location, enable, adressId, cityId)
        values
            (@line1, @line2, @zip, @location, @enable, @adressId, @cityId);

        -- siguiente contador
        set @i = @i + 1;
    end
end
go



/*
 procedimiento almacenado: dbo.insertsampleaddressesperuser
 descripcion: asigna direcciones a usuarios en dbo.caipi_AdressessPerUser
*/
GO
CREATE OR ALTER PROCEDURE dbo.insertardireccionesparausuariosporusuario
AS
BEGIN
    -- este bloque evita mensajes de conteo de filas
    SET NOCOUNT ON;

    -- contador para crear 200 registros (direcciones por usuario)
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        -- id secuencial de la relacion
        DECLARE @addressPerUserId INT = @i;

        -- flag habilitado aleatorio
        DECLARE @enable BIT = CAST((ABS(CHECKSUM(NEWID())) % 2) AS BIT);

        -- direccion id de 1 a 200
        DECLARE @adressId INT = @i;

        -- usuario id de 1 A 100
        DECLARE @userid INT = @i;

        -- insertar registro en la tabla de relacion
        INSERT INTO dbo.caipi_AdressessPerUser
            (adressPerUserId, enable, adressId, userid)
        VALUES
            (@addressPerUserId, @enable, @adressId, @userid);

        -- incrementar contador
        SET @i = @i + 1;
    END
END
GO


GO
CREATE OR ALTER PROCEDURE insertarInfoContactoUsuarios
AS
BEGIN
    SET NOCOUNT ON;

    -- declaramos las variables
    DECLARE @userid INT = 1;
    DECLARE @contactTypeId INT;
    DECLARE @email VARCHAR(100);
    DECLARE @phone VARCHAR(100);
    DECLARE @mobile VARCHAR(100);
    DECLARE @fax VARCHAR(100);
    DECLARE @web VARCHAR(100);
    DECLARE @fecha DATETIME;

    -- recorremos los usuarios del 101 al 300
    WHILE @userid <= 100
    BEGIN
        -- generamos una fecha aleatoria
        SET @fecha = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-04-01');

        -- generamos un correo electronico
        SET @email = 'user' + CAST(@userid AS VARCHAR) + '@correo.com';
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @email, @userid, 1); -- 1 es email

        -- generamos un numero telefonico fijo
        SET @phone = '+506 2222' + RIGHT('000' + CAST(@userid AS VARCHAR), 4);
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @phone, @userid, 2); -- 2 es telefono fijo

        -- generamos un numero movil
        SET @mobile = '+506 88' + RIGHT('000000' + CAST(@userid AS VARCHAR), 6);
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @mobile, @userid, 5); -- 5 es numero movil

        -- generamos un fax (opcional, no todos tendran)
        IF @userid % 3 = 0
        BEGIN
            SET @fax = '+506 2288' + RIGHT('000' + CAST(@userid AS VARCHAR), 4);
            INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
            VALUES (1, @fecha, @fax, @userid, 3); -- 3 es fax
        END

        -- generamos un sitio web (opcional, algunos tendran)
        IF @userid % 4 = 0
        BEGIN
            SET @web = 'https://usuario' + CAST(@userid AS VARCHAR) + '.com';
            INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
            VALUES (1, @fecha, @web, @userid, 4); -- 4 es sitio web
        END

        SET @userid = @userid + 1;
    END
END
GO



/*
 procedimiento almacenado: dbo.FillSubscriptionsAndMembers
 descripcion: asigna suscripciones a un tercio de usuarios (101-300) y miembros a cada suscripcion
 hay mas usuarios como miembros que como dueños
 cada suscripcion tendra de 3 a 6 miembros
*/
GO
CREATE OR ALTER PROCEDURE dbo.llenarSubscriptionyMembers
AS
BEGIN
    SET NOCOUNT ON;

    -- definimos rango de usuarios
    DECLARE @minUser INT = 1, @maxUser INT = 100;
    DECLARE @totalUsers INT = @maxUser - @minUser + 1;
    -- elegimos un tercio de usuarios como dueños
    DECLARE @ownersCount INT = @totalUsers / 3;

    -- tabla temporal de dueños de suscripcion
    DECLARE @owners TABLE (userid INT PRIMARY KEY);
    DECLARE @idx INT = 0;
    WHILE @idx < @ownersCount
    BEGIN
        SET @idx = @idx + 1;
        INSERT INTO @owners (userid)
        VALUES (@minUser + @idx - 1);
    END;

    -- cursor para recorrer cada dueño
    DECLARE owner_cursor CURSOR FOR
        SELECT userid FROM @owners;
    OPEN owner_cursor;

    DECLARE @ownerId INT;
    FETCH NEXT FROM owner_cursor INTO @ownerId;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- datos aleatorios para la suscripcion
        DECLARE @subscription_typeid INT = CAST(RAND(CHECKSUM(NEWID())) * 8 + 1 AS INT);
        DECLARE @social BIT         = CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT);
        DECLARE @enable BIT         = 1;
        DECLARE @startdate DATE     = DATEADD(DAY, -CAST(RAND(CHECKSUM(NEWID())) * 365 AS INT), CAST(GETDATE() AS DATE));
        DECLARE @deleted BIT        = 0;
        DECLARE @statusid INT       = CAST(RAND(CHECKSUM(NEWID())) * 5 + 1 AS INT);
        DECLARE @scheduleId INT     = CAST(RAND(CHECKSUM(NEWID())) * 39 + 1 AS INT);
        DECLARE @auto_renew BIT     = CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT);
        DECLARE @created_at DATETIME = DATEADD(MINUTE, -CAST(RAND(CHECKSUM(NEWID())) * 10000 AS INT), GETDATE());
        DECLARE @idPlan INT         = CAST(RAND(CHECKSUM(NEWID())) * 15 + 1 AS INT);

        -- insertamos la suscripcion y obtenemos su id
        INSERT INTO dbo.caipi_subscriptions
            (suscription_typeid, userid, social, enable, startdate, deleted, statusid, scheduleId, auto_renew, created_at, idPlan)
        VALUES
            (@subscription_typeid, @ownerId, @social, @enable, @startdate, @deleted, @statusid, @scheduleId, @auto_renew, @created_at, @idPlan);
        DECLARE @subscriptionId INT = SCOPE_IDENTITY();

        -- determinamos cuántos miembros (3 a 6)
        DECLARE @membersCount INT = CAST(RAND(CHECKSUM(NEWID())) * 4 + 3 AS INT);

        -- insertamos al dueño como miembro
        INSERT INTO dbo.caipi_members
            (subscriptionid, userid, startdate, leftdate, enabled, deleted)
        VALUES
            (@subscriptionId, @ownerId, @created_at, NULL, 1, 0);

        -- insertamos miembros adicionales, pueden repetirse en otras suscripciones
        DECLARE @m INT = 1;
        WHILE @m < @membersCount
        BEGIN
            DECLARE @randUser INT = CAST(RAND(CHECKSUM(NEWID())) * @totalUsers + @minUser AS INT);
            IF NOT EXISTS(
                SELECT 1 FROM dbo.caipi_members
                WHERE subscriptionid = @subscriptionId AND userid = @randUser
            )
            BEGIN
                INSERT INTO dbo.caipi_members
                    (subscriptionid, userid, startdate, leftdate, enabled, deleted)
                VALUES
                    (@subscriptionId, @randUser, @created_at, NULL, 1, 0);
                SET @m = @m + 1;
            END;
        END;

        FETCH NEXT FROM owner_cursor INTO @ownerId;
    END;

    CLOSE owner_cursor;
    DEALLOCATE owner_cursor;
END;
GO


/*
	Insercion de metodos de pagos disponibles, 15 para que cada proveedor y usuario tengan unicos
	En este caso se utiliza un cursor local disponible solamente en el codigo de bloque ejecutado, su funcion es procesar el resultado de
	la consulta select y recorrer los 5 metodos de pago que los porveedores y usuarios pueden tener en la app
*/

CREATE OR ALTER PROCEDURE InsertarPaymentMethods
	--no hay parametros
AS
BEGIN
    -- Declaración de variables
    DECLARE @i INT = 1;
    DECLARE @name NVARCHAR(50);
    DECLARE @methodId INT;
    DECLARE @token NVARCHAR(100);
    DECLARE @expTokenDate DATETIME;
    DECLARE @maskAccount VARCHAR(10);
    DECLARE @callbackURL NVARCHAR(100);
    DECLARE @configurationDetails NVARCHAR(MAX);
    DECLARE @refreshToken VARBINARY(MAX);

    -- Cursor para recorrer los métodos de pago existentes, recibiendo loda daros de la consulta select de la tabla que contiene los metodos de pago
    DECLARE method_cursor CURSOR FOR
        SELECT [name],[methodId]
        FROM [dbo].[caipi_paymentMethods];

    OPEN method_cursor;
    FETCH NEXT FROM method_cursor INTO @name, @methodId; --Recorre el primerregistro, almacena el nombre y el id del metodo que sera utilizado en la insercion

    -- Ciclo para insertar datos en la tabla de métodos de pago
    WHILE @i <= 15
    BEGIN
		-- Asignar valores dinámicos a las variables
        SET @token = CONVERT(NVARCHAR(100), NEWID());
        SET @expTokenDate = DATEADD(DAY, @i * 30, GETDATE());  -- Asignación de fechas, incrementa cada 30 días
        SET @maskAccount = CONCAT('****', RIGHT('000' + CAST((1000 + @i * 7) AS VARCHAR), 4));  -- Cuenta enmascarada con incremento
        SET @callbackURL = CONCAT('https://example.com/callback/method', @i);
        SET @configurationDetails = CONCAT('{"currency":"USD", "method":"', @name, '"}');
        SET @refreshToken = CAST(HASHBYTES('SHA2_256', @token) AS VARBINARY(MAX));  -- Encriptación del token

        -- Insertar el registro en la tabla
        INSERT INTO [dbo].[caipi_availablePaymentMethods]
           ([name], [token], [expTokenDate], [maskAccount], [callbackURL], [configurationDetails], [refreshToken], [methodId])
        VALUES
           (@name, @token, @expTokenDate, @maskAccount, @callbackURL, @configurationDetails, @refreshToken, @methodId);  -- Usa @methodId como ID del método QUE ES APUNTADO POR EL CURSOR

        SET @i += 1;  -- Incrementar el contador para el siguiente ciclo
        -- Obtener el siguiente método de pago
        FETCH NEXT FROM method_cursor INTO @name, @methodId;

		-- Si ya se recorrio hasta último registro, vuelve al inicio para volver a recorrer la consulta
		IF @@FETCH_STATUS <> 0 -- Ya no hay más registros
		BEGIN
			-- Reinicia el cursor a la primera fila
			CLOSE method_cursor;

			-- Reabriendo el cursor
			OPEN method_cursor;
			FETCH NEXT FROM method_cursor INTO @name, @methodId; -- Vuelve al primer registro
		END
    END

    -- Cerrar y liberar el cursor
    CLOSE method_cursor;
    DEALLOCATE method_cursor;
END



-- Available payment Methods per Supplier
/*

	Crea la relacion de los metodos de pago existentes y disponibles para cada proveedor, asigna solo 1 y diferente para el mismo.

*/

GO
CREATE OR ALTER PROCEDURE AddPaymentMethodsPerSupplier
	--SIN PARAMETROS
AS
BEGIN
	--Declare local variables
	DECLARE @SupplierQuantity INT = 15 --cantidad de proveedores
	DECLARE @MethodsQuantity INT = 5 --cantidad de metodos disponibles
	DECLARE @MethodId INT --Id del metodo seleccionado de forma aleatoria
	DECLARE @SupplierCount INT = 1 --Contador de ciclo que recorre los registros de proveedores el cual funciona tambien como ID del supplier


	WHILE @SupplierCount <= @SupplierQuantity
    BEGIN
		--Escoge un metodo de pago disponible entre los id registrados con el checkscum obtengo distintos valores en cada interacion de RAND
		SET @MethodId = FLOOR(1 + RAND(CHECKSUM(NEWID())) * @MethodsQuantity);

		INSERT INTO [dbo].[caipi_AvailablePaymentMethodsPerSuppliers]
			   ([enable]
			   ,[paymentMethodId]
			   ,[supplierId])
		 VALUES
			   (1
			   ,@MethodId
			   ,@SupplierCount)

		SET @SupplierCount +=1;
	END
END

GO
CREATE OR ALTER PROCEDURE LlenarPlanes
AS
BEGIN
    DECLARE @countPlanes INT = 15;
    DECLARE @planesID INT;
    DECLARE @Name VARCHAR(30);
    DECLARE @planType INT;
    DECLARE @checkSum VARBINARY(255); -- HASHBYTES devuelve VARBINARY
    DECLARE @fecha DATETIME;
    DECLARE @total DECIMAL(5,2);

    DECLARE @nombres TABLE (nombre VARCHAR(30));
    
    -- Insertamos los 15 nombres
    INSERT INTO @nombres(nombre)
    VALUES 
        ('Joven Deportista'), ('Familia de Verano'), ('Viajero Frecuente'), ('Nómada Digital'),
        ('Profesional en Movimiento'), ('Estudiante Proactivo'), ('Creativo Freelance'), ('Full Wellness'),
        ('Tiempo en Familia'), ('Explorador Urbano'), ('Hogar Equilibrado'), ('Fit & Chill'),
        ('EcoVida'), ('Combo Soltura'), ('Zen Diario');

    DECLARE @i INT = 1;

    WHILE @i <= 15
    BEGIN
        SET @planesID = @i;

        SELECT @Name = nombre FROM (
            SELECT nombre, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn FROM @nombres
        ) AS nombres_ordenados
        WHERE rn = @i;

        -- Tipo de plan entre 1 y 6
        SET @planType = FLOOR(1 + RAND() * 6);

        -- Fecha aleatoria entre 2024-06-01 y hoy
        DECLARE @startDate DATETIME = '2024-06-01 00:00:00';
        DECLARE @secondsRange INT = DATEDIFF(SECOND, @startDate, GETDATE());
        SET @fecha = DATEADD(SECOND, FLOOR(RAND(CHECKSUM(NEWID())) * @secondsRange), @startDate);

        -- Total entre 100 y 200
        SET @total = ROUND(100 + (RAND() * 100), 2); 

        -- Checksum con HASHBYTES
        SET @checkSum = HASHBYTES('SHA2_512', CONCAT(@planesID, @Name, 'fbsdinaldkna3193'));

        -- Insertamos en la tabla
        INSERT INTO caipi_plans(name, description, enable, deleted, checkSum, idplanTypes, effectiveDate, totalAmount)
        VALUES (
            @Name, 'Esta es la descripción', 1, 0, @checkSum, @planType, @fecha, @total
        );

        SET @i += 1;
    END
END



-- ------------------------------Llenado de schedules -------------------------------------
GO
CREATE OR ALTER PROCEDURE llenadoSchedules
AS
BEGIN

    DECLARE @horarios TABLE (
        name VARCHAR(50),
        recurrencyType VARCHAR(20),
        repetition INT
    );

    INSERT INTO @horarios (name, recurrencyType, repetition)
    VALUES 
        ('Cada semana', 'semanal', 1),
        ('Cada mes', 'mensual', 1),
        ('Cada 15 días', 'semanal', 2);

    DECLARE @i INT = 1;
    DECLARE @mes INT;
    DECLARE @dia INT;
    DECLARE @endDate DATE;

    WHILE @i <= 13
    BEGIN
        
        SET @mes = FLOOR(RAND(CHECKSUM(NEWID())) * 8) + 5; -- Mes aleatorio

        SET @dia = FLOOR(RAND(CHECKSUM(NEWID())) * 28) + 1; -- Dia aleatorio

        SET @endDate = DATEFROMPARTS(2025, @mes, @dia);

        -- Insertar 3 registros por vuelta
        INSERT INTO caipi_schedules (name, recurrencyType, repetition, endType, endDate)
        SELECT name, recurrencyType, repetition, 'NA', @endDate
        FROM @horarios;

        SET @i += 1;
    END
END;




EXECUTE dbo.crearusuarios;
EXECUTE dbo.insertardireccionesparausuarios;
EXECUTE dbo.insertardireccionesparausuariosporusuario;
EXECUTE insertarInfoContactoUsuarios;
EXECUTE LlenarPlanes;
EXECUTE llenadoSchedules;
EXECUTE dbo.llenarSubscriptionyMembers;
EXECUTE InsertarPaymentMethods;
EXECUTE AddPaymentMethodsPerSupplier;


