CREATE PROCEDURE [dbo].[Thread_Get]
	@id int = null
AS
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @id is NULL
		BEGIN
			SELECT [Id]
			      ,[TopicId]
				  ,[Name]
			      ,[Pinned]
				  ,[PinOrder]
				  ,[Enabled]
			  FROM [dbo].[Thread]
		END
	ELSE
		BEGIN
			SELECT [Id]
			      ,[TopicId]
				  ,[Name]
			      ,[Pinned]
				  ,[PinOrder]
				  ,[Enabled]
			  FROM [dbo].[Thread]
			  WHERE [Id] = @id
		END
RETURN 0
