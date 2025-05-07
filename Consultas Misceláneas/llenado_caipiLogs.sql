USE [caipiLogs];

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