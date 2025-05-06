-- SCRIPT PARA BASES DE DATOS DE CASO 2

-- Debido a que SQL Server trabaja con una jerarquía de claves, debemos tener una clave maestra primero
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'ClaveMaestra';
GO	

-- Crear certificado
CREATE CERTIFICATE CaipiSeguridad
WITH SUBJECT = 'CaipiCertificado';

-- Crear llave asimétrica
CREATE ASYMMETRIC KEY CaipiClaveAsimetrica
WITH ALGORITHM = RSA_2048
ENCRYPTION BY PASSWORD = 'CaipiCaso2';

-- Creamos una credencial que enlace el certificado con la llave asimetrica 
CREATE CREDENTIAL CertificadoEnlace
WITH IDENTITY = 'CaipiSeguridad',
SECRET = 'CaipiClaveAsimetrica'


