USE [caipiIAdb];

	---------------------------------------------CATALOGO DEL SISTEMA------------------------------


	-- --------------- Archivos ----------------------

	INSERT INTO caipi_mediaFileType (name, enable, deleted)
	VALUES
	('imagen', 1, 0),
	('video', 1, 0);
	-- SELECT * FROM dbo.caipi_mediaFileType;

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
	-- SELECT * FROM dbo.caipi_mediaFiles;

	-- insertar moneda CRC y USD
	INSERT INTO dbo.caipi_currencies (name, acronym, symbol)
	VALUES ('Colón Costa Rica', 'CRC', '¢'),('Dólar Estados Unidos', 'USD', '$');
	-- SELECT * FROM dbo.caipi_currencies;




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
		(1, 'Cantidad de beneficiarios', 'Número máximo de personas que pueden usar la suscripción', 1),
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
	-- SELECT * FROM dbo.caipi_contactInfoType;

	--ContactInfoPerSupplier
	INSERT INTO [dbo].[caipi_contactInfoPerSupplier]
			   ([enable], [value], [contactInfoTypeId], [idSupplier])
		 VALUES
			   (1, 'info@theretreatcr.com', 1, 1),
			   (1, '+506 4000 1234', 2, 1),
			   (1, 'contacto@vidamia.com', 1, 2),
			   (1, '+506 4000 5678', 4, 2),
			   (1, 'www.agromedica.cr', 4, 3),
			   (1, '+506 2222 3333', 2, 3),
			   (1, 'pawsco@vetservices.com', 1, 4),
			   (1, '+506 8888 7777', 4, 4),
			   (1, 'www.thepetsclub.cr', 4, 5),
			   (1, '+506 6000 9000', 2, 5),
			   (1, 'info@volairstudio.com', 1, 6),
			   (1, '+506 7000 8000', 4, 6),
			   (1, 'smartfit@fitness.com', 1, 7),
			   (1, 'www.smartfit.cr', 4, 7),
			   (1, 'amamaser@wellness.com', 1, 8);
	-- SELECT * FROM dbo.caipi_contactInfoPerSupplier;

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
	-- SELECT * FROM dbo.caipi_states;

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

	--INSERCIÓN DE LOS CONTRATOS


	-- SMART FIT (idSupplier = 7)
INSERT INTO caipi_agreementTerms (
 enable, checkSum, startDate, idMeasureUnit, idService, finalDate, idSupplier,
 signedDate, deleted, access, disccountPercentage, originalPrice, agreementPrice,
 salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount
) VALUES
(1, HASHBYTES('SHA2_256', 'SmartFit-Gym'), '2025-05-01', 1, 2, '2025-12-31', 7, GETDATE(), 0, 1, 15.00, 850.00, 722.50, 722.50, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'SmartFit-Personal'), '2025-05-01', 1, 14, '2025-12-31', 7, GETDATE(), 0, 1, 10.00, 700.00, 630.00, 630.00, 1, 2, 1, 4, NULL, NULL);

-- AMASER (idSupplier = 8)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'AmaSer-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 8, GETDATE(), 0, 1, 20.00, 600.00, 480.00, 480.00, 1, 3, 1, 4, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'AmaSer-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 8, GETDATE(), 0, 1, 25.00, 800.00, 600.00, 600.00, 1, 1, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'AmaSer-Personal'), '2025-05-01', 1, 14, '2025-12-31', 8, GETDATE(), 0, 1, 15.00, 750.00, 637.50, 637.50, 1, 5, 1, 2, NULL, NULL);

-- SPOON (idSupplier = 13)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'Spoon-Comida'), '2025-05-01', 1, 8, '2025-12-31', 13, GETDATE(), 0, 1, 10.00, 500.00, 450.00, 450.00, 1, 2, 1, 5, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Spoon-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 13, GETDATE(), 0, 1, 5.00, 600.00, 570.00, 570.00, 1, 1, 1, 1, NULL, NULL);

-- CENTRAL DE MASCOTAS (idSupplier = 11)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'Central-Grooming'), '2025-05-01', 1, 4, '2025-12-31', 11, GETDATE(), 0, 1, 20.00, 400.00, 320.00, 320.00, 1, 5, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Central-Veterinaria'), '2025-05-01', 1, 5, '2025-12-31', 11, GETDATE(), 0, 1, 15.00, 500.00, 425.00, 425.00, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Central-Mantenimiento'), '2025-05-01', 1, 10, '2025-12-31', 11, GETDATE(), 0, 1, 30.00, 700.00, 490.00, 490.00, 1, 3, 1, 1, NULL, NULL);

-- VIDA MIA (idSupplier = 2)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'VidaMia-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 2, GETDATE(), 0, 1, 25.00, 500.00, 375.00, 375.00, 1, 1, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VidaMia-Belleza'), '2025-05-01', 1, 12, '2025-12-31', 2, GETDATE(), 0, 1, 20.00, 700.00, 560.00, 560.00, 1, 2, 1, 1, NULL, NULL);

