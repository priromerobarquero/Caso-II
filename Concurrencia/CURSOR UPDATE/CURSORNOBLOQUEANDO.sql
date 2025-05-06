--Con la finalidad de realizar pruebas se recomienda ejecutar la siguiente actualizacion
UPDATE caipi_agreementTerms
SET finalDate = GETDATE(), enable = 1


DECLARE @idAgreementTerm INT
DECLARE @finalDate DATETIME
DECLARE @enable BIT



-- Declara el cursor con bloqueo UPDLOCK y ROWLOCK para garantizar la actualización sin bloqueos globales
DECLARE agreement_terms_cursor CURSOR FOR
SELECT idagreementTerm, finalDate, enable
FROM dbo.caipi_agreementTerms  --NO SE BLOQUEA TODA LA FILA QUE EL CURSOR ESTA RECORRIENDO PQ NO SE INDICA NINGUN OPERADOR
WHERE deleted = 0  -- Solo acuerdos no eliminados

-- Abre el cursor
OPEN agreement_terms_cursor

-- Recupera el primer registro
FETCH NEXT FROM agreement_terms_cursor INTO @idAgreementTerm, @finalDate, @enable

-- Recorre los registros
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Ejemplo de operación: Deshabilitar el acuerdo si la fecha final ha pasado
    IF @finalDate < GETDATE() AND @enable = 1
    BEGIN
        -- Actualiza el valor de 'enable' a 0 sin necesidad de UPDLOCK adicional pq el cursor lo esta realizando
        UPDATE dbo.caipi_agreementTerms
        SET enable = 0
        WHERE idagreementTerm = @idAgreementTerm
    END

	--PRINT 'Procesado el Agreement ID: ' + CAST(@idAgreementTerm AS VARCHAR) +  ', Final Date: ' + CAST(@finalDate AS VARCHAR) +  ', Enabled: ' + CAST(@enable AS VARCHAR)
	WAITFOR DELAY '00:00:012'
    -- Recupera el siguiente registro
    FETCH NEXT FROM agreement_terms_cursor INTO @idAgreementTerm, @finalDate, @enable
END

-- Cierra y desasocia el cursor
CLOSE agreement_terms_cursor
DEALLOCATE agreement_terms_cursor
