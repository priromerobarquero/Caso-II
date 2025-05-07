
	---------------------------------------------CATALOGO DEL SISTEMA------------------------------


	-- --------------- Archivos ----------------------

	INSERT INTO caipi_mediaFileType (name, enable, deleted)
	VALUES
	('imagen', 1, 0),
	('video', 1, 0);

	INSERT INTO caipi_mediaFiles ( mediaURL, filename, lastUpdate, idmediaFileType)
	VALUES
		('https://media.soltura.com/plan_fitness_4_personas.mp4', 'Plan de Gimnasio 4 Personas', GETDATE(), 2),
		('https://media.soltura.com/plan_yoga_familiar.mp4', 'Plan Yoga Familiar', GETDATE(), 2),
		( 'https://media.soltura.com/plan_grooming_mascota.jpg', 'Plan Grooming para Mascota', GETDATE(), 1),
		( 'https://media.soltura.com/plan_revision_veterinaria.jpg', 'Plan Revisión Veterinaria', GETDATE(), 1),
		( 'https://media.soltura.com/plan_clases_natacion_futbol.jpg', 'Plan Clases de Natación y Fútbol Niños', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_combustible_gas_diesel.jpg', 'Servicio de Combustible Gas o Diésel', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_uber_eats.jpg', 'Servicio Uber Eats', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_uber_rides.jpg', 'Servicio Uber Rides', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_mantenimiento_mascota.jpg', 'Servicio de Mantenimiento de Mascotas', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_plan_clases_futbol.jpg', 'Plan de Clases de Fútbol', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_grooming_mascota.jpg', 'Grooming para Mascotas', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_revision_salud.jpg', 'Revisión de Salud', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_activacion_plan.jpg', 'Activación de Plan', GETDATE(), 1),
		( 'https://media.soltura.com/servicio_subscripcion_plan.jpg', 'Suscripción a Planes', GETDATE(), 1),
		('https://media.soltura.com/servicio_pagos_suscripcion.jpg', 'Pagos de Suscripción', GETDATE(), 1);

	-- insertar moneda CRC y USD
	INSERT INTO dbo.caipi_currencies (name, acronym, symbol)
	VALUES ('Colón Costa Rica', 'CRC', '¢'),('Dólar Estados Unidos', 'USD', '$');




	-- inserciones CRC ? USD (currencyId = 1)
	INSERT INTO dbo.caipi_ExchangeRates
	  (startDate,    endDate,      exchangeRate, enable, currentExchangeRate, currencyId)
	VALUES
	  ('2025-04-14','2025-04-14', 0.00195,       1,      0,                   1),
	  ('2025-04-15','2025-04-15', 0.0019493,     1,      0,                   1),
	  ('2025-04-16','2025-04-16', 0.0019896,     1,      0,                   1),
	  ('2025-04-17','2025-04-17', 0.00199,       1,      0,                   1),
	  ('2025-04-18','2025-04-18', 0.00199,       1,      1,                   1);

	-- inserciones USD ? CRC (currencyId = 2)
	INSERT INTO dbo.caipi_ExchangeRates
	  (startDate,    endDate,      exchangeRate, enable, currentExchangeRate, currencyId)
	VALUES
	  ('2025-04-14','2025-04-14', 511.52,        1,      0,                   2),
	  ('2025-04-15','2025-04-15', 512.99828,     1,      0,                   2),
	  ('2025-04-16','2025-04-16', 502.61598,     1,      0,                   2),
	  ('2025-04-17','2025-04-17', 502.26978,     1,      0,                   2),
	  ('2025-04-18','2025-04-18', 502.26978,     1,      1,                   2);


	--Reminder Types 
	INSERT INTO [dbo].[caipi_remindertypes] ([name], [description])
	VALUES
		('SMS', 'Envío de notificaciones por mensaje de texto'),
		('Email', 'Envío de notificaciones por correo electrónico'),
		('Push', 'Notificación dentro de la aplicación móvil'),
		('WhatsApp', 'Notificación enviada por WhatsApp'),
		('Popup', 'Ventana emergente dentro del sistema');


	-- Suscription Status

	INSERT INTO [dbo].[caipi_subscription_status] ([name], [description], [enable])
	VALUES
		('Activa', 'La suscripción está activa y operativa', 1),
		('Pendiente', 'La suscripción está en proceso de activación o aprobación', 1),
		('Suspendida', 'La suscripción ha sido pausada temporalmente', 1),
		('Cancelada', 'La suscripción fue cancelada por el usuario o el sistema', 1),
		('Expirada', 'La suscripción ha llegado a su fecha de expiración', 1);

		select * from caipi_schedules
	-- Subscription Types 
	INSERT INTO [dbo].caipi_subscription_types ([name], [description], [customizable])
	VALUES
		('Mensual', 'Plan mensual con beneficios fijos', 0),
		('Mensual Personalizable', 'Plan mensual con beneficios modificables por el usuario', 1),
		('Anual', 'Plan anual con beneficios fijos', 0),
		('Anual Personalizable', 'Plan anual con beneficios modificables por el usuario', 1),
		('Trimestral', 'Plan trimestral con beneficios fijos', 0),
		('Trimestral Personalizable', 'Plan trimestral con beneficios modificables por el usuario', 1),
		('Semestral', 'Plan semestral con beneficios fijos', 0),
		('Semestral Personalizable', 'Plan semestral con beneficios modificables por el usuario', 1);

	--Sucription Settings Types
	INSERT INTO [dbo].[caipi_suscriptionSettingTypes] ([sucriptionSettingTypeId], [name], [description], [enable])
	VALUES
		(1,'Cantidad de beneficiarios', 'Número máximo de personas que pueden usar la suscripción', 1),
		(2, 'Acceso a servicios adicionales', 'Permite acceso a beneficios o servicios complementarios', 1),
		(3, 'Frecuencia de uso', 'Cantidad de veces que se puede utilizar el servicio en un periodo', 1),
		(4, 'Periodo de validez', 'Duración total del plan o suscripción', 1),
		(5, 'Cobertura geográfica', 'Zonas o ubicaciones donde es válido el plan', 1),
		(6, 'Soporte incluido', 'Tipo de asistencia disponible dentro del plan', 1),
		(7, 'Capacidad de uso', 'Límite en volumen, cantidad o tiempo de uso permitido', 1),
		(8, 'Acceso a contenido exclusivo', 'Permite acceso a beneficios especiales no estándar', 1),
		(9, 'Renovación automática', 'Indica si la suscripción se renueva sin intervención del usuario', 1),
		(10, 'Nivel de personalización', 'Grado en el que el usuario puede modificar los beneficios del plan', 1);

	--Payment Methods
	INSERT INTO [dbo].[caipi_paymentMethods] ([name], [apiURL], [secretKey], [key], [enable])
	VALUES
		('PayPal', 'https://api.paypal.com/v1/', 0x5A3D4C6F2A7B9C5F1234567890ABCDE1234567890ABCDEF0123456789ABCDEF, 0x7F5A9B6C5D7E1F23334567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
		('Stripe', 'https://api.stripe.com/v1/', 0x8F3A7B9C1D2E3F9A1234567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x9B3D6C2F1D8E7A234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
		('MercadoPago', 'https://api.mercadopago.com/v1/', 0x2D3A5F9B1C7E9D3A567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x4F2A8D6E3B9F0A234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
		('RappiPay', 'https://api.rappipay.com/v1/', 0x1A3D4E5F2B8C9D3A567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x5E7A9D2B6C3F4A1234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
		('Apple Pay', 'https://api.apple.com/v1/', 0x0B5D6F3A2C8E9D234567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x9C7F2A3D8B5E1F9A234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1);


	--Trans Type
	INSERT INTO [dbo].[caipi_transTypes] ([transactionTypeId], [name], [deleted], [transTypeId])
	VALUES
		(1, 'Credit', 0, 101),            
		(2, 'Debit', 0, 102),              
		(3, 'Refund', 0, 103),           
		(4, 'Manual Adjustment', 0, 104),  
		(5, 'Chargeback', 0, 105),            
		(6, 'Deposit', 0, 106),               
		(7, 'Withdrawal', 0, 107),            
		(8, 'Transfer', 0, 108);         

	--Trans Sub type
	INSERT INTO [dbo].[caipi_transSubTypes] ([name], [deleted])
	VALUES
		('Prize Awarded', 0),
		('Product Purchase', 0),
		('Refund Claim', 0),
		('Transaction Approval', 0),
		('Subscription Payment', 0),
		('Service Activation', 0),
		('Account Credit', 0),
		('Service Cancellation', 0),
		('Balance Adjustment', 0),
		('Interest Payment', 0);

	-- Log severity
	INSERT INTO [dbo].[caipi_logSeverity] ([name])
	VALUES
		('Low'),
		('Medium'),
		('High'),
		('Critical'),
		('Informational');

	--Log Sources
	INSERT INTO [dbo].[caipi_logsSources] ([name])
	VALUES
		('System'),
		('Application'),
		('Database'),
		('Security'),
		('User Activity'),
		('Network'),
		('API'),
		('Payment Gateway'),
		('Error Handler'),
		('Authentication'),
		('File System');

	--Log Types
	INSERT INTO [dbo].[caipi_logTypes] ([name])
	VALUES
		('Error'),
		('Warning'),
		('Info'),
		('Debug'),
		('Critical'),
		('Audit'),
		('Security'),
		('Transaction'),
		('Performance'),
		('Access');

	--Unit Measures
	INSERT INTO [dbo].[caipi_measureUnits] ([name], [enable], [deleted], [dataType])
	VALUES
		('Hora', 1, 0, 'Decimal'),
		('Pieza', 1, 0, 'Integer'),
		('Colones', 1, 0, 'Decimal'),
		('Kilogramo', 1, 0, 'Decimal'),
		('Litro', 1, 0, 'Decimal'),
		('Clase', 1, 0, 'Integer'),
		('Consulta', 1, 0, 'Integer'),
		('Servicio', 1, 0, 'Integer'),
		('Descuento', 1, 0, 'Integer'),
		('Almuerzo', 1, 0, 'Integer'),
		('Dias', 1, 0, 'Integer');


	-- Services Types
	INSERT INTO [dbo].[caipi_serviceTypes] ([idServiceType], [name], [description], [enable])
	VALUES
		(1, 'Gimnasios', 'Servicios de entrenamiento físico y bienestar', 1),
		(2, 'Salud', 'Centros médicos, clínicas y servicios de salud', 1),
		(3, 'Parqueos', 'Zonas de estacionamiento para vehículos', 1),
		(4, 'Comedores', 'Servicios de alimentación y comedores comunitarios', 1),
		(5, 'Educación', 'Escuelas, guarderías y centros de aprendizaje', 1),
		(6, 'Transporte', 'Servicios de transporte público o privado', 1),
		(7, 'Cultura', 'Centros culturales, bibliotecas y museos', 1),
		(8, 'Recreación', 'Áreas recreativas y de esparcimiento', 1),
		(9, 'Deporte', 'Instalaciones deportivas y clubes atléticos', 1),
		(10, 'Tecnología', 'Acceso a servicios tecnológicos y digitales', 1);

	-- Services
	INSERT INTO [dbo].[caipi_services] ([name], [description], [enable], [image], [idServiceType])
	VALUES
		('Membresía de Gimnasio', 'Acceso a instalaciones de gimnasio', 1, 1, 1),
		('Clases de Yoga', 'Sesiones de yoga para principiantes y avanzados, con enfoque en bienestar y flexibilidad', 1, 2, 1),
		('Corte y Cuidado de Mascotas', 'Servicio profesional de grooming', 1, 3, 2),
		('Consultas Veterinarias', 'Consultas médicas para mascotas', 1, 4, 2),
		('Clases de Natación', 'Clases de natación para personas de todas las edades, desde principiantes hasta avanzados', 1, 5, 9),
		('Descuento en Combustible', 'Descuento mensual en combustible, aplicable en estaciones de servicio seleccionadas', 1, 6, 6),
		('Pedidos de Comida a Domicilio', 'Descuento y promociones en pedidos de comida a través de plataformas de entrega', 1, 7, 4),
		('Descuentos en Viajes', 'Descuentos en viajes realizados', 1, 8, 6),
		('Mantenimiento para Mascotas', 'Paquete completo de salud preventiva y cuidado para mascotas', 1, 9, 2),
		('Entrenamiento Deportivo', 'Clases de fútbol', 1, 10, 9),
		('Servicios de Belleza', 'Corte de cabello, tratamientos faciales y corporales, manicura y pedicura', 1, 11, 2),
		('Asesoría Nutricional', 'Consultas con nutricionistas para mejorar la dieta y el estilo de vida saludable', 1, 12, 2),
		('Estacionamiento Privado', 'Acceso a espacios de estacionamiento privado en zonas estratégicas', 1, 13, 3),
		('Entrenamiento Personalizado', 'Entrenamiento físico y nutricional a medida, con seguimiento personalizado', 1, 14, 1);

	-- --------------- Proveedores ----------------------


	INSERT INTO caipi_supplierCategories(name, enable, deleted)
	VALUES
		('Gimnasios y Fitness', 1, 0),
		('Estudios de Yoga', 1, 0),
		('Grooming para Mascotas', 1, 0),
		('Clínicas Veterinarias', 1, 0),
		('Escuelas de Natación', 1, 0),
		('Estaciones de Combustible', 1, 0),
		('Restaurantes y Comida Rápida', 1, 0),
		('Agencias de Viajes', 1, 0),
		('Centros de Cuidado Animal', 1, 0),
		('Clubes Deportivos', 1, 0),
		('Centros de Estética', 1, 0),
		('Consultorios Nutricionales', 1, 0),
		('Parqueos Privados', 1, 0),
		('Entrenadores Personales', 1, 0),
		('Proveedores Varios', 1, 0);



	INSERT INTO [dbo].[caipi_suppliers] ([name], [enable], [idsupplierCategories], [idmediaFiles], [idagreementTerms], [deleted])
	VALUES
		('The Retreat Costa Rica', 1, 1, 1, 1, 0), 
		('Vida Mia Healing Center', 1, 2, 2, 2, 0),
		('Agromédica Veterinaria', 1, 4, 4, 4, 0), 
		('Paws & Co.', 1, 3, 3, 3, 0), 
		('The Pets Club', 1, 9, 9, 9, 0), 
		('VolAir Studio', 1, 2, 2, 2, 0), 
		('Smart Fit', 1, 1, 1, 1, 0), 
		('AmaSer', 1, 2, 2, 2, 0), 
		('Pure Jungle Spa', 1, 11, 11, 11, 0), 
		('Aloha Skincare and Wellness', 1, 11, 11, 11, 0), 
		('Central de Mascotas', 1, 9, 9, 9, 0), 
		('Veterinaria Arroyo y Solano', 1, 4, 4, 4, 0),
		('Spoon', 1, 7, 7, 7, 0), 
		('Rostipollos', 1, 7, 7, 7, 0), 
		('KOKi Beach', 1, 7, 7, 7, 0); 

	--modules
	INSERT INTO [dbo].[caipi_modules]
			   ([name]
			   ,[enable]
			   ,[deleted])
		 VALUES
			   ('Gestión de Planes', 1, 0),
			   ('Módulo de Membresías', 1, 0),
			   ('Módulo de Pagos y Facturación', 1, 0),
			   ('Módulo de Notificaciones', 1, 0),
			   ('Módulo de Servicios', 1, 0),
			   ('Módulo de Proveedores', 1, 0),
			   ('Módulo de Suscripciones', 1, 0),
			   ('Módulo de Reportes', 1, 0),
			   ('Módulo de Usuarios', 1, 0),
			   ('Módulo de Seguridad', 1, 0);
	--RedemptionTransactionType
	INSERT INTO [dbo].[caipi_RedemptionTransactionTypes]
			   ([name]
			   ,[enable]
			   ,[deleted])
		 VALUES
			   ('Cupon', 1, 0),
			   ('NFC', 1, 0),
			   ('QR', 1, 0);

	--RedemptionSubType
	INSERT INTO [dbo].[caipi_redemptionSubType]
			   ([name]
			   ,[enable]
			   ,[deleted])
		 VALUES
			   ('Proveedor',1,0),
			   ('Usuario',1,0),
			   ('Servicio',1,0);

	--Notification Methods
	INSERT INTO [dbo].[caipi_notificationmethods]
			   ([name]
			   ,[lastupdate]
			   ,[createddate]
			   ,[enabled]
			   ,[callbackurlget]
			   ,[callbackurlpost]
			   ,[callbackurlredirect]
			   ,[messagingserviceid]
			   ,[authtoken])
		 VALUES
			   ('SendGrid Email', GETDATE(), GETDATE(), 1, 'https://api.sendgrid.com/get', 'https://api.sendgrid.com/post', 'https://api.sendgrid.com/redirect', 'SENDGRID_SERVICE_ID', 'SENDGRID_API_KEY'),
			   ('Mailgun Email', GETDATE(), GETDATE(), 1, 'https://api.mailgun.com/get', 'https://api.mailgun.com/post', 'https://api.mailgun.com/redirect', 'MAILGUN_SERVICE_ID', 'MAILGUN_API_KEY'),
			   ('Twilio SMS', GETDATE(), GETDATE(), 1, 'https://api.twilio.com/get', 'https://api.twilio.com/post', 'https://api.twilio.com/redirect', 'SMXXXXXX', 'twilio_auth_token');


	--Contact Info Type
	INSERT INTO [dbo].[caipi_contactInfoType]
			   ([name]
			   ,[enable])
		 VALUES
			   ('Email',1),
			   ('Numero Telefonico',1),
			   ('Fax',1),
			   ('Sitio Web',1),
			   ('Numero Movil',1);

	--ContactInfoPerSupplier
	INSERT INTO [dbo].[caipi_contactInfoPerSupplier]
			   ([enable], [value], [contactInfoTypeId], [idSupplier])
		 VALUES
			   (1, 'info@theretreatcr.com', 1, 1),
			   (1, '+506 4000 1234', 2, 1),
			   (1, 'contacto@vidamia.com', 1, 2),
			   (1, '+506 4000 5678', 5, 2),
			   (1, 'www.agromedica.cr', 4, 3),
			   (1, '+506 2222 3333', 2, 3),
			   (1, 'pawsco@vetservices.com', 1, 4),
			   (1, '+506 8888 7777', 5, 4),
			   (1, 'www.thepetsclub.cr', 4, 5),
			   (1, '+506 6000 9000', 2, 5),
			   (1, 'info@volairstudio.com', 1, 6),
			   (1, '+506 7000 8000', 5, 6),
			   (1, 'smartfit@fitness.com', 1, 7),
			   (1, 'www.smartfit.cr', 4, 7),
			   (1, 'amamaser@wellness.com', 1, 8);

	--Countries
	INSERT INTO [dbo].[caipi_countries]
			   ([countryId]
			   ,[name]
			   ,[phoneCode])
		 VALUES
			   (1, 'Costa Rica', '+506'),
			   (3, 'México', '+52'),
			   (5, 'Colombia', '+57'),
			   (6, 'Argentina', '+54'),
			   (7, 'Chile', '+56'),
			   (8, 'Perú', '+51'),
			   (9, 'Brasil', '+55');

	--States
	INSERT INTO [dbo].[caipi_states]
			   ([name]
			   ,[enable]
			   ,[countryId])
		 VALUES
			   ('Cartago', 1, 1),
			   ('San José', 1, 1),
			   ('Puntarenas', 1, 1), 
			   ('Guerrero', 1, 3), 
			   ('Jalisco', 1, 3),
			   ('California', 1, 5), 
			   ('Antioquia', 1, 5), 
			   ('Valle del Cauca', 1, 5), 
			   ('Buenos Aires', 1, 6), 
			   ('Mendoza', 1, 6), 
			   ('Santa Fe', 1, 6),
			   ('Santiago', 1, 7),
			   ('Lima', 1, 8);

	--cities
	INSERT INTO [dbo].[caipi_cities]
			   ([name]
			   ,[enable]
			   ,[stateId])
		 VALUES
			   ('Guadalupe', 1, 1), 
			   ('Cartago', 1, 1), 
			   ('Turrialba', 1, 1), 
			   ('Guadalajara', 1, 5), 
			   ('Tlaquepaque', 1, 5), 
			   ('Zapopan', 1, 7), 
			   ('Medellín', 1, 7), 
			   ('Envigado', 1, 7), 
			   ('Itagüí', 1, 5), 
			   ('Buenos Aires', 1, 9),
			   ('La Plata', 1, 9), 
			   ('Mar del Plata', 1, 9), 
			   ('Santiago', 1, 12),
			   ('Providencia', 1, 12), 
			   ('Las Condes', 1, 12), 
			   ('Lima', 1, 13),
			   ('Miraflores', 1, 13), 
			   ('San Isidro', 1, 13);

	--Types Branch
	INSERT INTO [dbo].[caipi_typesBranch]
			   ([name]
			   ,[enable]
			   ,[deleted])
		 VALUES
			   ('Fisica', 1, 0),
			   ('Ecommerce', 1, 0),
			   ('Distribución', 1, 0),
			   ('Móvil', 1, 0),
			   ('Atención al Cliente', 1, 0),
			   ('Corporativa', 1, 0),
			   ('Atención Especializada', 1, 0),
			   ('Soporte Técnico', 1, 0);

	-- LLenado de Planes 

	INSERT INTO caipi_planTypes (name, enable, deleted)
	VALUES 
	('Básico', 1, 0),
	('Personalizado', 1, 0),
	('Familiar', 1, 0),
	('Corporativo', 1, 0),
	('Estudiantil', 1, 0),
	('Salud y Bienestar', 1, 0);

	-- INSERCIÓN DE LOS TIPOS DE CONTRATOS

	INSERT INTO caipi_AgreementType (name, description, dataType)
	VALUES
	('Descuento Porcentaje', 'Aplica un porcentaje de descuento sobre el precio original.', 'porcentaje'),
	('Precio Fijo', 'Precio acordado fijo sin descuento adicional.', 'decimal'),
	('Membresía Mensual', 'Acceso a un servicio durante un mes.', 'tiempo'),
	('Acceso Ilimitado', 'Servicio disponible sin restricción durante el periodo contratado.', 'bool'),
	('Promoción Especial', 'Descuento o beneficio temporal sobre el precio de lista.', 'porcentaje');

-- Sucursales
-- Inserción por proveedor, un solo tipo de sucursal por proveedor

-- The Retreat Costa Rica (supplierId = 1)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - The Retreat Costa Rica', 1, 0, 1, 1);

-- Vida Mia Healing Center (supplierId = 2)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Vida Mia Healing Center', 1, 0, 2, 2);

-- Agromédica Veterinaria (supplierId = 3)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Agromédica Veterinaria', 1, 0, 3, 4);

-- Paws & Co. (supplierId = 4)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Paws & Co.', 1, 0, 4, 3);

-- The Pets Club (supplierId = 5)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - The Pets Club', 1, 0, 5, 6);

-- VolAir Studio (supplierId = 6)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - VolAir Studio', 1, 0, 6, 2);

-- Smart Fit (supplierId = 7)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Smart Fit', 1, 0, 7, 1);

-- AmaSer (supplierId = 8)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - AmaSer', 1, 0, 8, 2);

-- Pure Jungle Spa (supplierId = 9)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Pure Jungle Spa', 1, 0, 9, 7);

-- Aloha Skincare and Wellness (supplierId = 10)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Aloha Skincare and Wellness', 1, 0, 10, 7);

-- Central de Mascotas (supplierId = 11)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Central de Mascotas', 1, 0, 11, 4);

-- Veterinaria Arroyo y Solano (supplierId = 12)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Veterinaria Arroyo y Solano', 1, 0, 12, 4);

-- Spoon (supplierId = 13)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Spoon', 1, 0, 13, 7);

-- Rostipollos (supplierId = 14)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - Rostipollos', 1, 0, 14, 7);

-- KOKi Beach (supplierId = 15)
INSERT INTO [dbo].[caipi_supplierBranches] ([name], [enable], [deleted], [supplierId], [idTypesBranch])
VALUES ('Sucursal Principal - KOKi Beach', 1, 0, 15, 7);

SELECT * FROM caipi_agreementTerms


--INSERCIÓN DE LOS CONTRATOS
INSERT INTO caipi_agreementTerms (
 enable, checkSum, startDate, idMeasureUnit, idService, finalDate, idSupplier,
 signedDate, deleted, access, disccountPercentage, originalPrice, agreementPrice,
 salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount
) VALUES
-- SMARTFIT (idSupplier = 7)
(1, HASHBYTES('SHA2_256', 'SmartFit-Gym'), '2025-05-01', 1, 2, '2025-12-31', 7, GETDATE(), 0, 1, 15.00, 850.00, 722.50, 722.50, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'SmartFit-Personal'), '2025-05-01', 1, 14, '2025-12-31', 7, GETDATE(), 0, 1, 10.00, 700.00, 630.00, 630.00, 1, 2, 1, 4, NULL, NULL),

-- AMASER (idSupplier = 8)
(1, HASHBYTES('SHA2_256', 'AmaSer-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 8, GETDATE(), 0, 1, 20.00, 600.00, 480.00, 480.00, 1, 3, 1, 4, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'AmaSer-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 8, GETDATE(), 0, 1, 25.00, 800.00, 600.00, 600.00, 1, 1, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'AmaSer-Personal'), '2025-05-01', 1, 14, '2025-12-31', 8, GETDATE(), 0, 1, 15.00, 750.00, 637.50, 637.50, 1, 5, 1, 2, NULL, NULL),

-- SPOON (idSupplier = 13)
(1, HASHBYTES('SHA2_256', 'Spoon-Comida'), '2025-05-01', 1, 8, '2025-12-31', 13, GETDATE(), 0, 1, 10.00, 500.00, 450.00, 450.00, 1, 2, 1, 5, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Spoon-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 13, GETDATE(), 0, 1, 5.00, 600.00, 570.00, 570.00, 1, 1, 1, 1, NULL, NULL),

-- CENTRAL DE MASCOTAS (idSupplier = 11)
(1, HASHBYTES('SHA2_256', 'Central-Grooming'), '2025-05-01', 1, 4, '2025-12-31', 11, GETDATE(), 0, 1, 20.00, 400.00, 320.00, 320.00, 1, 5, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Central-Veterinaria'), '2025-05-01', 1, 5, '2025-12-31', 11, GETDATE(), 0, 1, 15.00, 500.00, 425.00, 425.00, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Central-Mantenimiento'), '2025-05-01', 1, 10, '2025-12-31', 11, GETDATE(), 0, 1, 30.00, 700.00, 490.00, 490.00, 1, 3, 1, 1, NULL, NULL),

-- VIDA MIA (idSupplier = 2)
(1, HASHBYTES('SHA2_256', 'VidaMia-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 2, GETDATE(), 0, 1, 25.00, 500.00, 375.00, 375.00, 1, 1, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VidaMia-Belleza'), '2025-05-01', 1, 12, '2025-12-31', 2, GETDATE(), 0, 1, 20.00, 700.00, 560.00, 560.00, 1, 2, 1, 1, NULL, NULL),

-- THE PETS CLUB (idSupplier = 5)
(1, HASHBYTES('SHA2_256', 'PetsClub-Grooming'), '2025-05-01', 1, 4, '2025-12-31', 5, GETDATE(), 0, 1, 20.00, 450.00, 360.00, 360.00, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'PetsClub-Mantenimiento'), '2025-05-01', 1, 10, '2025-12-31', 5, GETDATE(), 0, 1, 10.00, 550.00, 495.00, 495.00, 1, 4, 1, 1, NULL, NULL),

-- VOLAIR STUDIO (idSupplier = 6)
(1, HASHBYTES('SHA2_256', 'VolAir-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 6, GETDATE(), 0, 1, 10.00, 600.00, 540.00, 540.00, 1, 3, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VolAir-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 6, GETDATE(), 0, 1, 15.00, 700.00, 595.00, 595.00, 1, 5, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VolAir-Entrenamiento'), '2025-05-01', 1, 14, '2025-12-31', 6, GETDATE(), 0, 1, 12.00, 750.00, 660.00, 660.00, 1, 1, 1, 1, NULL, NULL);



-- INSERCIÓN DE AGREEMENTSPERPLAN

INSERT INTO caipi_AgreementsPerPlan (
    enable, deleted, idPlans, idAgreementTerm, quantity, idMeasureUnit, amount, disccount
)
VALUES (
    1,
    0,
    15,
    7,
    '1 mes',
    1,
    722.50,
    127.50
);

-- Plan 16: Joven Deportista
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 15, 7, '1 mes', 1, 722.50, 127.50),
(1, 0, 15, 9, '1 mes', 1, 630.00, 70.00);

