USE [master]
GO
/****** Object:  Database [ProyectoFinal]    Script Date: 22/08/2025 14:45:16 ******/
CREATE DATABASE [ProyectoFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProyectoFinal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoFinal] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoFinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoFinal', N'ON'
GO
ALTER DATABASE [ProyectoFinal] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProyectoFinal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProyectoFinal]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tActividades]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tActividades]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tActividades](
	[ActividadID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Ubicacion] [varchar](100) NOT NULL,
	[LinkLlamada] [varchar](255) NOT NULL,
	[OrganizadorID] [int] NOT NULL,
 CONSTRAINT [PK__Activida__981483F05901123B] PRIMARY KEY CLUSTERED 
(
	[ActividadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tCertificados]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tCertificados]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCertificados](
	[CertificadoID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[FechaEmision] [date] NOT NULL,
	[Formato] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Certific__6B016733AE2873EB] PRIMARY KEY CLUSTERED 
(
	[CertificadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tCursos]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tCursos]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCursos](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Requisitos] [text] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[VideoUrl] [varchar](255) NULL,
 CONSTRAINT [PK__Cursos__7E023A37AA2A8FD4] PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tErrores]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tErrores](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[MensajeError] [text] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
 CONSTRAINT [PK__Errores__358565CA8A2F4F1D] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tEvaluadores]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEvaluadores](
	[ID_Evaluador] [int] NOT NULL,
	[TotalEvaluados] [int] NOT NULL,
	[Retroalimentaciones] [int] NOT NULL,
	[AreasMejora] [varchar](250) NOT NULL,
 CONSTRAINT [PK_tEvaluadores] PRIMARY KEY CLUSTERED 
(
	[ID_Evaluador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tInscripciones]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tInscripciones](
	[InscripcionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[FechaInscripcion] [date] NOT NULL,
	[Completado] [bit] NOT NULL,
 CONSTRAINT [PK__Inscripc__168316995A1F03B4] PRIMARY KEY CLUSTERED 
(
	[InscripcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tNotificaciones]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tNotificaciones]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNotificaciones](
	[NotificacionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[Mensaje] [text] NOT NULL,
	[FechaEnvio] [date] NOT NULL,
 CONSTRAINT [PK__Notifica__BCC120C477D31428] PRIMARY KEY CLUSTERED 
(
	[NotificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tPatrocinadores]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tPatrocinadores]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPatrocinadores](
	[ID_Patrocinador] [int] NOT NULL,
	[TotalContribuciones] [int] NOT NULL,
	[Contribucion] [decimal](18, 2) NOT NULL,
	[Impacto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tPatrocinadores] PRIMARY KEY CLUSTERED 
(
	[ID_Patrocinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tPerfiles]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tPerfiles]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPerfiles](
	[PerfiID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[EstadoLaboral] [varchar](100) NOT NULL,
	[EstadoEducativo] [varchar](100) NOT NULL,
	[FechaActualizacion] [date] NOT NULL,
 CONSTRAINT [PK__Perfiles__0C005B664E8080F3] PRIMARY KEY CLUSTERED 
(
	[PerfiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tRecomendaciones]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tRecomendaciones]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRecomendaciones](
	[RecomendacionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Contenido] [text] NOT NULL,
	[FechaGeneracion] [date] NOT NULL,
 CONSTRAINT [PK__Recomend__104CC1EEB3FD3A5F] PRIMARY KEY CLUSTERED 
(
	[RecomendacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tReportesImpacto]    Script Date: 22/8/2025 04:18:15 ******/
========
/****** Object:  Table [dbo].[tReportesImpacto]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tReportesImpacto](
	[ReporteID] [int] IDENTITY(1,1) NOT NULL,
	[PatrocinadorID] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[FechaGeneracion] [date] NOT NULL,
	[UsuarioID] [int] NULL,
	[CursoID] [int] NULL,
	[ActividadID] [int] NULL,
	[InscripcionID] [int] NULL,
	[SuscripcionID] [int] NULL,
 CONSTRAINT [PK__Reportes__0B29EA4EEC28F27D] PRIMARY KEY CLUSTERED 
(
	[ReporteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tRoles]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tRoles]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRoles](
	[ID_Rol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRoles] PRIMARY KEY CLUSTERED 
(
	[ID_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tSuscripciones]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tSuscripciones]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSuscripciones](
	[SuscripcionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[ActividadID] [int] NOT NULL,
	[FechaSuscripcion] [date] NOT NULL,
 CONSTRAINT [PK__Subcripc__BD908C939EA4165F] PRIMARY KEY CLUSTERED 
(
	[SuscripcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  Table [dbo].[tUsuarios]    Script Date: 23/8/2025 00:54:03 ******/
========
/****** Object:  Table [dbo].[tUsuarios]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUsuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Rol] [int] NOT NULL,
	[Contraseña] [varchar](255) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__Usuarios__2B3DE798699986D3] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_Cedula] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVoluntarios]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVoluntarios](
	[ID_Usuario] [int] NOT NULL,
	[Profesion] [varchar](50) NOT NULL,
	[Estudios] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tRoles] ON 
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (1, N'Admin')
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (2, N'Usuario')
GO
SET IDENTITY_INSERT [dbo].[tRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuarios] ON 
GO
INSERT [dbo].[tUsuarios] ([ID_Usuario], [Cedula], [Nombre], [Correo], [Rol], [Contraseña], [Estado]) VALUES (2, N'118490588', N'RAQUEL ARIANA ARIAS SANCHO', N'rarias90588@ufide.ac.cr', 2, N'03VicMhh+yxPhJlfIKVmdQ==', 1)
GO
INSERT [dbo].[tUsuarios] ([ID_Usuario], [Cedula], [Nombre], [Correo], [Rol], [Contraseña], [Estado]) VALUES (3, N'111111111', N'Pedro', N'pedro@correo.com', 1, N'03VicMhh+yxPhJlfIKVmdQ==', 1)
GO
SET IDENTITY_INSERT [dbo].[tUsuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Cedula]    Script Date: 22/08/2025 14:45:16 ******/
ALTER TABLE [dbo].[tUsuarios] ADD  CONSTRAINT [uk_Cedula] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Correo]    Script Date: 22/08/2025 14:45:16 ******/
ALTER TABLE [dbo].[tUsuarios] ADD  CONSTRAINT [uk_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tInscripciones] ADD  DEFAULT ((0)) FOR [Completado]
GO
ALTER TABLE [dbo].[tActividades]  WITH CHECK ADD  CONSTRAINT [FK__Actividad__Organ__4AB81AF0] FOREIGN KEY([OrganizadorID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tActividades] CHECK CONSTRAINT [FK__Actividad__Organ__4AB81AF0]
GO
ALTER TABLE [dbo].[tCertificados]  WITH CHECK ADD  CONSTRAINT [FK__Certifica__Curso__4316F928] FOREIGN KEY([CursoID])
REFERENCES [dbo].[tCursos] ([CursoID])
GO
ALTER TABLE [dbo].[tCertificados] CHECK CONSTRAINT [FK__Certifica__Curso__4316F928]
GO
ALTER TABLE [dbo].[tCertificados]  WITH CHECK ADD  CONSTRAINT [FK__Certifica__Usuar__4222D4EF] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tCertificados] CHECK CONSTRAINT [FK__Certifica__Usuar__4222D4EF]
GO
ALTER TABLE [dbo].[tEvaluadores]  WITH CHECK ADD  CONSTRAINT [FK_tEvaluadores_Usuarios] FOREIGN KEY([ID_Evaluador])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tEvaluadores] CHECK CONSTRAINT [FK_tEvaluadores_Usuarios]
GO
ALTER TABLE [dbo].[tInscripciones]  WITH CHECK ADD  CONSTRAINT [FK__Inscripci__Curso__3F466844] FOREIGN KEY([CursoID])
REFERENCES [dbo].[tCursos] ([CursoID])
GO
ALTER TABLE [dbo].[tInscripciones] CHECK CONSTRAINT [FK__Inscripci__Curso__3F466844]
GO
ALTER TABLE [dbo].[tInscripciones]  WITH CHECK ADD  CONSTRAINT [FK__Inscripci__Usuar__3E52440B] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tInscripciones] CHECK CONSTRAINT [FK__Inscripci__Usuar__3E52440B]
GO
ALTER TABLE [dbo].[tNotificaciones]  WITH CHECK ADD  CONSTRAINT [FK__Notificac__Usuar__5165187F] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tNotificaciones] CHECK CONSTRAINT [FK__Notificac__Usuar__5165187F]
GO
ALTER TABLE [dbo].[tPatrocinadores]  WITH CHECK ADD  CONSTRAINT [FK_tPatrocinadores_Usuarios] FOREIGN KEY([ID_Patrocinador])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tPatrocinadores] CHECK CONSTRAINT [FK_tPatrocinadores_Usuarios]
GO
ALTER TABLE [dbo].[tPerfiles]  WITH CHECK ADD  CONSTRAINT [FK__Perfiles__Usuari__398D8EEE] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tPerfiles] CHECK CONSTRAINT [FK__Perfiles__Usuari__398D8EEE]
GO
ALTER TABLE [dbo].[tRecomendaciones]  WITH CHECK ADD  CONSTRAINT [FK__Recomenda__Usuar__5441852A] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tRecomendaciones] CHECK CONSTRAINT [FK__Recomenda__Usuar__5441852A]
GO
ALTER TABLE [dbo].[tReportesImpacto]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Actividades] FOREIGN KEY([ActividadID])
REFERENCES [dbo].[tActividades] ([ActividadID])
GO
ALTER TABLE [dbo].[tReportesImpacto] CHECK CONSTRAINT [FK_Reportes_Actividades]
GO
ALTER TABLE [dbo].[tReportesImpacto]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Cursos] FOREIGN KEY([CursoID])
REFERENCES [dbo].[tCursos] ([CursoID])
GO
ALTER TABLE [dbo].[tReportesImpacto] CHECK CONSTRAINT [FK_Reportes_Cursos]
GO
ALTER TABLE [dbo].[tReportesImpacto]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Inscripciones] FOREIGN KEY([InscripcionID])
REFERENCES [dbo].[tInscripciones] ([InscripcionID])
GO
ALTER TABLE [dbo].[tReportesImpacto] CHECK CONSTRAINT [FK_Reportes_Inscripciones]
GO
ALTER TABLE [dbo].[tReportesImpacto]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Suscripciones] FOREIGN KEY([SuscripcionID])
REFERENCES [dbo].[tSuscripciones] ([SuscripcionID])
GO
ALTER TABLE [dbo].[tReportesImpacto] CHECK CONSTRAINT [FK_Reportes_Suscripciones]
GO
ALTER TABLE [dbo].[tReportesImpacto]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Usuarios] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tReportesImpacto] CHECK CONSTRAINT [FK_Reportes_Usuarios]
GO
ALTER TABLE [dbo].[tReportesImpacto]  WITH CHECK ADD  CONSTRAINT [FK_ReportesImpacto_Usuarios] FOREIGN KEY([PatrocinadorID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tReportesImpacto] CHECK CONSTRAINT [FK_ReportesImpacto_Usuarios]
GO
ALTER TABLE [dbo].[tSuscripciones]  WITH CHECK ADD  CONSTRAINT [FK__Subcripci__Activ__4E88ABD4] FOREIGN KEY([ActividadID])
REFERENCES [dbo].[tActividades] ([ActividadID])
GO
ALTER TABLE [dbo].[tSuscripciones] CHECK CONSTRAINT [FK__Subcripci__Activ__4E88ABD4]
GO
ALTER TABLE [dbo].[tSuscripciones]  WITH CHECK ADD  CONSTRAINT [FK__Subcripci__Usuar__4D94879B] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tSuscripciones] CHECK CONSTRAINT [FK__Subcripci__Usuar__4D94879B]
GO
ALTER TABLE [dbo].[tUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Usuarios] FOREIGN KEY([Rol])
REFERENCES [dbo].[tRoles] ([ID_Rol])
GO
ALTER TABLE [dbo].[tUsuarios] CHECK CONSTRAINT [FK_Usuarios_Usuarios]
GO
ALTER TABLE [dbo].[tVoluntarios]  WITH CHECK ADD  CONSTRAINT [FK_tVoluntarios_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[tUsuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[tVoluntarios] CHECK CONSTRAINT [FK_tVoluntarios_Usuarios]
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  StoredProcedure [dbo].[ActualizarActividad]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarActividad]
    @ActividadID INT,
    @Titulo NVARCHAR(100),
    @Descripcion NVARCHAR(MAX),
    @Fecha DATE,
    @Tipo NVARCHAR(50),
    @Ubicacion NVARCHAR(150),
    @LinkLlamada NVARCHAR(250),
    @OrganizadorID INT
AS
BEGIN
    UPDATE tActividades
    SET Titulo = @Titulo,
        Descripcion = @Descripcion,
        Fecha = @Fecha,
        Tipo = @Tipo,
        Ubicacion = @Ubicacion,
        LinkLlamada = @LinkLlamada,
        OrganizadorID = @OrganizadorID
    WHERE ActividadID = @ActividadID
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContra]    Script Date: 22/8/2025 04:18:15 ******/
========
/****** Object:  StoredProcedure [dbo].[ActualizarContra]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarContra]
		@ID_Usuario int,
		@Contraseña varchar(255)
AS
BEGIN

	UPDATE dbo.tUsuarios
	SET Contraseña = @Contraseña
	WHERE ID_Usuario = @ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContrasenna]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizarContrasenna]
		@ID_Usuario int,
		@Contraseña varchar(255)
AS
BEGIN

	UPDATE dbo.tUsuarios
	SET Contraseña = @Contraseña
	WHERE ID_Usuario = @ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
		@ID_Usuario int,
		@Cedula varchar(20),
		@Nombre varchar(100),
		@Correo varchar(100)
AS
BEGIN

IF NOT EXISTS(SELECT 1 FROM dbo.tUsuarios
					WHERE Cedula = @Cedula
					AND Correo = @Correo
					AND ID_Usuario != @ID_Usuario)
	BEGIN
	UPDATE dbo.tUsuarios
	SET Cedula = @Cedula,
	Nombre = @Nombre,
	Correo = @Correo
	WHERE ID_Usuario = @ID_Usuario
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
		@ID_Usuario int
AS
BEGIN
	SELECT ID_Usuario, Nombre, Correo, Cedula, Estado, U.Rol, R.Nombre_Rol
	FROM dbo.tUsuarios U
	INNER JOIN dbo.tRoles R ON U.Rol = R.ID_Rol
	WHERE ID_Usuario = @ID_Usuario
END
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  StoredProcedure [dbo].[EliminarSuscripcion]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarSuscripcion]
    @SuscripcionID INT
AS
BEGIN
    DELETE FROM tSuscripciones
    WHERE SuscripcionID = @SuscripcionID
END
GO
/****** Object:  StoredProcedure [dbo].[InscribirUsuario]    Script Date: 22/8/2025 04:18:15 ******/
========
/****** Object:  StoredProcedure [dbo].[InscribirUsuario]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InscribirUsuario]
    @UsuarioID INT,
    @CursoID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Evitar inscripciones duplicadas
    IF NOT EXISTS (SELECT 1 FROM tInscripciones WHERE UsuarioID = @UsuarioID AND CursoID = @CursoID)
    BEGIN
        INSERT INTO tInscripciones (UsuarioID, CursoID, FechaInscripcion)
        VALUES (@UsuarioID, @CursoID, GETDATE());
    END
    ELSE
    BEGIN
        RAISERROR('El usuario ya está inscrito en este curso.', 16, 1);
    END
END
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  StoredProcedure [dbo].[InsertarActividad]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarActividad]
    @Titulo NVARCHAR(100),
    @Descripcion NVARCHAR(MAX),
    @Fecha DATE,
    @Tipo NVARCHAR(50),
    @Ubicacion NVARCHAR(150),
    @LinkLlamada NVARCHAR(250),
    @OrganizadorID INT
AS
BEGIN
    INSERT INTO tActividades (Titulo, Descripcion, Fecha, Tipo, Ubicacion, LinkLlamada, OrganizadorID)
    VALUES (@Titulo, @Descripcion, @Fecha, @Tipo, @Ubicacion, @LinkLlamada, @OrganizadorID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarSuscripcion]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarSuscripcion]
    @UsuarioID INT,
    @ActividadID INT
AS
BEGIN
    INSERT INTO tSuscripciones (UsuarioID, ActividadID, FechaSuscripcion)
    VALUES (@UsuarioID, @ActividadID, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarActividadPorId]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarActividadPorId]
    @ActividadID INT
AS
BEGIN
    SELECT * FROM tActividades
    WHERE ActividadID = @ActividadID
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarCursos]    Script Date: 22/8/2025 04:18:15 ******/
========
/****** Object:  StoredProcedure [dbo].[MostrarCursos]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MostrarCursos]
AS
BEGIN
    SELECT CursoID, Nombre, Descripcion, Requisitos, FechaInicio, FechaFin
    FROM tCursos
END
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  StoredProcedure [dbo].[MostrarSuscripcionesPorActividad]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarSuscripcionesPorActividad]
    @ActividadID INT
AS
BEGIN
    SELECT s.*
    FROM tSuscripciones s
    WHERE s.ActividadID = @ActividadID
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarSuscripcionesPorUsuario]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarSuscripcionesPorUsuario]
    @UsuarioID INT
AS
BEGIN
    SELECT a.*
    FROM tActividades a
    INNER JOIN tSuscripciones s ON a.ActividadID = s.ActividadID
    WHERE s.UsuarioID = @UsuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuenta]    Script Date: 22/8/2025 04:18:15 ******/
