USE [master]
GO
/****** Object:  Database [ProyectoFinal]    Script Date: 23/08/2025 7:53:33 ******/
CREATE DATABASE [ProyectoFinal]
GO
USE [ProyectoFinal]
GO
/****** Object:  Table [dbo].[tActividades]    Script Date: 23/08/2025 7:53:34 ******/
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
	[LinkLlamada] [nvarchar](250) NULL,
	[OrganizadorID] [int] NOT NULL,
 CONSTRAINT [PK__Activida__981483F05901123B] PRIMARY KEY CLUSTERED 
(
	[ActividadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCertificados]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tCursos]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tErrores]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tEvaluadores]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tInscripciones]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tNotificaciones]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tPatrocinadores]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tPerfiles]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tRecomendaciones]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tReportesImpacto]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tRoles]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tSuscripciones]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  Table [dbo].[tUsuarios]    Script Date: 23/08/2025 7:53:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVoluntarios]    Script Date: 23/08/2025 7:53:34 ******/
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
SET IDENTITY_INSERT [dbo].[tActividades] ON 
GO
INSERT [dbo].[tActividades] ([ActividadID], [Titulo], [Descripcion], [Fecha], [Tipo], [Ubicacion], [LinkLlamada], [OrganizadorID]) VALUES (2, N'Actividad', N'Actividad', CAST(N'2025-08-23' AS Date), N'Taller', N'San Pedro', NULL, 6)
GO
INSERT [dbo].[tActividades] ([ActividadID], [Titulo], [Descripcion], [Fecha], [Tipo], [Ubicacion], [LinkLlamada], [OrganizadorID]) VALUES (3, N'Actividad2', N'sss', CAST(N'2025-08-23' AS Date), N'Taller', N'San Pedro', NULL, 6)
GO
SET IDENTITY_INSERT [dbo].[tActividades] OFF
GO
SET IDENTITY_INSERT [dbo].[tCursos] ON 
GO
INSERT [dbo].[tCursos] ([CursoID], [Nombre], [Descripcion], [Requisitos], [FechaInicio], [FechaFin], [VideoUrl]) VALUES (1, N'Programación en C# Básico', N'Curso introductorio a la programación en C# con ejercicios prácticos.', N'Conocimientos básicos de informática.', CAST(N'2025-09-01' AS Date), CAST(N'2025-10-15' AS Date), N'yRHaY9I8JvQ')
GO
INSERT [dbo].[tCursos] ([CursoID], [Nombre], [Descripcion], [Requisitos], [FechaInicio], [FechaFin], [VideoUrl]) VALUES (2, N'Introducción a SQL Server', N'Aprende los fundamentos de bases de datos y lenguaje SQL en SQL Server.', N'Nociones de programación.', CAST(N'2025-09-10' AS Date), CAST(N'2025-11-01' AS Date), N'Atpj2UsF65M')
GO
INSERT [dbo].[tCursos] ([CursoID], [Nombre], [Descripcion], [Requisitos], [FechaInicio], [FechaFin], [VideoUrl]) VALUES (3, N'Desarrollo Web con ASP.NET MVC', N'Curso práctico para construir aplicaciones web usando ASP.NET MVC.', N'Conocimientos de C# y HTML.', CAST(N'2025-09-20' AS Date), CAST(N'2025-11-30' AS Date), N'DG15OMmtjd8')
GO
INSERT [dbo].[tCursos] ([CursoID], [Nombre], [Descripcion], [Requisitos], [FechaInicio], [FechaFin], [VideoUrl]) VALUES (4, N'Fundamentos de Ciencia de Datos', N'Curso introductorio sobre análisis de datos, estadística y Python.', N'Conocimientos básicos de matemáticas y programación.', CAST(N'2025-10-01' AS Date), CAST(N'2025-12-15' AS Date), N'dH5v_mcvlXM')
GO
INSERT [dbo].[tCursos] ([CursoID], [Nombre], [Descripcion], [Requisitos], [FechaInicio], [FechaFin], [VideoUrl]) VALUES (5, N'Cloud Computing en Azure', N'Curso para aprender a desplegar y administrar soluciones en Microsoft Azure.', N'Conocimientos de redes y sistemas operativos.', CAST(N'2025-10-15' AS Date), CAST(N'2025-12-20' AS Date), N'V65rQ8umwxw')
GO
SET IDENTITY_INSERT [dbo].[tCursos] OFF
GO
SET IDENTITY_INSERT [dbo].[tRoles] ON 
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (1, N'Admin')
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (2, N'Usuario')
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (3, N'Organizador')
GO
SET IDENTITY_INSERT [dbo].[tRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuarios] ON 
GO
INSERT [dbo].[tUsuarios] ([ID_Usuario], [Cedula], [Nombre], [Correo], [Rol], [Contraseña], [Estado]) VALUES (2, N'118490588', N'RAQUEL ARIANA ARIAS SANCHO', N'rarias90588@ufide.ac.cr', 2, N'03VicMhh+yxPhJlfIKVmdQ==', 1)
GO
INSERT [dbo].[tUsuarios] ([ID_Usuario], [Cedula], [Nombre], [Correo], [Rol], [Contraseña], [Estado]) VALUES (3, N'111111111', N'Pedro', N'pedro@correo.com', 1, N'03VicMhh+yxPhJlfIKVmdQ==', 1)
GO
INSERT [dbo].[tUsuarios] ([ID_Usuario], [Cedula], [Nombre], [Correo], [Rol], [Contraseña], [Estado]) VALUES (6, N'222222222', N'Ana', N'ana@correo.com', 3, N'03VicMhh+yxPhJlfIKVmdQ==', 1)
GO
SET IDENTITY_INSERT [dbo].[tUsuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Cedula]    Script Date: 23/08/2025 7:53:34 ******/
ALTER TABLE [dbo].[tUsuarios] ADD  CONSTRAINT [uk_Cedula] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Correo]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarActividad]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarContra]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarContrasenna]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarSuscripcion]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[InscribirUsuario]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarActividad]    Script Date: 23/08/2025 7:53:34 ******/
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
    SET NOCOUNT ON;

    -- Verificar que el usuario tenga asignado el rol 3 (Organizador)
    IF EXISTS (
        SELECT 1
        FROM tUsuarios U
        INNER JOIN tRoles R ON U.Rol = R.ID_Rol
        WHERE U.ID_Usuario = @OrganizadorID
          AND R.ID_Rol = 3
    )
    BEGIN
        INSERT INTO tActividades (Titulo, Descripcion, Fecha, Tipo, Ubicacion, LinkLlamada, OrganizadorID)
        VALUES (@Titulo, @Descripcion, @Fecha, @Tipo, @Ubicacion, @LinkLlamada, @OrganizadorID);
    END
END

GO
/****** Object:  StoredProcedure [dbo].[InsertarSuscripcion]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[MostrarActividades]    Script Date: 23/08/2025 7:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[MostrarActividades]
AS
BEGIN
    SELECT 
        a.ActividadID,
        a.Titulo,
        a.Descripcion,
        a.Fecha,
        a.Tipo,
        a.Ubicacion,
        a.LinkLlamada,
        a.OrganizadorID,
        u.Nombre AS NombreOrganizador
    FROM tActividades a
    INNER JOIN tUsuarios u ON a.OrganizadorID = u.ID_Usuario
    ORDER BY a.Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarActividadPorId]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[MostrarCursos]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[MostrarSuscripcionesPorActividad]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[MostrarSuscripcionesPorUsuario]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerOrganizadores]    Script Date: 23/08/2025 7:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerOrganizadores]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT u.ID_Usuario, u.Nombre
    FROM tUsuarios u
    INNER JOIN tRoles r ON u.Rol = r.ID_Rol
    WHERE r.ID_Rol = 3;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuenta]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[RevisarCorreo]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetReportesImpacto]    Script Date: 23/08/2025 7:53:34 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidarInicioSesion]    Script Date: 23/08/2025 7:53:34 ******/
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
