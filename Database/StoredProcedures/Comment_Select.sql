CREATE PROCEDURE [dbo].[Comment_Select]
	@id int = null
AS
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @id is null
		BEGIN
			SELECT [Id]
				  ,[TopicId]
				  ,[ThreadId]
				  ,[UserId]
				  ,[Comment]
				  ,[ReplyToCommentId]
				  ,[DateTimeAdded]
				  ,[Version]
			  FROM [dbo].[Comment]
  		END
	ELSE
		BEGIN
			SELECT [Id]
				  ,[TopicId]
				  ,[ThreadId]
				  ,[Comment]
				  ,[UserId]
				  ,[ReplyToCommentId]
				  ,[DateTimeAdded]
				  ,[Version]
			  FROM [dbo].[Comment]
			  WHERE Id = @id
		END
RETURN 0
