USE [master]
GO

CREATE DATABASE [ProyectoFinal]
GO


USE [ProyectoFinal]
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

CREATE TABLE [dbo].[tCursos](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Requisitos] [text] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK__Cursos__7E023A37AA2A8FD4] PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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

CREATE TABLE [dbo].[tInscripciones](
	[InscripcionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[FechaInscripcion] [date] NOT NULL,
 CONSTRAINT [PK__Inscripc__168316995A1F03B4] PRIMARY KEY CLUSTERED 
(
	[InscripcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

CREATE TABLE [dbo].[tReportesImpacto](
	[ReporteID] [int] IDENTITY(1,1) NOT NULL,
	[PatrocinadorID] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[FechaGeneracion] [date] NOT NULL,
 CONSTRAINT [PK__Reportes__0B29EA4EEC28F27D] PRIMARY KEY CLUSTERED 
(
	[ReporteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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

CREATE TABLE [dbo].[tUsuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Rol] [int] NOT NULL,
	[Contraseña] [varchar](10) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__Usuarios__2B3DE798699986D3] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (3, N'Patrocinador')
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (4, N'Voluntario')
GO
INSERT [dbo].[tRoles] ([ID_Rol], [Nombre_Rol]) VALUES (5, N'Evaluador')
GO
SET IDENTITY_INSERT [dbo].[tRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuarios] ON 
GO
INSERT [dbo].[tUsuarios] ([ID_Usuario], [Cedula], [Nombre], [Correo], [Rol], [Contraseña], [Estado]) VALUES (1, N'111', N'Pedro', N'Pedro@correo.com', 2, N'12345', 1)
GO
SET IDENTITY_INSERT [dbo].[tUsuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Cedula]    Script Date: 02/07/2025 11:59:53 ******/
ALTER TABLE [dbo].[tUsuarios] ADD  CONSTRAINT [uk_Cedula] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Correo]    Script Date: 02/07/2025 11:59:53 ******/
ALTER TABLE [dbo].[tUsuarios] ADD  CONSTRAINT [uk_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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

CREATE PROCEDURE [dbo].[InicioSesion]
		@Cedula varchar(20),
		@Contraseña varchar(10)
AS
BEGIN
	SELECT ID_Usuario, Cedula, Nombre, Correo, Rol, Contraseña, Estado
	FROM dbo.tUsuarios
	WHERE Cedula = @Cedula
	AND Contraseña = @Contraseña
	AND Estado = 1
END
GO

CREATE PROCEDURE [dbo].[RegistrarCuenta]
		@Cedula varchar(20),
		@Nombre varchar(100),
		@Correo varchar(100),
		@Rol int,
		@Contraseña varchar(10),
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

