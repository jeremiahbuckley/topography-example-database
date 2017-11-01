CREATE PROCEDURE [dbo].[Comment_Delete]
	@id int
AS
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Comment]
		  WHERE Id = @id
RETURN 0
