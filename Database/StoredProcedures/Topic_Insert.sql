CREATE PROCEDURE [dbo].[Topic_Insert]
	@name nvarchar(2000),
	@enabled bit = 1
AS
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Topic]
			   ([Name]
			   ,[Enabled])
		 VALUES
			   (@name, @enabled)

	SELECT CAST(SCOPE_IDENTITY() as int) as Id
RETURN 0