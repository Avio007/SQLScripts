USE TestPartition;  
GO  
-- Adds four new filegroups to the TestPartition database  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR01FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR02FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR03FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR04FG;   
GO
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR05FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR06FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR07FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR08FG;  
GO
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR09FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR10FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR11FG;  
GO  
ALTER DATABASE TestPartition  
ADD FILEGROUP YEAR12FG;  

-- Adds one file for each filegroup.  
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR01DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR01DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR01FG;  
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR02DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR02DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR02FG;  
GO  
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR03DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR03DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR03FG;  
GO  
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR04DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR04DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR04FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR05DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR05DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR05FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR06DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR06DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR06FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR07DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR07DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR07FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR08DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR08DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR08FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR09DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR09DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR09FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR10DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR10DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR10FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR11DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR11DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR11FG;  
GO
ALTER DATABASE TestPartition   
ADD FILE   
(  
    NAME = YEAR12DAT,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\YEAR12DAT.ndf',  
    SIZE = 5MB,  
    MAXSIZE = 100MB,  
    FILEGROWTH = 5MB  
)  
TO FILEGROUP YEAR12FG;  
GO

-- Creates a partition function called myRangePF1 that will partition a table into four partitions  
--CREATE PARTITION FUNCTION myRangePF1 (int)  
--    AS RANGE LEFT FOR VALUES (1, 100, 1000) ;  
CREATE PARTITION FUNCTION [DateRangePF1] (datetime)  
AS RANGE RIGHT FOR VALUES ('20180201', '20180301', '20180401',  
               '20180501', '20180601', '20180701', '20180801',   
               '20180901', '20181001', '20181101', '20181201');
GO  
-- Creates a partition scheme called myRangePS1 that applies myRangePF1 to the four filegroups created above  
CREATE PARTITION SCHEME RangeYearPS 
    AS PARTITION DateRangePF1  
    TO (YEAR01FG, YEAR02FG, YEAR03FG, YEAR04FG, YEAR05FG, YEAR06FG, YEAR07FG, YEAR08FG, YEAR09FG, YEAR10FG, YEAR11FG, YEAR12FG) ;  
GO  
-- Creates a partitioned table called PartitionTable that uses myRangePS1 to partition col1  
--CREATE TABLE PartitionTable (col1 int PRIMARY KEY, col2 char(10))  
--    ON RangeYearPS (col1) ;  
GO
CREATE TABLE [dbo].[tbl_testpartition](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [int] NULL,
	[createtimestamp] [datetime] NULL,
	[updatestimstamp] [datetime] NULL,
	[payload] [nvarchar](max) NULL,
) ON RangeYearPS ([createtimestamp])
GO

