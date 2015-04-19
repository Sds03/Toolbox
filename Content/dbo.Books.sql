USE [toolbox]
GO

/****** Objekt: Table [dbo].[Books] Skriptdatum: 2015-04-19 20:42:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Books] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [titel]          VARCHAR (MAX) NULL,
    [author]         VARCHAR (50)  NULL,
    [booknr]         VARCHAR (50)  NULL,
    [location]       INT           NULL,
    [description]    VARCHAR (MAX) NULL,
    [numberOfCopies] INT           NULL,
    [nrOfPages]      INT           NULL,
    [yearpublished]  VARCHAR (10)  NULL,
    [pictureURL]     VARCHAR (50)  NULL,
    [publisher]      VARCHAR (50)  NULL,
    [checkedOut]     INT           NULL,
    [lent]           BIT           NULL
);


