USE [master]
GO
/****** Object:  Database [Final Proyect 2018]    Script Date: 24/02/2018 11:42:55 a.m. ******/
CREATE DATABASE [Final Proyect 2018]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Final Proyect 2018', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Final Proyect 2018.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Final Proyect 2018_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Final Proyect 2018_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Final Proyect 2018] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Final Proyect 2018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Final Proyect 2018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET ARITHABORT OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Final Proyect 2018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Final Proyect 2018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Final Proyect 2018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Final Proyect 2018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Final Proyect 2018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Final Proyect 2018] SET  MULTI_USER 
GO
ALTER DATABASE [Final Proyect 2018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Final Proyect 2018] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Final Proyect 2018] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Final Proyect 2018] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Final Proyect 2018]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 24/02/2018 11:42:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[idalmacen] [uniqueidentifier] NOT NULL,
	[Inventario] [int] NULL,
	[UltimoChequeo] [date] NULL,
	[encargado] [nchar](50) NULL,
 CONSTRAINT [PK_Almacen] PRIMARY KEY CLUSTERED 
(
	[idalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cajero]    Script Date: 24/02/2018 11:42:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajero](
	[idcajero] [uniqueidentifier] NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Apellido] [nchar](10) NOT NULL,
	[Sueldo] [money] NOT NULL,
	[Cumpleaños] [date] NOT NULL,
	[Edad]  AS (datediff(year,[Cumpleaños],getdate())),
 CONSTRAINT [PK_Cajero] PRIMARY KEY CLUSTERED 
(
	[idcajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gerente]    Script Date: 24/02/2018 11:42:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gerente](
	[idGerente] [uniqueidentifier] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Sueldo] [money] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
 CONSTRAINT [PK_Gerente_1] PRIMARY KEY CLUSTERED 
(
	[idGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 24/02/2018 11:42:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idproducto] [uniqueidentifier] NOT NULL,
	[precio] [money] NOT NULL,
	[iva]  AS ([precio]*(0.16)),
	[stock] [int] NULL,
	[empresa] [nchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 24/02/2018 11:42:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [uniqueidentifier] NOT NULL,
	[ubicacion] [nchar](50) NOT NULL,
	[utilidades] [money] NOT NULL,
	[FechaApertura] [date] NOT NULL,
 CONSTRAINT [PK_Sucursal_1] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 24/02/2018 11:42:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[id] [uniqueidentifier] NOT NULL,
	[Precio] [money] NULL,
	[IVA]  AS ([Precio]*(0.16)),
	[FechaNacimiento] [date] NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_Almacen]    Script Date: 24/02/2018 11:42:55 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Almacen] ON [dbo].[Almacen]
(
	[idalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cajero]    Script Date: 24/02/2018 11:42:55 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Cajero] ON [dbo].[Cajero]
(
	[idcajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Gerente]    Script Date: 24/02/2018 11:42:55 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Gerente] ON [dbo].[Gerente]
(
	[idGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sucursal]    Script Date: 24/02/2018 11:42:55 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Sucursal] ON [dbo].[Sucursal]
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Final Proyect 2018] SET  READ_WRITE 
GO