-- THE PETS CLUB (idSupplier = 5)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'PetsClub-Grooming'), '2025-05-01', 1, 4, '2025-12-31', 5, GETDATE(), 0, 1, 20.00, 450.00, 360.00, 360.00, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'PetsClub-Mantenimiento'), '2025-05-01', 1, 10, '2025-12-31', 5, GETDATE(), 0, 1, 10.00, 550.00, 495.00, 495.00, 1, 4, 1, 1, NULL, NULL);

-- VOLAIR STUDIO (idSupplier = 6)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'VolAir-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 6, GETDATE(), 0, 1, 10.00, 600.00, 540.00, 540.00, 1, 3, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VolAir-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 6, GETDATE(), 0, 1, 15.00, 700.00, 595.00, 595.00, 1, 5, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VolAir-Entrenamiento'), '2025-05-01', 1, 14, '2025-12-31', 6, GETDATE(), 0, 1, 12.00, 750.00, 660.00, 660.00, 1, 1, 1, 1, NULL, NULL);
GO




-- ##############################
-- INSERCIÓN DE PLANES
-- ##############################
CREATE OR ALTER PROCEDURE dbo.caipiSP_LlenarPlanes
AS
BEGIN
    DECLARE @countPlanes INT = 15;
    DECLARE @planesID INT;
    DECLARE @Name VARCHAR(30);
    DECLARE @planType INT;
    DECLARE @checkSum VARBINARY(255); -- HASHBYTES devuelve VARBINARY
    DECLARE @fecha DATETIME;
    DECLARE @total DECIMAL(5,2);
    DECLARE @mensual DECIMAL(5,2);

    DECLARE @nombres TABLE (nombre VARCHAR(30));
    
    -- Se insertan los 15 planes disponibles 
    INSERT INTO @nombres(nombre)
    VALUES 
        ('Joven Deportista'), ('Familia de Verano'), ('Viajero Frecuente'), ('Nómada Digital'),
        ('Profesional en Movimiento'), ('Estudiante Proactivo'), ('Creativo Freelance'), ('Full Wellness'),
        ('Tiempo en Familia'), ('Explorador Urbano'), ('Hogar Equilibrado'), ('Fit & Chill'),
        ('EcoVida'), ('Combo Soltura'), ('Zen Diario');

    DECLARE @i INT = 1;

 -- Se inicia el ciclo para insertar los 15 planes
    WHILE @i <= 15
    BEGIN
        SET @planesID = @i;

        SELECT @Name = nombre FROM (
            SELECT nombre, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn FROM @nombres
        ) AS nombres_ordenados
        WHERE rn = @i;

        -- Tipo de plan entre 1 y 6
        SET @planType = FLOOR(1 + RAND() * 6);

        -- Fecha aleatoria entre 2024-06-01 y hoy
        DECLARE @startDate DATETIME = '2024-06-01 00:00:00';
        DECLARE @secondsRange INT = DATEDIFF(SECOND, @startDate, GETDATE());
        SET @fecha = DATEADD(SECOND, FLOOR(RAND(CHECKSUM(NEWID())) * @secondsRange), @startDate);

        -- Monto total entre 100 y 200
        SET @total = ROUND(100 + (RAND() * 100), 2); 
        -- Monto Mensual entre 50 y 60
        SET @mensual = ROUND(50 + (RAND() * 10), 2);

        -- Checksum
        SET @checkSum = HASHBYTES('SHA2_512', CONCAT(@planesID, @Name, 'fbsdinaldkna3193'));

        -- Insertamos en la tabla
        INSERT INTO caipi_plans(name, description, enable, deleted, checkSum, idplanTypes, effectiveDate, totalAmount, monthlyAmount)
        VALUES (
            @Name, 'Esta es la descripción', 1, 0, @checkSum, @planType, @fecha, @total, @mensual
        );

        SET @i += 1;
    END
END;
GO

EXEC dbo.caipiSP_LlenarPlanes;
GO
--  select * from caipi_plans;




-- ##############################
-- INSERCIÓN DE SCHEDULES	
-- ##############################
GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_LlenarSchedules
AS
BEGIN

    DECLARE @horarios TABLE (
        name VARCHAR(50),
        recurrencyType VARCHAR(20),
        repetition INT
    );
-- Se realiza una inserción en tabla temporal 
    INSERT INTO @horarios (name, recurrencyType, repetition)
    VALUES 
        ('Cada semana', 'semanal', 1),
        ('Cada mes', 'mensual', 1),
        ('Cada 15 días', 'semanal', 2);

    DECLARE @i INT = 1;
    DECLARE @mes INT;
    DECLARE @dia INT;
    DECLARE @endDate DATE;
-- Se insertan en bloques de 13
    WHILE @i <= 13
    BEGIN
        
        SET @mes = FLOOR(RAND(CHECKSUM(NEWID())) * 8) + 5; -- Mes aleatorio

        SET @dia = FLOOR(RAND(CHECKSUM(NEWID())) * 28) + 1; -- Dia aleatorio

        SET @endDate = DATEFROMPARTS(2025, @mes, @dia);

        -- Insertar 3 registros por vuelta
        INSERT INTO caipi_schedules (name, recurrencyType, repetition, endType, endDate)
        SELECT name, recurrencyType, repetition, 'NA', @endDate
        FROM @horarios;

        SET @i += 1;
    END
