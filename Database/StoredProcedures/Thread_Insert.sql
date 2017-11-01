CREATE PROCEDURE [dbo].[Thread_Insert]
	@topicid int,
	@name nvarchar(2000),
	@enabled bit = 1,
	@pinned bit = 0,
	@pinorder int null
AS
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Thread]
			   ([TopicId]
			   ,[Name]
			   ,[Enabled]
			   ,[Pinned]
			   ,[PinOrder])
		 VALUES
			   (@topicid, @name, @enabled, @pinned, @pinorder)

	SELECT CAST(SCOPE_IDENTITY() as int) as Id
RETURN 0