-- Plan 17: Familia de Verano
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 7, 10, '1 mes', 1, 480.00, 120.00),
(1, 0, 7, 11, '1 mes', 1, 600.00, 200.00),
(1, 0, 7, 12, '1 mes', 1, 637.50, 112.50);

-- Plan 18: Viajero Frecuente
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 8, 13, '1 mes', 1, 450.00, 50.00),
(1, 0, 8, 14, '1 mes', 1, 570.00, 30.00);

-- Plan 19: Nómada Digital
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 9, 8, '1 mes', 1, 375.00, 125.00),
(1, 0, 9, 9, '1 mes', 1, 560.00, 140.00);

-- Plan 20: Profesional en Movimiento
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 10, 2, '1 mes', 1, 425.00, 75.00),
(1, 0, 10, 1, '1 mes', 1, 495.00, 55.00),
(1, 0, 10, 15, '1 mes', 1, 360.00, 90.00);

-- Plan 21: Estudiante Proactivo
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 1, 10, '1 mes', 1, 480.00, 120.00),
(1, 0, 1, 9, '1 mes', 1, 560.00, 140.00);

-- Plan 22: Creativo Freelance
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 2, 7, '1 mes', 1, 722.50, 127.50),
(1, 0, 2, 9, '1 mes', 1, 630.00, 70.00),
(1, 0, 2, 17, '1 mes', 1, 490.00, 210.00);

