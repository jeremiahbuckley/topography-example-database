CREATE PROCEDURE [dbo].[Thread_Update]
	@id int,
	@topicid int,
	@name nvarchar(2000),
	@enabled bit = 1,
	@pinned bit = 0,
	@pinorder int null
AS
	SET NOCOUNT ON;

	DECLARE @updateId int
	IF exists(select top 1 Id FROM [dbo].[Thread] where Id = @id)
		BEGIN
			UPDATE [dbo].[Thread]
			SET TopicId = @topicid
			   ,Name = @name
			   ,Enabled = @enabled
			   ,Pinned = @pinned
			   ,PinOrder = @pinorder
			WHERE Id = @id
			SELECT @updateId = Id from [dbo].[Thread] where Id = @id
		END
	ELSE
		BEGIN
			EXEC @updateId = [dbo].[Thread_Insert] @topicid, @name, @enabled, @pinned, @pinorder
		END

	SELECT @updateId as Id

RETURN 0
