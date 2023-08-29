
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


------------

INSERT INTO BD_PROYECTO.dbo.TipoProyectoGeneral 
(ID,NOMBRE,ACTIVO,IDUSUARIOREGISTRA) VALUES 
(1,'Proyecto',1,6808),
(2,'Objetivo',1,6808),
(3,'Servicio',1,6808);



USE [BD_PROYECTO]
GO
 ALTER TABLE [BD_PROYECTO].[dbo].[Proyecto] ADD IDTipoProyectoGeneral INT; 
 ALTER TABLE [BD_PROYECTO].[dbo].[Proyecto] ADD IDTipoTactica INT; 
 ALTER TABLE [BD_PROYECTO].[dbo].[Proyecto] ADD IDTipoObjetivoEstrategico INT; 

 -----------------------------------------
 USE [BD_PROYECTO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
=============================================
Fecha		: 29/08/2023
Responsable	: Deicy Rojas Rosas
Descripción	: Retornar el nombre del Proyecto Genral
Email		: deicy.rojas@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		:
Responsable	:
Descripción	: 
=============================================
*/
CREATE FUNCTION [dbo].[FN_NOMBRE_TIPOPROYECTOGENERAL]
(
	@ID INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	/* VARIABLES */
	DECLARE @Nombre VARCHAR(50)

	/* ASIGNACIÓN DE VALORES */
	SELECT @Nombre = tp.Nombre FROM BD_PROYECTO.dbo.TipoProyectoGeneral tp WHERE tp.ID = @ID
	
	RETURN @Nombre
--
END

--------------------------------------------------------------------
USE [BD_PROYECTO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
=============================================
Fecha		: 29/08/2023
Responsable	: Deicy Rojas Rosas
Descripción	: Retornar el nombre de las  Tacticas
Email		: deicy.rojas@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		:
Responsable	:
Descripción	: 
=============================================
*/
CREATE FUNCTION [dbo].[FN_NOMBRE_TIPOTACTICA]
(
	@ID INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	/* VARIABLES */
	DECLARE @Nombre VARCHAR(50)

	/* ASIGNACIÓN DE VALORES */
	SELECT @Nombre = t.Nombre FROM BD_PROYECTO.dbo.TipoTactica t WHERE t.ID = @ID
	
	RETURN @Nombre
--
END

--------------------------------------------

USE [BD_PROYECTO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
=============================================
Fecha		: 29/08/2023
Responsable	: Deicy Rojas Rosas
Descripción	: Retornar el nombre de los objetivos estrategicos
Email		: deicy.rojas@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		:
Responsable	:
Descripción	: 
=============================================
*/
CREATE FUNCTION [dbo].[FN_NOMBRE_TIPOOBJETIVOESTRATEGICO]
(
	@ID INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	/* VARIABLES */
	DECLARE @Nombre VARCHAR(50)

	/* ASIGNACIÓN DE VALORES */
	SELECT @Nombre = toe.Nombre FROM BD_PROYECTO.dbo.TipoObjetivoEstrategico toe WHERE toe.ID = @ID
	
	RETURN @Nombre
--
END




-------------------------------------------------------------------------------------------------------


------------PARTE DE SAMRT
-- 1.  GENERACION DE LAS RUTAS Y NUEVOS FORMULARIOS PARA NO AFECTAR LOS ACTUALES PROCESOS:
Registrar Proyecto Nuevo (LID)  --objeto duplicado

--2. Modificacion del TRansaccion agregando los atributos necesarios
--3. generacion de las listas externas para tactica y objetivo y tipoproyecto


USE [BD_PROYECTO]
GO
 ALTER TABLE [BD_PROYECTO].[dbo].[Proyecto] ADD Anno INT;
 ALTER TABLE [BD_PROYECTO].[dbo].[TipoTactica] ADD Anno INT; 
 ALTER TABLE [BD_PROYECTO].[dbo].[TipoObjetivoEstrategico] ADD Anno INT; 




 --registros de tacticas año 2023
  INSERT INTO [BD_PROYECTO].[dbo].[TipoTactica] (ID,NOMBRE,ACTIVO,IDUSUARIOREGISTRA,ANNO) VALUES 
(1,'Hacer acuerdos de nivel de servicio con base en lo que le genera dolor al cliente y está en la caracterización, creando banderas rojas según cada cliente.',1,6808,2023),
(2,'Apropiar los atributos y  resultados de nuestros productos y servicios como información valiosa para la toma de decisiones en el nivel táctico de las instituciones educativas, en el componente de gestión académica.',1,6808,2023),
(3, 'Realizar eventos de valor compartido entre aliados estratégicos del sector educativo',1,6808,2023),
(4, 'Incrementar la tasa de adquisición de clientes identificando el encaje que hay entre las necesidades del prospecto y las beneficios y ventajas que ofrecemos',1,6808,2023),
(5, 'Generar actividades masivas a traves de canales digitales y presenciales que permitan el contacto con grupos de interes, clientes potenciales de los cursos preifes para generacion de prospectos cualificados ',1,6808,2023),
(6, 'Establecer en los puntos de contacto con el cliente las actividades de gestion comercial que garanticen la efectividad en el cierre de ventas ',1,6808,2023),
(7, 'Diversificar el  producto para  que respoda las necesidades especificas del cliente.',1,6808,2023),
(8, 'Incrementar el engagement con los clientes identificando el encaje que hay entre sus necesidades  y las beneficios y ventajas que ofrecemos',1,6808,2023),
(9, 'Identificar el journey map en la prestación del servicio del 2022 y establecer los puntos de dolor para generar acciones e indicadores sobre ellas en el 2023',1,6808,2023),
(10, 'Despliegue de actividades disruptivas que generen reconocimiento en nuestros clientes internos y externos de Be+ Group como sombrilla del grupo.',1,6808,2023);
 

  INSERT INTO [BD_PROYECTO].[dbo].[TipoObjetivoestrategico] (ID,NOMBRE,ACTIVO,IDUSUARIOREGISTRA,ANNO) VALUES 
(1,'Reducir las no conformidades un 10% respecto al año anterior',1,6808,2023),
(2,'Llevar nuestros productos y servicios a nivel táctico ​con el ﬁn de que la información que arrojan, tras su implementación, sea base fundamental para la toma de decisiones en el mejoramiento del proceso académico en el 30% de los colegios activos a nivel nacional durante el primer año de desarrollo (377 de 1257 colegios).',1,6808,2023),
(3,'Realizar eventos autosostenibles que generen Retorno sobre la marca (ROB)',1,6808,2023),
(4,'Cumplir la meta de captación de ventas desde el desarrollo de estrategias conjuntas entre los procesos ($2.637.505.300)',1,6808,2023),
(5,'Cumplir la meta de venta clientes uno a uno desde el desarrollo de estrategias conjuntas entre los procesos ($1.472.000.000)',1,6808,2023),
(6,'Cumplir la meta venta a clientes activos desde el desarrollo de estrategias conjuntas entre los procesos ($9.441.556.107)',1,6808,2023),
(7,'Cumplir con la propuesta de valor de nuestros productos y servicios para retener el 100%  de nuestros los colegios activos',1,6808,2023),
(8,'Posicionar a Be+Group​ como la sombrilla del grupo en el 40 % de nuestros clientes activos 2022 y 100 % en cliente interno​',1,6808,2023);
