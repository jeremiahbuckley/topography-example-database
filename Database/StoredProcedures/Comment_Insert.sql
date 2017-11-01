CREATE PROCEDURE [dbo].[Comment_Insert]
	@topicid int,
	@threadid int,
	@userid int,
	@comment nvarchar(max),
	@replytocommentid int null
AS
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Comment]
			   ([TopicId]
			   ,[ThreadId]
			   ,[UserId]
			   ,[ReplyToCommentId]
			   ,[Comment]
			   ,[DateTimeAdded])
		 VALUES
			   (@topicid, @threadid, @userid, @replytocommentid, @comment, getdate())

	SELECT CAST(SCOPE_IDENTITY() as int) as Id

RETURN 0
