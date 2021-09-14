CREATE TABLE customer (cId int primary key, firstName nvarchar(50), lastName nvarchar(50), age int)

GO
CREATE PROC usp_InsertData (@cId int, @fName nvarchar(50), @lName nvarchar(50), @age int)
AS
BEGIN
	BEGIN TRY
		IF @fname IS NOT NULL and @lName IS NOT NULL and @age IS NOT NULL
			BEGIN
				INSERT INTO dbo.customer(cId, firstName, lastName, age) VALUES (@cId, @fName, @lName, @age)
			END
		ELSE
			BEGIN
				RETURN -1
			END
	END TRY
	BEGIN CATCH
		RETURN -99
	END CATCH
END
GO 


EXEC usp_InsertData @cId='01', @fName='smitha', @lName='Dsouza', @age = '35'
EXEC usp_InsertData @cId='02', @fName='John', @lName='fernandis', @age = '42'


GO
CREATE PROC usp_getData
AS
BEGIN
SELECT * FROM dbo.customer
END
GO

EXEC usp_getData
