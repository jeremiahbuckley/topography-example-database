CREATE PROCEDURE [dbo].[Thread_Update]
	@id int,
	@version rowversion,
	@topicid int,
	@name nvarchar(2000),
	@enabled bit = 1,
	@pinned bit = 0,
	@pinorder int null
AS
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	BEGIN TRY
		DECLARE @t TABLE(id int);

		DECLARE @updateId int
		IF exists(select top 1 Id FROM [dbo].[Thread] where Id = @id)
			BEGIN
				UPDATE [dbo].[Thread]
				SET TopicId = @topicid
				   ,Name = @name
				   ,Enabled = @enabled
				   ,Pinned = @pinned
				   ,PinOrder = @pinorder
				OUTPUT inserted.Id INTO @t(id)
				WHERE Id = @id AND Version = @version

				IF (SELECT COUNT(*) FROM @t) = 0
				BEGIN
					;THROW 50000, 'Concurrency error when attempting to update record.', @id
				END

				SELECT @updateId = Id from [dbo].[Thread] where Id = @id
			END
		ELSE
			BEGIN
				EXEC @updateId = [dbo].[Thread_Insert] @topicid, @name, @enabled, @pinned, @pinorder
			END

		SELECT @updateId as Id
	
		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW;
	END CATCH

RETURN 0
