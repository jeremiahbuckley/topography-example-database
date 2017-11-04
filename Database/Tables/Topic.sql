﻿CREATE TABLE [dbo].[Topic]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(MAX) NOT NULL, 
    [Enabled] BIT NOT NULL, 
    [Version] ROWVERSION NOT NULL
)