END;
GO

EXEC dbo.caipiSP_LlenarSchedules;







-- ##############################
-- INSERCIÓN DE USERS
-- ##############################
/*
 procedimiento almacenado: dbo.sp_crearusuarios
 descripcion: inserta 100 usuarios de ejemplo en dbo.caipi_users
*/
GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_CrearUsuarios
AS
BEGIN
    -- este bloque desactiva mensajes de conteo de filas
    SET NOCOUNT ON;

    -- este bloque crea una tabla temporal con nombres comunes
    DECLARE @FirstNames TABLE (Name NVARCHAR(50));
    INSERT INTO @FirstNames (Name)
    VALUES ('Jose'),('Maria'),('Juan'),('Ana'),('Luis'),('Carmen'),('Miguel'),('Laura'),('Carlos'),('Lucia');

    -- este bloque crea una tabla temporal con apellidos comunes
    DECLARE @LastNames TABLE (Lastname NVARCHAR(50));
    INSERT INTO @LastNames (Lastname)
    VALUES ('Garcia'),('Rodriguez'),('Martinez'),('Hernandez'),('Lopez'),('Gonzalez'),('Perez'),('Sanchez'),('Ramirez'),('Torres');

    -- este bloque inicia el contador para insertar 100 usuarios
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        -- este bloque elige un nombre aleatorio
        DECLARE @FirstName NVARCHAR(50) = (
            SELECT TOP 1 Name FROM @FirstNames ORDER BY NEWID()
        );
        -- este bloque elige un apellido aleatorio
        DECLARE @LastName NVARCHAR(50) = (
            SELECT TOP 1 Lastname FROM @LastNames ORDER BY NEWID()
        );

        -- este bloque crea el username usando inicial del nombre, apellido y contador
        DECLARE @Username NVARCHAR(50) = LOWER(
            LEFT(@FirstName,1) + @LastName + RIGHT('00' + CAST(@i AS VARCHAR),3)
        );

        -- este bloque genera fecha de nacimiento entre 18 y 65 anos
        DECLARE @Birth DATE = DATEADD(
            DAY,
            - (ABS(CHECKSUM(NEWID())) % (47 * 365) + (18 * 365)),
            CAST(GETDATE() AS DATE)
        );

        -- este bloque genera contrasena como hash sha2_256 de pass + contador
        DECLARE @Password NVARCHAR(256) = 'pass' + CAST(@i AS NVARCHAR);

        -- este bloque define flags de estado eliminacion y activo
        DECLARE @Deleted BIT = 0;
        DECLARE @Active BIT = 1;

        -- este bloque crea fecha de registro aleatoria en el ultimo ano
        DECLARE @RegisterDate DATE = DATEADD(
            DAY,
            - (ABS(CHECKSUM(NEWID())) % 365),
            CAST(GETDATE() AS DATE)
        );
        -- este bloque asigna la fecha y hora actual como ultima actualizacion
        DECLARE @LastUpdate DATETIME = GETDATE();

        -- este bloque asigna un rol aleatorio entre 1 y 3
        DECLARE @Role TINYINT = CAST((ABS(CHECKSUM(NEWID())) % 3 + 1) AS TINYINT);

        -- este bloque crea urls de perfil e imagen usando el username
        DECLARE @ProfileUrl NVARCHAR(200) = 'https://example.com/users/' + @Username;
        DECLARE @ImgProfileUrl NVARCHAR(200) = 'https://example.com/images/' + @Username + '.jpg';

        -- este bloque inserta el usuario generado en la tabla principal
        INSERT INTO dbo.caipi_users
            (username, [name], lastname, birth, [password], deleted, active, last_update, role, registerdate, profile_url, img_profile_url)
        VALUES
            (@Username, @FirstName, @LastName, @Birth, @Password, @Deleted, @Active, @LastUpdate, @Role, @RegisterDate, @ProfileUrl, @ImgProfileUrl);

        -- este bloque incrementa el contador
        SET @i = @i + 1;
    END
END;
GO

EXEC dbo.caipiSP_CrearUsuarios;







