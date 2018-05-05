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
Insert into Empleado(
ID_empleado, Nombre, Apellido, Teléfono, email, FechaNacimiento, Salario
)
values(
newid(), 'Rodrigo', 'Botello', '8186024936', 'armandorodrigoba@gmail.com', '1999-06-07', '$1300'
newid(), 'Bruno', 'Ledezma', '8114826401', 'br1lucky@gmail.com', '1999-09-13', '$1300'
newid(), 'Jorge', 'Garza', '8183628503', 'garzarivjor@gmail.com', '1998-12-07', '$1300'
newid(), 'Irán', 'García', '8128374957', 'iraanpais@gmail.com', '1999-03-04', '$1250'
newid(), 'Diego', 'Barraza', '81472759383', 'chiapasjagu@gmail.com', '1999-09-28', '$1279'
newid(), 'Araceli', 'Gutiérrez', '8112385649', 'araprincesa12@gmail.com', '1999-01-21', '$1450'
newid(), 'Elizabeth', 'Niño', '8194003475', 'elininio@gmail.com', '1998-12-26', '$1100'
newid(), 'Fanny', 'Alfano', '8194656274', 'faannyy@gmail.com', '1999-03-15', '$1500'
newid(), 'Alejandro', 'Campos', '8118435679', 'alecampos98@gmail.com', '1998-04-18', '$1200'
newid(), 'Alejandro', 'Lara', '8137594950', 'alexlaral@gmail.com', '1999-01-02', '$1100'
)

Insert into Categoria(
ID_categoria, Nombre, Descripcion
)
values(
newid(), 'Carne', 'Alimentos de origen animal'
newid(), 'Bebida', 'Acompañamiento de la comida'
newid(), 'Condimento', 'Sazón para alimento'
newid(), 'Higiene', 'Productos de limpieza'
newid(), 'Salud', 'Medicamentos'
newid(), 'Ropa', 'Prendas para todos'
newid(), 'Fruta', 'Cosechadas y tratadas'
newid(), 'Verdura', 'Frescos y recientes'
newid(), 'Herramienta', 'Para auto y jardín'
newid(), 'Juguete', 'Para niños menores de 14'
)

Insert into Producto(
ID_producto, nombre, precio, stock
)
values(
newid(), 'Kilo Pescado', '$120', '5'
newid(), '2 Litros Soda', '$20', '10'
newid(), '20g Pimienta', '$15', '20'
newid(), 'Barra Jabón', '$10', '8'
newid(), 'Medicasp', '$60', '3'
newid(), 'Pants GAP', '$130', '2'
newid(), 'Kilo Manzana', '$50', '1'
newid(), 'Kilo Zanahoria', '$59', '5'
newid(), 'Podadora', '$560', '4'
newid(), 'Carrito', '$35', '12'
)

Insert into Cliente(
ID_Cliente, nombres, apellidos, Fecha_Nacimiento, telefono, email
)
values(
newid(), 'Emmanuel', 'Ontiveros Castillo', '1999-01-21', '8163274957', 'emmont@gmail.com'
newid(), 'Kassandra', 'Silva Rodriguez', '1999-04-18', '9134759374', 'kassilva@gmail.com'
newid(), 'Marco Alexis', 'Castillo Medina', '1999-04-01', '9329874878', 'alexicastillo@gmail.com'
newid(), 'Daniela Alexa', 'Zapata Trejo', '1999-09-03', '9837591638', 'alexasheeran@gmail.com'
newid(), 'Abel', 'Rojas Mejia', '1997-05-19', '9748259154', 'abelrojas@gmail.com'
newid(), 'Juan', 'Jimenez Marin', '2000-01-31', '9937483296', 'jonathanmauro@gmail.com'
newid(), 'Lucia', 'Marinez Guerrero', '1999-08-15', '9364827466', 'lucypop@gmail.com'
newid(), 'Diana Elizabeth', 'Diaz Gallegos', '1999-07-08', '9639204658', 'dianurix@gmail.com'
newid(), 'Jorge David', 'Sosa Mendez', '1999-01-04', '9385675484', 'davidtigre5@gmail.com'
newid(), 'Oscar Nicolas', 'Flores Villarreal', '1998-10-26', '9234732983', 'nicopanque@gmail.com'
)

Insert into Ubicacion(
ID_Ubicacion, Direccion, Ciudad, Estado, CodigoPost
)
values(
newid(), 'CALLE AGUSTIN LARA NO. 69-B', 'Manzanillo', 'Colima', '83649'
newid(), 'AV. INDEPENDENCIA NO. 241', 'Monterrey', 'Nuevo Leon', '83547'
newid(), 'AV. 20 DE NOVIEMBRE NO.1024', 'Guadalupe', 'Nuevo Leon', '36594'
newid(), 'CALLE ZARAGOZA NO. 1010', 'Escobedo', 'Nuevo Leon', '02548'
newid(), 'AV. 5 DE MAYO NO. 1108', 'San Luis', 'Michoacan', '364956'
newid(), 'CALLE IGNACIO RAYON NO.949', 'Puerto Verde', 'Guerrero', '19354'
newid(), 'AV. 20 DE NOVIEMBRE NO. 1020' , 'Playa Humeda', 'Tamaulipas', '12345'
newid(), 'KM.13 CARRET. CD. ALEMAN-TUXTEPEC', 'Papaloapan', 'Chiapas', '82364'
newid(), 'MATAMOROS NO 350', 'Gamero', 'Durango', '28463'
newid(), 'AV. MANCILLA ESQ. ALDAMA S/N', 'Luna', 'San Luis Potosi', '27495'
)


