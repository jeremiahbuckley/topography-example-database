CREATE PROCEDURE [dbo].[User_Insert]
	@name nvarchar(50),
	@enabled bit = 1
AS
	SET NOCOUNT ON;

	INSERT INTO [dbo].[User]
			   ([Name]
			   ,[Enabled]
			   ,[DateTimeJoined])
		 VALUES
			   (@name, @enabled, GETDATE())

	SELECT CAST(SCOPE_IDENTITY() as int) as Id
RETURN 0