/*
 procedimiento almacenado: dbo.sp_insertsampleaddresses
 descripcion: inserta 100 direcciones de ejemplo en dbo.caipi_Adresses
*/
go
CREATE OR ALTER procedure dbo.caipiSP_insertardireccionesparausuarios
as
begin
    set nocount on;

    -- contador para crear 100 direcciones
    declare @i int = 1;
    while @i <= 100
    begin
        -- linea 1: calle + numero
        declare @line1 varchar(200) = 'calle ' + cast((abs(checksum(newid())) % 200 + 1) as varchar) + ' #' + cast((abs(checksum(newid())) % 1000 + 1) as varchar);
        
        -- linea 2: apto o null
        declare @line2 varchar(200);
        if (abs(checksum(newid())) % 2) = 0
            set @line2 = 'apto ' + cast((abs(checksum(newid())) % 100 + 1) as varchar);
        else
            set @line2 = null;

        -- codigo postal formato 5 digitos[-4]
        declare @zip varchar(9) = right('00000' + cast(abs(checksum(newid())) % 100000 as varchar),5)
                                 + '-' + right('0000' + cast(abs(checksum(newid())) % 10000 as varchar),4);

        -- generar punto geometrico con lat/lon en costa rica aproximado
        declare @rand float = rand(checksum(newid()));
        declare @lat float = 8 + @rand * 3;      -- entre 8 y 11 grados
        declare @lon float = -85 + @rand * 3;    -- entre -85 y -82 grados
        declare @location geometry = geometry::Point(@lon, @lat, 4326);

        -- habilitado aleatori
        declare @enable bit = cast((abs(checksum(newid())) % 2) as bit);

        -- id de direccion secuencial
        declare @adressId int = @i;

        -- id de ciudad aleatorio entre 1 y 18
        declare @cityId int = abs(checksum(newid())) % 18 + 1;

        -- insertar registro
        insert into dbo.caipi_Adresses
            (line1, line2, zipcode, location, enable, adressId, cityId)
        values
            (@line1, @line2, @zip, @location, @enable, @adressId, @cityId);

        -- siguiente contador
        set @i = @i + 1;
    end
end
go

EXEC dbo.caipiSP_insertardireccionesparausuarios;






/*
 procedimiento almacenado: dbo.sp_insertsampleaddressesperuser
 descripcion: asigna direcciones a usuarios en dbo.caipi_AdressessPerUser
*/
GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_insertardireccionesparausuariosporusuario
AS
BEGIN
    -- este bloque evita mensajes de conteo de filas
    SET NOCOUNT ON;

    -- contador para crear 200 registros (direcciones por usuario)
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        -- id secuencial de la relacion
        DECLARE @addressPerUserId INT = @i;

        -- flag habilitado aleatorio
        DECLARE @enable BIT = CAST((ABS(CHECKSUM(NEWID())) % 2) AS BIT);

        -- direccion id de 1 a 200
        DECLARE @adressId INT = @i;

        -- usuario id de 1 A 100
        DECLARE @userid INT = @i;

        -- insertar registro en la tabla de relacion
        INSERT INTO dbo.caipi_AdressessPerUser
            (adressPerUserId, enable, adressId, userid)
        VALUES
            (@addressPerUserId, @enable, @adressId, @userid);

        -- incrementar contador
        SET @i = @i + 1;
    END
END
GO

EXEC dbo.caipiSP_insertardireccionesparausuariosporusuario;




GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_insertarInfoContactoUsuarios
AS
BEGIN
    SET NOCOUNT ON;

    -- declaramos las variables
    DECLARE @userid INT = 1;
    DECLARE @contactTypeId INT;
    DECLARE @email VARCHAR(100);
    DECLARE @phone VARCHAR(100);
    DECLARE @mobile VARCHAR(100);
    DECLARE @fax VARCHAR(100);
    DECLARE @web VARCHAR(100);
    DECLARE @fecha DATETIME;

    -- recorremos los usuarios del 101 al 300
    WHILE @userid <= 100
    BEGIN
        -- generamos una fecha aleatoria
        SET @fecha = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-04-01');

        -- generamos un correo electronico
        SET @email = 'user' + CAST(@userid AS VARCHAR) + '@correo.com';
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @email, @userid, 1); -- 1 es email

        -- generamos un numero telefonico fijo
        SET @phone = '+506 2222' + RIGHT('000' + CAST(@userid AS VARCHAR), 4);
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @phone, @userid, 2); -- 2 es telefono fijo

        -- generamos un numero movil
        SET @mobile = '+506 88' + RIGHT('000000' + CAST(@userid AS VARCHAR), 6);
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @mobile, @userid, 5); -- 5 es numero movil

        -- generamos un fax (opcional, no todos tendran)
        IF @userid % 3 = 0
        BEGIN
            SET @fax = '+506 2288' + RIGHT('000' + CAST(@userid AS VARCHAR), 4);
            INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
            VALUES (1, @fecha, @fax, @userid, 3); -- 3 es fax
        END

        -- generamos un sitio web (opcional, algunos tendran)
        IF @userid % 4 = 0
        BEGIN
            SET @web = 'https://usuario' + CAST(@userid AS VARCHAR) + '.com';
            INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
            VALUES (1, @fecha, @web, @userid, 4); -- 4 es sitio web
        END

        SET @userid = @userid + 1;
    END
END
GO

EXEC dbo.caipiSP_insertarInfoContactoUsuarios;



