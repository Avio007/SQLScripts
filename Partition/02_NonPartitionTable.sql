USE [TestPartition]
GO

/****** Object:  Table [dbo].[tbl_testpartitionOhnePartion]    Script Date: 08.08.2018 14:48:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_testpartitionOhnePartion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [int] NULL,
	[createtimestamp] [datetime] NULL,
	[updatestimstamp] [datetime] NULL,
	[payload] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_testpartitionOhnePartion] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

