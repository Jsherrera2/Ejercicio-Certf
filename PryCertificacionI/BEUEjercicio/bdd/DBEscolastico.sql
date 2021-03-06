USE [master]
GO
/****** Object:  Database [DBESCOLAR]    Script Date: 3/8/2020 19:14:30 ******/
CREATE DATABASE [DBESCOLAR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBESCOLAR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBESCOLAR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBESCOLAR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBESCOLAR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBESCOLAR] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBESCOLAR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBESCOLAR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBESCOLAR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBESCOLAR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBESCOLAR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBESCOLAR] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBESCOLAR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBESCOLAR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBESCOLAR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBESCOLAR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBESCOLAR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBESCOLAR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBESCOLAR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBESCOLAR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBESCOLAR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBESCOLAR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBESCOLAR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBESCOLAR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBESCOLAR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBESCOLAR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBESCOLAR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBESCOLAR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBESCOLAR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBESCOLAR] SET RECOVERY FULL 
GO
ALTER DATABASE [DBESCOLAR] SET  MULTI_USER 
GO
ALTER DATABASE [DBESCOLAR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBESCOLAR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBESCOLAR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBESCOLAR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBESCOLAR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBESCOLAR', N'ON'
GO
ALTER DATABASE [DBESCOLAR] SET QUERY_STORE = OFF
GO
USE [DBESCOLAR]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cedula] [varchar](15) NULL,
	[fecha_nacimiento] [date] NULL,
	[lugar_nacimiento] [varchar](50) NULL,
	[sexo] [nchar](1) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idarea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[coordinador] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[idcalificacion] [int] IDENTITY(1,1) NOT NULL,
	[valor] [nchar](10) NULL,
	[fecha] [datetime] NULL,
	[unidad] [nchar](1) NULL,
	[idmatricula] [int] NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[idcalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maquinaria]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maquinaria](
	[idmaquinaria] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](25) NULL,
	[nombre] [varchar](50) NULL,
	[fecha_adquisicion] [date] NULL,
	[precio] [decimal](18, 2) NULL,
	[porcentaje_depreciacion] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Maquinaria] PRIMARY KEY CLUSTERED 
