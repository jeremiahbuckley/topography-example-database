CREATE TABLE [dbo].[Thread]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(MAX) NOT NULL, 
    [Pinned] BIT NOT NULL, 
    [PinOrder] INT NULL, 
    [Enabled] INT NOT NULL, 
    [TopicId] INT NOT NULL, 
    [Version] ROWVERSION NOT NULL
)
