CREATE PROCEDURE [dbo].[User_SelectByName]
	@name as varchar(400)
AS
	SELECT [Name]
		,[Enabled]
		,[DateTimeJoined]
		,[Id]
		,[Version]
	FROM [dbo].[User]
	WHERE Name = @name
RETURN 0
