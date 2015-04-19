CREATE TABLE [dbo].[Books] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [titel]          VARCHAR (MAX)  NULL,
    [author]         VARCHAR(50) NULL,
    [booknr]         NCHAR (10)     NULL,
    [location]       INT            NULL,
    [description]    VARCHAR (MAX)  NULL,
    [numberOfCopies] INT            NULL,
    [nrOfPages]      INT            NULL,
    [yearpublished]  VARCHAR (10)   NULL,
    [pictureURL]     VARCHAR (50)   NULL,
    [publisher]      VARCHAR (50)   NULL,
    [checkedOut]     INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