-- Plan 23: Full Wellness
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 3, 10, '1 mes', 1, 480.00, 120.00),
(1, 0, 3, 2, '1 mes', 1, 540.00, 60.00),
(1, 0, 3, 4, '1 mes', 1, 660.00, 90.00);

-- Plan 24: Tiempo en Familia
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 4, 13, '1 mes', 1, 450.00, 50.00),
(1, 0, 4, 14, '1 mes', 1, 570.00, 30.00),
(1, 0, 4, 16, '1 mes', 1, 425.00, 75.00),
(1, 0, 4, 11, '1 mes', 1, 600.00, 200.00);

-- INSERCIÓN DE SUSCRIPCIONES A CADA USUARIO
-- Plan 16
INSERT INTO caipi_subscriptions (suscription_typeid, userid, social, enable, startdate, deleted, statusid, scheduleId, auto_renew, created_at, idPlan) VALUES
(1, 1, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 15),
(1, 2, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 15),
(1, 3, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 15);
	
-- Plan 17
INSERT INTO caipi_subscriptions VALUES
(1, 4, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 7),
(1, 5, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 7),
(1, 6, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 7),
(1, 7, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 7);

-- Plan 18
INSERT INTO caipi_subscriptions VALUES
(1, 8, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 8),
(1, 9, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 8),
(1, 10, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 8),
(1, 11, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 8),
(1, 12, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 8);

