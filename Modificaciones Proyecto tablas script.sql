
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


