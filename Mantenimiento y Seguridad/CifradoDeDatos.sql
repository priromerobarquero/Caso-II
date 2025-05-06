-- ENCRIPTACIÓN DE DATOS 

select * from sys.asymmetric_keys

-- Abrimos la llave simetrica
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica
WITH PASSWORD = 'CaipiCaso2'

-- Encriptación de las contraseñas de los usuarios y nombres
UPDATE caipi_users
SET password = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), password),
name = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), name)


-- Encriptación del Mask Account y CallBackURL
UPDATE caipi_availablePaymentMethods
SET callbackURL = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), callbackURL),
	maskAccount = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), maskAccount)

-- Encriptación del authNumber
UPDATE caipi_payments
SET authNumber = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), authNumber)

-- Encriptación del computer
UPDATE caipi_logs
SET computer = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), computer)

-- Encriptación del quantity (Hace que aunque consigan la otra información, no puedan interpretarla)
UPDATE caipi_AgreementsPerPlan
SET quantity = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), quantity)