/*
 procedimiento almacenado: dbo.sp_FillSubscriptionsAndMembers
 descripcion: asigna suscripciones a un tercio de usuarios (101-300) y miembros a cada suscripcion
 hay mas usuarios como miembros que como dueños
 cada suscripcion tendra de 3 a 6 miembros
*/
GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_llenarSubscriptionyMembers
AS
BEGIN
    SET NOCOUNT ON;

    -- definimos rango de usuarios
    DECLARE @minUser INT = 1, @maxUser INT = 100;
    DECLARE @totalUsers INT = @maxUser - @minUser + 1;
    -- elegimos un tercio de usuarios como dueños
    DECLARE @ownersCount INT = @totalUsers / 3;

    -- tabla temporal de dueños de suscripcion
    DECLARE @owners TABLE (userid INT PRIMARY KEY);
    DECLARE @idx INT = 0;
    WHILE @idx < @ownersCount
    BEGIN
        SET @idx = @idx + 1;
        INSERT INTO @owners (userid)
        VALUES (@minUser + @idx - 1);
    END;

    -- cursor para recorrer cada dueño
    DECLARE owner_cursor CURSOR FOR
        SELECT userid FROM @owners;
    OPEN owner_cursor;

    DECLARE @ownerId INT;
    FETCH NEXT FROM owner_cursor INTO @ownerId;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- datos aleatorios para la suscripcion
        DECLARE @subscription_typeid INT = CAST(RAND(CHECKSUM(NEWID())) * 8 + 1 AS INT);
        DECLARE @social BIT         = CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT);
        DECLARE @enable BIT         = 1;
        DECLARE @startdate DATE     = DATEADD(DAY, -CAST(RAND(CHECKSUM(NEWID())) * 365 AS INT), CAST(GETDATE() AS DATE));
        DECLARE @deleted BIT        = 0;
        DECLARE @statusid INT       = CAST(RAND(CHECKSUM(NEWID())) * 5 + 1 AS INT);
        DECLARE @scheduleId INT     = CAST(RAND(CHECKSUM(NEWID())) * 39 + 1 AS INT);
        DECLARE @auto_renew BIT     = CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT);
        DECLARE @created_at DATETIME = DATEADD(MINUTE, -CAST(RAND(CHECKSUM(NEWID())) * 10000 AS INT), GETDATE());
        DECLARE @idPlan INT         = CAST(RAND(CHECKSUM(NEWID())) * 15 + 1 AS INT);

        -- insertamos la suscripcion y obtenemos su id
        INSERT INTO dbo.caipi_subscriptions
            (suscription_typeid, userid, social, enable, startdate, deleted, statusid, scheduleId, auto_renew, created_at, idPlan)
        VALUES
            (@subscription_typeid, @ownerId, @social, @enable, @startdate, @deleted, @statusid, @scheduleId, @auto_renew, @created_at, @idPlan);
        DECLARE @subscriptionId INT = SCOPE_IDENTITY();

        -- determinamos cuántos miembros (3 a 6)
        DECLARE @membersCount INT = CAST(RAND(CHECKSUM(NEWID())) * 4 + 3 AS INT);

        -- insertamos al dueño como miembro
        INSERT INTO dbo.caipi_members
            (subscriptionid, userid, startdate, leftdate, enabled, deleted)
        VALUES
            (@subscriptionId, @ownerId, @created_at, NULL, 1, 0);

        -- insertamos miembros adicionales, pueden repetirse en otras suscripciones
        DECLARE @m INT = 1;
        WHILE @m < @membersCount
        BEGIN
            DECLARE @randUser INT = CAST(RAND(CHECKSUM(NEWID())) * @totalUsers + @minUser AS INT);
            IF NOT EXISTS(
                SELECT 1 FROM dbo.caipi_members
                WHERE subscriptionid = @subscriptionId AND userid = @randUser
            )
            BEGIN
                INSERT INTO dbo.caipi_members
                    (subscriptionid, userid, startdate, leftdate, enabled, deleted)
                VALUES
                    (@subscriptionId, @randUser, @created_at, NULL, 1, 0);
                SET @m = @m + 1;
            END;
        END;

        FETCH NEXT FROM owner_cursor INTO @ownerId;
    END;

    CLOSE owner_cursor;
    DEALLOCATE owner_cursor;
END;
GO

EXEC dbo.caipiSP_llenarSubscriptionyMembers;




GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_InsertarPaymentMethods
	--no hay parametros
