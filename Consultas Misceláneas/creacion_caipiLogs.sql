USE [caipiLogs]

/****** Object:  Table [dbo].[caipi_logs]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logs](
	[logId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](80) NULL,
	[postime] [timestamp] NOT NULL,
	[computer] [nvarchar](100) NOT NULL,
	[username] [varchar](70) NOT NULL,
	[trace] [varchar](300) NULL,
	[referenceId1] [bigint] NULL,
	[referenceId2] [bigint] NULL,
	[value1] [varchar](300) NULL,
	[value2] [varchar](300) NULL,
	[chechsum] [varbinary](256) NOT NULL,
	[logSeverityId] [int] NOT NULL,
	[logSourceId] [int] NOT NULL,
	[logTypeId] [int] NOT NULL,
 CONSTRAINT [PK_caipi_qrLogs] PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caipi_logSeverity]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logSeverity](
	[logSeverityId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_caipi_logSeverity] PRIMARY KEY CLUSTERED 
(
	[logSeverityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caipi_logsSources]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logsSources](
	[logSourceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_caipi_logsSources] PRIMARY KEY CLUSTERED 
(
	[logSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caipi_logTypes]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logTypes](
	[logTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_caipi_logTypes] PRIMARY KEY CLUSTERED 
(
	[logTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO