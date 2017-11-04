CREATE PROCEDURE [dbo].[Comment_Update]
	@id int,
	@version rowversion,
	@topicid int,
	@threadid int,
	@userid int,
	@comment nvarchar(max),
	@replytocommentid int null
AS
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	BEGIN TRY
		DECLARE @t TABLE(id int);

		DECLARE @updateId int
		IF exists(select top 1 Id FROM [dbo].[Comment] where Id = @id)
			BEGIN
				UPDATE [dbo].[Comment]
				SET TopicId = @topicid
				   ,ThreadId = @threadid
				   ,UserId = @userid
				   ,Comment = @comment
				   ,ReplyToCommentId = @replytocommentid
				OUTPUT inserted.Id INTO @t(id)
				WHERE Id = @id AND Version = @version

				IF (SELECT COUNT(*) FROM @t) = 0
				BEGIN
					;THROW 50000, 'Concurrency error when attempting to update record.', @id
				END

				SELECT @updateId = Id from [dbo].[Comment] where Id = @id
			END
		ELSE
			BEGIN
				EXEC @updateId = [dbo].[Comment_Insert] @topicid, @threadid, @userid, @comment, @replytocommentid
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
