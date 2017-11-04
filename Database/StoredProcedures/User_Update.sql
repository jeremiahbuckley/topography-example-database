CREATE PROCEDURE [dbo].[User_Update]
	@id int,
	@version rowversion,
	@name nvarchar(50),
	@enabled bit = 1
AS
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	BEGIN TRY
		DECLARE @t TABLE(id int);

		DECLARE @updateId int
		IF exists(select top 1 Id FROM [dbo].[User] where Id = @id)
			BEGIN
				UPDATE [dbo].[User]
				SET Name = @name
					,Enabled = @enabled
				OUTPUT inserted.Id INTO @t(id)
				WHERE Id = @id AND Version = @version

				IF (SELECT COUNT(*) FROM @t) = 0
				BEGIN
					;THROW 50000, 'Concurrency error when attempting to update record.', @id
				END

				SELECT @updateId = Id from [dbo].[User] where Id = @id
			END
		ELSE
			BEGIN
				EXEC @updateId = [dbo].[User_Insert] @name, @enabled
			END

		SELECT @updateId as Id
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
	END CATCH
	
	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;

RETURN 0
