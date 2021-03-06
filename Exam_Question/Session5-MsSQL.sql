SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RockTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BackgroundColor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RockTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellLayers]    Script Date: 8/24/2019 9:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellLayers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[WellID] [bigint] NOT NULL,
	[RockTypeID] [bigint] NOT NULL,
	[StartPoint] [bigint] NOT NULL,
	[EndPoint] [bigint] NOT NULL,
 CONSTRAINT [PK_WellLayers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wells]    Script Date: 8/24/2019 9:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wells](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[WellTypeID] [bigint] NOT NULL,
	[WellName] [nvarchar](50) NOT NULL,
	[GasOilDepth] [bigint] NOT NULL,
	[Capacity] [bigint] NOT NULL,
 CONSTRAINT [PK_Wells] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellTypes]    Script Date: 8/24/2019 9:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WellTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RockTypes] ON 

INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (1, N'Argillite', N'#E52B50')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (2, N'Breccia', N'#FFBF00')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (3, N'Chalk', N'#9966CC')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (4, N'Chert', N'#FBCEB1')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (5, N'Coal', N'#7FFFD4')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (6, N'Conglomerate', N'#007FFF')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (7, N'Dolomite', N'#0095B6')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (8, N'Limestone', N'#800020')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (9, N'Marl', N'#DE3163')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (10, N'Mudstone', N'#F7E7CE')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (11, N'Sandstone', N'#7FFF00')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (12, N'Shale', N'#C8A2C8')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (13, N'Tufa', N'#BFFF00')
INSERT [dbo].[RockTypes] ([ID], [Name], [BackgroundColor]) VALUES (14, N'Wackestone', N'#FFFF00')
SET IDENTITY_INSERT [dbo].[RockTypes] OFF
SET IDENTITY_INSERT [dbo].[WellLayers] ON 

INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (1, 1, 10, 0, 800)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (2, 1, 3, 800, 1430)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (3, 1, 2, 1430, 1982)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (4, 1, 11, 1982, 2648)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (5, 1, 6, 2648, 3312)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (6, 1, 7, 3312, 3839)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (7, 1, 1, 3839, 4450)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (8, 2, 9, 0, 755)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (9, 2, 11, 755, 1523)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (10, 2, 3, 1523, 2280)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (11, 2, 6, 2280, 2916)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (12, 2, 10, 2916, 3727)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (13, 2, 1, 3727, 4230)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (14, 3, 10, 0, 808)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (15, 3, 5, 808, 1605)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (16, 3, 1, 1605, 2129)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (17, 3, 6, 2129, 2770)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (18, 3, 9, 2770, 3738)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (19, 3, 8, 3738, 4670)
INSERT [dbo].[WellLayers] ([ID], [WellID], [RockTypeID], [StartPoint], [EndPoint]) VALUES (20, 3, 4, 4670, 4830)
SET IDENTITY_INSERT [dbo].[WellLayers] OFF
SET IDENTITY_INSERT [dbo].[Wells] ON 

INSERT [dbo].[Wells] ([ID], [WellTypeID], [WellName], [GasOilDepth], [Capacity]) VALUES (1, 1, N'Yolka #12 ', 4500, 980000000)
INSERT [dbo].[Wells] ([ID], [WellTypeID], [WellName], [GasOilDepth], [Capacity]) VALUES (2, 1, N'Kazan  #12', 4230, 1080000000)
INSERT [dbo].[Wells] ([ID], [WellTypeID], [WellName], [GasOilDepth], [Capacity]) VALUES (3, 1, N'Kazan  #13', 4830, 780000000)
SET IDENTITY_INSERT [dbo].[Wells] OFF
SET IDENTITY_INSERT [dbo].[WellTypes] ON 

INSERT [dbo].[WellTypes] ([ID], [Name]) VALUES (1, N'Well')
INSERT [dbo].[WellTypes] ([ID], [Name]) VALUES (2, N'Section')
SET IDENTITY_INSERT [dbo].[WellTypes] OFF
ALTER TABLE [dbo].[WellLayers]  WITH CHECK ADD  CONSTRAINT [FK_WellLayers_RockTypes] FOREIGN KEY([RockTypeID])
REFERENCES [dbo].[RockTypes] ([ID])
GO
ALTER TABLE [dbo].[WellLayers] CHECK CONSTRAINT [FK_WellLayers_RockTypes]
GO
ALTER TABLE [dbo].[WellLayers]  WITH CHECK ADD  CONSTRAINT [FK_WellLayers_Wells] FOREIGN KEY([WellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WellLayers] CHECK CONSTRAINT [FK_WellLayers_Wells]
GO
ALTER TABLE [dbo].[Wells]  WITH CHECK ADD  CONSTRAINT [FK_Wells_WellTypes] FOREIGN KEY([WellTypeID])
REFERENCES [dbo].[WellTypes] ([ID])
GO
ALTER TABLE [dbo].[Wells] CHECK CONSTRAINT [FK_Wells_WellTypes]
GO
