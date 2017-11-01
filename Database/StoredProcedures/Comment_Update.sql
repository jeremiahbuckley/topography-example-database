CREATE PROCEDURE [dbo].[Comment_Update]
	@id int,
	@topicid int,
	@threadid int,
	@userid int,
	@comment nvarchar(max),
	@replytocommentid int null
AS
	SET NOCOUNT ON;

	DECLARE @updateId int
	IF exists(select top 1 Id FROM [dbo].[Comment] where Id = @id)
		BEGIN
			UPDATE [dbo].[Comment]
			SET TopicId = @topicid
			   ,ThreadId = @threadid
			   ,UserId = @userid
			   ,Comment = @comment
			   ,ReplyToCommentId = @replytocommentid
			WHERE Id = @id
			SELECT @updateId = Id from [dbo].[Comment] where Id = @id
		END
	ELSE
		BEGIN
			EXEC @updateId = [dbo].[Comment_Insert] @topicid, @threadid, @userid, @comment, @replytocommentid
		END

	SELECT @updateId as Id

RETURN 0