AS
BEGIN
    -- Declaración de variables
    DECLARE @i INT = 1;
    DECLARE @name NVARCHAR(50);
    DECLARE @methodId INT;
    DECLARE @token NVARCHAR(100);
    DECLARE @expTokenDate DATETIME;
    DECLARE @maskAccount NVARCHAR(MAX);
    DECLARE @callbackURL NVARCHAR(200);
    DECLARE @configurationDetails NVARCHAR(MAX);
    DECLARE @refreshToken VARBINARY(MAX);

    -- Cursor para recorrer los métodos de pago existentes, recibiendo loda daros de la consulta select de la tabla que contiene los metodos de pago
    DECLARE method_cursor CURSOR FOR
        SELECT [name],[methodId]
        FROM [dbo].[caipi_paymentMethods];

    OPEN method_cursor;
    FETCH NEXT FROM method_cursor INTO @name, @methodId; --Recorre el primerregistro, almacena el nombre y el id del metodo que sera utilizado en la insercion

    -- Ciclo para insertar datos en la tabla de métodos de pago
    WHILE @i <= 15
    BEGIN
		-- Asignar valores dinámicos a las variables
        SET @token = CONVERT(NVARCHAR(100), NEWID());
        SET @expTokenDate = DATEADD(DAY, @i * 30, GETDATE());  -- Asignación de fechas, incrementa cada 30 días
        SET @maskAccount = CONCAT('****', RIGHT('000' + CAST((1000 + @i * 7) AS NVARCHAR), 4));  -- Cuenta enmascarada con incremento
        SET @callbackURL = CONCAT('https://example.com/callback/method', @i);
        SET @configurationDetails = CONCAT('{"currency":"USD", "method":"', @name, '"}');
        SET @refreshToken = CAST(HASHBYTES('SHA2_256', @token) AS VARBINARY(MAX));  -- Encriptación del token

        -- Insertar el registro en la tabla
        INSERT INTO [dbo].[caipi_availablePaymentMethods]
           ([name], [token], [expTokenDate], [maskAccount], [callbackURL], [configurationDetails], [refreshToken], [methodId])
        VALUES
           (@name, @token, @expTokenDate, @maskAccount, @callbackURL, @configurationDetails, @refreshToken, @methodId);  -- Usa @methodId como ID del método QUE ES APUNTADO POR EL CURSOR

        SET @i += 1;  -- Incrementar el contador para el siguiente ciclo
        -- Obtener el siguiente método de pago
        FETCH NEXT FROM method_cursor INTO @name, @methodId;

		-- Si ya se recorrio hasta último registro, vuelve al inicio para volver a recorrer la consulta
		IF @@FETCH_STATUS <> 0 -- Ya no hay más registros
		BEGIN
			-- Reinicia el cursor a la primera fila
			CLOSE method_cursor;

			-- Reabriendo el cursor
			OPEN method_cursor;
			FETCH NEXT FROM method_cursor INTO @name, @methodId; -- Vuelve al primer registro
		END
    END

    -- Cerrar y liberar el cursor
    CLOSE method_cursor;
    DEALLOCATE method_cursor;
END;
GO

EXEC dbo.caipiSP_InsertarPaymentMethods;





/*

	Crea la relacion de los metodos de pago existentes y disponibles para cada proveedor, asigna solo 1 y diferente para el mismo.

*/
GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_AddPaymentMethodsPerSupplier
	--SIN PARAMETROS
AS
BEGIN
	--Declare local variables
	DECLARE @SupplierQuantity INT = 15 --cantidad de proveedores
	DECLARE @MethodsQuantity INT = 5 --cantidad de metodos disponibles
	DECLARE @MethodId INT --Id del metodo seleccionado de forma aleatoria
	DECLARE @SupplierCount INT = 1 --Contador de ciclo que recorre los registros de proveedores el cual funciona tambien como ID del supplier


	WHILE @SupplierCount <= @SupplierQuantity
    BEGIN
		--Escoge un metodo de pago disponible entre los id registrados con el checkscum obtengo distintos valores en cada interacion de RAND
		SET @MethodId = FLOOR(1 + RAND(CHECKSUM(NEWID())) * @MethodsQuantity);

		INSERT INTO [dbo].[caipi_AvailablePaymentMethodsPerSuppliers]
			   ([enable]
			   ,[paymentMethodId]
			   ,[supplierId])
		 VALUES
			   (1
			   ,@MethodId
			   ,@SupplierCount)

		SET @SupplierCount +=1;
	END
END;
GO

EXEC dbo.caipiSP_AddPaymentMethodsPerSupplier;





GO
CREATE OR ALTER PROCEDURE dbo.caipi_SP_AddPaymentMethodsPerUser
	--SIN PARAMETROS
AS
BEGIN
	--Declare local variables
	DECLARE @UserQuantity INT = 100 --cantidad de usuarios
	DECLARE @MethodsQuantity INT = 5 --cantidad de metodos disponibles
	DECLARE @MethodId INT --Id del metodo seleccionado de forma aleatoria
	DECLARE @UserCount INT = 1 --Contador de ciclo que recorre los registros de usuarios el cual funciona tambien como ID del users


	WHILE @UserCount <= @UserQuantity
    BEGIN
		--Escoge un metodo de pago disponible entre los id registrados con el checkscum obtengo distintos valores en cada interacion de RAND
		SET @MethodId = FLOOR(1 + RAND(CHECKSUM(NEWID())) * @MethodsQuantity);

		INSERT INTO dbo.caipi_AvailiablePaymentMethodsPerUser
			   ([enable]
			   ,[paymentMethodId]
			   ,[idUser])
		 VALUES
			   (1
			   ,@MethodId
			   ,@UserCount)

		SET @UserCount +=1;
	END
END;
GO

