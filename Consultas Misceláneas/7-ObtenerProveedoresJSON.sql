-- Será posible que haciendo una consulta SQL en esta base de datos se pueda obtener un JSON para ser consumido 
-- por alguna de las pantallas de la aplicación que tenga que ver con los planes, subscripciones, servicios o pagos. 
-- Justifique cuál pantalla podría requerir esta consulta

SELECT 
	s.idSupplier AS id, 
	s.name AS nombre, 
	m.mediaURL AS logo, 
	CONVERT(VARCHAR(200), DecryptByKey(c.value)) AS contacto
FROM dbo.caipi_suppliers AS s
INNER JOIN dbo.caipi_supplierCategories AS sc ON s.idsupplierCategories = sc.idsupplierCategories
INNER JOIN dbo.caipi_mediaFiles AS m ON s.idmediaFiles = m.idmediaFile
INNER JOIN dbo.caipi_contactInfoPerSupplier AS c ON s.idSupplier = c.idSupplier
INNER JOIN dbo.caipi_contactInfoType AS ct ON c.contactInfoTypeId = ct.conatctInfoTypeId
FOR JSON PATH, ROOT('proveedores');


-- Justificacion de uso: pantalla de presentación o visualización pública de proveedores en la pagina web