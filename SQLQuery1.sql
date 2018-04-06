USE [Lackluster]
GO

/****** Object: Table [dbo].[video] Script Date: 4/5/2018 4:48:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[video] (
    [videoID]     INT           NOT NULL,
    [title]       VARCHAR (MAX) NULL,
    [studio]      VARCHAR (MAX) NULL,
    [released]    DATETIME      NULL,
    [status]      VARCHAR (50)  NULL,
    [sound]       VARCHAR (50)  NULL,
    [versions]    VARCHAR (50)  NULL,
    [price]       MONEY         NULL,
    [rating]      VARCHAR (50)  NULL,
    [year]        VARCHAR (50)  NULL,
    [genre]       VARCHAR (50)  NULL,
    [aspect]      VARCHAR (50)  NULL,
    [UPC]         VARCHAR (50)  NULL,
    [releaseDate] DATETIME      NULL,
    [active]      BIT           NULL,
    [rented]      BIT           NOT NULL
);

CREATE TABLE [dbo].[customer] (
    [custID]        INT           IDENTITY (1, 1) NOT NULL,
    [firstName]     VARCHAR (50)  NULL,
    [lastName]      VARCHAR (50)  NULL,
    [streetAddress] VARCHAR (MAX) NULL,
    [city]          VARCHAR (50)  NULL,
    [state]         VARCHAR (50)  NULL,
    [zip]           INT           NULL,
    [phone]         VARCHAR (50)  NULL,
    [balance]       MONEY         NULL,
    [dvdsOut]       INT           NULL,
    [active]        BIT           NULL
);

CREATE TABLE [dbo].[employee] (
    [empID]         INT           IDENTITY (1, 1) NOT NULL,
    [firstName]     VARCHAR (50)  NULL,
    [lastName]      VARCHAR (50)  NULL,
    [streetAddress] VARCHAR (MAX) NULL,
    [city]          VARCHAR (50)  NULL,
    [state]         VARCHAR (50)  NULL,
    [zip]           INT           NULL,
    [phone]         VARCHAR (50)  NULL,
    [userName]      VARCHAR (10)  NULL,
    [llv_password]  VARCHAR (50)  NULL,
    [salt]          CHAR (10)     NULL,
    [manager]       BIT           NULL,
    [active]        BIT           NULL
);

CREATE TABLE [dbo].[rental] (
    [rentalID]  INT      IDENTITY (1, 1) NOT NULL,
    [custID]    INT      NOT NULL,
    [videoID]   INT      NOT NULL,
    [empID]     INT      NOT NULL,
    [dayRented] DATETIME NULL,
    [dayDue]    DATETIME NULL,
    [returned]  BIT      NULL
);
