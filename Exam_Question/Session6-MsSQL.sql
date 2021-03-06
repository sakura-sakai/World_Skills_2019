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
/****** Object:  Table [dbo].[DepartmentLocations]    Script Date: 8/25/2019 1:40:22 PM ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 8/25/2019 1:40:22 PM ******/
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
/****** Object:  Table [dbo].[EmergencyMaintenances]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyMaintenances](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetID] [bigint] NOT NULL,
	[PriorityID] [bigint] NOT NULL,
	[DescriptionEmergency] [nvarchar](200) NOT NULL,
	[OtherConsiderations] [nvarchar](200) NOT NULL,
	[EMRequestDate] [date] NOT NULL,
	[EMStartDate] [date] NULL,
	[EMEndDate] [date] NULL,
	[EMTechnicianNote] [nvarchar](200) NULL,
 CONSTRAINT [PK_EMS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 8/25/2019 1:40:22 PM ******/
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
/****** Object:  Table [dbo].[OrderItems]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[PartID] [bigint] NOT NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Stock] [decimal](18, 2) NULL,
	[UnitPrice] [money] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionTypeID] [bigint] NOT NULL,
	[SupplierID] [bigint] NULL,
	[EmergencyMaintenancesID] [bigint] NULL,
	[SourceWarehouseID] [bigint] NULL,
	[DestinationWarehouseID] [bigint] NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NULL,
 CONSTRAINT [PK_SupplierHeaders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EffectiveLife] [bigint] NULL,
	[BatchNumberHasRequired] [bit] NULL,
	[MinimumQuantity] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionTypes]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 8/25/2019 1:40:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (1, N'05/04/0001', N'Toyota Hilux FAF321', 3, 5, 4, N'', NULL)
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (2, N'04/03/0001', N'Suction Line 852', 7, 8, 3, N'', CAST(N'2020-03-02' AS Date))
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (3, N'01/01/0001', N'ZENY 3,5CFM Single-Stage 5 Pa Rotary Vane', 11, 22, 1, N'', CAST(N'2018-01-17' AS Date))
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (4, N'05/04/0002', N'Volvo FH16', 4, 26, 4, N'', NULL)
SET IDENTITY_INSERT [dbo].[Assets] OFF
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
SET IDENTITY_INSERT [dbo].[EmergencyMaintenances] ON 

INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (1, 1, 2, N'Car does not start', N'none', CAST(N'2019-08-25' AS Date), CAST(N'2019-08-25' AS Date), NULL, NULL)
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (2, 4, 1, N'Perforated tire', N'none', CAST(N'2019-08-25' AS Date), CAST(N'2019-08-25' AS Date), NULL, NULL)
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (3, 4, 1, N'Preforated tire', N'none', CAST(N'2017-09-29' AS Date), CAST(N'2017-09-29' AS Date), CAST(N'2017-09-29' AS Date), N'The tire changed')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (4, 4, 2, N'', N'', CAST(N'2017-01-05' AS Date), CAST(N'2017-01-05' AS Date), CAST(N'2017-01-06' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (5, 1, 2, N'', N'', CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-26' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (6, 1, 1, N'', N'', CAST(N'2017-02-14' AS Date), CAST(N'2017-02-14' AS Date), CAST(N'2017-02-15' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (7, 3, 3, N'', N'', CAST(N'2017-03-06' AS Date), CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (8, 1, 3, N'', N'', CAST(N'2017-03-26' AS Date), CAST(N'2017-03-26' AS Date), CAST(N'2017-03-27' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (9, 2, 1, N'', N'', CAST(N'2017-04-15' AS Date), CAST(N'2017-04-15' AS Date), CAST(N'2017-04-16' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (10, 1, 3, N'', N'', CAST(N'2017-05-05' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (11, 3, 1, N'', N'', CAST(N'2017-05-25' AS Date), CAST(N'2017-05-25' AS Date), CAST(N'2017-05-26' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (12, 2, 1, N'', N'', CAST(N'2017-06-14' AS Date), CAST(N'2017-06-14' AS Date), CAST(N'2017-06-15' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (13, 1, 3, N'', N'', CAST(N'2017-07-04' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-05' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (14, 3, 2, N'', N'', CAST(N'2017-07-24' AS Date), CAST(N'2017-07-24' AS Date), CAST(N'2017-07-25' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (15, 1, 3, N'', N'', CAST(N'2017-08-13' AS Date), CAST(N'2017-08-13' AS Date), CAST(N'2017-08-14' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (16, 1, 1, N'', N'', CAST(N'2017-09-02' AS Date), CAST(N'2017-09-02' AS Date), CAST(N'2017-09-03' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (17, 1, 1, N'', N'', CAST(N'2017-09-22' AS Date), CAST(N'2017-09-22' AS Date), CAST(N'2017-09-23' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (18, 4, 1, N'', N'', CAST(N'2017-12-12' AS Date), CAST(N'2017-12-12' AS Date), CAST(N'2017-12-13' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (19, 3, 2, N'', N'', CAST(N'2017-12-01' AS Date), CAST(N'2017-12-01' AS Date), CAST(N'2017-12-02' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (20, 4, 2, N'', N'', CAST(N'2017-12-21' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2017-12-22' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (21, 1, 2, N'', N'', CAST(N'2017-12-11' AS Date), CAST(N'2017-12-11' AS Date), CAST(N'2017-12-12' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (22, 1, 1, N'', N'', CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (23, 3, 1, N'', N'', CAST(N'2018-01-20' AS Date), CAST(N'2018-01-20' AS Date), CAST(N'2018-01-20' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (24, 4, 1, N'', N'', CAST(N'2018-02-09' AS Date), CAST(N'2018-02-09' AS Date), CAST(N'2018-02-09' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (25, 1, 3, N'', N'', CAST(N'2018-03-01' AS Date), CAST(N'2018-03-01' AS Date), CAST(N'2018-03-01' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (26, 3, 3, N'', N'', CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (27, 1, 2, N'', N'', CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (28, 4, 1, N'', N'', CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (29, 1, 1, N'', N'', CAST(N'2018-05-20' AS Date), CAST(N'2018-05-20' AS Date), CAST(N'2018-05-20' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (30, 2, 1, N'', N'', CAST(N'2018-06-09' AS Date), CAST(N'2018-06-09' AS Date), CAST(N'2018-06-09' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (31, 1, 3, N'', N'', CAST(N'2018-06-29' AS Date), CAST(N'2018-06-29' AS Date), CAST(N'2018-06-29' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (32, 4, 2, N'', N'', CAST(N'2017-01-05' AS Date), CAST(N'2017-01-05' AS Date), CAST(N'2017-01-06' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (33, 1, 2, N'', N'', CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-26' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (34, 1, 1, N'', N'', CAST(N'2017-02-14' AS Date), CAST(N'2017-02-14' AS Date), CAST(N'2017-02-15' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (35, 3, 3, N'', N'', CAST(N'2017-03-06' AS Date), CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (36, 1, 3, N'', N'', CAST(N'2017-03-26' AS Date), CAST(N'2017-03-26' AS Date), CAST(N'2017-03-27' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (37, 2, 1, N'', N'', CAST(N'2017-04-15' AS Date), CAST(N'2017-04-15' AS Date), CAST(N'2017-04-16' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (38, 1, 3, N'', N'', CAST(N'2017-05-05' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (39, 3, 1, N'', N'', CAST(N'2017-05-25' AS Date), CAST(N'2017-05-25' AS Date), CAST(N'2017-05-26' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (40, 2, 1, N'', N'', CAST(N'2017-06-14' AS Date), CAST(N'2017-06-14' AS Date), CAST(N'2017-06-15' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (41, 1, 3, N'', N'', CAST(N'2017-07-04' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-05' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (42, 3, 2, N'', N'', CAST(N'2017-07-24' AS Date), CAST(N'2017-07-24' AS Date), CAST(N'2017-07-25' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (43, 1, 3, N'', N'', CAST(N'2017-08-13' AS Date), CAST(N'2017-08-13' AS Date), CAST(N'2017-08-14' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (44, 1, 1, N'', N'', CAST(N'2017-09-02' AS Date), CAST(N'2017-09-02' AS Date), CAST(N'2017-09-03' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (45, 1, 1, N'', N'', CAST(N'2017-09-22' AS Date), CAST(N'2017-09-22' AS Date), CAST(N'2017-09-23' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (46, 4, 1, N'', N'', CAST(N'2017-12-12' AS Date), CAST(N'2017-12-12' AS Date), CAST(N'2017-12-13' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (47, 3, 2, N'', N'', CAST(N'2017-12-01' AS Date), CAST(N'2017-12-01' AS Date), CAST(N'2017-12-02' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (48, 4, 2, N'', N'', CAST(N'2017-12-21' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2017-12-22' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (49, 1, 2, N'', N'', CAST(N'2017-12-11' AS Date), CAST(N'2017-12-11' AS Date), CAST(N'2017-12-12' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (50, 1, 1, N'', N'', CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (51, 3, 1, N'', N'', CAST(N'2018-01-20' AS Date), CAST(N'2018-01-20' AS Date), CAST(N'2018-01-20' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (52, 4, 1, N'', N'', CAST(N'2018-02-09' AS Date), CAST(N'2018-02-09' AS Date), CAST(N'2018-02-09' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (53, 1, 3, N'', N'', CAST(N'2018-03-01' AS Date), CAST(N'2018-03-01' AS Date), CAST(N'2018-03-01' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (54, 3, 3, N'', N'', CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-03-21' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (55, 1, 2, N'', N'', CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (56, 4, 1, N'', N'', CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (57, 1, 1, N'', N'', CAST(N'2018-05-20' AS Date), CAST(N'2018-05-20' AS Date), CAST(N'2018-05-20' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (58, 2, 1, N'', N'', CAST(N'2018-06-09' AS Date), CAST(N'2018-06-09' AS Date), CAST(N'2018-06-09' AS Date), N'')
INSERT [dbo].[EmergencyMaintenances] ([ID], [AssetID], [PriorityID], [DescriptionEmergency], [OtherConsiderations], [EMRequestDate], [EMStartDate], [EMEndDate], [EMTechnicianNote]) VALUES (59, 1, 3, N'', N'', CAST(N'2018-06-29' AS Date), CAST(N'2018-06-29' AS Date), CAST(N'2018-06-29' AS Date), N'')
SET IDENTITY_INSERT [dbo].[EmergencyMaintenances] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([ID], [Name]) VALUES (1, N'Kazan')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (2, N'Volka')
INSERT [dbo].[Locations] ([ID], [Name]) VALUES (3, N'Moscow')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (1, 1, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 330.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (2, 1, 6, N'SL1258', CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (3, 1, 1, N'', CAST(4.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 481.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (5, 1, 10, N'TR740LKO', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (6, 1, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1740.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (7, 2, 4, N'XP985S', CAST(4.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 450.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (9, 2, 7, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1000.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (10, 2, 3, N'', CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (11, 2, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 332.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (12, 3, 4, N'XM471W', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 127.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (13, 3, 5, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (14, 3, 1, N'', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 440.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (16, 3, 2, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (17, 4, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 311.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (19, 4, 3, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (20, 5, 10, N'TB44705KO', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 580.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (21, 5, 12, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1740.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (22, 5, 6, N'KL4701', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 541.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (23, 5, 7, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1101.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (25, 5, 11, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (26, 6, 8, N'', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 330.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (27, 6, 2, N'', CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (29, 6, 12, N'', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1740.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (30, 6, 4, N'XP985S', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 460.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (31, 7, 11, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (32, 7, 6, N'KL4701', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 542.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (33, 7, 3, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (36, 8, 3, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (37, 8, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (38, 9, 9, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (39, 9, 6, N'KL4701', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 543.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (41, 9, 11, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (42, 10, 12, N'', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 1742.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (43, 10, 8, N'', CAST(5.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 370.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (44, 11, 7, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1150.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (45, 11, 1, N'', CAST(4.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 450.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (46, 11, 2, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (47, 11, 10, N'TJ140OO', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 11.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (48, 12, 6, N'KL4701', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 544.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (49, 12, 11, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (50, 12, 3, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (51, 12, 9, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (52, 13, 4, N'XM471W', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 126.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (53, 14, 5, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (54, 14, 11, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (55, 14, 12, N'', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1742.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (56, 15, 4, N'XM471W', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 125.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (57, 15, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 329.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (58, 15, 6, N'KO4570', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1580.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (60, 16, 8, N'', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 318.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (61, 16, 12, N'', CAST(3.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1743.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (62, 16, 10, N'TJ140OO', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 16.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (63, 16, 7, N'', CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1155.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (64, 17, 7, N'', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 999.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (65, 17, 9, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (67, 18, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 433.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (68, 18, 5, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (69, 18, 4, N'XM471W', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 124.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (72, 19, 4, N'XM471W', CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 123.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (73, 19, 1, N'', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 480.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (74, 20, 4, N'XM471W', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 111.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (75, 20, 7, N'', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 997.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (77, 21, 1, N'', CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 472.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (78, 21, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 313.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (79, 21, 6, N'KO4570', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1582.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (80, 22, 9, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (81, 22, 11, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (82, 22, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (83, 23, 3, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (84, 23, 5, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (85, 23, 6, N'SL1258', CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 255.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (86, 23, 10, N'TJ140OO', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 23.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (87, 24, 2, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (88, 24, 1, N'', CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 470.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (89, 24, 11, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (91, 25, 8, N'', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 340.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (93, 25, 11, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (95, 26, 5, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (96, 26, 9, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (97, 27, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1155.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (98, 27, 2, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (99, 28, 11, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (100, 28, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (101, 28, 4, N'XP985S', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 450.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (102, 29, 1, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 472.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (104, 29, 2, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (105, 29, 5, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (106, 29, 4, N'XP985S', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 460.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (107, 30, 11, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (108, 30, 6, N'SL1258', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (110, 31, 10, N'TR740LKO', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (112, 31, 12, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1743.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (113, 32, 11, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (114, 32, 10, N'TJ140OO', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 16.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (115, 32, 12, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1740.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (116, 33, 8, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 370.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (118, 33, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 999.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (119, 34, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 313.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (120, 34, 9, N'', CAST(16.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
GO
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (122, 34, 7, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1155.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (123, 35, 10, N'TB44705KO', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 580.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (124, 35, 1, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 481.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (125, 35, 3, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (126, 35, 5, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (127, 36, 7, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1101.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (128, 36, 2, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (129, 37, 8, N'', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 330.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (130, 37, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (131, 37, 4, N'XM471W', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 127.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (132, 37, 2, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 780.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (133, 37, 1, N'', CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 450.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (134, 37, 3, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 180.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (135, 37, 7, N'', CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1000.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (136, 37, 7, N'', CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1150.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (137, 38, 4, N'Xl1245', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (138, 39, 4, N'Xl1245', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (139, 40, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (140, 40, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (141, 40, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 744.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (142, 40, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (143, 41, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 71.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (144, 41, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 487.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (145, 41, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (146, 41, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (147, 42, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 89.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (148, 42, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (149, 42, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (150, 43, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (151, 43, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (152, 43, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (153, 43, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (154, 43, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (155, 44, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (156, 44, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (157, 45, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (158, 45, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (159, 46, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (160, 46, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (161, 46, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (162, 46, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (163, 46, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (164, 47, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (165, 47, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 78.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (166, 47, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 77.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (167, 47, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 74.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (168, 47, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 675.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (169, 47, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (170, 47, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (171, 47, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (172, 48, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (173, 48, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (174, 48, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (175, 48, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (176, 49, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (177, 49, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (178, 49, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (179, 50, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 75.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (180, 50, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 460.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (181, 50, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (182, 50, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (183, 50, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (184, 51, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (185, 51, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (186, 51, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 746.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (187, 51, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 401.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (188, 51, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 424.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (189, 52, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 756.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (190, 52, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 443.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (191, 53, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 71.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (192, 53, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (193, 53, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (194, 53, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (195, 53, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (196, 53, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (197, 54, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (198, 54, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (199, 54, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 414.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (200, 54, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 438.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (201, 54, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (202, 54, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (203, 54, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (204, 55, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (205, 55, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (206, 55, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (207, 56, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 77.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (208, 56, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 470.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (209, 56, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (210, 56, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (211, 57, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 445.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (212, 57, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (213, 57, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (214, 57, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (215, 58, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 752.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (216, 58, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (217, 58, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (218, 59, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (219, 59, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (220, 59, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (221, 59, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
GO
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (222, 59, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (223, 59, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (224, 60, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 881.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (225, 60, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (226, 60, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (227, 61, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (228, 61, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (229, 61, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (230, 61, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (231, 61, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (232, 62, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (233, 63, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (234, 63, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (235, 63, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (236, 63, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (237, 63, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (238, 64, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 598.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (239, 64, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (240, 64, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (241, 64, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (242, 64, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (243, 65, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (244, 65, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 70.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (245, 65, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (246, 65, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 462.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (247, 65, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (248, 66, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 610.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (249, 66, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (250, 66, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (251, 66, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (252, 66, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (253, 67, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (254, 67, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 74.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (255, 67, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (256, 67, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (257, 67, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (258, 68, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (259, 68, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (260, 69, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (261, 69, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (262, 69, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (263, 69, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (264, 69, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (265, 70, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 489.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (266, 70, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (267, 70, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (268, 71, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (269, 71, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (270, 71, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 606.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (271, 71, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (272, 72, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (273, 72, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 79.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (274, 72, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 678.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (275, 72, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (276, 72, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (277, 73, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 72.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (278, 73, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (279, 74, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 808.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (280, 74, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (281, 74, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (282, 74, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (283, 74, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (284, 75, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (285, 75, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (286, 75, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (287, 75, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (288, 75, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (289, 75, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (290, 75, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (291, 76, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (292, 76, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (293, 77, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (294, 77, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 76.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (295, 77, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 877.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (296, 77, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 617.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (297, 77, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 778.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (298, 77, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 747.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (299, 77, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (300, 77, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (301, 77, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (302, 78, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (303, 78, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 70.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (304, 78, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (305, 78, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (306, 79, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 70.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (307, 79, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 626.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (308, 79, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 896.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (309, 79, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (310, 80, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 801.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (311, 80, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (312, 81, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (313, 81, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (314, 81, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (315, 81, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (316, 81, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (317, 82, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 417.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (318, 82, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (319, 83, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (320, 83, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (321, 84, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
GO
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (322, 84, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (323, 84, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (324, 84, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (325, 84, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (326, 84, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (327, 85, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 89.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (328, 85, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 71.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (329, 85, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (330, 85, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (331, 85, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (332, 85, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (333, 85, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (334, 85, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (335, 86, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (336, 87, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (337, 87, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (338, 87, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (339, 87, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 454.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (340, 87, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (341, 87, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (342, 87, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (343, 87, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (344, 87, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (345, 88, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 615.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (346, 88, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (347, 88, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (348, 88, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (349, 89, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (350, 89, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 75.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (351, 89, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 421.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (352, 89, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (353, 89, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (354, 90, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (355, 90, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (356, 90, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 543.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (357, 90, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 793.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (358, 90, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (359, 90, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (360, 91, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (361, 91, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (362, 91, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (363, 91, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (364, 91, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (365, 91, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 634.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (366, 91, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 682.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (367, 91, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 745.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (368, 91, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (369, 91, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (370, 92, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (371, 92, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (372, 92, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 75.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (373, 92, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 488.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (374, 92, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (375, 93, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 74.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (376, 93, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 459.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (377, 93, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (378, 93, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (379, 93, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (380, 94, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 559.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (381, 94, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 402.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (382, 94, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 467.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (383, 94, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (384, 95, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (385, 95, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 607.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (386, 96, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (387, 96, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (388, 96, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (389, 97, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (390, 97, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 612.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (391, 97, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (392, 97, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (393, 98, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (394, 98, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (395, 98, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 596.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (396, 98, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 469.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (397, 98, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 426.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (398, 99, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (399, 99, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (400, 100, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 452.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (401, 100, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (402, 100, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (403, 100, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (404, 101, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (405, 101, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 626.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (406, 101, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (407, 101, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 459.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (408, 101, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (409, 101, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 402.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (410, 102, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (411, 102, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (412, 103, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (413, 104, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (414, 104, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 75.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (415, 105, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (416, 105, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (417, 105, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (418, 105, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (419, 105, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (420, 105, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (421, 105, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 896.0000)
GO
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (422, 107, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (423, 107, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (424, 107, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (425, 107, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (426, 108, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (427, 108, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (428, 108, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 70.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (429, 108, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (430, 108, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (431, 108, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (432, 109, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 756.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (433, 109, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (434, 109, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (435, 109, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (436, 110, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (437, 110, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 74.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (438, 111, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (439, 111, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (440, 111, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (441, 111, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (442, 111, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (443, 112, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 598.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (444, 113, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (445, 113, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (446, 113, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (447, 113, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (448, 113, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (449, 113, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (450, 113, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (451, 114, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 77.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (452, 114, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (453, 114, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (454, 114, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 421.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (455, 114, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 543.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (456, 114, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 634.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (457, 114, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (458, 114, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (459, 115, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (460, 115, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 401.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (461, 115, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (462, 115, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (463, 115, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 801.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (464, 115, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (465, 115, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 596.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (466, 116, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (467, 116, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (468, 116, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 745.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (469, 117, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (470, 117, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (471, 119, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (472, 119, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (473, 119, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 606.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (474, 119, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 877.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (475, 120, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (476, 120, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (477, 120, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 615.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (478, 120, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (479, 120, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 612.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (480, 121, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (481, 121, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (482, 121, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 438.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (483, 121, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (484, 121, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (485, 121, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (486, 121, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (487, 122, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (488, 122, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (489, 123, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (490, 123, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (491, 123, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 467.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (492, 124, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (493, 124, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (494, 124, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (495, 124, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 70.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (496, 124, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (497, 124, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (498, 124, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (499, 125, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 881.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (500, 125, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (501, 125, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (502, 125, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (503, 125, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (504, 126, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (505, 126, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 675.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (506, 126, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (507, 126, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (508, 126, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (509, 127, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (510, 127, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (511, 127, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (512, 127, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (513, 127, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (514, 127, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (515, 127, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (516, 127, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (517, 128, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (518, 128, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (519, 128, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (520, 128, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (521, 128, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
GO
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (522, 129, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (523, 129, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 75.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (524, 129, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (525, 129, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 414.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (526, 129, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (527, 129, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (528, 129, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 417.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (529, 130, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (530, 130, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (531, 130, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (532, 130, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (533, 130, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 88.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (534, 130, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (535, 131, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 487.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (536, 131, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (537, 131, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (538, 131, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (539, 131, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (540, 132, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (541, 132, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (542, 132, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (543, 132, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 89.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (544, 132, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (545, 133, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (546, 133, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (547, 133, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 747.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (548, 134, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (549, 134, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 70.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (550, 134, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 793.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (551, 134, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 426.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (552, 135, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (553, 135, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (554, 135, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (555, 135, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (556, 135, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 74.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (557, 135, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (558, 135, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 617.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (559, 135, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (560, 136, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 78.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (561, 136, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (562, 136, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 778.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (563, 137, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (564, 137, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (565, 137, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 79.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (566, 138, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (567, 139, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (568, 139, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (569, 139, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (570, 139, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (571, 140, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 77.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (572, 140, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (573, 140, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (574, 141, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (575, 141, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 71.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (576, 141, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (577, 141, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (578, 142, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (579, 142, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (580, 142, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (581, 143, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (582, 143, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (583, 143, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 678.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (584, 143, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 808.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (585, 143, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (586, 144, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (587, 144, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (588, 144, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 74.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (589, 145, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (590, 145, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (591, 145, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 462.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (592, 145, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (593, 145, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (594, 145, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (595, 145, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 559.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (596, 146, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 89.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (597, 146, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (598, 146, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (599, 146, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (600, 146, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 72.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (601, 146, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (602, 146, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (603, 147, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (604, 147, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 489.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (605, 147, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 454.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (606, 147, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 452.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (607, 148, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (608, 148, 8, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 320.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (609, 148, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (610, 148, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (611, 148, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (612, 149, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (613, 149, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (614, 149, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 73.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (615, 149, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 682.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (616, 150, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (617, 150, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (618, 150, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (619, 150, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (620, 150, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 86.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (621, 150, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
GO
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (622, 151, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (623, 151, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (624, 151, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (625, 151, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 83.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (626, 152, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 445.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (627, 152, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 85.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (628, 152, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 469.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (629, 153, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (630, 153, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 424.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (631, 153, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (632, 153, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 90.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (633, 153, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (634, 153, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (635, 153, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 87.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (636, 153, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 80.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (637, 153, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 607.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (638, 153, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 81.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (639, 155, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 746.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (640, 155, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 443.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (641, 155, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (642, 155, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (643, 155, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (644, 156, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 71.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (645, 156, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 470.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (646, 156, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (647, 156, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 488.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (648, 157, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 71.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (649, 157, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (650, 157, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (651, 158, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (652, 158, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (653, 158, 12, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 6300.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (654, 158, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 76.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (655, 159, 7, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 250.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (656, 159, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (657, 159, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 752.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (658, 159, 1, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 82.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (659, 159, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (660, 159, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (661, 159, 11, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 560.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (662, 160, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 84.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (663, 160, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (664, 160, 9, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1500.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (665, 161, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 744.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (666, 161, 5, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 460.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (667, 161, 3, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 610.0000)
INSERT [dbo].[OrderItems] ([ID], [OrderID], [PartID], [BatchNumber], [Amount], [Stock], [UnitPrice]) VALUES (668, 161, 2, N'', CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 75.0000)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (1, 1, 3, NULL, NULL, 2, CAST(N'2019-08-18' AS Date), CAST(N'08:21:28' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (2, 1, 4, NULL, NULL, 1, CAST(N'2019-08-18' AS Date), CAST(N'08:10:41' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (3, 1, 4, NULL, NULL, 1, CAST(N'2019-08-18' AS Date), CAST(N'08:03:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (4, 1, 3, NULL, NULL, 2, CAST(N'2019-08-18' AS Date), CAST(N'08:21:14' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (5, 1, 3, NULL, NULL, 2, CAST(N'2019-08-18' AS Date), CAST(N'08:26:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (6, 1, 2, NULL, NULL, 2, CAST(N'2019-08-18' AS Date), CAST(N'08:04:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (7, 1, 3, NULL, NULL, 1, CAST(N'2019-08-18' AS Date), CAST(N'08:10:05' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (8, 1, 2, NULL, NULL, 1, CAST(N'2019-08-22' AS Date), CAST(N'08:14:58' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (9, 1, 3, NULL, NULL, 2, CAST(N'2019-08-22' AS Date), CAST(N'08:21:34' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (10, 1, 4, NULL, NULL, 2, CAST(N'2019-08-22' AS Date), CAST(N'08:12:15' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (11, 1, 3, NULL, NULL, 1, CAST(N'2019-08-23' AS Date), CAST(N'08:14:52' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (12, 1, 4, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:19:50' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (13, 1, 2, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:03:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (14, 1, 3, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:26:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (15, 1, 2, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:04:00' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (16, 1, 3, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:01:47' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (17, 1, 4, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:21:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (18, 1, 1, NULL, NULL, 2, CAST(N'2019-08-23' AS Date), CAST(N'08:07:22' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (19, 1, 1, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:34:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (20, 1, 2, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:19:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (21, 1, 2, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:37:50' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (22, 1, 4, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:03:37' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (23, 1, 1, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:34:50' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (24, 1, 3, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:25:20' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (25, 1, 3, NULL, NULL, 1, CAST(N'2019-08-24' AS Date), CAST(N'08:31:11' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (26, 1, 2, NULL, NULL, 2, CAST(N'2019-08-24' AS Date), CAST(N'08:14:19' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (27, 2, NULL, NULL, 1, 2, CAST(N'2019-08-18' AS Date), CAST(N'11:25:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (28, 2, NULL, NULL, 1, 2, CAST(N'2019-08-19' AS Date), CAST(N'11:13:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (29, 2, NULL, NULL, 2, 1, CAST(N'2019-08-19' AS Date), CAST(N'11:15:54' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (30, 2, NULL, NULL, 2, 1, CAST(N'2019-08-19' AS Date), CAST(N'11:28:20' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (31, 2, NULL, NULL, 2, 1, CAST(N'2019-08-20' AS Date), CAST(N'11:12:27' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (32, 2, NULL, NULL, 1, 2, CAST(N'2019-08-23' AS Date), CAST(N'11:12:29' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (33, 2, NULL, NULL, 1, 2, CAST(N'2019-08-20' AS Date), CAST(N'11:26:37' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (34, 2, NULL, NULL, 2, 1, CAST(N'2019-08-22' AS Date), CAST(N'11:07:09' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (35, 2, NULL, NULL, 2, 1, CAST(N'2019-08-22' AS Date), CAST(N'11:24:24' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (36, 2, NULL, NULL, 1, 2, CAST(N'2019-08-24' AS Date), CAST(N'11:39:15' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (37, 2, NULL, NULL, 2, 1, CAST(N'2019-08-24' AS Date), CAST(N'11:34:44' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (38, 1, 1, NULL, NULL, 1, CAST(N'2017-09-29' AS Date), CAST(N'08:23:40' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (39, 3, NULL, 3, 1, NULL, CAST(N'2017-09-29' AS Date), CAST(N'16:37:37' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (40, 1, 1, NULL, NULL, 2, CAST(N'2017-06-18' AS Date), CAST(N'08:33:59' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (41, 1, 1, NULL, NULL, 2, CAST(N'2017-06-19' AS Date), CAST(N'08:31:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (42, 1, 3, NULL, NULL, 1, CAST(N'2017-06-20' AS Date), CAST(N'08:11:33' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (43, 1, 3, NULL, NULL, 2, CAST(N'2017-06-21' AS Date), CAST(N'08:04:31' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (44, 1, 2, NULL, NULL, 2, CAST(N'2017-06-22' AS Date), CAST(N'08:01:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (45, 1, 3, NULL, NULL, 2, CAST(N'2017-06-23' AS Date), CAST(N'08:33:16' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (46, 1, 1, NULL, NULL, 2, CAST(N'2017-06-24' AS Date), CAST(N'08:34:36' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (47, 1, 1, NULL, NULL, 2, CAST(N'2017-06-25' AS Date), CAST(N'08:18:31' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (48, 1, 1, NULL, NULL, 2, CAST(N'2017-06-26' AS Date), CAST(N'08:14:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (49, 1, 3, NULL, NULL, 2, CAST(N'2017-06-27' AS Date), CAST(N'08:02:06' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (50, 1, 2, NULL, NULL, 1, CAST(N'2017-06-28' AS Date), CAST(N'08:17:14' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (51, 1, 3, NULL, NULL, 2, CAST(N'2017-06-29' AS Date), CAST(N'08:35:06' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (52, 1, 1, NULL, NULL, 2, CAST(N'2017-06-30' AS Date), CAST(N'08:10:59' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (53, 1, 2, NULL, NULL, 1, CAST(N'2017-07-01' AS Date), CAST(N'08:13:59' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (54, 1, 1, NULL, NULL, 2, CAST(N'2017-07-02' AS Date), CAST(N'08:28:40' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (55, 1, 1, NULL, NULL, 2, CAST(N'2017-07-03' AS Date), CAST(N'08:26:39' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (56, 1, 1, NULL, NULL, 1, CAST(N'2017-07-04' AS Date), CAST(N'08:10:51' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (57, 1, 2, NULL, NULL, 1, CAST(N'2017-07-05' AS Date), CAST(N'08:32:45' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (58, 1, 2, NULL, NULL, 2, CAST(N'2017-07-06' AS Date), CAST(N'08:03:42' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (59, 1, 1, NULL, NULL, 1, CAST(N'2017-07-07' AS Date), CAST(N'08:32:50' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (60, 1, 3, NULL, NULL, 1, CAST(N'2017-07-08' AS Date), CAST(N'08:29:03' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (61, 1, 2, NULL, NULL, 2, CAST(N'2017-07-09' AS Date), CAST(N'08:13:17' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (62, 1, 1, NULL, NULL, 2, CAST(N'2017-07-10' AS Date), CAST(N'08:25:23' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (63, 1, 2, NULL, NULL, 2, CAST(N'2017-07-11' AS Date), CAST(N'08:09:51' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (64, 1, 1, NULL, NULL, 1, CAST(N'2017-07-12' AS Date), CAST(N'08:37:03' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (65, 1, 1, NULL, NULL, 1, CAST(N'2017-07-13' AS Date), CAST(N'08:21:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (66, 1, 2, NULL, NULL, 1, CAST(N'2017-07-14' AS Date), CAST(N'08:17:20' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (67, 1, 3, NULL, NULL, 1, CAST(N'2017-07-15' AS Date), CAST(N'08:00:42' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (68, 1, 3, NULL, NULL, 1, CAST(N'2017-07-16' AS Date), CAST(N'08:29:30' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (69, 1, 3, NULL, NULL, 1, CAST(N'2017-07-17' AS Date), CAST(N'08:30:14' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (70, 1, 3, NULL, NULL, 2, CAST(N'2017-07-18' AS Date), CAST(N'08:19:22' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (71, 1, 3, NULL, NULL, 2, CAST(N'2017-07-19' AS Date), CAST(N'08:08:09' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (72, 1, 3, NULL, NULL, 1, CAST(N'2017-07-20' AS Date), CAST(N'08:30:00' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (73, 1, 2, NULL, NULL, 1, CAST(N'2017-07-21' AS Date), CAST(N'08:07:17' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (74, 1, 3, NULL, NULL, 1, CAST(N'2017-07-22' AS Date), CAST(N'08:24:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (75, 1, 2, NULL, NULL, 1, CAST(N'2017-07-23' AS Date), CAST(N'08:06:35' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (76, 1, 2, NULL, NULL, 2, CAST(N'2017-07-24' AS Date), CAST(N'08:05:08' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (77, 1, 2, NULL, NULL, 2, CAST(N'2017-07-25' AS Date), CAST(N'08:12:14' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (78, 1, 2, NULL, NULL, 2, CAST(N'2017-07-26' AS Date), CAST(N'08:06:12' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (79, 1, 2, NULL, NULL, 2, CAST(N'2017-07-27' AS Date), CAST(N'08:14:33' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (80, 1, 2, NULL, NULL, 2, CAST(N'2017-07-28' AS Date), CAST(N'08:12:27' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (81, 1, 2, NULL, NULL, 1, CAST(N'2017-07-29' AS Date), CAST(N'08:32:27' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (82, 1, 1, NULL, NULL, 1, CAST(N'2017-07-30' AS Date), CAST(N'08:34:54' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (83, 1, 3, NULL, NULL, 1, CAST(N'2017-07-31' AS Date), CAST(N'08:31:07' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (84, 1, 2, NULL, NULL, 2, CAST(N'2017-08-01' AS Date), CAST(N'08:04:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (85, 1, 1, NULL, NULL, 2, CAST(N'2017-08-02' AS Date), CAST(N'08:19:42' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (86, 1, 2, NULL, NULL, 2, CAST(N'2017-08-03' AS Date), CAST(N'08:10:17' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (87, 1, 1, NULL, NULL, 1, CAST(N'2017-08-04' AS Date), CAST(N'08:01:55' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (88, 1, 1, NULL, NULL, 1, CAST(N'2017-08-05' AS Date), CAST(N'08:30:13' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (89, 1, 1, NULL, NULL, 2, CAST(N'2017-08-06' AS Date), CAST(N'08:27:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (90, 1, 3, NULL, NULL, 1, CAST(N'2017-08-07' AS Date), CAST(N'08:35:28' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (91, 1, 2, NULL, NULL, 1, CAST(N'2017-08-08' AS Date), CAST(N'08:07:02' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (92, 1, 3, NULL, NULL, 1, CAST(N'2017-08-09' AS Date), CAST(N'08:12:27' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (93, 1, 2, NULL, NULL, 2, CAST(N'2017-08-10' AS Date), CAST(N'08:08:55' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (94, 1, 3, NULL, NULL, 1, CAST(N'2017-08-11' AS Date), CAST(N'08:39:08' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (95, 1, 1, NULL, NULL, 1, CAST(N'2017-08-12' AS Date), CAST(N'08:16:24' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (96, 1, 3, NULL, NULL, 2, CAST(N'2017-08-13' AS Date), CAST(N'08:06:38' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (97, 1, 1, NULL, NULL, 1, CAST(N'2017-08-14' AS Date), CAST(N'08:06:36' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (98, 1, 2, NULL, NULL, 2, CAST(N'2017-08-15' AS Date), CAST(N'08:19:30' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (99, 1, 3, NULL, NULL, 1, CAST(N'2017-08-16' AS Date), CAST(N'08:08:10' AS Time))
GO
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (100, 1, 2, NULL, NULL, 1, CAST(N'2017-08-17' AS Date), CAST(N'08:39:05' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (101, 3, NULL, 47, 2, NULL, CAST(N'2017-01-05' AS Date), CAST(N'16:36:44' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (102, 3, NULL, 37, 2, NULL, CAST(N'2017-01-25' AS Date), CAST(N'16:37:58' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (103, 3, NULL, 29, 1, NULL, CAST(N'2017-02-14' AS Date), CAST(N'16:20:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (104, 3, NULL, 55, 2, NULL, CAST(N'2017-03-06' AS Date), CAST(N'16:04:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (105, 3, NULL, 46, 2, NULL, CAST(N'2017-03-26' AS Date), CAST(N'16:33:07' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (106, 3, NULL, 44, 2, NULL, CAST(N'2017-04-15' AS Date), CAST(N'16:27:50' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (107, 3, NULL, 4, 2, NULL, CAST(N'2017-05-05' AS Date), CAST(N'16:30:41' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (108, 3, NULL, 22, 2, NULL, CAST(N'2017-05-25' AS Date), CAST(N'16:11:27' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (109, 3, NULL, 28, 2, NULL, CAST(N'2017-06-14' AS Date), CAST(N'16:18:35' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (110, 3, NULL, 35, 2, NULL, CAST(N'2017-07-04' AS Date), CAST(N'16:08:27' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (111, 3, NULL, 52, 1, NULL, CAST(N'2017-07-24' AS Date), CAST(N'16:08:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (112, 3, NULL, 17, 2, NULL, CAST(N'2017-08-13' AS Date), CAST(N'16:24:09' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (113, 3, NULL, 7, 2, NULL, CAST(N'2017-09-02' AS Date), CAST(N'16:03:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (114, 3, NULL, 37, 1, NULL, CAST(N'2017-09-22' AS Date), CAST(N'16:26:26' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (115, 3, NULL, 26, 2, NULL, CAST(N'2017-12-12' AS Date), CAST(N'16:27:28' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (116, 3, NULL, 38, 2, NULL, CAST(N'2017-12-01' AS Date), CAST(N'16:31:45' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (117, 3, NULL, 52, 1, NULL, CAST(N'2017-12-21' AS Date), CAST(N'16:31:19' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (118, 3, NULL, 22, 1, NULL, CAST(N'2017-12-11' AS Date), CAST(N'16:26:18' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (119, 3, NULL, 42, 2, NULL, CAST(N'2017-12-31' AS Date), CAST(N'16:37:42' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (120, 3, NULL, 23, 1, NULL, CAST(N'2018-01-20' AS Date), CAST(N'16:00:14' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (121, 3, NULL, 9, 1, NULL, CAST(N'2018-02-09' AS Date), CAST(N'16:26:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (122, 3, NULL, 43, 2, NULL, CAST(N'2018-03-01' AS Date), CAST(N'16:24:51' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (123, 3, NULL, 42, 2, NULL, CAST(N'2018-03-21' AS Date), CAST(N'16:19:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (124, 3, NULL, 4, 2, NULL, CAST(N'2018-04-10' AS Date), CAST(N'16:22:13' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (125, 3, NULL, 18, 1, NULL, CAST(N'2018-04-30' AS Date), CAST(N'16:31:04' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (126, 3, NULL, 53, 1, NULL, CAST(N'2018-05-20' AS Date), CAST(N'16:15:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (127, 3, NULL, 7, 1, NULL, CAST(N'2018-06-09' AS Date), CAST(N'16:30:05' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (128, 3, NULL, 41, 1, NULL, CAST(N'2018-06-29' AS Date), CAST(N'16:36:50' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (129, 3, NULL, 49, 1, NULL, CAST(N'2017-01-05' AS Date), CAST(N'16:39:57' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (130, 3, NULL, 24, 1, NULL, CAST(N'2017-01-25' AS Date), CAST(N'16:24:23' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (131, 3, NULL, 9, 2, NULL, CAST(N'2017-02-14' AS Date), CAST(N'16:18:38' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (132, 3, NULL, 56, 2, NULL, CAST(N'2017-03-06' AS Date), CAST(N'16:11:40' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (133, 3, NULL, 35, 1, NULL, CAST(N'2017-03-26' AS Date), CAST(N'16:19:42' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (134, 3, NULL, 38, 1, NULL, CAST(N'2017-04-15' AS Date), CAST(N'16:30:15' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (135, 3, NULL, 38, 1, NULL, CAST(N'2017-05-05' AS Date), CAST(N'16:38:07' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (136, 3, NULL, 40, 1, NULL, CAST(N'2017-05-25' AS Date), CAST(N'16:29:48' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (137, 3, NULL, 56, 2, NULL, CAST(N'2017-06-14' AS Date), CAST(N'16:24:06' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (138, 3, NULL, 24, 2, NULL, CAST(N'2017-07-04' AS Date), CAST(N'16:06:11' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (139, 3, NULL, 5, 2, NULL, CAST(N'2017-07-24' AS Date), CAST(N'16:27:53' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (140, 3, NULL, 25, 2, NULL, CAST(N'2017-08-13' AS Date), CAST(N'16:32:49' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (141, 3, NULL, 30, 2, NULL, CAST(N'2017-09-02' AS Date), CAST(N'16:11:51' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (142, 3, NULL, 41, 1, NULL, CAST(N'2017-09-22' AS Date), CAST(N'16:29:58' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (143, 3, NULL, 34, 1, NULL, CAST(N'2017-12-12' AS Date), CAST(N'16:05:21' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (144, 3, NULL, 22, 1, NULL, CAST(N'2017-12-01' AS Date), CAST(N'16:18:31' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (145, 3, NULL, 59, 2, NULL, CAST(N'2017-12-21' AS Date), CAST(N'16:25:31' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (146, 3, NULL, 33, 2, NULL, CAST(N'2017-12-11' AS Date), CAST(N'16:14:17' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (147, 3, NULL, 22, 2, NULL, CAST(N'2017-12-31' AS Date), CAST(N'16:38:13' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (148, 3, NULL, 36, 1, NULL, CAST(N'2018-01-20' AS Date), CAST(N'16:32:21' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (149, 3, NULL, 59, 1, NULL, CAST(N'2018-02-09' AS Date), CAST(N'16:18:17' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (150, 3, NULL, 36, 2, NULL, CAST(N'2018-03-01' AS Date), CAST(N'16:01:37' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (151, 3, NULL, 50, 1, NULL, CAST(N'2018-03-21' AS Date), CAST(N'16:24:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (152, 3, NULL, 42, 1, NULL, CAST(N'2018-04-10' AS Date), CAST(N'16:24:41' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (153, 3, NULL, 52, 1, NULL, CAST(N'2018-04-30' AS Date), CAST(N'16:13:02' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (154, 3, NULL, 16, 2, NULL, CAST(N'2018-05-20' AS Date), CAST(N'16:09:10' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (155, 3, NULL, 42, 1, NULL, CAST(N'2018-06-09' AS Date), CAST(N'16:23:25' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (156, 3, NULL, 48, 1, NULL, CAST(N'2018-06-29' AS Date), CAST(N'16:26:54' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (157, 3, NULL, 53, 2, NULL, CAST(N'2017-08-13' AS Date), CAST(N'16:17:32' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (158, 3, NULL, 35, 1, NULL, CAST(N'2017-08-14' AS Date), CAST(N'16:05:01' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (159, 3, NULL, 28, 2, NULL, CAST(N'2017-08-15' AS Date), CAST(N'16:14:38' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (160, 3, NULL, 11, 1, NULL, CAST(N'2017-08-16' AS Date), CAST(N'16:33:38' AS Time))
INSERT [dbo].[Orders] ([ID], [TransactionTypeID], [SupplierID], [EmergencyMaintenancesID], [SourceWarehouseID], [DestinationWarehouseID], [Date], [Time]) VALUES (161, 3, NULL, 20, 1, NULL, CAST(N'2017-08-17' AS Date), CAST(N'16:09:51' AS Time))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Parts] ON 

INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (1, N'BLUE STORM Battery 12V 45Ah 54459', 650, 0, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (2, N'BLUE STORM Battery 12V 70Ah 80D26L', 700, 0, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (3, N'CT20 Turbo Turbocharger', NULL, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (4, N'michelin tyres   525/65 ZR 20.5', 1000, 1, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (5, N'MOCA Engine Timing Chain Kit ', NULL, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (6, N'CT16V Turbo Cartridge Core', NULL, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (7, N'iFJF 21100-35520 New Carburetor', NULL, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (8, N'ALAVENTE 21100-35463 Carburetor ', NULL, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (9, N'Carter P4594 In-Line Electric Fuel Pump', NULL, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (10, N'Electric Fuel Pump Universal Fuel Pump 12V ', NULL, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (11, N'Gast AT05 Rotary Vane ', NULL, 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Parts] ([ID], [Name], [EffectiveLife], [BatchNumberHasRequired], [MinimumQuantity]) VALUES (12, N'FAN 24" M480', 200, 0, CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Parts] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (1, N'MJOK petroleum')
INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (2, N'Kazan Bosch  Center')
INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (3, N'Denso Corp')
INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (4, N'MJOK petroleum')
INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (5, N'Kazan Bosch  Center')
INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (6, N'Denso Corp')
INSERT [dbo].[Suppliers] ([ID], [Name]) VALUES (7, N'Castrol Crop')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[TransactionTypes] ON 

INSERT [dbo].[TransactionTypes] ([ID], [Name]) VALUES (1, N'Purchase Order')
INSERT [dbo].[TransactionTypes] ([ID], [Name]) VALUES (2, N'Warehouse Management')
INSERT [dbo].[TransactionTypes] ([ID], [Name]) VALUES (3, N'Used on Emergency Maintenance')
INSERT [dbo].[TransactionTypes] ([ID], [Name]) VALUES (4, N'Extermination Part')
SET IDENTITY_INSERT [dbo].[TransactionTypes] OFF
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([ID], [Name]) VALUES (1, N'Central Warehouse')
INSERT [dbo].[Warehouses] ([ID], [Name]) VALUES (2, N'Volka  Warehouse')
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_DepartmentLocations] FOREIGN KEY([DepartmentLocationID])
REFERENCES [dbo].[DepartmentLocations] ([ID])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_DepartmentLocations]
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
ALTER TABLE [dbo].[EmergencyMaintenances]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyMaintenances_Assets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[EmergencyMaintenances] CHECK CONSTRAINT [FK_EmergencyMaintenances_Assets]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Parts] FOREIGN KEY([PartID])
REFERENCES [dbo].[Parts] ([ID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_Transactions_Parts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Headers_EmergencyMaintenances] FOREIGN KEY([EmergencyMaintenancesID])
REFERENCES [dbo].[EmergencyMaintenances] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Headers_EmergencyMaintenances]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Headers_Stocks] FOREIGN KEY([SourceWarehouseID])
REFERENCES [dbo].[Warehouses] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Headers_Stocks]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Headers_Stocks1] FOREIGN KEY([DestinationWarehouseID])
REFERENCES [dbo].[Warehouses] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Headers_Stocks1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Headers_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Headers_Suppliers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Headers_TransactionTypes] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[TransactionTypes] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Headers_TransactionTypes]
GO
ALTER DATABASE [Session6] SET  READ_WRITE 
GO
