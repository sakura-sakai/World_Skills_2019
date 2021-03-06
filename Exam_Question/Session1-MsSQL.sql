
/****** Object:  Table [dbo].[AssetGroups]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetGroups](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AssetTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetPhotos]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetPhotos](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetID] [bigint] NOT NULL,
	[AssetPhoto] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_AssetPhotos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetSN] [nvarchar](20) NOT NULL,
	[AssetName] [nvarchar](150) NOT NULL,
	[DepartmentLocationID] [bigint] NOT NULL,
	[EmployeeID] [bigint] NOT NULL,
	[AssetGroupID] [bigint] NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[WarrantyDate] [date] NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetTransferLogs]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetTransferLogs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetID] [bigint] NOT NULL,
	[TransferDate] [date] NOT NULL,
	[FromAssetSN] [nvarchar](20) NOT NULL,
	[ToAssetSN] [nvarchar](20) NOT NULL,
	[FromDepartmentLocationID] [bigint] NOT NULL,
	[ToDepartmentLocationID] [bigint] NOT NULL,
 CONSTRAINT [PK_AssetRelocationLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentLocations]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentLocations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [bigint] NOT NULL,
	[LocationID] [bigint] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_DepartmentLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varbinary](200) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[Length] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[ContentType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 8/21/2019 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssetGroups] ON 

INSERT [dbo].[AssetGroups] ([ID], [Name]) VALUES (1, N'Hydraulic')
INSERT [dbo].[AssetGroups] ([ID], [Name]) VALUES (3, N'Electrical')
INSERT [dbo].[AssetGroups] ([ID], [Name]) VALUES (4, N'Mechanical ')
SET IDENTITY_INSERT [dbo].[AssetGroups] OFF
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (1, N'05/04/0001', N'Toyota Hilux FAF321', 3, 5, 4, N'', NULL)
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (2, N'04/03/0001', N'Suction Line 852', 7, 8, 3, N'', CAST(N'2020-03-02' AS Date))
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (3, N'01/01/0001', N'ZENY 3,5CFM Single-Stage 5 Pa Rotary Vane', 11, 22, 1, N'', CAST(N'2018-01-17' AS Date))
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (4, N'05/04/0002', N'Volvo FH16', 4, 26, 4, N'', NULL)
SET IDENTITY_INSERT [dbo].[Assets] OFF
SET IDENTITY_INSERT [dbo].[AssetTransferLogs] ON 

INSERT [dbo].[AssetTransferLogs] ([ID], [AssetID], [TransferDate], [FromAssetSN], [ToAssetSN], [FromDepartmentLocationID], [ToDepartmentLocationID]) VALUES (1, 1, CAST(N'2012-01-09' AS Date), N'04/04/0002', N'05/04/0001', 7, 4)
INSERT [dbo].[AssetTransferLogs] ([ID], [AssetID], [TransferDate], [FromAssetSN], [ToAssetSN], [FromDepartmentLocationID], [ToDepartmentLocationID]) VALUES (2, 3, CAST(N'2014-02-02' AS Date), N'03/01/0001', N'01/01/0001', 8, 11)
SET IDENTITY_INSERT [dbo].[AssetTransferLogs] OFF
SET IDENTITY_INSERT [dbo].[DepartmentLocations] ON 

INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (1, 6, 3, CAST(N'2010-12-28' AS Date), CAST(N'2011-01-20' AS Date))
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (2, 6, 2, CAST(N'2015-12-27' AS Date), CAST(N'2019-08-20' AS Date))
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (3, 5, 2, CAST(N'1996-04-29' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (4, 5, 1, CAST(N'2002-03-04' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (5, 5, 1, CAST(N'1991-03-25' AS Date), CAST(N'2001-10-30' AS Date))
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (6, 4, 3, CAST(N'2012-05-28' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (7, 4, 2, CAST(N'2005-05-04' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (8, 3, 2, CAST(N'1992-10-17' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (9, 3, 3, CAST(N'2000-01-08' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (10, 2, 1, CAST(N'1993-12-25' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (11, 1, 2, CAST(N'2005-11-11' AS Date), NULL)
INSERT [dbo].[DepartmentLocations] ([ID], [DepartmentID], [LocationID], [StartDate], [EndDate]) VALUES (12, 1, 2, CAST(N'1991-01-17' AS Date), CAST(N'2000-02-02' AS Date))
SET IDENTITY_INSERT [dbo].[DepartmentLocations] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [Name]) VALUES (1, N'Exploration')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (2, N'Production')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (3, N'Transportation')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (4, N'R&D')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (5, N'Distribution')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (6, N'QHSE')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (1, N'Martina', N'Winegarden', N'69232044381')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (2, N'Rashida', N'Brammer', N'70687629632')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (3, N'Mohamed', N'Krall', N'52688435003')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (4, N'Shante', N'Karr', N'73706803851')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (5, N'Rosaura', N'Rames', N'70477806324')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (6, N'Toi', N'Courchesne', N'37756763508')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (7, N'Precious', N'Wismer', N'15287468908')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (8, N'Josefa', N'Otte', N'68886927765')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (9, N'Afton', N'Harrington', N'41731972558')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (10, N'Daphne', N'Morrow', N'49099375842')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (11, N'Dottie', N'Polson', N'91205317719')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (12, N'Alleen', N'Nally', N'26312971918')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (13, N'Hilton', N'Odom', N'66197770749')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (14, N'Shawn', N'Hillebrand', N'64091780262')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (15, N'Lorelei', N'Kettler', N'73606665126')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (16, N'Jalisa', N'Gossage', N'10484197749')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (17, N'Germaine', N'Sim', N'62454794026')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (18, N'Suzanna', N'Wollman', N'97932678482')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (19, N'Jennette', N'Besse', N'26229712670')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (20, N'Margherita', N'Anstine', N'87423893204')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (21, N'Earleen', N'Lambright', N'64658700776')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (22, N'Lyn', N'Valdivia', N'32010885662')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (23, N'Alycia', N'Couey', N'41716866650')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (24, N'Lewis', N'Rousey', N'16716397946')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (25, N'Tanja', N'Profitt', N'77230010211')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (26, N'Cherie', N'Whyte', N'33510813739')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (27, N'Efren', N'Leaf', N'72090665294')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (28, N'Delta', N'Darcangelo', N'73136120450')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (29, N'Jess', N'Bodnar', N'12207277240')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Phone]) VALUES (30, N'Sudie', N'Parkhurst', N'26842289705')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([ID], [Name]) VALUES (1, N'Kazan')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (2, N'Volka')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (3, N'Moscow')
SET IDENTITY_INSERT [dbo].[Locations] OFF
ALTER TABLE [dbo].[AssetPhotos]  WITH CHECK ADD  CONSTRAINT [FK_AssetPhotos_Assets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[AssetPhotos] CHECK CONSTRAINT [FK_AssetPhotos_Assets]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_AssetGroups] FOREIGN KEY([AssetGroupID])
REFERENCES [dbo].[AssetGroups] ([ID])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_AssetGroups]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_DepartmentLocations] FOREIGN KEY([DepartmentLocationID])
REFERENCES [dbo].[DepartmentLocations] ([ID])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_DepartmentLocations]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_Employees]
GO
ALTER TABLE [dbo].[AssetTransferLogs]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransferLogs_DepartmentLocations] FOREIGN KEY([FromDepartmentLocationID])
REFERENCES [dbo].[DepartmentLocations] ([ID])
GO
ALTER TABLE [dbo].[AssetTransferLogs] CHECK CONSTRAINT [FK_AssetTransferLogs_DepartmentLocations]
GO
ALTER TABLE [dbo].[AssetTransferLogs]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransferLogs_DepartmentLocations1] FOREIGN KEY([ToDepartmentLocationID])
REFERENCES [dbo].[DepartmentLocations] ([ID])
GO
ALTER TABLE [dbo].[AssetTransferLogs] CHECK CONSTRAINT [FK_AssetTransferLogs_DepartmentLocations1]
GO
ALTER TABLE [dbo].[AssetTransferLogs]  WITH CHECK ADD  CONSTRAINT [FK_AssetTransfers_Assets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[AssetTransferLogs] CHECK CONSTRAINT [FK_AssetTransfers_Assets]
GO
ALTER TABLE [dbo].[DepartmentLocations]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentLocations_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[DepartmentLocations] CHECK CONSTRAINT [FK_DepartmentLocations_Departments]
GO
ALTER TABLE [dbo].[DepartmentLocations]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentLocations_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[DepartmentLocations] CHECK CONSTRAINT [FK_DepartmentLocations_Locations]
GO
ALTER DATABASE [Session1] SET  READ_WRITE 
GO
