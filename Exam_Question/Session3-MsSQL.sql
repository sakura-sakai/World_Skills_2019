USE [master]
GO
/****** Object:  Database [Session3Final]    Script Date: 8/27/2019 10:40:56 AM ******/
CREATE DATABASE [Session3Final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session3Final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Session3Final.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session3Final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Session3Final_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session3Final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session3Final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session3Final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session3Final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session3Final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session3Final] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session3Final] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session3Final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session3Final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session3Final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session3Final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session3Final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session3Final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session3Final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session3Final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session3Final] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session3Final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session3Final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session3Final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session3Final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session3Final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session3Final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session3Final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session3Final] SET RECOVERY FULL 
GO
ALTER DATABASE [Session3Final] SET  MULTI_USER 
GO
ALTER DATABASE [Session3Final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session3Final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session3Final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session3Final] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session3Final] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session3Final] SET QUERY_STORE = OFF
GO
USE [Session3Final]
GO
/****** Object:  Table [dbo].[AssetOdometers]    Script Date: 8/27/2019 10:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetOdometers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetID] [bigint] NOT NULL,
	[ReadDate] [date] NOT NULL,
	[OdometerAmount] [bigint] NOT NULL,
 CONSTRAINT [PK_AssetOdometers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 8/27/2019 10:40:56 AM ******/
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
/****** Object:  Table [dbo].[PMScheduleModels]    Script Date: 8/27/2019 10:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMScheduleModels](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PMScheduleTypeID] [bigint] NULL,
 CONSTRAINT [PK_PMScheduleModels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMScheduleTypes]    Script Date: 8/27/2019 10:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMScheduleTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PMScheduleTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMTasks]    Script Date: 8/27/2019 10:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMTasks](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetID] [bigint] NOT NULL,
	[TaskID] [bigint] NOT NULL,
	[PMScheduleTypeID] [bigint] NOT NULL,
	[ScheduleDate] [date] NULL,
	[ScheduleKilometer] [bigint] NULL,
	[TaskDone] [bit] NULL,
 CONSTRAINT [PK_PMTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 8/27/2019 10:40:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssetOdometers] ON 

INSERT [dbo].[AssetOdometers] ([ID], [AssetID], [ReadDate], [OdometerAmount]) VALUES (3, 1, CAST(N'2019-07-10' AS Date), 140000)
INSERT [dbo].[AssetOdometers] ([ID], [AssetID], [ReadDate], [OdometerAmount]) VALUES (4, 1, CAST(N'2019-07-30' AS Date), 157000)
INSERT [dbo].[AssetOdometers] ([ID], [AssetID], [ReadDate], [OdometerAmount]) VALUES (5, 1, CAST(N'2019-08-19' AS Date), 157133)
INSERT [dbo].[AssetOdometers] ([ID], [AssetID], [ReadDate], [OdometerAmount]) VALUES (6, 4, CAST(N'2019-07-08' AS Date), 54800)
INSERT [dbo].[AssetOdometers] ([ID], [AssetID], [ReadDate], [OdometerAmount]) VALUES (7, 4, CAST(N'2019-07-28' AS Date), 57245)
INSERT [dbo].[AssetOdometers] ([ID], [AssetID], [ReadDate], [OdometerAmount]) VALUES (8, 4, CAST(N'2019-08-18' AS Date), 60580)
SET IDENTITY_INSERT [dbo].[AssetOdometers] OFF
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (1, N'05/04/0001', N'Toyota Hilux FAF321', 3, 5, 4, N'', NULL)
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (2, N'04/03/0001', N'Suction Line 852', 7, 8, 3, N'', CAST(N'2020-03-02' AS Date))
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (3, N'01/01/0001', N'ZENY 3,5CFM Single-Stage 5 Pa Rotary Vane', 11, 22, 1, N'', CAST(N'2018-01-17' AS Date))
INSERT [dbo].[Assets] ([ID], [AssetSN], [AssetName], [DepartmentLocationID], [EmployeeID], [AssetGroupID], [Description], [WarrantyDate]) VALUES (4, N'05/04/0002', N'Volvo FH16', 4, 26, 4, N'', NULL)
SET IDENTITY_INSERT [dbo].[Assets] OFF
SET IDENTITY_INSERT [dbo].[PMScheduleModels] ON 

INSERT [dbo].[PMScheduleModels] ([ID], [Name], [PMScheduleTypeID]) VALUES (1, N'Daily', 2)
INSERT [dbo].[PMScheduleModels] ([ID], [Name], [PMScheduleTypeID]) VALUES (2, N'Weekly', 2)
INSERT [dbo].[PMScheduleModels] ([ID], [Name], [PMScheduleTypeID]) VALUES (3, N'Monthly', 2)
INSERT [dbo].[PMScheduleModels] ([ID], [Name], [PMScheduleTypeID]) VALUES (4, N'Every X Kilometer', 1)
SET IDENTITY_INSERT [dbo].[PMScheduleModels] OFF
SET IDENTITY_INSERT [dbo].[PMScheduleTypes] ON 

INSERT [dbo].[PMScheduleTypes] ([ID], [Name]) VALUES (1, N'By Milage')
INSERT [dbo].[PMScheduleTypes] ([ID], [Name]) VALUES (2, N'By Date')
SET IDENTITY_INSERT [dbo].[PMScheduleTypes] OFF
SET IDENTITY_INSERT [dbo].[PMTasks] ON 

INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (10, 1, 1, 1, NULL, 140000, 1)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (11, 1, 1, 1, NULL, 155000, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (87, 3, 6, 2, CAST(N'2019-05-01' AS Date), NULL, 1)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (88, 3, 6, 2, CAST(N'2019-06-01' AS Date), NULL, 1)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (89, 3, 6, 2, CAST(N'2019-07-01' AS Date), NULL, 1)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (90, 3, 6, 2, CAST(N'2019-08-01' AS Date), NULL, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (91, 3, 6, 2, CAST(N'2019-09-01' AS Date), NULL, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (92, 3, 6, 2, CAST(N'2019-10-01' AS Date), NULL, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (93, 3, 6, 2, CAST(N'2019-11-01' AS Date), NULL, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (335, 3, 5, 2, CAST(N'2019-08-24' AS Date), NULL, 1)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (336, 3, 5, 2, CAST(N'2019-08-25' AS Date), NULL, 1)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (337, 3, 5, 2, CAST(N'2019-08-26' AS Date), NULL, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (338, 3, 5, 2, CAST(N'2019-08-27' AS Date), NULL, 0)
INSERT [dbo].[PMTasks] ([ID], [AssetID], [TaskID], [PMScheduleTypeID], [ScheduleDate], [ScheduleKilometer], [TaskDone]) VALUES (339, 3, 5, 2, CAST(N'2019-08-28' AS Date), NULL, 0)
SET IDENTITY_INSERT [dbo].[PMTasks] OFF
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (1, N'Get Tires Rotated and Balanced.')
INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (2, N'Check Engine Oil')
INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (3, N'Check  Air Filter')
INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (4, N'Check Battery')
INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (5, N'Inspect for any damage to paint on pump')
INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (6, N'Inspect cord and cord placement')
INSERT [dbo].[Tasks] ([ID], [Name]) VALUES (7, N'Pull each pump and reset')
SET IDENTITY_INSERT [dbo].[Tasks] OFF
ALTER TABLE [dbo].[AssetOdometers]  WITH CHECK ADD  CONSTRAINT [FK_AssetOdometers_Assets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[AssetOdometers] CHECK CONSTRAINT [FK_AssetOdometers_Assets]
GO
ALTER TABLE [dbo].[PMScheduleModels]  WITH CHECK ADD  CONSTRAINT [FK_PMScheduleModels_PMScheduleTypes] FOREIGN KEY([PMScheduleTypeID])
REFERENCES [dbo].[PMScheduleTypes] ([ID])
GO
ALTER TABLE [dbo].[PMScheduleModels] CHECK CONSTRAINT [FK_PMScheduleModels_PMScheduleTypes]
GO
ALTER TABLE [dbo].[PMTasks]  WITH CHECK ADD  CONSTRAINT [FK_PMTasks_Assets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[PMTasks] CHECK CONSTRAINT [FK_PMTasks_Assets]
GO
ALTER TABLE [dbo].[PMTasks]  WITH CHECK ADD  CONSTRAINT [FK_PMTasks_PMScheduleTypes] FOREIGN KEY([PMScheduleTypeID])
REFERENCES [dbo].[PMScheduleTypes] ([ID])
GO
ALTER TABLE [dbo].[PMTasks] CHECK CONSTRAINT [FK_PMTasks_PMScheduleTypes]
GO
ALTER TABLE [dbo].[PMTasks]  WITH CHECK ADD  CONSTRAINT [FK_PMTasks_Tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[PMTasks] CHECK CONSTRAINT [FK_PMTasks_Tasks]
GO
USE [master]
GO
ALTER DATABASE [Session3Final] SET  READ_WRITE 
GO
