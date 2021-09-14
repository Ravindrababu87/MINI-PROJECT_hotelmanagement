CREATE TABLE [dbo].[Hotel](
    [HotelID] [int] IDENTITY(1,1) NOT NULL,
    [HotelName] [nvarchar](128) NOT NULL,
    CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
    (
      [HotelID] ASC
    ) WITH (
              PAD_INDEX  = OFF
              , STATISTICS_NORECOMPUTE  = OFF
              , IGNORE_DUP_KEY = OFF
              , ALLOW_ROW_LOCKS  = ON
              , ALLOW_PAGE_LOCKS  = ON
    ) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
INSERT INTO Hotel
SELECT 'Hotel Delluna'
UNION
SELECT 'Morning Bliss'
UNION
SELECT 'Hotel ABC'

SELECT * FROM Hotel

CREATE TABLE [dbo].[Room](
    [RoomID] [int] IDENTITY(1,1) NOT NULL,
    [RoomDescription] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
 (
     [RoomID] ASC
 )WITH (PAD_INDEX  = OFF
        , STATISTICS_NORECOMPUTE  = OFF
        , IGNORE_DUP_KEY = OFF
        ,     ALLOW_ROW_LOCKS  = ON
         , ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
  ) ON [PRIMARY]

GO

INSERT INTO Room
SELECT 'Suite'
UNION 
SELECT 'Master'
UNION 
SELECT 'Deluxe'

SELECT * FROM Room

CREATE TABLE [dbo].[HotelRoom](
[HotelID] [int] NOT NULL,
[RoomID] [int] NOT NULL,
[Price] [money] NOT NULL,
CONSTRAINT [PK_ShopProduct] PRIMARY KEY CLUSTERED 
 (
     [HotelID] ASC,
      [RoomID] ASC
 )WITH (PAD_INDEX  = OFF,
     STATISTICS_NORECOMPUTE  = OFF, 
     IGNORE_DUP_KEY = OFF, 
     ALLOW_ROW_LOCKS  = ON,
     ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
  ) ON [PRIMARY]

 GO

 INSERT INTO HotelRoom VALUES(1,2,159.99) 
INSERT INTO HotelRoom VALUES(2,1,259.99)
INSERT INTO HotelRoom VALUES(3,3,199.99) 

SELECT      Hotel.*
        , HotelRoom.*
        , Room.*
FROM         Hotel 
INNER JOIN  HotelRoom ON HotelRoom.RoomID = HotelRoom.HotelID 
INNER JOIN  Room ON HotelRoom.RoomID = Hotel.HotelID
WHERE       Hotel.HotelID=2

