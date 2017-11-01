CREATE PROCEDURE [dbo].[Topic_Delete]
	@id int
AS
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Topic]
		  WHERE Id = @id
RETURN 0