-- Plan 19
INSERT INTO caipi_subscriptions VALUES
(1, 13, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 9),
(1, 14, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 9),
(1, 15, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 9);

-- Plan 20
INSERT INTO caipi_subscriptions VALUES
(1, 16, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 10),
(1, 17, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 10),
(1, 18, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 10),
(1, 19, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 10),
(1, 20, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 10),
(1, 21, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 10);

-- Plan 21
INSERT INTO caipi_subscriptions VALUES
(1, 22, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 1),
(1, 23, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 1),
(1, 24, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 1),
(1, 25, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 1);

-- Plan 22
INSERT INTO caipi_subscriptions VALUES
(1, 26, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 2),
(1, 27, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 2),
(1, 28, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 2),
(1, 29, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 2),
(1, 30, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 2);



-- LLENADO PARA UN CANJEO DE TRANSACCIONES ESTOS INSERT SI FUNCIONA
INSERT INTO [dbo].[caipi_AgreementType] (
    [name],
    [description],
    [dataType]
)
VALUES 
    ('Amount', 'Contrato basado en monto económico, porcentaje, tiempo', 'DECIMAL(5,2)'),
    ('Validation', 'Contrato que requiere validación previa', 'BIT'),
    ('Quantity', 'Contrato basado en cantidad de unidades', 'INT');
