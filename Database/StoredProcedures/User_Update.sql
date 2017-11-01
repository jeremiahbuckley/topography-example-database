CREATE PROCEDURE [dbo].[User_Update]
	@id int,
	@name nvarchar(50),
	@enabled bit = 1
AS
	SET NOCOUNT ON;

	DECLARE @updateId int
	IF exists(select top 1 Id FROM [dbo].[User] where Id = @id)
		BEGIN
			UPDATE [dbo].[User]
			SET Name = @name
			   ,Enabled = @enabled
			WHERE Id = @id
			SELECT @updateId = Id from [dbo].[User] where Id = @id
		END
	ELSE
		BEGIN
			EXEC @updateId = [dbo].[User_Insert] @name, @enabled
		END

	SELECT @updateId as Id

RETURN 0