EXEC dbo.caipi_SP_AddPaymentMethodsPerUser;



-- ##############################
-- INSERCIÓN DE AGREEMENTSPERPLAN
-- ##############################
INSERT INTO caipi_AgreementsPerPlan
(enable, deleted, idPlans, idAgreementTerm, quantity, idMeasureUnit, amount, disccount)
VALUES
(1,0,15,7,'1 mes',1,722.50,127.50);

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









-- Insertar pago 1
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (125.50, 125.50, 'OK', 'ATH-589', 'REF1001', CONVERT(varbinary(100), 'prueba'), 'Suscripción Básica', 'Exitosa', CONVERT(varbinary(100), 'pruebacheck'),
   '2025-05-05 09:15:00',  1, 1, 1, 10, 10);

-- Insertar pago 2
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (2500.00, 2400.00, 'REFUNDED', 'ATH-590', 'REF1002', CONVERT(varbinary(100), 'descuento'), 'Pago Premium con descuento', 'Error', CONVERT(varbinary(100), 'descuentoCheck'),
   '2025-05-05 11:30:00',  2, 2, 2, 20, 20);

-- Insertar pago 3
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (75.00, 75.00, 'OK', 'ATH-591', 'REF1003', CONVERT(varbinary(100), 'adicional'), 'Servicio Adicional X', 'Exitosa', CONVERT(varbinary(100), 'adicionalCheck'),
   '2025-05-06 14:45:00',  1, 3, 3, 30, 30);

-- Insertar pago 4
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (500.00, 500.00, 'ERROR', 'ATH-592', 'REF1004', CONVERT(varbinary(100), 'error'), 'Pago Plan Intermedio', 'Error', CONVERT(varbinary(100), 'errorCheck'),
   '2025-05-07 08:00:00',  3, 1, 4, 40, 40);

-- Insertar pago 5
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (1500.75, 1500.75, 'OK', 'ATH-593', 'REF1005', CONVERT(varbinary(100), 'upgrade'), 'Upgrade a Plan Oro', 'Exitosa', CONVERT(varbinary(100), 'upgradeCheck'),
   '2025-05-07 16:20:00',  2, 2, 5, 50, 50);

-- Inserciones en caipi_payments

-- Insertar pago 1
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (125.50, 125.50, 'OK', 'ATH-589', 'REF1001', CONVERT(varbinary(100), 'prueba'), 'Suscripción Básica', 'Exitosa', CONVERT(varbinary(100), 'pruebacheck'),
   '2025-05-05 09:15:00',  1, 1, 1, 10, 10);

-- Insertar pago 2
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (2500.00, 2400.00, 'REFUNDED', 'ATH-590', 'REF1002', CONVERT(varbinary(100), 'descuento'), 'Pago Premium con descuento', 'Error', CONVERT(varbinary(100), 'descuentoCheck'),
   '2025-05-05 11:30:00',  2, 2, 2, 20, 20);

-- Insertar pago 3
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (75.00, 75.00, 'OK', 'ATH-591', 'REF1003', CONVERT(varbinary(100), 'adicional'), 'Servicio Adicional X', 'Exitosa', CONVERT(varbinary(100), 'adicionalCheck'),
   '2025-05-06 14:45:00',  1, 3, 3, 30, 30);

-- Insertar pago 4
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (500.00, 500.00, 'ERROR', 'ATH-592', 'REF1004', CONVERT(varbinary(100), 'error'), 'Pago Plan Intermedio', 'Error', CONVERT(varbinary(100), 'errorCheck'),
   '2025-05-07 08:00:00',  3, 1, 4, 40, 40);

-- Insertar pago 5
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (1500.75, 1500.75, 'OK', 'ATH-593', 'REF1005', CONVERT(varbinary(100), 'upgrade'), 'Upgrade a Plan Oro', 'Exitosa', CONVERT(varbinary(100), 'upgradeCheck'),
   '2025-05-07 16:20:00',  2, 2, 5, 50, 50);

-- Insertar pago 6
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (200.00, 200.00, 'OK', 'ATH-594', 'REF1006', CONVERT(varbinary(100), 'plan'), 'Plan Básico Anual', 'Exitosa', CONVERT(varbinary(100), 'planCheck'),
   '2025-05-08 09:45:00',  1, 3, 6, 15, 15);

-- Insertar pago 7
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (600.00, 600.00, 'OK', 'ATH-595', 'REF1007', CONVERT(varbinary(100), 'nuevoPlan'), 'Pago Plan Plus', 'Exitosa', CONVERT(varbinary(100), 'nuevoPlanCheck'),
   '2025-05-08 13:00:00',  2, 2, 7, 12, 12);

-- Insertar pago 8
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (800.00, 800.00, 'OK', 'ATH-596', 'REF1008', CONVERT(varbinary(100), 'pagoExtra'), 'Pago adicional por servicios', 'Exitosa', CONVERT(varbinary(100), 'pagoExtraCheck'),
   '2025-05-09 10:30:00',  3, 1, 8, 60, 60);

