CREATE TABLE hotel (hId nvarchar(50),  hotelName nvarchar(50),  hotelCity nvarchar(50))

GO
CREATE PROC usp_InsertData (@hId nvarchar(50), @hName nvarchar(50), @hCity nvarchar(50))
AS
BEGIN
	BEGIN TRY
		IF @hname IS NOT NULL and @hcity IS NOT NULL
			BEGIN
				INSERT INTO dbo.hotel(hId, hotelName, hotelCity) VALUES (@hId, @hName, @hCity)
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


EXEC usp_InsertData @hId='H001', @hName='Hoteldelluna', @hCity = 'SouthKorea'
EXEC usp_InsertData @hId='H007', @hName='MorningBliss', @hCity = 'Singapore'


GO
CREATE PROC usp_getData
AS
BEGIN
SELECT * FROM dbo.hotel
END
GO

EXEC usp_getData
