/*
Created: 23/06/2022
Modified: 23/06/2022
Model: Microsoft SQL Server 2019
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table CLIENTE

CREATE TABLE [CLIENTE]
(
 [id_cliente] Int IDENTITY NOT NULL,
 [nom_cliente] Varchar(100) NOT NULL,
 [ape_cliente] Varchar(100) NOT NULL,
 [dni_cliente] Char(8) NULL,
 [car_cliente] Varchar(100) NULL,
 [dir_cliente] Varchar(100) NULL,
 [tel_cliente] Varchar(100) NULL,
 [ema_cliente] Varchar(100) NULL
)
go

-- Add keys for table CLIENTE

ALTER TABLE [CLIENTE] ADD CONSTRAINT [PK_CLIENTE] PRIMARY KEY ([id_cliente])
go

-- Table USUARIO

CREATE TABLE [USUARIO]
(
 [id_usuario] Int IDENTITY NOT NULL,
 [dni_usuario] Char(8) NULL,
 [nom_usuario] Varchar(100) NOT NULL,
 [ape_usuario] Varchar(100) NOT NULL,
 [tel_usuario] Varchar(100) NULL,
 [ema_usuario] Varchar(100) NULL,
 [pue_usuario] Varchar(100) NULL
)
go

-- Add keys for table USUARIO

ALTER TABLE [USUARIO] ADD CONSTRAINT [PK_USUARIO] PRIMARY KEY ([id_usuario])
go

-- Table DETALLE

CREATE TABLE [DETALLE]
(
 [id_detalle] Int IDENTITY NOT NULL,
 [cod_detalle] Varchar(100) NOT NULL,
 [can_detalle] Int NULL,
 [pre_detalle] Decimal(18,2) NULL,
 [igv_detalle] Decimal(18,2) NULL,
 [tot_detalle] Decimal(18,2) NULL,
 [id_comprobante] Int NOT NULL,
 [id_cliente] Int NOT NULL,
 [id_producto] Int NOT NULL,
 [id_mod] Int NOT NULL,
 [id_categoria] Int NOT NULL,
 [id_local] Int NOT NULL,
 [id_usuario] Int NOT NULL
)
go

-- Add keys for table DETALLE

ALTER TABLE [DETALLE] ADD CONSTRAINT [PK_DETALLE] PRIMARY KEY ([id_detalle],[id_comprobante],[id_cliente],[id_producto],[id_mod],[id_categoria],[id_local],[id_usuario])
go

-- Table MODO_PAGO

CREATE TABLE [MODO_PAGO]
(
 [id_mod] Int IDENTITY NOT NULL,
 [nom_mod] Varchar(100) NULL,
 [otr_mod] Varchar(100) NULL
)
go

-- Add keys for table MODO_PAGO

ALTER TABLE [MODO_PAGO] ADD CONSTRAINT [PK_MODO_PAGO] PRIMARY KEY ([id_mod])
go

-- Table PRODUCTO

CREATE TABLE [PRODUCTO]
(
 [id_producto] Int IDENTITY NOT NULL,
 [nom_producto] Varchar(100) NULL,
 [pru_producto] Decimal(18,2) NULL,
 [prm_producto] Decimal(18,2) NULL,
 [can_producto] Int NULL,
 [id_categoria] Int NOT NULL,
 [id_local] Int NOT NULL
)
go

-- Add keys for table PRODUCTO

ALTER TABLE [PRODUCTO] ADD CONSTRAINT [PK_PRODUCTO] PRIMARY KEY ([id_producto],[id_categoria],[id_local])
go

-- Table LOCAL

CREATE TABLE [LOCAL]
(
 [id_local] Int IDENTITY NOT NULL,
 [cod_local] Varchar(100) NULL,
 [dir_local] Varchar(100) NULL,
 [tel_local] Varchar(100) NULL
)
go

-- Add keys for table LOCAL

ALTER TABLE [LOCAL] ADD CONSTRAINT [PK_LOCAL] PRIMARY KEY ([id_local])
go

-- Table CATEGORIA

CREATE TABLE [CATEGORIA]
(
 [id_categoria] Int IDENTITY NOT NULL,
 [nom_categoria] Varchar(100) NULL,
 [des_categoria] Varchar(100) NULL
)
go

-- Add keys for table CATEGORIA

ALTER TABLE [CATEGORIA] ADD CONSTRAINT [PK_CATEGORIA] PRIMARY KEY ([id_categoria])
go

-- Table COMPROBANTE

CREATE TABLE [COMPROBANTE]
(
 [id_comprobante] Int IDENTITY NOT NULL,
 [cod_comprobante] Varchar(100) NULL,
 [fec_comprobante] Date NULL,
 [id_cliente] Int NOT NULL,
 [id_mod] Int NOT NULL,
 [id_usuario] Int NOT NULL
)
go

-- Add keys for table COMPROBANTE

ALTER TABLE [COMPROBANTE] ADD CONSTRAINT [PK_COMPROBANTE] PRIMARY KEY ([id_comprobante],[id_cliente],[id_mod],[id_usuario])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [COMPROBANTE] ADD CONSTRAINT [CLIENTE_COMPROBANTE] FOREIGN KEY ([id_cliente]) REFERENCES [CLIENTE] ([id_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DETALLE] ADD CONSTRAINT [COMPROBANTE_DETALLE] FOREIGN KEY ([id_comprobante], [id_cliente], [id_mod], [id_usuario]) REFERENCES [COMPROBANTE] ([id_comprobante], [id_cliente], [id_mod], [id_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DETALLE] ADD CONSTRAINT [PRODUCTO_DETALLE] FOREIGN KEY ([id_producto], [id_categoria], [id_local]) REFERENCES [PRODUCTO] ([id_producto], [id_categoria], [id_local]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [COMPROBANTE] ADD CONSTRAINT [MODO_COMPROBANTE] FOREIGN KEY ([id_mod]) REFERENCES [MODO_PAGO] ([id_mod]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PRODUCTO] ADD CONSTRAINT [CATEGORIA_PRODUCTO] FOREIGN KEY ([id_categoria]) REFERENCES [CATEGORIA] ([id_categoria]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [PRODUCTO] ADD CONSTRAINT [LOCAL_PRODUCTO] FOREIGN KEY ([id_local]) REFERENCES [LOCAL] ([id_local]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [COMPROBANTE] ADD CONSTRAINT [USUARIO_COMPROBANTE] FOREIGN KEY ([id_usuario]) REFERENCES [USUARIO] ([id_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




