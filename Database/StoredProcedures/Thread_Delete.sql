CREATE PROCEDURE [dbo].[Thread_Delete]
	@id int
AS
	SET NOCOUNT ON;

	DELETE FROM [dbo].[Thread]
		  WHERE Id = @id
RETURN 0