GO


INSERT INTO [dbo].[caipi_supplierBranches]  ([name] ,[enable] ,[deleted]   ,[supplierId] ,[idTypesBranch])
     VALUES ('Sucursal Principal'  ,1  ,0 ,1  ,1)

INSERT INTO [dbo].[caipi_plansLimits]([limit] ,[dateUsed] ,[current],[checkSum]  ,[idPlans]  ,[benefitPerPlanId] ,[idMeasureUnit]  ,[idMember])
     VALUES ('10'  ,'2025-05-04 10:30:00',1  ,CONVERT(varbinary(255), HASHBYTES('SHA2_256', '10-2025-05-04-123'), 1),1
           ,14 ,2 ,15)

INSERT INTO [dbo].[caipi_redemptions] ([numberTag],[idPlan] ,[idRedemptionSubType],[idBenefit],[idUser],[idSupplier]
           ,[idService],[enable])
     VALUES('1234',1,2,null,15,null,null,1)

INSERT INTO [dbo].[caipi_plansLimits]
           ([limit], [dateUsed], [current], [checkSum], [idPlans], [benefitPerPlanId], [idMeasureUnit], [idMember])
SELECT
    -- RANDOM LIMIT: entero, decimal, o bit como string
    CASE ABS(CHECKSUM(NEWID())) % 3
        WHEN 0 THEN CAST(CAST(ROUND(RAND() * 1000.0, 2) AS decimal(10,2)) AS varchar(30))  -- Decimal
        WHEN 1 THEN CAST(ABS(CHECKSUM(NEWID())) % 1000 AS varchar(30))                     -- Entero
        ELSE CAST(ABS(CHECKSUM(NEWID())) % 2 AS varchar(30))                               -- Bit (0 o 1)
    END AS [limit],
    GETDATE(),
    1,
    3,
    t.idPlans,
    t.benefitPerPlanId,
    t.idMeasureUnit,
    t.idMember