========
/****** Object:  StoredProcedure [dbo].[RegistrarCuenta]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarCuenta]
		@Cedula varchar(20),
		@Nombre varchar(100),
		@Correo varchar(100),
		@Rol int,
		@Contraseña varchar(255),
		@Estado bit
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM dbo.tUsuarios
					WHERE Cedula = @Cedula
					OR Correo = @Correo)
	BEGIN
		INSERT INTO dbo.tUsuarios(Cedula, Nombre, Correo, Rol, Contraseña, Estado)
		VALUES (@Cedula,@Nombre, @Correo,2, @Contraseña,@Estado)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[RevisarCorreo]    Script Date: 22/08/2025 14:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RevisarCorreo]
		@Correo varchar(100)
AS
BEGIN
	SELECT ID_Usuario, Cedula, Nombre, Correo
	FROM dbo.tUsuarios
	WHERE Correo = @Correo
END
GO
<<<<<<<< HEAD:ProyectoFinal2.2_2.sql
/****** Object:  StoredProcedure [dbo].[sp_GetReportesImpacto]    Script Date: 22/8/2025 04:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetReportesImpacto]
AS
BEGIN
    SELECT 
        ReporteID,
        PatrocinadorID,
        Descripcion,
        FechaGeneracion,
        UsuarioID,
        CursoID,
        ActividadID,
        InscripcionID,
        SuscripcionID
    FROM dbo.tReportesImpacto
END

GO
/****** Object:  StoredProcedure [dbo].[ValidarInicioSesion]    Script Date: 22/8/2025 04:18:15 ******/
========
/****** Object:  StoredProcedure [dbo].[ValidarInicioSesion]    Script Date: 22/08/2025 14:45:16 ******/
>>>>>>>> origin/main:ProyectoFinal1.9.sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidarInicioSesion]
		@Cedula varchar(20),
		@Contraseña varchar(255)
AS
BEGIN
	SELECT ID_Usuario, Nombre, Correo, Cedula, Estado, U.Rol, R.Nombre_Rol
	FROM dbo.tUsuarios U
	INNER JOIN dbo.tRoles R ON U.Rol = R.ID_Rol
	WHERE Cedula = @Cedula
	AND Contraseña = @Contraseña
END
GO
USE [master]
GO
ALTER DATABASE [ProyectoFinal] SET  READ_WRITE 
GO
