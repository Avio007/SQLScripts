DBCC FREESYSTEMCACHE ('ALL')
DBCC FREESESSIONCACHE
DBCC FREEPROCCACHE

SET STATISTICS TIME ON 

SELECT COUNT(*)
FROM [TestPartition].[dbo].[tbl_testpartitionOhnePartion]

SELECT TOP (1000) 
    [name]
    ,[status]
    ,[createtimestamp]
FROM [TestPartition].[dbo].[tbl_testpartitionOhnePartion]
WHERE [createtimestamp] = '2018-09-29 13:48:48.000'


SELECT COUNT(*)
FROM [TestPartition].[dbo].[tbl_testpartition]

SELECT TOP (1000) 
    [name]
    ,[status]
    ,[createtimestamp]
  FROM [TestPartition].[dbo].[tbl_testpartition]
  WHERE [createtimestamp] = '2018-04-09 14:26:27.000'
