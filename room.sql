CREATE TABLE room (roomNo int primary key, roomType nvarchar(50), roomFloor int, capacity int)

GO
CREATE PROC usp_InsertData (@roomNo int, @rType nvarchar(50), @rfloor int, @capacity int)
AS
BEGIN
	BEGIN TRY
		IF @rType IS NOT NULL and @rFloor IS NOT NULL and @capacity IS NOT NULL
			BEGIN
				INSERT INTO dbo.room(roomNo, roomType, roomFloor, capacity) VALUES (@roomNo, @rType, @rFloor, @capacity)
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


EXEC usp_InsertData @roomNo='07', @rType='Suite', @rFloor='01', @capacity = '2'
EXEC usp_InsertData @roomNo='11', @fName='Master', @rFloor='02', @capacity = '3'

GO
CREATE PROC usp_getData
AS
BEGIN
SELECT * FROM dbo.room
END
GO

EXEC usp_getData
