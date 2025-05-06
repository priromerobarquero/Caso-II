-- Crear llave simétrica
CREATE SYMMETRIC KEY ClaveSimetrica
WITH ALGORITHM = AES_256 
ENCRYPTION BY PASSWORD = 'CaipiContraseñaSimetrica';

-- Abrir llave
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY PASSWORD = 'CaipiContraseñaSimetrica'; -- Contraseña original

-- Proteger clave simetrica con asimetrica
ALTER SYMMETRIC KEY ClaveSimetrica
ADD ENCRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica; -- Usa la llave asimétrica

-- Cerrar la llave
CLOSE SYMMETRIC KEY ClaveSimetrica;

-- Abrir la llave simétrica usando la llave asimétrica
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica
WITH PASSWORD = 'CaipiCaso2'; -- Contraseña de la llave asimétrica

-- ===================================================================
-- Ver si la llave está abierta
-- ===================================================================
SELECT key_name AS 'Llave Abierta' 
FROM sys.openkeys;