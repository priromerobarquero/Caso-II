-- Crear llave sim�trica
CREATE SYMMETRIC KEY ClaveSimetrica
WITH ALGORITHM = AES_256 
ENCRYPTION BY PASSWORD = 'CaipiContrase�aSimetrica';

-- Abrir llave
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY PASSWORD = 'CaipiContrase�aSimetrica'; -- Contrase�a original

-- Proteger clave simetrica con asimetrica
ALTER SYMMETRIC KEY ClaveSimetrica
ADD ENCRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica; -- Usa la llave asim�trica

-- Cerrar la llave
CLOSE SYMMETRIC KEY ClaveSimetrica;

-- Abrir la llave sim�trica usando la llave asim�trica
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica
WITH PASSWORD = 'CaipiCaso2'; -- Contrase�a de la llave asim�trica

-- ===================================================================
-- Ver si la llave est� abierta
-- ===================================================================
SELECT key_name AS 'Llave Abierta' 
FROM sys.openkeys;