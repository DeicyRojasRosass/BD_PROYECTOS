
----Modificaciones sobre Proyectos 
USE [BD_PROYECTO]
GO
 ALTER TABLE [BD_PROYECTO].[dbo].[Proyecto] ADD Inversion BIT; 
 
ALTER TABLE [BD_PROYECTO].[dbo].[Proyecto] ADD  CONSTRAINT [DF_Proyecto_Inversion]  DEFAULT ((0)) FOR [Inversion]
GO



-----tabla de Tacticas 

USE [BD_PROYECTO]
GO

/****** Object:  Table [dbo].[TipoObjetivo]    Script Date: 25/08/2023 9:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoTactica](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IDUsuarioRegistra] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_TipoTactica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TipoTactica_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TipoTactica] ADD  CONSTRAINT [DF_TipoTactica_Activo]  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[TipoTactica] ADD  CONSTRAINT [DF_TipoTactica_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO


-----Objetivo Estrategico

USE [BD_PROYECTO]
GO

/****** Object:  Table [dbo].[TipoObjetivo]    Script Date: 25/08/2023 9:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoObjetivoEstrategico](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IDUsuarioRegistra] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_TipoObjetivoEstrategico] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TipoObjetivoEstrategico_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TipoObjetivoEstrategico] ADD  CONSTRAINT [DF_TipoObjetivoEstrategico_Activo]  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[TipoObjetivoEstrategico] ADD  CONSTRAINT [DF_TipoObjetivoEstrategico_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO


---------------------------------------------------------------------
--proyecto general : proyecto-objetivo-servicio

USE [BD_PROYECTO]
GO

/****** Object:  Table [dbo].[TipoObjetivo]    Script Date: 25/08/2023 9:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoProyectoGeneral](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IDUsuarioRegistra] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_TipoProyectoGeneral] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TipoProyectoGeneral_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TipoProyectoGeneral] ADD  CONSTRAINT [DF_TipoProyectoGeneral_Activo]  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[TipoProyectoGeneral] ADD  CONSTRAINT [DF_TipoProyectoGeneral_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