-- Insertar pago 9
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (1000.00, 1000.00, 'ERROR', 'ATH-597', 'REF1009', CONVERT(varbinary(100), 'cancelado'), 'Pago Plan Cancelado', 'Error', CONVERT(varbinary(100), 'canceladoCheck'),
   '2025-05-09 15:00:00',  1, 3, 9, 20, 20);

-- Insertar pago 10
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (150.00, 150.00, 'OK', 'ATH-598', 'REF1010', CONVERT(varbinary(100), 'intermediate'), 'Pago Plan Intermedio', 'Exitosa', CONVERT(varbinary(100), 'intermediateCheck'),
   '2025-05-10 09:00:00',  2, 2, 10, 30, 30);

-- Insertar pago 11
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (180.00, 180.00, 'OK', 'ATH-599', 'REF1011', CONVERT(varbinary(100), 'addOn'), 'Pago Adicional Plan Básico', 'Exitosa', CONVERT(varbinary(100), 'addOnCheck'),
   '2025-05-11 12:30:00',  3, 1, 11, 40, 40);

-- Insertar pago 12
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (500.00, 500.00, 'ERROR', 'ATH-600', 'REF1012', CONVERT(varbinary(100), 'fallo'), 'Pago con Fallo de Transacción', 'Error', CONVERT(varbinary(100), 'falloCheck'),
   '2025-05-12 08:00:00',  1, 3, 12, 50, 50);

-- Insertar pago 13
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (2200.00, 2200.00, 'OK', 'ATH-601', 'REF1013', CONVERT(varbinary(100), 'descuentoPlan'), 'Descuento sobre Plan Oro', 'Exitosa', CONVERT(varbinary(100), 'descuentoPlanCheck'),
   '2025-05-12 10:15:00',  2, 2, 13, 60, 60);

-- Insertar pago 14
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (350.00, 350.00, 'OK', 'ATH-602', 'REF1014', CONVERT(varbinary(100), 'pagoExtra'), 'Pago Extra por Extensión', 'Exitosa', CONVERT(varbinary(100), 'pagoExtraCheck'),
   '2025-05-13 11:30:00',  3, 1, 14, 70, 70);

-- Insertar pago 15
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (999.99, 999.99, 'OK', 'ATH-603', 'REF1015', CONVERT(varbinary(100), 'premium'), 'Pago Premium Anual', 'Exitosa', CONVERT(varbinary(100), 'premiumCheck'),
   '2025-05-13 13:45:00',  2, 3, 15, 80, 80);

-- Insertar pago 16
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (999.00, 999.00, 'ERROR', 'ATH-604', 'REF1016', CONVERT(varbinary(100), 'falloPlan'), 'Error en pago de Plan', 'Error', CONVERT(varbinary(100), 'falloPlanCheck'),
   '2025-05-14 08:30:00',  1, 1, 16, 90, 90);

-- Insertar pago 17
INSERT INTO caipi_payments
  (amount, actualAmount, result, authNumber, reference, chargeToken, description, error, checksum,
   date, paymentMethodId, methodId, scheduleId,
   userId, personId)
VALUES
  (1200.00, 1200.00, 'OK', 'ATH-605', 'REF1017', CONVERT(varbinary(100), 'intermedio'), 'Pago Plan Intermedio Anual', 'Exitosa', CONVERT(varbinary(100), 'intermedioCheck'),
   '2025-05-14 10:00:00',  2, 3, 17, 100, 100);


-- insercion para deadlocks


INSERT INTO [dbo].[caipi_redemptions]
           ([numberTag], [idRedemptionSubType], [enable])
VALUES
           ('TAG-001', 2,1 ),
           ('TAG-002', 1,1 ),
           ('TAG-003', 2,1 ),
           ('TAG-004', 3,1 ),
           ('TAG-005', 1,1 );


INSERT INTO [dbo].[caipi_redemptionTransactions]
           ([idRedemption], [idUser], [checkSum], [creationDate], [idModule],
            [description], [idPerson], [idRedemptionTransactionTypes], [amount], [idAgreementTerm])
VALUES
           (1, 3, HASHBYTES('SHA2_256', 'ReDeMpTiOnS47398'), GETDATE(), 7, 'Redención de beneficio 1', 5, 1, 25.50, 1),
           (2, 3, HASHBYTES('SHA2_256', 'ReDeMpTiOnS27469'), GETDATE(), 7, 'Redención de beneficio 2', 5, 2, 15.00, 1),
           (3, 4, HASHBYTES('SHA2_256', 'ReDeMpTiOnS28462'), GETDATE(), 7, 'Redención de beneficio 1', 6, 1, 30.75, 3),
           (4, 4, HASHBYTES('SHA2_256', 'ReDeMpTiOnS97402'), GETDATE(), 7, 'Redención de beneficio 2', 6, 3, 10.00, 4),
           (5, 1, HASHBYTES('SHA2_256', 'ReDeMpTiOnS82469'), GETDATE(), 7, 'Redención de beneficio 4', 1, 2, 50.00, 5);



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

