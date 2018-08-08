USE [TestPartition]
GO
DECLARE @name				nvarchar(50)
DECLARE @status				int
DECLARE @createtimestamp	datetime
DECLARE @updatestimstamp	datetime
DECLARE @payload			nvarchar(max)	
DECLARE  @RandomDate datetime
DECLARE @count int
SET @count = 1

WHILE (@count < 1000000)
BEGIN
	SELECT    @RandomDate   = 
    DATEADD(day, ROUND(DATEDIFF(day, '2018-01-01', '2018-12-31') * RAND(CHECKSUM(NEWID())), 0),
    DATEADD(second, CHECKSUM(NEWID()) % 48000, '2018-01-01'))

	INSERT INTO [dbo].[tbl_testpartition]
	([name]
	,[status]
	,[createtimestamp]
	,[updatestimstamp]
	,[payload])
	VALUES
	('@name'
	,@count
	,@RandomDate
	,@RandomDate
	,'')

	SET @count = @count + 1
END

WHILE (@count < 1000000)
BEGIN
	SELECT    @RandomDate   = 
    DATEADD(day, ROUND(DATEDIFF(day, '2018-01-01', '2018-12-31') * RAND(CHECKSUM(NEWID())), 0),
    DATEADD(second, CHECKSUM(NEWID()) % 48000, '2018-01-01'))

	INSERT INTO [dbo].[tbl_testpartitionOhnePartion]
	([name]
	,[status]
	,[createtimestamp]
	,[updatestimstamp]
	,[payload])
	VALUES
	('@name'
	,@count
	,@RandomDate
	,@RandomDate
	,'')

	SET @count = @count + 1
END