FROM (
    VALUES
    (1, 15, 1, 1),
    (1, 15, 1, 2),
    (1, 9, 1, 3),
    (1, 10, 1, 4),
    (1, 11, 1, 5),
    (1, 12, 1, 6),
    (1, 13, 1, 7),
    (1, 14, 1, 8),
    (1, 8, 1, 9),
    (1, 9, 1, 10),
    (1, 2, 1, 11),
    (1, 1, 1, 12),
    (1, 15, 1, 13),
    (1, 10, 1, 14),
    (1, 9, 1, 15),
    (2, 7, 1, 16),
    (2, 9, 1, 17),
    (2, 17, 1, 18),
    (3, 10, 1, 19),
    (3, 2, 1, 20),
    (3, 4, 1, 21),
    (4, 13, 1, 22),
    (4, 14, 1, 23),
    (4, 16, 1, 24),
    (4, 11, 1, 25)
) AS t(idPlans, benefitPerPlanId, idMeasureUnit, idMember)

UPDATE caipi_agreementTerms 
SET idAgreementType = 6
where idagreementTerm = 10

UPDATE caipi_plansLimits 
SET [limit] = 10000
where idPlansLimits = 1

--Planes para usuarios de payment assitant	
INSERT INTO caipi_plans (name, description, enable, deleted, checkSum, idplanTypes, effectiveDate, totalAmount)
VALUES ('Plan Básico Extra', 'appAssistant', 1, 0, HASHBYTES('SHA2_512', CONCAT(NEWID(), '723489ansdjflq723')), 1, 2020-05-01, 3.99);

-- Plan 2: Personalizado
INSERT INTO caipi_plans (name, description, enable, deleted, checkSum, idplanTypes, effectiveDate, totalAmount)
VALUES ('Plan Personalizado Extra', 'appAssistant', 1, 0, HASHBYTES('SHA2_512', CONCAT(NEWID(), '723489ansdjflq723')), 2, 2020-05-01, 9.99);
