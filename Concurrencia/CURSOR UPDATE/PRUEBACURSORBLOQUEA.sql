DECLARE @agreementId INT
SET @agreementId = 16

UPDATE caipi_agreementTerms
SET finalDate = GETDATE()