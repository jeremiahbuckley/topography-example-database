CREATE PROCEDURE [dbo].[User_Select]
	@id int = null
AS
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @id is null
		BEGIN
			SELECT [Name]
				  ,[Enabled]
				  ,[DateTimeJoined]
				  ,[Id]
			  FROM [dbo].[User]
		END
	ELSE
		BEGIN
			SELECT [name]
				  ,[enabled]
				  ,[DateTimeJoined]
				  ,[id]
			  FROM [dbo].[user]
			  WHERE id = @id
		END
RETURN 0
