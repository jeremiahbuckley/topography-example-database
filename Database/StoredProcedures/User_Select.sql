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
				  ,[Version]
			  FROM [dbo].[User]
		END
	ELSE
		BEGIN
			SELECT [Name]
				  ,[Enabled]
				  ,[DateTimeJoined]
				  ,[Id]
				  ,[Version]
			  FROM [dbo].[User]
			  WHERE id = @id
		END
RETURN 0
