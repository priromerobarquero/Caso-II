-- Modificar el Stored Procedure DesencriptarColumna
CREATE PROCEDURE DesencriptarColumna
    @NombreTabla NVARCHAR(128),
    @NombreColumna NVARCHAR(128),
    @NombreLlaveSimetrica NVARCHAR(128),
    @NombreLlaveAsimetrica NVARCHAR(128),
    @Contrase�aLlaveAsimetrica NVARCHAR(256)
AS
BEGIN
    -- Evitar el conteo de filas afectadas
    SET NOCOUNT ON;

    -- Construir la consulta din�micamente
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = '
    OPEN SYMMETRIC KEY ' + QUOTENAME(@NombreLlaveSimetrica) + '
    DECRYPTION BY ASYMMETRIC KEY ' + QUOTENAME(@NombreLlaveAsimetrica) + '
    WITH PASSWORD = ''' + @Contrase�aLlaveAsimetrica + ''';

    SELECT
        ' + QUOTENAME(@NombreColumna) + ' AS ColumnaEncriptada,
        CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(' + QUOTENAME(@NombreColumna) + ')) AS ColumnaDesencriptada
    FROM ' + QUOTENAME(@NombreTabla) + ';

    CLOSE SYMMETRIC KEY ' + QUOTENAME(@NombreLlaveSimetrica) + ';';

    -- Ejecutar la consulta din�mica
    EXEC sp_executesql @SQL;
END;
GO

-- Ejemplo de uso
EXEC DesencriptarColumna
    @NombreTabla = 'caipi_users',
    @NombreColumna = 'password',
    @NombreLlaveSimetrica = 'ClaveSimetrica',
    @NombreLlaveAsimetrica = 'CaipiClaveAsimetrica',
    @Contrase�aLlaveAsimetrica = 'CaipiCaso2';