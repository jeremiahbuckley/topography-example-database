CREATE PROCEDURE [dbo].[User_Delete]
	@id int
AS
	SET NOCOUNT ON;

	DELETE FROM [dbo].[User]
		  WHERE Id = @id

RETURN 0