(
	[idmaquinaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[idmateria] [int] NOT NULL,
	[nombre] [nvarchar](70) NULL,
	[nrc] [nchar](5) NULL,
	[creditos] [smallint] NULL,
	[idarea] [int] NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[idmateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[costo] [decimal](18, 2) NULL,
	[estado] [nchar](1) NULL,
	[tipo] [nchar](1) NULL,
	[idmateria] [int] NULL,
	[idalumno] [int] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vinculacion]    Script Date: 3/8/2020 19:14:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vinculacion](
	[idvinculacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[nombre_organizacion] [varchar](100) NULL,
	[nombre_responsable] [varchar](100) NULL,
	[numero_horas] [int] NULL,
	[nombre_proyecto] [varchar](100) NULL,
	[numero_integrantes] [int] NULL,
	[ubicacion] [varchar](100) NULL,
 CONSTRAINT [PK_Vinculacion] PRIMARY KEY CLUSTERED 
(
	[idvinculacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1, N'Jefferson Stalin', N'Herrera', N'1724169469', CAST(N'1994-12-17' AS Date), N'Quito', N'M')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (5, N'David', N'Vique', N'1254123648', CAST(N'1997-10-12' AS Date), N'Quito', N'M')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (7, N'Paulina', N'Herrera', N'12365478965', CAST(N'1992-01-01' AS Date), N'Quito', N'F')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (14, N'Cristian', N'Cabascango', N'0021325412', CAST(N'1999-08-07' AS Date), N'Cayambe', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (20, N'Cristian', N'Caisaluisa', N'1721002136', CAST(N'2020-06-21' AS Date), N'Quito', N'M')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (32, N'Anntonela', N'Ramos', N'1236541236', CAST(N'2020-08-06' AS Date), N'Quito', N'M')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (34, N'Joel', N'Herrera', N'1784512365', CAST(N'2000-02-02' AS Date), N'Quito', N'H')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (1, N'Programacion', N'Ing Javier Montaluisa')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (2, N'Software', N'Dr Edison Espinoza')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (3, N'Inteligencia Artificial', N'Dr Jose Carrillo')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (5, N'Programacion', N'Ing Javier Montaluisa')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Maquinaria] ON 

INSERT [dbo].[Maquinaria] ([idmaquinaria], [codigo], [nombre], [fecha_adquisicion], [precio], [porcentaje_depreciacion]) VALUES (1, N'MQ001', N'Soldadora electrica', CAST(N'2020-09-01' AS Date), CAST(50000.00 AS Decimal(18, 2)), CAST(7.20 AS Decimal(4, 2)))
INSERT [dbo].[Maquinaria] ([idmaquinaria], [codigo], [nombre], [fecha_adquisicion], [precio], [porcentaje_depreciacion]) VALUES (3, N'MQ0056', N' Excavadora.', CAST(N'2019-01-01' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(4, 2)))
INSERT [dbo].[Maquinaria] ([idmaquinaria], [codigo], [nombre], [fecha_adquisicion], [precio], [porcentaje_depreciacion]) VALUES (4, N'MQ3789', N'Volqueta', CAST(N'2020-08-02' AS Date), CAST(789.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(4, 2)))
INSERT [dbo].[Maquinaria] ([idmaquinaria], [codigo], [nombre], [fecha_adquisicion], [precio], [porcentaje_depreciacion]) VALUES (5, N'QM1313', N'Pavimentadora Electrica', CAST(N'2010-01-29' AS Date), CAST(6009.00 AS Decimal(18, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Maquinaria] ([idmaquinaria], [codigo], [nombre], [fecha_adquisicion], [precio], [porcentaje_depreciacion]) VALUES (6, N'dsa', N'esa', CAST(N'2020-08-04' AS Date), CAST(45.00 AS Decimal(18, 2)), CAST(7.20 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[Maquinaria] OFF
GO
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (0, N'fundamentos de programacion', N'1522 ', 8, 1)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (1, N'Base de datos', N'4565 ', 8, 2)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (2, N'Patrones de Diseño', N'8745 ', 4, 2)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (3, N'Multimedia', N'2020 ', 4, 2)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (5, N'Base de datos', N'4200 ', 5, 2)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (7, N'Encriptacion', N'4556 ', 10, 3)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (10, N'sample string 2', N'7588 ', 4, 5)
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (3, CAST(N'2020-06-21T19:14:59.013' AS DateTime), CAST(98.00 AS Decimal(18, 2)), N'1', N'S', 1, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (4, CAST(N'2020-06-21T14:22:48.080' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 0, 1)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (5, CAST(N'2020-06-21T18:18:32.670' AS DateTime), CAST(196.00 AS Decimal(18, 2)), N'1', N'T', 0, 5)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (8, CAST(N'2020-06-21T19:15:27.923' AS DateTime), CAST(196.00 AS Decimal(18, 2)), N'1', N'T', 1, 1)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (9, CAST(N'2020-06-21T19:49:15.130' AS DateTime), CAST(98.00 AS Decimal(18, 2)), N'1', N'S', 1, 20)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (10, CAST(N'2020-06-25T10:18:07.073' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 3, 14)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (1010, CAST(N'2020-07-20T11:48:19.873' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 0, 1)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idmateria], [idalumno]) VALUES (1011, CAST(N'2020-07-20T11:48:55.860' AS DateTime), CAST(98.00 AS Decimal(18, 2)), N'1', N'T', 2, 14)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
SET IDENTITY_INSERT [dbo].[Vinculacion] ON 

INSERT [dbo].[Vinculacion] ([idvinculacion], [fecha_inicio], [fecha_fin], [nombre_organizacion], [nombre_responsable], [numero_horas], [nombre_proyecto], [numero_integrantes], [ubicacion]) VALUES (2, CAST(N'2020-03-08' AS Date), CAST(N'2020-12-12' AS Date), N'ESPE', N'Ing Diego Velasco', 120, N'Tecnologías ASP.NET para tiendas de barrio', 3, N'Latacunga')
INSERT [dbo].[Vinculacion] ([idvinculacion], [fecha_inicio], [fecha_fin], [nombre_organizacion], [nombre_responsable], [numero_horas], [nombre_proyecto], [numero_integrantes], [ubicacion]) VALUES (6, CAST(N'2020-08-17' AS Date), CAST(N'2020-08-31' AS Date), N'ESPE-L', N'Ing Herrera', 120, N'Software reconocimiento facial ', 4, N'Latacunga')
INSERT [dbo].[Vinculacion] ([idvinculacion], [fecha_inicio], [fecha_fin], [nombre_organizacion], [nombre_responsable], [numero_horas], [nombre_proyecto], [numero_integrantes], [ubicacion]) VALUES (11, CAST(N'2020-08-04' AS Date), CAST(N'2020-08-09' AS Date), N'ESPE-L', N'Ing  Elizabeth Ruiz ', 20, N'Capacitación del personal administrativo ESPE', 4, N'Ambato')
SET IDENTITY_INSERT [dbo].[Vinculacion] OFF
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Matricula] FOREIGN KEY([idmatricula])
REFERENCES [dbo].[Matricula] ([idmatricula])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Matricula]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Area] FOREIGN KEY([idarea])
REFERENCES [dbo].[Area] ([idarea])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Area]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([idalumno])
REFERENCES [dbo].[Alumno] ([idalumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Materia] FOREIGN KEY([idmateria])
REFERENCES [dbo].[Materia] ([idmateria])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Materia]
GO
USE [master]
GO
ALTER DATABASE [DBESCOLAR] SET  READ_WRITE 
GO
