CREATE TABLE [dbo].[Comment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Comment] NVARCHAR(MAX) NOT NULL, 
    [TopicId] INT NOT NULL, 
    [ThreadId] INT NOT NULL, 
    [ReplyToCommentId] INT NULL, 
    [DateTimeAdded] DATETIME NOT NULL, 
    [UserId] INT NOT NULL, 
    [Version] ROWVERSION NOT NULL
)
