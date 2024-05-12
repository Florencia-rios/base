CREATE DATABASE [boletinesoficiales]
GO

USE [boletinesoficiales]
GO

CREATE SCHEMA [core]
GO

CREATE SCHEMA [user]
GO

CREATE TABLE [core].[cargos] (
  [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(30),
  [codigo] varchar(2)
)
GO

CREATE TABLE [core].[estado_civil] (
  [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(30),
  [codigo] varchar(1)
)
GO

CREATE TABLE [core].[fuente_informacion] (
  [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(30),
  [codigo] varchar(3)
)
GO

CREATE TABLE [core].[provincias] (
  [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(30),
  [codigo] varchar(1)
)
GO

CREATE TABLE [core].[sexo] (
  [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(30),
  [codigo] varchar(1)
)
GO

CREATE TABLE [core].[nacionalidades] (
  [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(30),
  [codigo] varchar(2)
)
GO

CREATE TABLE [user].[sociedad] (
    [id] INTEGER PRIMARY KEY IDENTITY(1, 1),
    [mor_user] VARCHAR(10),
    [mor_nro_user] VARCHAR(10),
    [mor_lote] VARCHAR(10),
    [mor_codint] INT,
    [mor_matriz] VARCHAR(10),
    [mor_sucursal] VARCHAR(10),
    [mor_sector] VARCHAR(10),
    [mor_cliente] VARCHAR(10),
    [mor_nombre_completo] VARCHAR(72),
    [mor_fecha_nac] VARCHAR(10),
    [mor_sexo_id] INTEGER,
    [mor_documento1] VARCHAR(11),
    [mor_documento2] VARCHAR(11),
    [mor_prov_doc2] VARCHAR(1),
    [mor_telefono] VARCHAR(14),
    [mor_marca_dire_1] VARCHAR(1),
    [mor_calle] VARCHAR(40),
    [mor_numer] VARCHAR(10),
    [mor_piso] VARCHAR(6),
    [mor_loca] VARCHAR(36),
    [mor_prov_id] INTEGER,
    [mor_cp] VARCHAR(8),
    [mor_est_civil_id] INTEGER,
    [mor_nacionalidad_id] INTEGER,
    [mor_relacion] VARCHAR(1),
    [mor_cargo_id] INTEGER,
    [mor_cargo_fecha] VARCHAR(10),
    [mor_cargo_fuente_id] INTEGER,
    [mor_ant_codigo] VARCHAR(3) DEFAULT 'XXX',
    [mor_campo_1] VARCHAR(20),
    [mor_campo_2] VARCHAR(20),
    [mor_campo_3] VARCHAR(20),
    [mor_campo_4] VARCHAR(20),
    [mor_campo_5] VARCHAR(20),
    [mor_campo_6] VARCHAR(20),
    [mor_campo_7] VARCHAR(20),
    [mor_campo_8] VARCHAR(20),
    [mor_ant_fecha] VARCHAR(10),
    [mor_archivo] VARCHAR(72),
    [mor_soc_categoria] VARCHAR(3)
)
GO

ALTER TABLE [user].[sociedad] ADD FOREIGN KEY ([mor_sexo_id]) REFERENCES [core].[sexo]([id])
GO

ALTER TABLE [user].[sociedad] ADD FOREIGN KEY ([mor_prov_id]) REFERENCES [core].[provincias]([id])
GO

ALTER TABLE [user].[sociedad] ADD FOREIGN KEY ([mor_est_civil_id]) REFERENCES [core].[estado_civil]([id])
GO

ALTER TABLE [user].[sociedad] ADD FOREIGN KEY ([mor_nacionalidad_id]) REFERENCES [core].[nacionalidades]([id])
GO

ALTER TABLE [user].[sociedad] ADD FOREIGN KEY ([mor_cargo_id]) REFERENCES [core].[cargos]([id])
GO

ALTER TABLE [user].[sociedad] ADD FOREIGN KEY ([mor_cargo_fuente_id]) REFERENCES [core].[fuente_informacion]([id])
GO
