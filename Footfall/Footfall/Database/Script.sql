USE [Footfall]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Premises]') AND type in (N'U'))
ALTER TABLE [dbo].[Premises] DROP CONSTRAINT IF EXISTS [FK_Premises_Businesses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Footfall]') AND type in (N'U'))
ALTER TABLE [dbo].[Footfall] DROP CONSTRAINT IF EXISTS [FK_Footfall_Premises]
GO
/****** Object:  Table [dbo].[Premises]    Script Date: 25/11/2021 17:08:51 ******/
DROP TABLE IF EXISTS [dbo].[Premises]
GO
/****** Object:  Table [dbo].[Footfall]    Script Date: 25/11/2021 17:08:51 ******/
DROP TABLE IF EXISTS [dbo].[Footfall]
GO
/****** Object:  Table [dbo].[Businesses]    Script Date: 25/11/2021 17:08:51 ******/
DROP TABLE IF EXISTS [dbo].[Businesses]
GO
USE [master]
GO
/****** Object:  Database [Footfall]    Script Date: 25/11/2021 17:08:51 ******/
DROP DATABASE IF EXISTS [Footfall]
GO
/****** Object:  Database [Footfall]    Script Date: 25/11/2021 17:08:51 ******/
CREATE DATABASE [Footfall]
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'Footfall', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Footfall.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME = N'Footfall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Footfall_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Footfall] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Footfall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Footfall] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Footfall] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Footfall] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Footfall] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Footfall] SET ARITHABORT OFF
GO
ALTER DATABASE [Footfall] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Footfall] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Footfall] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Footfall] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Footfall] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Footfall] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Footfall] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Footfall] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Footfall] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Footfall] SET  DISABLE_BROKER
GO
ALTER DATABASE [Footfall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Footfall] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Footfall] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Footfall] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Footfall] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Footfall] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Footfall] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Footfall] SET RECOVERY FULL
GO
ALTER DATABASE [Footfall] SET  MULTI_USER
GO
ALTER DATABASE [Footfall] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Footfall] SET DB_CHAINING OFF
GO
ALTER DATABASE [Footfall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [Footfall] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [Footfall] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [Footfall] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Footfall', N'ON'
GO
ALTER DATABASE [Footfall] SET QUERY_STORE = OFF
GO
USE [Footfall]
GO
/****** Object:  Table [dbo].[Businesses]    Script Date: 25/11/2021 17:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Businesses](
	[Id] [int] NOT NULL,
	[Business] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Businesses] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footfall]    Script Date: 25/11/2021 17:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footfall](
	[WeekNo] [int] NOT NULL,
	[PremisesId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Footfall] PRIMARY KEY CLUSTERED
(
	[WeekNo] ASC,
	[PremisesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Premises]    Script Date: 25/11/2021 17:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premises](
	[Id] [int] NOT NULL,
	[Street] [nvarchar](40) NOT NULL,
	[Postcode] [nvarchar](15) NOT NULL,
	[StreetNo] [nvarchar](12) NULL,
	[BusinessId] [int] NOT NULL,
 CONSTRAINT [PK_Premises] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000022, N'PizzaExpress')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000024, N'Holland & Barret')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000025, N'Cafe Rouge')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000026, N'Lloyds TSB ')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000028, N'Emest Jones 2')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000029, N'Boots The Chemist')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000031, N'HSBC')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000032, N'The Body Shop')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000033, N'ABC Pharmacy')
GO
INSERT [dbo].[Businesses] ([Id], [Business]) VALUES (10000034, N'Oxfam')
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 1839, 272)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 2020, 181)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 2285, 948)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 2958, 220)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 3859, 272)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 4837, 494)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 4920, 182)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 5472, 282)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (32, 8016, 382)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 1839, 181)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 2020, 289)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 2285, 952)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 2958, 494)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 3859, 282)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 4837, 285)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 4920, 282)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 8016, 494)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (33, 9484, 383)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 1839, 595)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 2020, 484)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 2285, 284)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 2958, 959)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 3859, 595)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 4837, 181)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 4920, 712)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 5472, 817)
GO
INSERT [dbo].[Footfall] ([WeekNo], [PremisesId], [Count]) VALUES (34, 8016, 821)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (1839, N'Commercial Road', N'NG6 8HA', N'16', 10000032)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (2020, N'York Road', N'TS26 9EN', NULL, 10000022)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (2285, N'Earls Court Road', N'W8 6EA', N'10 ', 10000029)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (2958, N'Edgware Road', N'W2 1ET', N'62-64', 10000028)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (3859, N'Glenbumie Road', N'SW17 7PJ', N'15a', 10000024)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (4837, N'Wilmslow Road', N'M20 3Bw', N'432-434', 10000031)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (4920, N'Kendal Street', N'W2 2AW', NULL, 10000034)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (5472, N'Preston Road', N'BN1 4QF', NULL, 10000033)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (8016, N'Portobello Road', N'W11 2DY', N'79', 10000025)
GO
INSERT [dbo].[Premises] ([Id], [Street], [Postcode], [StreetNo], [BusinessId]) VALUES (9484, N'Mere Street', N'IP22 4AD', N'6', 10000026)
GO
ALTER TABLE [dbo].[Footfall]  WITH CHECK ADD  CONSTRAINT [FK_Footfall_Premises] FOREIGN KEY([PremisesId])
REFERENCES [dbo].[Premises] ([Id])
GO
ALTER TABLE [dbo].[Footfall] CHECK CONSTRAINT [FK_Footfall_Premises]
GO
ALTER TABLE [dbo].[Premises]  WITH CHECK ADD  CONSTRAINT [FK_Premises_Businesses] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Businesses] ([Id])
GO
ALTER TABLE [dbo].[Premises] CHECK CONSTRAINT [FK_Premises_Businesses]
GO
USE [master]
GO
ALTER DATABASE [Footfall] SET  READ_WRITE
GO
