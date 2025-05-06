-- ENCRIPTACI�N DE DATOS 

select * from sys.asymmetric_keys

-- Abrimos la llave simetrica
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica
WITH PASSWORD = 'CaipiCaso2'

-- Encriptaci�n de las contrase�as de los usuarios y nombres
UPDATE caipi_users
SET password = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), password),
name = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), name)


-- Encriptaci�n del Mask Account y CallBackURL
UPDATE caipi_availablePaymentMethods
SET callbackURL = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), callbackURL),
	maskAccount = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), maskAccount)

-- Encriptaci�n del authNumber
UPDATE caipi_payments
SET authNumber = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), authNumber)

-- Encriptaci�n del computer
UPDATE caipi_logs
SET computer = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), computer)

-- Encriptaci�n del quantity (Hace que aunque consigan la otra informaci�n, no puedan interpretarla)
UPDATE caipi_AgreementsPerPlan
SET quantity = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), quantity)
