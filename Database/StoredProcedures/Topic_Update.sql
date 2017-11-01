CREATE PROCEDURE [dbo].[Topic_Update]
	@id int,
	@name nvarchar(2000),
	@enabled bit = 1
AS
	SET NOCOUNT ON;

	DECLARE @updateId int
	IF exists(select top 1 Id FROM [dbo].[Topic] where Id = @id)
		BEGIN
			UPDATE [dbo].[Topic]
			SET Name = @name
			   ,Enabled = @enabled
			WHERE Id = @id
			SELECT @updateId = Id from [dbo].[Topic] where Id = @id
		END
	ELSE
		BEGIN
			EXEC @updateId = [dbo].[Topic_Insert] @name, @enabled
		END

	SELECT @updateId as Id

RETURN 0
