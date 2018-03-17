USE [master]
GO
/****** Object:  Database [PIA2018]    Script Date: 17/03/2018 01:15:53 a. m. ******/
CREATE DATABASE [PIA2018]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PIA2018', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\PIA2018.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PIA2018_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\PIA2018_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PIA2018] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PIA2018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PIA2018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PIA2018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PIA2018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PIA2018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PIA2018] SET ARITHABORT OFF 
GO
ALTER DATABASE [PIA2018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PIA2018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PIA2018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PIA2018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PIA2018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PIA2018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PIA2018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PIA2018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PIA2018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PIA2018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PIA2018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PIA2018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PIA2018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PIA2018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PIA2018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PIA2018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PIA2018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PIA2018] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PIA2018] SET  MULTI_USER 
GO
ALTER DATABASE [PIA2018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PIA2018] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PIA2018] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PIA2018] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PIA2018] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PIA2018] SET QUERY_STORE = OFF
GO
USE [PIA2018]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PIA2018]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/03/2018 01:15:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID_Categoria] [uniqueidentifier] NOT NULL,
	[Nombre] [nchar](20) NOT NULL,
	[Descripcion] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [uniqueidentifier] NOT NULL,
	[nombres] [nchar](20) NOT NULL,
	[apellidos] [nchar](20) NOT NULL,
	[Fecha_Nacimiento] [nchar](10) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[email] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[ID_Departamento] [uniqueidentifier] NOT NULL,
	[Nombre_Departamento] [nchar](30) NULL,
	[ID_Ubicacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[ID_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID_Empleado] [uniqueidentifier] NOT NULL,
	[ID_Empleo] [uniqueidentifier] NOT NULL,
	[ID_Departamento] [uniqueidentifier] NOT NULL,
	[Nombre] [nchar](30) NOT NULL,
	[Apellido] [nchar](30) NOT NULL,
	[Teléfono] [int] NOT NULL,
	[email] [nchar](30) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
	[Salario] [money] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleos]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleos](
	[ID_Empleo] [uniqueidentifier] NOT NULL,
	[Titulo_Empleo] [nchar](30) NOT NULL,
	[salario_min] [money] NOT NULL,
	[salario_max] [money] NULL,
 CONSTRAINT [PK_Empleos] PRIMARY KEY CLUSTERED 
(
	[ID_Empleo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID_Factura] [uniqueidentifier] NOT NULL,
	[ID_Cliente] [uniqueidentifier] NOT NULL,
	[ID_Empleado] [uniqueidentifier] NOT NULL,
	[fecha] [date] NOT NULL,
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial_Empleo]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Empleo](
	[ID_Empleado] [uniqueidentifier] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[ID_Empleo] [uniqueidentifier] NOT NULL,
	[AñosTrabajando]  AS (datediff(year,[FechaInicio],getdate()))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [money] NOT NULL,
	[stock] [int] NOT NULL,
	[ID_Categoria] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 17/03/2018 01:15:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[ID_Ubicacion] [uniqueidentifier] NOT NULL,
	[Direccion] [nchar](20) NOT NULL,
	[Ciudad] [nchar](20) NOT NULL,
	[Estado] [nchar](20) NOT NULL,
	[CodigoPost] [int] NOT NULL,
 CONSTRAINT [PK_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[ID_Ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD  CONSTRAINT [FK_Departamentos_Ubicacion] FOREIGN KEY([ID_Ubicacion])
REFERENCES [dbo].[Ubicacion] ([ID_Ubicacion])
GO
ALTER TABLE [dbo].[Departamentos] CHECK CONSTRAINT [FK_Departamentos_Ubicacion]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamentos] FOREIGN KEY([ID_Departamento])
REFERENCES [dbo].[Departamentos] ([ID_Departamento])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamentos]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Empleos] FOREIGN KEY([ID_Empleo])
REFERENCES [dbo].[Empleos] ([ID_Empleo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Empleos]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Empleado] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleado] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Empleado]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Producto] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Producto]
GO
ALTER TABLE [dbo].[Historial_Empleo]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Empleo_Empleado] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleado] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Historial_Empleo] CHECK CONSTRAINT [FK_Historial_Empleo_Empleado]
GO
ALTER TABLE [dbo].[Historial_Empleo]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Empleo_Empleos] FOREIGN KEY([ID_Empleo])
REFERENCES [dbo].[Empleos] ([ID_Empleo])
GO
ALTER TABLE [dbo].[Historial_Empleo] CHECK CONSTRAINT [FK_Historial_Empleo_Empleos]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[Categoria] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
USE [master]
GO
ALTER DATABASE [PIA2018] SET  READ_WRITE 
GO