Update Cliente(
set FechaNacimiento = '1999-01-31'
where telefono = '9937483296'


Update Cliente(
set FechaNacimiento = '1999-08-31'
where telefono = '9234732983'

Update Cliente(
set FechaNacimiento = '1999-02-31'
where telefono = '9385675484'

Update Cliente(
set FechaNacimiento = '1999-03-31'
where telefono = '9639204658'

Update Cliente(
set FechaNacimiento = '1999-04-31'
where telefono = '8163274957'



delete
from Empleados
where telefono in ('8163274957')

delete
from Empleados
where telefono in ('9639204658')

delete
from Empleados
where telefono in ('9385675484')

delete
from Empleados
where telefono in ('9234732983')

delete
from Empleados
where telefono in ('9937483296')


select nombres, apellidos
from Cliente

select cantidad, precio
from Factura

select FechaInicio, AñosTrabajando
from Historial_Empleo

select ID_Cliente, nombres
from Cliente

select Direccion, Estado
from Ubicacion



SELECT c.nombres
From [Cliente] as c
group by c.nombres

SELECT c.apellidos
From [Cliente] as c
group by c.apellidos

SELECT u.Ciudad
From [Ubicacion] as u
group by u.Ciudad

SELECT u.Estado
From [Ubicacion] as u
group by u.Estado

SELECT e.email
From [Empleado] as e
group by e.email


select nombres as N, apellidos as A, len(Nombre) as Tamaño
from Cliente

select nombres as N, apellidos as A, len(apellidos) as TamañoA
from Cliente

select Nombre as N, Apellido as A, len(Nombre) as Tamaño
from Empleado

select Nombre as N, Apellido as A, len(Apellido) as Tamaño
from Empleado

select Ciudad as C, Estado as A, len(Estado) as Tamaño
from Ubicacion


SELECT c.nombres, COUNT(c.ID_Cliente)
From [Cliente] as c
group by c.nombres
having COUNT(c.ID_Cliente) >10

SELECT c.apellidos, COUNT(c.ID_Cliente)
From [Cliente] as c
group by c.apellidos
having COUNT(c.ID_Cliente) >20

SELECT u.Ciudad, COUNT(u.ID_Ubicacion)
From [Ubicacion] as u
group by u.Ciudad
having COUNT(u.ID_Ubicacion) >30

SELECT u.Estado, COUNT(u.ID_Ubicacion)
From [Ubicacion] as u
group by u.Estado
having COUNT(u.ID_Ubicacion) >40

SELECT e.email, COUNT(e.ID_Empleado)
From [Empleado] as e
group by e.email
having COUNT(e.ID_Empleado) >50


select top 5 nombres as 'N', apellidos
from Cliente

select top 10 cantidad as 'C', precio
from Factura

select top 15 FechaInicio as 'FI', AñosTrabajando
from Historial_Empleo

select top 20 ID_Cliente as 'IC', nombres
from Cliente

select top 24 Direccion as 'D', Estado
from Ubicacion

create view ClientesLocales as
select u.Calle, u.estado, u.municipio
from ubicacion u
left join clientes c on u.estado = c.Id_cliente
left join clientes c on u.pais = c.Id_cliente
left join clientes c on u.municipio = c.Id_cliente

create view EmpleadosLocales as
select u.Calle, u.estado, u.municipio
from ubicacion u
right join empleado e on u.estado = e.Id_empleado
right join empleado e on u.pais = e.Id_empleado
right join empleado e on u.municipio = e.Id_empleado

create view UbicacionProducto as
select p.nombre, p.precio, p.Id_Producto
from producto p
inner join ubicacion u on p.nombre = p.estado
inner join ubicacion u on p.precio = p.pais
inner join ubicacion u on p.Id_Producto = p.municipio

create view FacturaCliente as
select c.Calle, c.NumeroInterior, c.NumeroExterno
from clientes c
left join factura f on c.estado = c.Id_cliente
left join factura f on c.estado = c.Id_cliente
left join factura f on c.estado = c.Id_cliente

create view ProveedorInventario as
select i.id, i.Numero, i.ProductoExterno
from inventario p
inner join proveedor p on i.nombre = p.estado
inner join proveedor p on i.precio = p.numero
inner join proveedor p on i.Id_Producto = p.productoexterno

