CREATE PROCEDURE [dbo].[Topic_Select]
	@id int = null
AS
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @id is NULL
		BEGIN
			SELECT [Name]
				  ,[Enabled]
				  ,[Id]
			  FROM [dbo].[Topic]
		END
	ELSE
		BEGIN
			SELECT [name]
				  ,[Enabled]
				  ,[id]
			  FROM [dbo].[topic]
			  WHERE [id] = @id
		END

RETURN 0
