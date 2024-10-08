USE [master]
GO
/****** Object:  Database [db_mcs_data]    Script Date: 06/21/2023 15:47:23 ******/
CREATE DATABASE [db_mcs_data] ON  PRIMARY 
( NAME = N'db_mcs_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_mcs_data.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_mcs_data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_mcs_data_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_mcs_data] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_mcs_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_mcs_data] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_mcs_data] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_mcs_data] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_mcs_data] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_mcs_data] SET ARITHABORT OFF
GO
ALTER DATABASE [db_mcs_data] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [db_mcs_data] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_mcs_data] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [db_mcs_data] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_mcs_data] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_mcs_data] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_mcs_data] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_mcs_data] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_mcs_data] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_mcs_data] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_mcs_data] SET  DISABLE_BROKER
GO
ALTER DATABASE [db_mcs_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_mcs_data] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_mcs_data] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_mcs_data] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_mcs_data] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_mcs_data] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_mcs_data] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [db_mcs_data] SET  READ_WRITE
GO
ALTER DATABASE [db_mcs_data] SET RECOVERY FULL
GO
ALTER DATABASE [db_mcs_data] SET  MULTI_USER
GO
ALTER DATABASE [db_mcs_data] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_mcs_data] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_mcs_data', N'ON'
GO
USE [db_mcs_data]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 06/21/2023 15:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Pwd] [varchar](512) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[RoleID] [bigint] NULL,
	[Enabled] [int] NULL,
	[AddTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[Remark] [nvarchar](256) NULL,
	[Department] [nvarchar](50) NULL,
	[AvatarName] [varchar](100) NULL,
	[DevUser] [varchar](50) NULL,
	[JobNumber] [varchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserInfo] UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (1, N'admin', N'管理员11', N'637938E74C5C8FBBBD4F50C852720DA2B6781501756FE68D9BC9DA32D4C00255', N'186227115', N'2', 1, 1, CAST(0x0000AD6400F3F73D AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'w3w4323月3月', N'', N'1_6612d58c9b6d40d4aa2772f581c91573_.png', N'222sdfs', N'11')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (15, N'Z00207', N'用户1', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'324234', N'23423', 9, 1, CAST(0x0000ACA700AE373B AS DateTime), CAST(0x0000ADE10114F018 AS DateTime), N'3423423', N'', NULL, N'z00207', N'Z00207')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (19, N'Z04177', N'用户5', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACA700AECBE9 AS DateTime), CAST(0x0000ACA700CEF02A AS DateTime), N'', N'', NULL, N'z04177', N'Z04177')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (21, N'W01447', N'用户7', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACA700AF03DC AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'', N'', NULL, N'w01447', N'W01447')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (23, N'W00335', N'用户9', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B059EB AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'', N'', NULL, N'w00335', N'W00335')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (24, N'W00332', N'用户10', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 1, 1, CAST(0x0000ACC300B0C4ED AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'', N'', NULL, N'w00332', N'')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (25, N'Z00184', N'用户11', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 24, 1, CAST(0x0000ACC300B0E84E AS DateTime), CAST(0x0000ACC300B65821 AS DateTime), N'', N'', NULL, N'z00184', N'Z00184')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (26, N'Z00201', N'用户12', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B110B0 AS DateTime), CAST(0x0000ACC300B66390 AS DateTime), N'', N'', NULL, N'z00201', N'Z00201')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (27, N'H02778', N'用户13', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B12AE1 AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'', N'', NULL, N'h02778', N'H02778')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (28, N'Z04071', N'用户14', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B2332E AS DateTime), CAST(0x0000ACC300B910B1 AS DateTime), N'', N'', NULL, N'z04071', N'Z04071')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (29, N'S52753', N'用户15', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 24, 1, CAST(0x0000ACC300B2635E AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'', N'', NULL, N's52753', N'S52753')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (31, N'Z04150', N'刘杰', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B2A21A AS DateTime), CAST(0x0000ACC300B69B93 AS DateTime), N'', N'', NULL, N'z04150', N'Z04150')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (32, N'Z04162', N'王国晨', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B2C836 AS DateTime), CAST(0x0000ACC300B68FEC AS DateTime), N'', N'', NULL, N'z04162', N'Z04162')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (33, N'Z04292', N'李波', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'', N'', 9, 1, CAST(0x0000ACC300B2E076 AS DateTime), CAST(0x0000ACC300B6830B AS DateTime), N'', N'', NULL, N'z04292', N'Z04292')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (39, N'WE2', N'W43W4', N'BBEF9EC178E5EC2892D5C37FE1F7DD36F5D6872F7879B4500293068A09E21EBA', N'DFSS', N'', 1, 1, CAST(0x0000AD6D010859EC AS DateTime), CAST(0x0000ADE200A9F434 AS DateTime), N'SDGSDGSDFSD', N'', NULL, N'EWRWER', N'')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (41, N'械', N'基本原则', N'217B8097B019BC3713D7D14E1F6C02961CABF0093C7B7AA7F7538F433E985809', N'要', N'工', 1, NULL, CAST(0x0000ADCF01016B89 AS DateTime), CAST(0x0000ADCF01016B89 AS DateTime), N'村', NULL, NULL, NULL, N'')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (42, N'12要', N'测试1', N'E20EDB80DFBE65C958DD1C823A8AF80B9D29A680D3CC7D05750A44BDF684C010', N'地', N'地', 1, 0, CAST(0x0000ADCF01023158 AS DateTime), CAST(0x0000ADE200AA0244 AS DateTime), N' 可想而知', NULL, NULL, NULL, N'')
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (43, N'1333', N'霜', N'2905B51CDDF2FD3293E0E8B7EBBDA3BB06ED32ADAE0E06CD6ED4D2B0477E8EC7', N'23', N'2', 4, 0, CAST(0x0000ADCF0102F594 AS DateTime), CAST(0x0000ADE200AA0244 AS DateTime), N'2323', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (44, N'a33e', N'33', N'48C2FCD6459907A647E13D7166CC05CF66BE18BC89E33F71FAB71E531CD115D9', NULL, NULL, NULL, 0, CAST(0x0000ADCF01061DC9 AS DateTime), CAST(0x0000ADE200AA0244 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([ID], [LoginName], [UserName], [Pwd], [Phone], [Email], [RoleID], [Enabled], [AddTime], [UpdateTime], [Remark], [Department], [AvatarName], [DevUser], [JobNumber]) VALUES (45, N'erte', N'terte', N'09D2457CFC170A6CDC61F8C233BE57F88A398A58528A05D8916C3C59353FBFE0', N'', N'', 2, 1, CAST(0x0000ADF600B83302 AS DateTime), CAST(0x0000ADF600B8330C AS DateTime), N'', NULL, NULL, NULL, N'')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
/****** Object:  Table [dbo].[TaskList_1]    Script Date: 06/21/2023 15:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskList_1](
	[ID] [int] NOT NULL,
	[TaskName] [nvarchar](50) NOT NULL,
	[Length] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Thickness] [float] NOT NULL,
	[FinishCount] [int] NOT NULL,
	[TotalCount] [int] NOT NULL,
	[FeedCount] [int] NOT NULL,
	[CompleteState] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NULL,
	[FinishTime] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[TaskList_1] ([ID], [TaskName], [Length], [Width], [Thickness], [FinishCount], [TotalCount], [FeedCount], [CompleteState], [AddTime], [FinishTime]) VALUES (1, N'111', 2, 3, 4, 5, 6, 7, N'false', NULL, NULL)
INSERT [dbo].[TaskList_1] ([ID], [TaskName], [Length], [Width], [Thickness], [FinishCount], [TotalCount], [FeedCount], [CompleteState], [AddTime], [FinishTime]) VALUES (1, N'111', 2, 3, 4, 5, 6, 7, N'false', NULL, NULL)
INSERT [dbo].[TaskList_1] ([ID], [TaskName], [Length], [Width], [Thickness], [FinishCount], [TotalCount], [FeedCount], [CompleteState], [AddTime], [FinishTime]) VALUES (2, N'22', 2, 222, 4, 5, 6, 7, N'false', NULL, NULL)
INSERT [dbo].[TaskList_1] ([ID], [TaskName], [Length], [Width], [Thickness], [FinishCount], [TotalCount], [FeedCount], [CompleteState], [AddTime], [FinishTime]) VALUES (1, N'111', 1, 1, 1, 5, 5, 5, N'no', NULL, NULL)
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 06/21/2023 15:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Enabled] [int] NULL,
	[AddTime] [datetime] NULL,
	[Remark] [nvarchar](256) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_RoleInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_RoleInfo] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RoleInfo] ON
INSERT [dbo].[RoleInfo] ([ID], [RoleName], [Enabled], [AddTime], [Remark], [UpdateTime]) VALUES (1, N'超级管理员', 1, CAST(0x0000AD6400F6FE27 AS DateTime), N'枯在', CAST(0x0000ADC80114E6B8 AS DateTime))
INSERT [dbo].[RoleInfo] ([ID], [RoleName], [Enabled], [AddTime], [Remark], [UpdateTime]) VALUES (3, N'1212', 1, CAST(0x0000ADC801018902 AS DateTime), N'要23232', CAST(0x0000ADC80114EEEC AS DateTime))
INSERT [dbo].[RoleInfo] ([ID], [RoleName], [Enabled], [AddTime], [Remark], [UpdateTime]) VALUES (5, N'管理员', 1, CAST(0x0000ADC80109499E AS DateTime), N'', NULL)
SET IDENTITY_INSERT [dbo].[RoleInfo] OFF
/****** Object:  Table [dbo].[Log]    Script Date: 06/21/2023 15:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Module] [int] NULL,
	[Identifier] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[Remark] [nvarchar](max) NULL,
	[Param1] [nvarchar](max) NULL,
	[Param2] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[UserHostAddress] [varchar](50) NULL,
 CONSTRAINT [PK_LogInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (1, 2, 14, N'2', N'修改员工信息', 1, CAST(0x0000ADDD00DDAB30 AS DateTime), NULL, N'{"ID":2,"Name":"测式","Sex":null,"DepartmentID":5,"Position":null,"Title":null,"JobNumber":"000988","JobStatus":"在职","Phone":null,"Remark":null,"Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Name":"测式","Sex":"男","DepartmentID":5,"Position":"程序员","Title":"高级","JobNumber":"000988","JobStatus":"在职","Phone":"18553343","Remark":"56","Enabled":1,"OperID":1,"AddTime":"2021-11-03T11:29:44.51","DepartmentName":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (2, 2, 14, N'1', N'修改员工信息', 1, CAST(0x0000ADDD00F50AF0 AS DateTime), NULL, N'{"ID":1,"Name":"1号","Sex":null,"DepartmentID":0,"Position":null,"Title":null,"JobNumber":"","JobStatus":"","Phone":null,"Remark":null,"Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Name":"1号","Sex":"女","DepartmentID":0,"Position":"se sdfsfs","Title":"few","JobNumber":"","JobStatus":"","Phone":"sdfs","Remark":"sdfsdf","Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (3, 3, 14, N'4', N'删除员工信息', 1, CAST(0x0000ADDD0100B5B5 AS DateTime), N'224', N'{
  "ID": 4,
  "Name": "224",
  "DepartmentID": 5,
  "JobNumber": "33434",
  "JobStatus": "12",
  "Enabled": 1
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (4, 2, 8, N'4', N'修改客户信息', 1, CAST(0x0000ADDD010448E9 AS DateTime), NULL, N'{"ID":4,"DataNumber":"顶替二","Type":null,"Name":"地","SimpleName":"顶戴","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{
  "ID": 4,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (5, 2, 8, N'11', N'修改客户信息', 1, CAST(0x0000ADDD010D23CC AS DateTime), NULL, N'{"ID":11,"DataNumber":null,"Type":null,"Name":"冰","SimpleName":null,"Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":11,"DataNumber":"ssdfsdf","Type":"","Name":"冰","SimpleName":null,"Contact":null,"ContactPhone":null,"Address":null,"Remark":"","Enabled":1,"AddTime":"2021-11-03T16:26:57.107","OperID":1,"OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (6, 2, 8, N'11', N'修改客户信息', 1, CAST(0x0000ADDD010D6DD7 AS DateTime), NULL, N'{"ID":11,"DataNumber":"ssdfsdf","Type":null,"Name":"冰","SimpleName":"","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":11,"DataNumber":"ssdfsdf","Type":"","Name":"冰","SimpleName":"","Contact":"","ContactPhone":"","Address":"","Remark":"测试测试","Enabled":1,"AddTime":"2021-11-03T16:26:57.107","OperID":1,"OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (7, 2, 11, N'8', N'修改订单信息', 1, CAST(0x0000ADDE00A5575F AS DateTime), NULL, N'{"ID":8,"Name":"测试","DataNumber":"SCDD202110280001","Status":1,"Type":"其它","ContractID":3,"CustomerID":null,"PlanCount":null,"Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"遥","Enabled":1,"AddTime":"2021-10-28T14:33:38.243","OperID":null,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Name":"测试","DataNumber":"SCDD202110280001","Status":1,"Type":"其它","ContractID":3,"CustomerID":null,"PlanCount":"10","Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"遥","Enabled":1,"AddTime":"2021-10-28T14:33:38.243","OperID":null,"StatusStr":"新增","ContractName":"华工激光","CustomerName":"","OperName":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (8, 2, 11, N'8', N'修改订单信息', 1, CAST(0x0000ADDE00A6C659 AS DateTime), NULL, N'{"ID":8,"Name":"测试","DataNumber":"SCDD202110280001","Status":1,"Type":"其它","ContractID":3,"CustomerID":4,"PlanCount":null,"Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"遥","Enabled":1,"AddTime":"2021-10-28T14:33:38.243","OperID":null,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Name":"测试","DataNumber":"SCDD202110280001","Status":1,"Type":"其它","ContractID":3,"CustomerID":4,"PlanCount":"10","Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":"2021-11-11","PlanEndTime":"2021-11-30","Remark":"遥","Enabled":1,"AddTime":"2021-10-28T14:33:38.243","OperID":null,"StatusStr":"新增","ContractName":"华工激光","CustomerName":"地","OperName":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (9, 2, 11, N'9', N'修改订单信息', 1, CAST(0x0000ADDE00A6EDD0 AS DateTime), NULL, N'{"ID":9,"Name":"测试","DataNumber":"SCDD202110281029","Status":1,"Type":"其它","ContractID":3,"CustomerID":null,"PlanCount":null,"Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":"2021-10-26T16:00:00","PlanEndTime":"2021-10-28T16:00:00","Remark":"","Enabled":0,"AddTime":"2021-10-28T14:34:56.343","OperID":null,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"Name":"测试","DataNumber":"SCDD202110281029","Status":1,"Type":"其它","ContractID":3,"CustomerID":null,"PlanCount":"10","Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":"2021-10-26T16:00:00","PlanEndTime":"2021-10-28T16:00:00","Remark":"","Enabled":0,"AddTime":"2021-10-28T14:34:56.343","OperID":null,"StatusStr":"新增","ContractName":"华工激光","CustomerName":"","OperName":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (10, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00AC43EC AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (11, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00ACDD32 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (12, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B00D28 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (13, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B03994 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (14, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B0A494 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (15, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B0DF84 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (16, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B21F7D AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"10","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (17, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B25786 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (18, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B403FC AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"10","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (19, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B41CF0 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"10","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (20, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B4902D AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"10","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (21, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00B4ABDA AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"112","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (22, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00C0E406 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":0,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractName":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"CustomerID":0,"PlanCount":"10","Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractName":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (23, 2, 9, N'8', N'修改合同信息', 1, CAST(0x0000ADDE00F255B5 AS DateTime), NULL, N'{"ID":8,"CustomerID":null,"Name":"7","DataNumber":"C202111010003","SigningDate":null,"Type":"","Status":1,"Price":"","StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Contents":null,"Attachment":null,"Remark":"","Enabled":1,"AddTime":"2021-11-01T16:09:36.77","OperID":1,"StatusStr":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"CustomerID":8,"Name":"7","DataNumber":"C202111010003","SigningDate":null,"Type":"","Status":1,"Price":"","StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Contents":null,"Attachment":null,"Remark":"","Enabled":1,"AddTime":"2021-11-01T16:09:36.77","OperID":1,"StatusStr":"新增","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (24, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADDE00F27943 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":null,"PlanCount":10,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":7,"PlanCount":10,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":"新增","ContractNumber":"","CustomerName":"","OperName":"管理员11"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (25, 2, 10, N'1', N'修改供应商信息', 1, CAST(0x0000ADDE00FB16FE AS DateTime), NULL, N'{"ID":1,"DataNumber":"23423423","Type":null,"Name":"在","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"DataNumber":"23423423","Type":"sww","Name":"在","Contact":"","ContactPhone":"","Address":"","Remark":"顶替厅","Enabled":1,"AddTime":"2021-09-28T14:55:07.01","OperID":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (26, 2, 10, N'1', N'修改供应商信息', 1, CAST(0x0000ADDE00FB9962 AS DateTime), NULL, N'{"ID":1,"DataNumber":"23423423","Type":null,"Name":"在","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{
  "ID": 1,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (27, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADE100BB80F6 AS DateTime), N'常规保养', N'{"ID":null,"DataNumber":null,"Name":"常规保养","DevID":null,"StartTime":null,"EndTime":"2021-11-02T00:00:00","Cost":0.0,"Company":null,"Acceptance":null,"AcceptanceTime":null,"AcceptanceOperID":null,"NextTime":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-11-15T11:22:40.7993936+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (28, 1, 5, NULL, N'添加设备信息', 1, CAST(0x0000ADE100E0FEDD AS DateTime), N'测试', N'{"ID":null,"Name":"测试","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-11-15T13:39:11.0057483+08:00","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"DepartmentName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (29, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADE100E105EB AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":1,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null}', N'{
  "ID": 7,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (30, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADE100E48F4D AS DateTime), N'常规保养', N'{"ID":null,"DataNumber":null,"Name":"常规保养","DevID":1,"StartTime":null,"EndTime":null,"Cost":"454","Company":"","Acceptance":"","AcceptanceTime":null,"AcceptanceOperID":null,"NextTime":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-11-15T13:52:07.7162857+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (31, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADE100E675E3 AS DateTime), N'常规保养', N'{"ID":null,"DataNumber":"WB202111150001","Name":"常规保养","DevID":1,"StartTime":"2021-11-03T00:00:00","EndTime":"2021-11-26T00:00:00","Cost":"20","Company":"","Acceptance":"通过","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"切割头常规保养","OperID":1,"AddTime":"2021-11-15T13:59:04.8462382+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (32, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADE100F03CF7 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"常规保养","DevID":1,"StartTime":"2021-11-03T00:00:00","EndTime":"2021-11-26T00:00:00","Cost":"20","Company":"","Acceptance":"通过","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"切割头常规保养","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"DataNumber":"WB202111150001","Name":"常规保养","DevID":1,"StartTime":"2021-11-03T00:00:00","EndTime":"2021-11-26T00:00:00","Cost":"20","Company":"华工激光","Acceptance":"通过","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"切割头常规保养","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (33, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADE100F19B74 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"常规保养","DevID":1,"StartTime":"2021-11-03T00:00:00","EndTime":"2021-11-26T00:00:00","Cost":"20","Company":"","Acceptance":"通过","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"切割头常规保养","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04","EndTime":"2021-11-20","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18","AcceptanceOperID":3,"NextTime":null,"Enabled":1,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (34, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADE100FDD6D3 AS DateTime), N'常规保养', N'{"ID":null,"DataNumber":"WB202111150002","Name":"常规保养","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"3","Company":"34","Acceptance":null,"AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"32423","OperID":1,"AddTime":"2021-11-15T15:24:11.9862738+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (35, 2, 15, N'2', N'修改维保信息', 1, CAST(0x0000ADE100FEDAF7 AS DateTime), NULL, N'{"ID":2,"DataNumber":"WB202111150002","Name":"常规保养","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"3","Company":"34","Acceptance":null,"AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"32423","OperID":1,"AddTime":"2021-11-15T15:24:11.987","DevName":null,"OperName":null,"AcceptanceOperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"DataNumber":"WB202111150002","Name":"常规保养12","DevID":2,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"33","Company":"34","Acceptance":null,"AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"32423于","OperID":1,"AddTime":"2021-11-15T15:24:11.987","DevName":"切割机1","OperName":"管理员11","AcceptanceOperName":"测式"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (36, 2, 15, N'2', N'修改维保信息', 1, CAST(0x0000ADE100FF3BF7 AS DateTime), NULL, N'{"ID":2,"DataNumber":"WB202111150002","Name":"常规保养12","DevID":2,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"33","Company":"34","Acceptance":"","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"32423于","OperID":1,"AddTime":"2021-11-15T15:24:11.987","DevName":null,"OperName":null,"AcceptanceOperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"DataNumber":"WB202111150002","Name":"常规保养12","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"33","Company":"34","Acceptance":"","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Remark":"32423于","OperID":1,"AddTime":"2021-11-15T15:24:11.987","DevName":"切割机2","OperName":"管理员11","AcceptanceOperName":"测式"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (37, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADE10104C9B6 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":1,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 1,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (38, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADE10104CDA7 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":0,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 1,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (39, 2, 15, N'2', N'修改维保信息', 1, CAST(0x0000ADE10104D144 AS DateTime), NULL, N'{"ID":2,"DataNumber":"WB202111150002","Name":"常规保养12","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"33","Company":"34","Acceptance":"","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Status":null,"Remark":"32423于","OperID":1,"AddTime":"2021-11-15T15:24:11.987","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 2,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (40, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADE10104D144 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":1,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 1,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (41, 2, 15, N'2', N'修改维保信息', 1, CAST(0x0000ADE10104D52E AS DateTime), NULL, N'{"ID":2,"DataNumber":"WB202111150002","Name":"常规保养12","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-25T00:00:00","Cost":"33","Company":"34","Acceptance":"","AcceptanceTime":"2021-11-30T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":0,"Status":null,"Remark":"32423于","OperID":1,"AddTime":"2021-11-15T15:24:11.987","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 2,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (42, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADE10104D52E AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":0,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 1,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (43, 3, 15, N'2', N'删除维保信息', 1, CAST(0x0000ADE101072D3C AS DateTime), N'常规保养12', N'{
  "ID": 2,
  "DataNumber": "WB202111150002",
  "Name": "常规保养12",
  "DevID": 1,
  "StartTime": "2021-11-02T00:00:00",
  "EndTime": "2021-11-25T00:00:00",
  "Cost": "33",
  "Company": "34",
  "Acceptance": "",
  "AcceptanceTime": "2021-11-30T00:00:00",
  "AcceptanceOperID": 2,
  "Enabled": 1,
  "Remark": "32423于",
  "OperID": 1,
  "AddTime": "2021-11-15T15:24:11.987"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (44, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADE10109831C AS DateTime), N'常规保养', N'{"ID":null,"DataNumber":"WB202111150002","Name":"常规保养","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-24T00:00:00","Cost":"45","Company":"4","Acceptance":null,"AcceptanceTime":"2021-11-10T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Status":1,"Remark":"454543","OperID":1,"AddTime":"2021-11-15T16:06:41.9817072+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (45, 2, 1, N'15', N'修改用户信息', 1, CAST(0x0000ADE10114F0F0 AS DateTime), NULL, N'{
  "ID": 15,
  "LoginName": "Z00207",
  "UserName": "用户1",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 9,
  "Enabled": 1
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 15,
    "LoginName": "Z00207",
    "UserName": "用户1",
    "Pwd": null,
    "Phone": "324234",
    "Email": "23423",
    "RoleID": 9,
    "RoleName": "",
    "AddTime": "2021-01-05T10:34:18.01",
    "UpdateTime": "2021-10-29T11:43:09",
    "Remark": "3423423",
    "Enabled": 1,
    "Department": "",
    "AvatarName": null,
    "AvatarHttp": "/api/avatar/",
    "DevUser": "z00207",
    "JobNumber": "Z00207"
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (46, 3, 1, N'39', N'修改用户信息', 1, CAST(0x0000ADE1011506EE AS DateTime), NULL, N'{
  "ID": 39,
  "LoginName": "WE2",
  "UserName": "W43W4",
  "Pwd": "BBEF9EC178E5EC2892D5C37FE1F7DD36F5D6872F7879B4500293068A09E21EBA",
  "RoleID": 1,
  "Enabled": 1
}', N'{
  "ID": 39,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (47, 3, 1, N'40', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 40,
  "LoginName": "1",
  "UserName": "23",
  "Pwd": "01556A836EBC7832D2E351566C9B675E7F988F0A321B6EAAA89F8A6BFAA6F6D4",
  "RoleID": 6
}', N'{
  "ID": 40,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (48, 3, 1, N'42', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 42,
  "LoginName": "12要",
  "UserName": "需要基本原则工枯",
  "Pwd": "E20EDB80DFBE65C958DD1C823A8AF80B9D29A680D3CC7D05750A44BDF684C010",
  "RoleID": 1
}', N'{
  "ID": 42,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (49, 3, 1, N'43', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 43,
  "LoginName": "1333",
  "UserName": "霜",
  "Pwd": "2905B51CDDF2FD3293E0E8B7EBBDA3BB06ED32ADAE0E06CD6ED4D2B0477E8EC7",
  "RoleID": 4
}', N'{
  "ID": 43,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (50, 3, 1, N'44', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 44,
  "LoginName": "a33e",
  "UserName": "33",
  "Pwd": "48C2FCD6459907A647E13D7166CC05CF66BE18BC89E33F71FAB71E531CD115D9"
}', N'{
  "ID": 44,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (51, 3, 1, N'1', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 1,
  "LoginName": "admin",
  "UserName": "管理员11",
  "Pwd": "637938E74C5C8FBBBD4F50C852720DA2B6781501756FE68D9BC9DA32D4C00255",
  "RoleID": 1,
  "Enabled": 1
}', N'{
  "ID": 1,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (52, 3, 1, N'35', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 35,
  "LoginName": "H00858",
  "UserName": "祖三妹",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 24,
  "Enabled": 1
}', N'{
  "ID": 35,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (53, 3, 1, N'36', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 36,
  "LoginName": "H02691",
  "UserName": "肖继龙",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 9,
  "Enabled": 1
}', N'{
  "ID": 36,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (54, 3, 1, N'27', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 27,
  "LoginName": "H02778",
  "UserName": "用户13",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 9,
  "Enabled": 1
}', N'{
  "ID": 27,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (55, 3, 1, N'29', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 29,
  "LoginName": "S52753",
  "UserName": "用户15",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 24,
  "Enabled": 1
}', N'{
  "ID": 29,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (56, 3, 1, N'24', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 24,
  "LoginName": "W00332",
  "UserName": "用户10",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 1,
  "Enabled": 1
}', N'{
  "ID": 24,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (57, 3, 1, N'23', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 23,
  "LoginName": "W00335",
  "UserName": "用户9",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 9,
  "Enabled": 1
}', N'{
  "ID": 23,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (58, 3, 1, N'21', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 21,
  "LoginName": "W01447",
  "UserName": "用户7",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 9,
  "Enabled": 1
}', N'{
  "ID": 21,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (59, 3, 1, N'39', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 39,
  "LoginName": "WE2",
  "UserName": "W43W4",
  "Pwd": "BBEF9EC178E5EC2892D5C37FE1F7DD36F5D6872F7879B4500293068A09E21EBA",
  "RoleID": 1,
  "Enabled": 0
}', N'{
  "ID": 39,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (60, 3, 1, N'34', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 34,
  "LoginName": "X00661",
  "UserName": "陈龙财",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 24,
  "Enabled": 1
}', N'{
  "ID": 34,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (61, 3, 1, N'22', N'修改用户信息', 1, CAST(0x0000ADE200A9F4C3 AS DateTime), NULL, N'{
  "ID": 22,
  "LoginName": "X00662",
  "UserName": "用户8",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "RoleID": 24,
  "Enabled": 1
}', N'{
  "ID": 22,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (62, 3, 1, N'42', N'修改用户信息', 1, CAST(0x0000ADE200AA02E0 AS DateTime), NULL, N'{
  "ID": 42,
  "LoginName": "12要",
  "UserName": "需要基本原则工枯",
  "Pwd": "E20EDB80DFBE65C958DD1C823A8AF80B9D29A680D3CC7D05750A44BDF684C010",
  "RoleID": 1,
  "Enabled": 1
}', N'{
  "ID": 42,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (63, 3, 1, N'43', N'修改用户信息', 1, CAST(0x0000ADE200AA02E0 AS DateTime), NULL, N'{
  "ID": 43,
  "LoginName": "1333",
  "UserName": "霜",
  "Pwd": "2905B51CDDF2FD3293E0E8B7EBBDA3BB06ED32ADAE0E06CD6ED4D2B0477E8EC7",
  "RoleID": 4,
  "Enabled": 1
}', N'{
  "ID": 43,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (64, 3, 1, N'44', N'修改用户信息', 1, CAST(0x0000ADE200AA02E0 AS DateTime), NULL, N'{
  "ID": 44,
  "LoginName": "a33e",
  "UserName": "33",
  "Pwd": "48C2FCD6459907A647E13D7166CC05CF66BE18BC89E33F71FAB71E531CD115D9",
  "Enabled": 1
}', N'{
  "ID": 44,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (65, 3, 1, N'40', N'修改用户信息', 1, CAST(0x0000ADE200AA02E0 AS DateTime), NULL, N'{
  "ID": 40,
  "LoginName": "1",
  "UserName": "23",
  "Pwd": "01556A836EBC7832D2E351566C9B675E7F988F0A321B6EAAA89F8A6BFAA6F6D4",
  "RoleID": 6,
  "Enabled": 1
}', N'{
  "ID": 40,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (66, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200BD3222 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":null,"AddTime":"2021-11-16T10:35:49.843","Remark":""},"Purviews":[],"Orgs":[]}', N'{
  "ID": 9,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (67, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200BD3222 AS DateTime), NULL, N'{"RoleInfo":{"ID":8,"RoleName":"有","Enabled":1,"AddTime":"2021-10-21T15:37:39.42","Remark":"要"},"Purviews":[],"Orgs":[]}', N'{
  "ID": 8,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (68, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200BD3991 AS DateTime), NULL, N'{"RoleInfo":{"ID":7,"RoleName":"要要要","Enabled":1,"AddTime":"2021-10-21T16:06:25.543","Remark":""},"Purviews":[],"Orgs":[]}', N'{
  "ID": 7,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (69, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200BD3E6C AS DateTime), NULL, N'{"RoleInfo":{"ID":3,"RoleName":"1212","Enabled":0,"AddTime":"2021-10-21T15:37:39.42","Remark":"要23232"},"Purviews":[],"Orgs":[]}', N'{
  "ID": 3,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (70, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200BD4392 AS DateTime), NULL, N'{"RoleInfo":{"ID":7,"RoleName":"要要要","Enabled":1,"AddTime":"2021-10-21T16:06:25.543","Remark":""},"Purviews":[],"Orgs":[]}', N'{
  "ID": 7,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (71, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200BD4392 AS DateTime), NULL, N'{"RoleInfo":{"ID":8,"RoleName":"有","Enabled":1,"AddTime":"2021-10-21T15:37:39.42","Remark":"要"},"Purviews":[],"Orgs":[]}', N'{
  "ID": 8,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (72, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BD9033 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":null,"AddTime":"2021-11-16T10:35:49.843","Remark":""},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"RoleInfo":{"ID":"9","RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (73, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BD975D AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"RoleInfo":{"ID":"9","RoleName":"式朋","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (74, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BE0186 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"RoleInfo":{"ID":"9","RoleName":"式有的","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (75, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BE3378 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"RoleInfo":{"ID":"9","RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (76, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BE3AAA AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"RoleInfo":{"ID":"9","RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (77, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BE686E AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"RoleInfo":{"ID":"9","RoleName":"式0","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (78, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200BEB730 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式0","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (79, 2, 2, N'9', N'修改角色信息', 1, CAST(0x0000ADE200C01B71 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式0","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"Purview":{"Purviews":["1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"],"ID":"9"}},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (80, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200DD726C AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式0","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":["1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"],"Orgs":[]}', N'{
  "ID": 9,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (81, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200DD726C AS DateTime), NULL, N'{"RoleInfo":{"ID":8,"RoleName":"有","Enabled":1,"AddTime":"2021-10-21T15:37:39.42","Remark":"要"},"Purviews":[],"Orgs":[]}', N'{
  "ID": 8,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (82, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200DD7700 AS DateTime), NULL, N'{"RoleInfo":{"ID":8,"RoleName":"有","Enabled":1,"AddTime":"2021-10-21T15:37:39.42","Remark":"要"},"Purviews":[],"Orgs":[]}', N'{
  "ID": 8,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (83, 2, 2, N'Entity.RoleInfo', N'修改角色信息', 1, CAST(0x0000ADE200DD7700 AS DateTime), NULL, N'{"RoleInfo":{"ID":9,"RoleName":"式0","Enabled":0,"AddTime":"2021-11-16T10:35:49.843","Remark":"无可奈何花落去枯"},"Purviews":["1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"],"Orgs":[]}', N'{
  "ID": 9,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (84, 2, 2, N'10', N'修改角色信息', 1, CAST(0x0000ADE200E8252B AS DateTime), NULL, N'{"ID":10,"RoleName":"测试","Enabled":null,"AddTime":"2021-11-16T14:04:34.89","Remark":"44","Purviews":[],"Orgs":[]}', N'{
  "ID": 10,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (85, 2, 2, N'10', N'修改角色信息', 1, CAST(0x0000ADE200E967A7 AS DateTime), NULL, N'{"ID":10,"RoleName":"测试","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"44","Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"RoleName":"测试","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"444","Purviews":[],"Orgs":[]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (86, 2, 2, N'10', N'修改角色信息', 1, CAST(0x0000ADE200E97100 AS DateTime), NULL, N'{"ID":10,"RoleName":"测试","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"444","Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"RoleName":"测试77","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"444878","Purviews":[],"Orgs":[]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (87, 2, 2, N'10', N'修改角色信息', 1, CAST(0x0000ADE200EA62E3 AS DateTime), NULL, N'{"ID":10,"RoleName":"测试77","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"444878","Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"Purviews":["1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (88, 2, 2, N'10', N'修改角色信息', 1, CAST(0x0000ADE200F36C68 AS DateTime), NULL, N'{"ID":10,"RoleName":"测试77","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"444878","Purviews":["1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"Purviews":["1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (89, 2, 2, N'10', N'修改角色信息', 1, CAST(0x0000ADE200F3BA77 AS DateTime), NULL, N'{"ID":10,"RoleName":"测试77","Enabled":1,"AddTime":"2021-11-16T14:04:34.89","Remark":"444878","Purviews":["1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"Purviews":["1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2201","2202","2203","2204","2205"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (90, 3, 2, N'10', N'删除角色信息', 1, CAST(0x0000ADE200F89C41 AS DateTime), N'测试77', N'{
  "ID": 10,
  "RoleName": "测试77",
  "Enabled": 1,
  "AddTime": "2021-11-16T14:04:34.89",
  "Remark": "444878",
  "Purviews": [
    "1401",
    "1402",
    "1403",
    "1404",
    "1405",
    "1501",
    "1502",
    "1503",
    "1504",
    "1505",
    "1506",
    "1601",
    "1602",
    "1603",
    "1604",
    "1605",
    "1701",
    "1702",
    "1703",
    "1704",
    "1705",
    "1801",
    "1802",
    "1803",
    "1804",
    "1805",
    "1901",
    "1902",
    "1903",
    "1904",
    "1905",
    "2201",
    "2202",
    "2203",
    "2204",
    "2205"
  ],
  "Orgs": []
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (91, 3, 2, N'9', N'删除角色信息', 1, CAST(0x0000ADE200F89C41 AS DateTime), N'式0', N'{
  "ID": 9,
  "RoleName": "式0",
  "Enabled": 0,
  "AddTime": "2021-11-16T10:35:49.843",
  "Remark": "无可奈何花落去枯",
  "Purviews": [
    "1801",
    "1802",
    "1803",
    "1804",
    "1805",
    "1901",
    "1902",
    "1903",
    "1904",
    "1905"
  ],
  "Orgs": []
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (92, 2, 2, N'8', N'修改角色信息', 1, CAST(0x0000ADE20106D14B AS DateTime), NULL, N'{"ID":8,"RoleName":"有","Enabled":0,"AddTime":"2021-10-21T15:37:39.42","Remark":"要","Purviews":[],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Purviews":["1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (93, 2, 2, N'8', N'修改角色信息', 1, CAST(0x0000ADE2010A6E1F AS DateTime), NULL, N'{"ID":8,"RoleName":"有","Enabled":0,"AddTime":"2021-10-21T15:37:39.42","Remark":"要","Purviews":["1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Purviews":["1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (94, 2, 3, N'1', N'修改部门信息', 1, CAST(0x0000ADE20116070E AS DateTime), NULL, N'{"ID":1,"DataNumber":"33","Name":"千瑞达","HeaderID":2,"AddTime":"2021-09-02T10:21:55.03","Remark":null,"Enabled":1,"Parent":0,"SortIndex":null,"OperID":null,"ParentName":null,"HeaderName":null}', N'{
  "ID": 1,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (95, 2, 3, N'3', N'修改部门信息', 1, CAST(0x0000ADE20116070E AS DateTime), NULL, N'{"ID":3,"DataNumber":null,"Name":"葛店2","HeaderID":null,"AddTime":"2021-09-02T13:47:17.3","Remark":null,"Enabled":1,"Parent":1,"SortIndex":null,"OperID":null,"ParentName":null,"HeaderName":null}', N'{
  "ID": 3,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (96, 2, 1, N'1', N'修改用户信息', 1, CAST(0x0000ADE3010F7B0E AS DateTime), NULL, N'{
  "ID": 1,
  "LoginName": "admin",
  "UserName": "管理员11",
  "Pwd": "637938E74C5C8FBBBD4F50C852720DA2B6781501756FE68D9BC9DA32D4C00255",
  "Phone": "186227115",
  "Email": "2",
  "RoleID": 1,
  "AddTime": "2021-07-13T14:48:15.137",
  "Remark": "w3w432",
  "Enabled": 1,
  "Department": "",
  "AvatarName": "07DE7BAF0C084E4396DD168E44285781_1_img.png",
  "DevUser": "222sdfs",
  "JobNumber": "11"
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 1,
    "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
    "OldPwd": "313621002"
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (97, 2, 1, N'1', N'修改用户信息', 1, CAST(0x0000ADE3010FE00A AS DateTime), NULL, N'{
  "ID": 1,
  "LoginName": "admin",
  "UserName": "管理员11",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "186227115",
  "Email": "2",
  "RoleID": 1,
  "AddTime": "2021-07-13T14:48:15.137",
  "Remark": "w3w432",
  "Enabled": 1,
  "Department": "",
  "AvatarName": "07DE7BAF0C084E4396DD168E44285781_1_img.png",
  "DevUser": "222sdfs",
  "JobNumber": "11"
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 1,
    "Pwd": "637938E74C5C8FBBBD4F50C852720DA2B6781501756FE68D9BC9DA32D4C00255",
    "OldPwd": "123456"
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (98, 2, 1, N'1', N'修改用户信息', 1, CAST(0x0000ADE50116FF20 AS DateTime), NULL, N'{
  "ID": 1,
  "LoginName": "admin",
  "UserName": "管理员11",
  "Pwd": "637938E74C5C8FBBBD4F50C852720DA2B6781501756FE68D9BC9DA32D4C00255",
  "Phone": "186227115",
  "Email": "2",
  "RoleID": 1,
  "AddTime": "2021-07-13T14:48:15.137",
  "Remark": "w3w432",
  "Enabled": 1,
  "Department": "",
  "AvatarName": "1_8a7f6870c5374a8797c15b6070d5116b_.png",
  "DevUser": "222sdfs",
  "JobNumber": "11"
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 1,
    "UserName": "管理员11",
    "Phone": "186227115",
    "Email": "2",
    "JobNumber": "11",
    "Remark": "w3w4323月3月"
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (99, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF00FCE8D8 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (100, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF00FCFB5C AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","User_Menu","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1306","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (101, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF00FD3E46 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","User_Menu","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Employee_Menu","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1306","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (102, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF0102A32C AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","User_Menu","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (103, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF01031CBA AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","User_Menu","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Role_Menu","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1206","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (104, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF01033AD4 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Role_Menu","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Department_Menu","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1206","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1206","1301","1302","1303","1304","1305","1306","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (105, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF01061E0F AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","PurviewKeys":["User_Gets","User_Export","User_Add","User_Modify","User_Delete","User_Menu","Role_Gets","Role_Export","Role_Add","Role_Modify","Role_Delete","Role_Menu","Department_Gets","Department_Export","Department_Add","Department_Modify","Department_Delete","Department_Menu","Employee_Gets","Employee_Export","Employee_Add","Employee_Modify","Employee_Delete","Employee_Menu","Customer_Gets","Customer_Export","Customer_Add","Customer_Modify","Customer_Delete","Contract_Gets","Contract_Price","Contract_Export","Contract_Add","Contract_Modify","Contract_Delete","Order_Gets","Order_Export","Order_Add","Order_Modify","Order_Delete","Device_Gets","Device_Export","Device_Add","Device_Modify","Device_Delete","Maintenance_Gets","Maintenance_Export","Maintenance_Add","Maintenance_Modify","Maintenance_Delete","Repair_Gets","Repair_Export","Repair_Add","Repair_Modify","Repair_Delete","Log_Gets","Log_Export","Supplier_Gets","Supplier_Export","Supplier_Add","Supplier_Modify","Supplier_Delete","RawStock_Gets","RawStock_Export","RawStock_Add","RawStock_Modify","RawStock_Delete","Production_Gets","Production_Export","Production_Add","Production_Modify","Production_Dispatch","Production_Delete","DevAlarm_Gets","DevAlarm_Export","DevMonitor_Gets","DevMonitor_Export"],"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1206","1301","1302","1303","1304","1305","1306","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"],"Orgs":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1206","1301","1302","1303","1304","1305","1306","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2003","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (106, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADEF0118156E AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[],"Purviews":["1001","1002","1003","1004","1005","1006","1101","1102","1103","1104","1105","1106","1201","1202","1203","1204","1205","1206","1301","1302","1303","1304","1305","1306","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2003","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10000","10001","10002","10000","10003","10004","10005","10006","10007","10008"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (107, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF000912589 AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Menus":[]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (108, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF00091508B AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Menus":[]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (109, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF00091A02E AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Menus":[]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (110, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF00092563F AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Menus":["10003","10004"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (111, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF00092C1C8 AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":["10003","10004"],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Menus":["10000","10001","10002","10003","10004"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (112, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000A5ED2A AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1101","1102","1103","1104","1201","1202","1203","1204","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (113, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF000A627FE AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Purviews":["1101","1203","1302"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (114, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADF000A638AC AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"导出","Key":"Employee_Export","Value":"1302"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Purviews":["1101","1102","1103","1104","1105","1203","1302"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (115, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000A7EBA3 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (116, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000AB3687 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (117, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000AE9A94 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502","2602","2601"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (118, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000B128AF AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"导出","Key":"Report_Export","Value":"2602"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10205","10206"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (119, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000B1FA25 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"导出","Key":"Report_Export","Value":"2602"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10101","10102","10205","10206",null,null]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (120, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000B221C9 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"导出","Key":"Report_Export","Value":"2602"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10101","10102","10205","10206","10100","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (121, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000DCCEC1 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"导出","Key":"Report_Export","Value":"2602"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1101","1102","1103","1104","1201","1202","1203","1204","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502","2601","2602"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (122, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000DF3809 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":[null,null,null,null,null,null,null]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (123, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000DFCE60 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10101","10102","10103","10205","10206","10100","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (124, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000DFF302 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10101","10102","10205","10206","10100","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (125, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E0012C AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10205","10206","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (126, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E00FFC AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10101","10205","10206","10100","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (127, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E18909 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10205","10206","10207","10208","10209","10210"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (128, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E2AA51 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"系统管理","Key":"Database","Value":"10200"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"部门管理","Key":"Database_Departments","Value":"10207"},{"Label":"员工管理","Key":"Database_Employees","Value":"10208"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10209"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10210"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10205","10207","10208","10209","10210","10211","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (129, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E2BFA5 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"帐号管理","Key":"Database_Users","Value":"10205"},{"Label":"部门管理","Key":"Database_Departments","Value":"10207"},{"Label":"员工管理","Key":"Database_Employees","Value":"10208"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10209"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10210"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10206","10200"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (130, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E2DD02 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"角色管理","Key":"Database_Roles","Value":"10206"},{"Label":"系统管理","Key":"Database","Value":"10200"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10205","10206","10207","10208","10209","10210"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (131, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E787E2 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"报表管理","Key":"Report","Value":"10200"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10205"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10300","10315","10316","10317","10318","10319","10320"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (132, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000E7AAC3 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"系统管理","Key":"Database","Value":"10300"},{"Label":"帐号管理","Key":"Database_Users","Value":"10315"},{"Label":"角色管理","Key":"Database_Roles","Value":"10316"},{"Label":"部门管理","Key":"Database_Departments","Value":"10317"},{"Label":"员工管理","Key":"Database_Employees","Value":"10318"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10319"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10320"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10206","10300","10315","10316","10317","10318","10319","10320","10200","10205"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (133, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000EA522D AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10506","10514","10600","10615","10616","10617","10618","10619","10620","10500","10505"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (134, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000EE085F AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10506"},{"Label":"生产日报表","Key":"Report_Report_DayDetail","Value":"10514"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10615"},{"Label":"角色管理","Key":"Database_Roles","Value":"10616"},{"Label":"部门管理","Key":"Database_Departments","Value":"10617"},{"Label":"员工管理","Key":"Database_Employees","Value":"10618"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10619"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10620"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10505"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10500","10505","10506","10507","10508","10514","10600","10615","10616","10617","10618","10619","10620"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (135, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000EE86B0 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10505"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10506"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10507"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10508"},{"Label":"生产日报表","Key":"Report_Report_DayDetail","Value":"10514"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10615"},{"Label":"角色管理","Key":"Database_Roles","Value":"10616"},{"Label":"部门管理","Key":"Database_Departments","Value":"10617"},{"Label":"员工管理","Key":"Database_Employees","Value":"10618"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10619"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10620"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10500","10505","10506","10507","10508","10514","10600","10615","10616","10617","10618","10619","10620"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (136, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000EF6258 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10505"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10506"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10507"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10508"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10514"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10618"},{"Label":"角色管理","Key":"Database_Roles","Value":"10619"},{"Label":"部门管理","Key":"Database_Departments","Value":"10620"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10500","10505","10506","10507","10508","10514","10515","10516","10517","10618","10619","10620","10600"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (137, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000EF7F42 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10505"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10506"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10507"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10508"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10514"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10515"},{"Label":"生产月报表","Key":"Report_Month","Value":"10516"},{"Label":"生产年报表","Key":"Report_Year","Value":"10517"},{"Label":"帐号管理","Key":"Database_Users","Value":"10618"},{"Label":"角色管理","Key":"Database_Roles","Value":"10619"},{"Label":"部门管理","Key":"Database_Departments","Value":"10620"},{"Label":"系统管理","Key":"Database","Value":"10600"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10500","10505","10506","10507","10508","10514","10515","10516","10517","10600","10618","10619","10620","10621","10622","10623"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (138, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F0E39F AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10508"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10517"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10621"},{"Label":"角色管理","Key":"Database_Roles","Value":"10622"},{"Label":"部门管理","Key":"Database_Departments","Value":"10623"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10300","10305","10306","10307","10500","10508","10509","10510","10511","10517","10518","10519","10520","10600","10621","10622","10623","10624","10625","10626"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (139, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F0F593 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10305"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10306"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10307"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10508"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10509"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10510"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10511"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10517"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10518"},{"Label":"生产月报表","Key":"Report_Month","Value":"10519"},{"Label":"生产年报表","Key":"Report_Year","Value":"10520"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10621"},{"Label":"角色管理","Key":"Database_Roles","Value":"10622"},{"Label":"部门管理","Key":"Database_Departments","Value":"10623"},{"Label":"员工管理","Key":"Database_Employees","Value":"10624"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10625"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10626"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10305","10307","10500","10508","10509","10510","10511","10517","10518","10519","10520","10600","10621","10622","10623","10624","10625","10626","10300"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (140, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F101F2 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10305"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10307"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10508"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10509"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10510"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10511"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10517"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10518"},{"Label":"生产月报表","Key":"Report_Month","Value":"10519"},{"Label":"生产年报表","Key":"Report_Year","Value":"10520"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10621"},{"Label":"角色管理","Key":"Database_Roles","Value":"10622"},{"Label":"部门管理","Key":"Database_Departments","Value":"10623"},{"Label":"员工管理","Key":"Database_Employees","Value":"10624"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10625"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10626"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10500","10508","10509","10510","10511","10517","10518","10519","10520","10600","10621","10622","10623","10624","10625","10626"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (141, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F3676E AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10508"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10509"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10510"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10511"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10517"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10518"},{"Label":"生产月报表","Key":"Report_Month","Value":"10519"},{"Label":"生产年报表","Key":"Report_Year","Value":"10520"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10621"},{"Label":"角色管理","Key":"Database_Roles","Value":"10622"},{"Label":"部门管理","Key":"Database_Departments","Value":"10623"},{"Label":"员工管理","Key":"Database_Employees","Value":"10624"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10625"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10626"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10300","10305","10306","10307","10500","10508","10509","10510","10511","10517","10518","10519","10520","10600","10621","10622","10623","10624","10625","10626"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (142, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F479CF AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"系统管理","Key":"Database","Value":"10600"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10201","10300","10301","10302","10303","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (143, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F4E0A2 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10201","10300","10301","10302","10303","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (144, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F4F71F AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10201","10300","10301","10302","10303","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (145, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F5204F AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (146, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000F8EFF7 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10401","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606","10400"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (147, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF000FAC714 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor_All","Value":"10401"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"},{"Label":"设备监控","Key":"Monitor","Value":"10400"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10400","10401","10402","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (148, 6, 12, N'53', N'派发生产任务', 1, CAST(0x0000ADF0010822BC AS DateTime), NULL, N'{"ID":53,"OrderID":15,"DataNumber":"SCGD202111120001","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":"2021-11-12T00:00:00","PlanEndTime":"2021-11-13T00:00:00","StartTime":null,"EndTime":null,"NFileName":"1.1005.anc","DXFFileName":"1.1005.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-12T14:45:09.553","Status":1,"NPath":"2021\\11\\12\\5a36d13da83a468aa4e17cc59977204b","DXFPath":"2021\\11\\12\\3f998b3bfbdd4b0b8f87ffdae16db5fe","Remark":null,"Enabled":1,"RawStockNumber":null,"OrderNumber":"SCDD202111120002","ContractNumber":"C202111010002","CustomerName":"测试","StatusStr":"新增","OperName":"管理员11"}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (149, 6, 12, N'53', N'发送文件失败', 0, CAST(0x0000ADF001083467 AS DateTime), N'发送文件失败:Timed out trying to connect!', NULL, NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (150, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF001169520 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor","Value":"10400"},{"Label":"设备监控","Key":"Monitor_All","Value":"10401"},{"Label":"接口日志","Key":"Monitor_ILog","Value":"10402"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10304","10400","10401","10402","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (151, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF100C1E606 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor","Value":"10400"},{"Label":"实时监控","Key":"Monitor_All","Value":"10401"},{"Label":"接口日志","Key":"Monitor_ILog","Value":"10402"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10400","10401","10402","10403","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (152, 2, 5, N'1', N'修改设备信息', 1, CAST(0x0000ADF100DEECCC AS DateTime), NULL, N'{"ID":1,"Name":"切割机1","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":1,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Name":"切割机#1","Type":"laser","DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":"2021-07-29T11:28:22.053","Enabled":1,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (153, 2, 5, N'2', N'修改设备信息', 1, CAST(0x0000ADF100DEF7F5 AS DateTime), NULL, N'{"ID":2,"Name":"切割机2","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":1,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Name":"切割机#2","Type":"laser","DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":"2021-07-29T11:28:34.803","Enabled":1,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (154, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF100E46481 AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":0,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"Name":"测试","Type":"顶替","DevNo":"1","Model":"2","Company":"3","InTime":"2021-12-02","AcceptTime":"2021-12-01","MaintenanceTime":"2021-12-04","DepartmentID":3,"Remark":"仍"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (155, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF2009E760D AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":0,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","MaintenanceTime":"2021-12-04T00:00:00","DepartmentID":3,"Remark":"仍"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (156, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF200AACA89 AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":0,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"IP":"123","FtpPort":"12312","FtpUser":"123123","FtpPwd":"1231231"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (157, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF200B01F77 AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":null,"DevNo":null,"Model":null,"Company":null,"InTime":null,"AcceptTime":null,"AddTime":null,"Enabled":0,"Remark":null,"DepartmentID":null,"MaintenanceTime":null,"OperID":null,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (158, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF200E4A39A AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","AddTime":"2021-11-15T13:39:11.007","Enabled":1,"Remark":"仍","DepartmentID":3,"MaintenanceTime":"2021-12-04T00:00:00","OperID":1,"IP":"123","FtpUser":"123123","FtpPwd":"1231231","FtpPort":12312,"DepartmentName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"IP":"127.0.0.1","FtpPort":"21","FtpUser":"","FtpPwd":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (159, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF200E5FA92 AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","AddTime":"2021-11-15T13:39:11.007","Enabled":1,"Remark":"仍","DepartmentID":3,"MaintenanceTime":"2021-12-04T00:00:00","OperID":1,"IP":"127.0.0.1","FtpUser":"","FtpPwd":"","FtpPort":21,"DepartmentName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"IP":"127.0.0.1","FtpPort":21,"FtpUser":"anonymous","FtpPwd":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (160, 3, 16, N'7', N'删除文件信息', 1, CAST(0x0000ADF20112C9C5 AS DateTime), N'新建文本文档.txt', N'{
  "LastWriteTime": "2021-12-02T14:43:00",
  "LastAccessTime": null,
  "CreationTime": "0001-01-01T00:00:00",
  "Extension": null,
  "FullName": "/新建文本文档.txt",
  "Name": "新建文本文档.txt",
  "Length": 0,
  "Type": 0,
  "SubType": null,
  "TypeStr": null
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (161, 3, 16, N'7', N'删除文件信息', 1, CAST(0x0000ADF201143277 AS DateTime), N'aspnet_client', N'{
  "LastWriteTime": null,
  "LastAccessTime": null,
  "CreationTime": null,
  "Extension": null,
  "FullName": "/aspnet_client",
  "Name": "aspnet_client",
  "Length": null,
  "Type": 1,
  "SubType": "文件夹",
  "TypeStr": null
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (162, 3, 16, N'7', N'删除文件信息', 1, CAST(0x0000ADF20114396F AS DateTime), N'aspnet_client', N'{
  "LastWriteTime": null,
  "LastAccessTime": null,
  "CreationTime": null,
  "Extension": null,
  "FullName": "/aspnet_client",
  "Name": "aspnet_client",
  "Length": null,
  "Type": 1,
  "SubType": "文件夹",
  "TypeStr": null
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (163, 1, 5, NULL, N'添加设备信息', 1, CAST(0x0000ADF300959ACB AS DateTime), N'二位', N'{"ID":null,"Name":"二位","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-03T09:04:41.6121617+08:00","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (164, 2, 5, N'8', N'修改设备信息', 1, CAST(0x0000ADF600C1642B AS DateTime), NULL, N'{"ID":8,"Name":"二位","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-03T09:04:41.613","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{
  "ID": 8,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (165, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF600C1642B AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","AddTime":"2021-11-15T13:39:11.007","Enabled":1,"Remark":"仍","DepartmentID":3,"MaintenanceTime":"2021-12-04T00:00:00","OperID":1,"IP":"127.0.0.1","FtpUser":"anonymous","FtpPwd":"","FtpPort":21,"DepartmentName":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (166, 2, 5, N'8', N'修改设备信息', 1, CAST(0x0000ADF600C168D2 AS DateTime), NULL, N'{"ID":8,"Name":"二位","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-03T09:04:41.613","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{
  "ID": 8,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (167, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF600C168D2 AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","AddTime":"2021-11-15T13:39:11.007","Enabled":1,"Remark":"仍","DepartmentID":3,"MaintenanceTime":"2021-12-04T00:00:00","OperID":1,"IP":"127.0.0.1","FtpUser":"anonymous","FtpPwd":"","FtpPort":21,"DepartmentName":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (168, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF600C171CB AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","AddTime":"2021-11-15T13:39:11.007","Enabled":0,"Remark":"仍","DepartmentID":3,"MaintenanceTime":"2021-12-04T00:00:00","OperID":1,"IP":"127.0.0.1","FtpUser":"anonymous","FtpPwd":"","FtpPort":21,"DepartmentName":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (169, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000ADF600C17736 AS DateTime), NULL, N'{"ID":7,"Name":"测试","Type":"顶替","DevNo":"11","Model":"2","Company":"3","InTime":"2021-12-02T00:00:00","AcceptTime":"2021-12-01T00:00:00","AddTime":"2021-11-15T13:39:11.007","Enabled":1,"Remark":"仍","DepartmentID":3,"MaintenanceTime":"2021-12-04T00:00:00","OperID":1,"IP":"127.0.0.1","FtpUser":"anonymous","FtpPwd":"","FtpPort":21,"DepartmentName":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (170, 3, 5, N'8', N'删除设备信息', 1, CAST(0x0000ADF600C30385 AS DateTime), N'二位', N'{
  "ID": 8,
  "Name": "二位",
  "Type": "",
  "DevNo": "",
  "Model": "",
  "Company": "",
  "AddTime": "2021-12-03T09:04:41.613",
  "Enabled": 0,
  "Remark": "",
  "OperID": 1
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (171, 3, 5, N'7', N'删除设备信息', 1, CAST(0x0000ADF600C3098B AS DateTime), N'测试', N'{
  "ID": 7,
  "Name": "测试",
  "Type": "顶替",
  "DevNo": "11",
  "Model": "2",
  "Company": "3",
  "InTime": "2021-12-02T00:00:00",
  "AcceptTime": "2021-12-01T00:00:00",
  "AddTime": "2021-11-15T13:39:11.007",
  "Enabled": 0,
  "Remark": "仍",
  "DepartmentID": 3,
  "MaintenanceTime": "2021-12-04T00:00:00",
  "OperID": 1,
  "IP": "127.0.0.1",
  "FtpUser": "anonymous",
  "FtpPwd": "",
  "FtpPort": 21
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (172, 1, 5, NULL, N'添加设备信息', 1, CAST(0x0000ADF600C31818 AS DateTime), N'体制内', N'{"ID":null,"Name":"体制内","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-06T11:50:18.9453391+08:00","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (173, 2, 5, N'9', N'修改设备信息', 1, CAST(0x0000ADF600C3266D AS DateTime), NULL, N'{"ID":9,"Name":"体制内","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-06T11:50:18.947","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{
  "ID": 9,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (174, 2, 15, N'3', N'修改维保信息', 1, CAST(0x0000ADF6010ED85E AS DateTime), NULL, N'{"ID":3,"DataNumber":"WB202111150002","Name":"常规保养","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-24T00:00:00","Cost":"45","Company":"4","Acceptance":null,"AcceptanceTime":"2021-11-10T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Status":1,"Remark":"454543","OperID":1,"AddTime":"2021-11-15T16:06:41.983","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 3,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (175, 2, 15, N'3', N'修改维保信息', 1, CAST(0x0000ADF6010EDC12 AS DateTime), NULL, N'{"ID":3,"DataNumber":"WB202111150002","Name":"常规保养","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-24T00:00:00","Cost":"45","Company":"4","Acceptance":null,"AcceptanceTime":"2021-11-10T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":0,"Status":1,"Remark":"454543","OperID":1,"AddTime":"2021-11-15T16:06:41.983","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 3,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (176, 3, 15, N'3', N'删除维保信息', 1, CAST(0x0000ADF6010F73A1 AS DateTime), N'常规保养', N'{"ID":3,"DataNumber":"WB202111150002","Name":"常规保养","DevID":1,"StartTime":"2021-11-02T00:00:00","EndTime":"2021-11-24T00:00:00","Cost":"45","Company":"4","Acceptance":null,"AcceptanceTime":"2021-11-10T00:00:00","AcceptanceOperID":2,"NextTime":null,"Enabled":1,"Status":1,"Remark":"454543","OperID":1,"AddTime":"2021-11-15T16:06:41.983","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (177, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADF6010FE31D AS DateTime), N'基本原则工工', N'{"ID":null,"DataNumber":"WB202112060001","Name":"基本原则工工","DevID":1,"StartTime":null,"EndTime":null,"Cost":"","Company":"","Acceptance":null,"AcceptanceTime":null,"AcceptanceOperID":null,"NextTime":null,"Enabled":1,"Status":1,"Remark":"","OperID":1,"AddTime":"2021-12-06T16:29:54.6329539+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (178, 3, 15, N'4', N'删除维保信息', 1, CAST(0x0000ADF6010FEF37 AS DateTime), N'基本原则工工', N'{"ID":4,"DataNumber":"WB202112060001","Name":"基本原则工工","DevID":1,"StartTime":null,"EndTime":null,"Cost":"","Company":"","Acceptance":null,"AcceptanceTime":null,"AcceptanceOperID":null,"NextTime":null,"Enabled":1,"Status":1,"Remark":"","OperID":1,"AddTime":"2021-12-06T16:29:54.633","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (179, 1, 15, NULL, N'添加维保信息', 1, CAST(0x0000ADF6010FF80C AS DateTime), N'基本原则工', N'{"ID":null,"DataNumber":"WB202112060001","Name":"基本原则工","DevID":1,"StartTime":null,"EndTime":null,"Cost":"","Company":"","Acceptance":null,"AcceptanceTime":null,"AcceptanceOperID":null,"NextTime":null,"Enabled":1,"Status":1,"Remark":"","OperID":1,"AddTime":"2021-12-06T16:30:12.5075292+08:00","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (180, 3, 15, N'5', N'删除维保信息', 1, CAST(0x0000ADF6010FFF1D AS DateTime), N'基本原则工', N'{
  "ID": 5,
  "DataNumber": "WB202112060001",
  "Name": "基本原则工",
  "DevID": 1,
  "Cost": "",
  "Company": "",
  "Enabled": 1,
  "Status": 1,
  "Remark": "",
  "OperID": 1,
  "AddTime": "2021-12-06T16:30:12.507"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (181, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADF60110057F AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":1,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 1,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (182, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADF601100895 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":0,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{
  "ID": 1,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (183, 2, 10, N'1', N'修改供应商信息', 1, CAST(0x0000ADF700B81FD1 AS DateTime), NULL, N'{"ID":1,"DataNumber":"23423423","Type":null,"Name":"在","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":0,"AddTime":null,"OperID":null}', N'{
  "ID": 1,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (184, 2, 10, N'1', N'修改供应商信息', 1, CAST(0x0000ADF700B824AF AS DateTime), NULL, N'{"ID":1,"DataNumber":"23423423","Type":null,"Name":"在","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{
  "ID": 1,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (185, 3, 10, N'2', N'删除供应商信息', 1, CAST(0x0000ADF700B85BC4 AS DateTime), N'测试', N'{"ID":2,"DataNumber":"","Type":null,"Name":"测试","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (186, 3, 10, N'5', N'删除供应商信息', 1, CAST(0x0000ADF700B86E60 AS DateTime), N'sdf', N'{
  "ID": 5,
  "DataNumber": "",
  "Name": "sdf",
  "Enabled": 1
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (187, 3, 10, N'1', N'删除供应商信息', 1, CAST(0x0000ADF700B86E60 AS DateTime), N'在', N'{
  "ID": 1,
  "DataNumber": "23423423",
  "Name": "在",
  "Enabled": 0
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (188, 1, 5, NULL, N'添加设备信息', 1, CAST(0x0000ADF700BB4F54 AS DateTime), N'edr', N'{"ID":null,"Name":"edr","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-07T11:21:58.4391959+08:00","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (189, 2, 5, N'10', N'修改设备信息', 1, CAST(0x0000ADF700BB56A8 AS DateTime), NULL, N'{"ID":10,"Name":"edr","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-07T11:21:58.44","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{
  "ID": 10,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (190, 2, 5, N'10', N'修改设备信息', 1, CAST(0x0000ADF700BB8F3B AS DateTime), NULL, N'{"ID":10,"Name":"edr","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-07T11:21:58.44","Enabled":0,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (191, 2, 5, N'10', N'修改设备信息', 1, CAST(0x0000ADF700BB94D2 AS DateTime), NULL, N'{"ID":10,"Name":"edr","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-07T11:21:58.44","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (192, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADF700BD5892 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":1,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"DevID":2,"Name":"维修sdfsfd","StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Remark":"切割头常规保养33333","Cost":"2033","Company":"4333","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"Acceptance":"通过3434"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (193, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADF700BD639E AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修sdfsfd","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":1,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (194, 2, 15, N'1', N'修改维保信息', 1, CAST(0x0000ADF700BD67E1 AS DateTime), NULL, N'{"ID":1,"DataNumber":"WB202111150001","Name":"维修sdfsfd","DevID":2,"StartTime":"2021-11-04T00:00:00","EndTime":"2021-11-20T00:00:00","Cost":"2033","Company":"4333","Acceptance":"通过3434","AcceptanceTime":"2021-11-18T00:00:00","AcceptanceOperID":3,"NextTime":null,"Enabled":0,"Status":null,"Remark":"切割头常规保养33333","OperID":1,"AddTime":"2021-11-15T13:59:04.847","DevName":null,"OperName":null,"AcceptanceOperName":null,"StatusStr":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (195, 2, 10, N'6', N'修改供应商信息', 1, CAST(0x0000ADF700BD7CEC AS DateTime), NULL, N'{"ID":6,"DataNumber":"","Type":null,"Name":"essw","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{
  "ID": 6,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (196, 2, 10, N'6', N'修改供应商信息', 1, CAST(0x0000ADF700BD7FFB AS DateTime), NULL, N'{"ID":6,"DataNumber":"","Type":null,"Name":"essw","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":0,"AddTime":null,"OperID":null}', N'{
  "ID": 6,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (197, 2, 10, N'6', N'修改供应商信息', 1, CAST(0x0000ADF700BDBB81 AS DateTime), NULL, N'{"ID":6,"DataNumber":"","Type":null,"Name":"essw","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{"Params":null,"OperID":1,"Data":{"ID":6,"Name":"essw","SimpleName":"","DataNumber":"sdf","Type":"","Contact":"","ContactPhone":"","Address":"","Remark":"","Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (198, 2, 10, N'6', N'修改供应商信息', 1, CAST(0x0000ADF700BDC261 AS DateTime), NULL, N'{"ID":6,"DataNumber":"sdf","Type":null,"Name":"essw","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null}', N'{"Params":null,"OperID":1,"Data":{"ID":6,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (199, 2, 10, N'6', N'修改供应商信息', 1, CAST(0x0000ADF700BDC60E AS DateTime), NULL, N'{"ID":6,"DataNumber":"sdf","Type":null,"Name":"essw","Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":0,"AddTime":null,"OperID":null}', N'{"Params":null,"OperID":1,"Data":{"ID":6,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (200, 2, 13, N'10', N'修改库存信息', 1, CAST(0x0000ADF700BE7DE1 AS DateTime), NULL, N'{"ID":10,"Name":"有","SupplierID":2,"BatchNumber":"","DataNumber":"S202111020001","Material":"","PlateThick":"","PlateLength":"","PlateWidth":"","InCount":0,"OutCount":0,"Count":0,"InTime":null,"Remark":"","AddTime":"2021-11-02T14:58:09.323","OperID":1,"Enabled":1,"SupplierName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"Name":"有","BatchNumber":"","DataNumber":"S202111020001","SupplierID":2,"Material":"3","PlateThick":"","PlateLength":"","PlateWidth":"","Count":0,"InTime":null,"Remark":"","ID":10},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (201, 2, 13, N'10', N'修改库存信息', 1, CAST(0x0000ADF700BE8864 AS DateTime), NULL, N'{"ID":10,"Name":"有","SupplierID":2,"BatchNumber":"","DataNumber":"S202111020001","Material":"3","PlateThick":"","PlateLength":"","PlateWidth":"","InCount":0,"OutCount":0,"Count":0,"InTime":null,"Remark":"","AddTime":"2021-11-02T14:58:09.323","OperID":1,"Enabled":1,"SupplierName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":10,"Enabled":0},"Array":null}', NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (202, 3, 13, N'10', N'删除库存信息', 1, CAST(0x0000ADF700BF0B33 AS DateTime), N'有', N'{"ID":10,"Name":"有","SupplierID":2,"BatchNumber":"","DataNumber":"S202111020001","Material":"3","PlateThick":"","PlateLength":"","PlateWidth":"","InCount":0,"OutCount":0,"Count":0,"InTime":null,"Remark":"","AddTime":"2021-11-02T14:58:09.323","OperID":1,"Enabled":0,"SupplierName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (203, 3, 13, N'1', N'删除库存信息', 1, CAST(0x0000ADF700BF1122 AS DateTime), N'dde', N'{
  "ID": 1,
  "Name": "dde",
  "BatchNumber": "",
  "DataNumber": "",
  "Material": "",
  "PlateThick": "",
  "PlateLength": "",
  "PlateWidth": "",
  "InCount": 10,
  "OutCount": 0,
  "Count": 10,
  "InTime": "2021-09-07T16:00:00",
  "Remark": "",
  "AddTime": "2021-09-28T17:03:38.463",
  "Enabled": 1
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (204, 2, 8, N'11', N'修改客户信息', 1, CAST(0x0000ADF700C0CCEB AS DateTime), NULL, N'{"ID":11,"DataNumber":"ssdfsdf","Type":null,"Name":"冰","SimpleName":null,"Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":11,"Name":"冰","SimpleName":"","DataNumber":"ssdfsdf","Type":"","Contact":"sdf","ContactPhone":"","Address":"","Remark":"测试测试"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (205, 2, 8, N'11', N'修改客户信息', 1, CAST(0x0000ADF700C0D2F2 AS DateTime), NULL, N'{"ID":11,"DataNumber":"ssdfsdf","Type":null,"Name":"冰","SimpleName":null,"Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":11,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (206, 2, 8, N'11', N'修改客户信息', 1, CAST(0x0000ADF700C0D696 AS DateTime), NULL, N'{"ID":11,"DataNumber":"ssdfsdf","Type":null,"Name":"冰","SimpleName":null,"Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":0,"AddTime":null,"OperID":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":11,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (207, 3, 8, N'11', N'删除客户信息', 1, CAST(0x0000ADF700C13937 AS DateTime), N'冰', N'{"ID":11,"DataNumber":"ssdfsdf","Type":null,"Name":"冰","SimpleName":null,"Contact":null,"ContactPhone":null,"Address":null,"Remark":null,"Enabled":1,"AddTime":null,"OperID":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (208, 3, 8, N'4', N'删除客户信息', 1, CAST(0x0000ADF700C13F3B AS DateTime), N'地', N'{
  "ID": 4,
  "DataNumber": "顶替二",
  "Name": "地",
  "Enabled": 0
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (209, 3, 8, N'7', N'删除客户信息', 1, CAST(0x0000ADF700C13F3B AS DateTime), N'dfsfs', N'{
  "ID": 7,
  "DataNumber": "",
  "Name": "dfsfs",
  "Enabled": 1
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (210, 2, 9, N'8', N'修改合同信息', 1, CAST(0x0000ADF700C3AAF7 AS DateTime), NULL, N'{"ID":8,"CustomerID":8,"Name":"7","DataNumber":"C202111010003","SigningDate":null,"Type":"","Status":1,"Price":"","StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Contents":"","Attachment":null,"Remark":"","Enabled":1,"AddTime":"2021-11-01T16:09:36.77","OperID":1,"StatusStr":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Name":"7","SimpleName":"","DataNumber":"C202111010003","Type":"","Price":"","SigningDate":"2021-12-01","PlanStartTime":null,"PlanEndTime":null,"Remark":"","CompletionDate":"","CustomerID":8},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (211, 2, 9, N'8', N'修改合同信息', 1, CAST(0x0000ADF700C3B5B0 AS DateTime), NULL, N'{"ID":8,"CustomerID":8,"Name":"7","DataNumber":"C202111010003","SigningDate":"2021-12-01T00:00:00","Type":"","Status":1,"Price":"","StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Contents":"","Attachment":null,"Remark":"","Enabled":1,"AddTime":"2021-11-01T16:09:36.77","OperID":1,"StatusStr":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (212, 2, 9, N'8', N'修改合同信息', 1, CAST(0x0000ADF700C3B96D AS DateTime), NULL, N'{"ID":8,"CustomerID":8,"Name":"7","DataNumber":"C202111010003","SigningDate":"2021-12-01T00:00:00","Type":"","Status":1,"Price":"","StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Contents":"","Attachment":null,"Remark":"","Enabled":0,"AddTime":"2021-11-01T16:09:36.77","OperID":1,"StatusStr":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (213, 3, 9, N'2', N'删除合同信息', 1, CAST(0x0000ADF700C3C18A AS DateTime), N'edfwe', N'{"ID":2,"CustomerID":null,"Name":"edfwe","DataNumber":"12323213213123","SigningDate":null,"Type":"分类1","Status":1,"Price":"124","StartTime":"2021-09-20T00:00:00","EndTime":"2021-09-29T00:00:00","PlanStartTime":null,"PlanEndTime":null,"Contents":null,"Attachment":null,"Remark":"44444","Enabled":0,"AddTime":"2021-09-27T08:49:35.267","OperID":null,"StatusStr":null,"CustomerName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (214, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADF700DF6701 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"","ContractID":7,"PlanCount":10,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"Name":"仍","DataNumber":"SCDD202111120002","ContractID":7,"Type":"333","PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","ID":15,"PlanCount":10},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (215, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADF700DF7073 AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"333","ContractID":7,"PlanCount":10,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (216, 2, 11, N'15', N'修改订单信息', 1, CAST(0x0000ADF700DF73CA AS DateTime), NULL, N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"333","ContractID":7,"PlanCount":10,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":0,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":15,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (217, 3, 11, N'15', N'删除订单信息', 1, CAST(0x0000ADF700DF7752 AS DateTime), N'仍', N'{"ID":15,"Name":"仍","DataNumber":"SCDD202111120002","Status":1,"Type":"333","ContractID":7,"PlanCount":10,"Count":null,"StartTime":null,"EndTime":null,"PlanStartTime":null,"PlanEndTime":null,"Remark":"估3453","Enabled":1,"AddTime":"2021-11-12T10:25:54.393","OperID":1,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (218, 3, 11, N'9', N'删除订单信息', 1, CAST(0x0000ADF700DF7D03 AS DateTime), N'测试', N'{"ID":9,"Name":"测试","DataNumber":"SCDD202110281029","Status":1,"Type":"其它","ContractID":3,"PlanCount":null,"Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":"2021-10-26T16:00:00","PlanEndTime":"2021-10-28T16:00:00","Remark":"","Enabled":0,"AddTime":"2021-10-28T14:34:56.343","OperID":null,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (219, 3, 11, N'8', N'删除订单信息', 1, CAST(0x0000ADF700DF7D03 AS DateTime), N'测试', N'{"ID":8,"Name":"测试","DataNumber":"SCDD202110280001","Status":1,"Type":"其它","ContractID":3,"PlanCount":null,"Count":10,"StartTime":null,"EndTime":null,"PlanStartTime":"2021-11-11T00:00:00","PlanEndTime":"2021-11-30T00:00:00","Remark":"遥","Enabled":1,"AddTime":"2021-10-28T14:33:38.243","OperID":null,"StatusStr":null,"ContractNumber":null,"CustomerName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (220, 2, 12, N'50', N'修改工单信息', 1, CAST(0x0000ADF700E38BD7 AS DateTime), NULL, N'{"ID":50,"OrderID":0,"DataNumber":"SCGD202111020002","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":null,"PlanEndTime":null,"StartTime":null,"EndTime":null,"NFileName":"1.1005 - 副本.anc","DXFFileName":"1.1005 - 副本.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-02T15:32:56.583","Status":1,"NPath":"2021\\11\\2\\b8d6040939d744fcb6b1d50ea62fbf0f","DXFPath":"2021\\11\\2\\4713d12a5fdd406e93a87d70563e2d1b","Remark":null,"Enabled":0,"RawStockNumber":null,"OrderNumber":null,"ContractNumber":null,"CustomerName":null,"StatusStr":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":50,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (221, 2, 12, N'50', N'修改工单信息', 1, CAST(0x0000ADF700E38ED2 AS DateTime), NULL, N'{"ID":50,"OrderID":0,"DataNumber":"SCGD202111020002","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":null,"PlanEndTime":null,"StartTime":null,"EndTime":null,"NFileName":"1.1005 - 副本.anc","DXFFileName":"1.1005 - 副本.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-02T15:32:56.583","Status":1,"NPath":"2021\\11\\2\\b8d6040939d744fcb6b1d50ea62fbf0f","DXFPath":"2021\\11\\2\\4713d12a5fdd406e93a87d70563e2d1b","Remark":null,"Enabled":1,"RawStockNumber":null,"OrderNumber":null,"ContractNumber":null,"CustomerName":null,"StatusStr":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":50,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (222, 3, 12, N'50', N'删除工单信息', 1, CAST(0x0000ADF700E39205 AS DateTime), N'', N'{"ID":50,"OrderID":0,"DataNumber":"SCGD202111020002","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":null,"PlanEndTime":null,"StartTime":null,"EndTime":null,"NFileName":"1.1005 - 副本.anc","DXFFileName":"1.1005 - 副本.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-02T15:32:56.583","Status":1,"NPath":"2021\\11\\2\\b8d6040939d744fcb6b1d50ea62fbf0f","DXFPath":"2021\\11\\2\\4713d12a5fdd406e93a87d70563e2d1b","Remark":null,"Enabled":0,"RawStockNumber":null,"OrderNumber":null,"ContractNumber":null,"CustomerName":null,"StatusStr":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (223, 6, 12, N'53', N'派发生产任务', 1, CAST(0x0000ADF700E39F15 AS DateTime), NULL, N'{"ID":53,"OrderID":15,"DataNumber":"SCGD202111120001","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":"2021-11-12T00:00:00","PlanEndTime":"2021-11-13T00:00:00","StartTime":null,"EndTime":null,"NFileName":"1.1005.anc","DXFFileName":"1.1005.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-12T14:45:09.553","Status":3,"NPath":"2021\\11\\12\\5a36d13da83a468aa4e17cc59977204b","DXFPath":"2021\\11\\12\\3f998b3bfbdd4b0b8f87ffdae16db5fe","Remark":null,"Enabled":1,"RawStockNumber":null,"OrderNumber":"","ContractNumber":"","CustomerName":"","StatusStr":"派工失败","OperName":"管理员11"}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (224, 6, 12, N'53', N'发送文件失败', 0, CAST(0x0000ADF700E3B0BA AS DateTime), N'发送文件失败:Timed out trying to connect!', NULL, NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (225, 6, 12, N'51', N'派发生产任务', 1, CAST(0x0000ADF700EC1BBD AS DateTime), NULL, N'{"ID":51,"OrderID":0,"DataNumber":"SCGD202111020003","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":null,"PlanEndTime":null,"StartTime":null,"EndTime":null,"NFileName":"1.1005 - 副本.anc","DXFFileName":"1.1005 - 副本.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-02T15:35:21.287","Status":1,"NPath":"2021\\11\\2\\57582194bf4f47a39a99f6f6a302a47c","DXFPath":"2021\\11\\2\\3defb48ced8f482da16273388099a1ac","Remark":null,"Enabled":1,"RawStockNumber":null,"OrderNumber":null,"ContractNumber":null,"CustomerName":null,"StatusStr":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (226, 6, 12, N'51', N'派发切割文件', 0, CAST(0x0000ADF700EC1BCA AS DateTime), N'发送文件失败:No host has been specified', NULL, NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (227, 6, 12, N'51', N'派发生产任务', 1, CAST(0x0000ADF700EC65AF AS DateTime), NULL, N'{"ID":51,"OrderID":0,"DataNumber":"SCGD202111020003","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":null,"PlanEndTime":null,"StartTime":null,"EndTime":null,"NFileName":"1.1005 - 副本.anc","DXFFileName":"1.1005 - 副本.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-02T15:35:21.287","Status":3,"NPath":"2021\\11\\2\\57582194bf4f47a39a99f6f6a302a47c","DXFPath":"2021\\11\\2\\3defb48ced8f482da16273388099a1ac","Remark":null,"Enabled":1,"RawStockNumber":null,"OrderNumber":null,"ContractNumber":null,"CustomerName":null,"StatusStr":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (228, 6, 12, N'51', N'派发切割文件', 0, CAST(0x0000ADF700EC65B5 AS DateTime), N'发送文件失败:No host has been specified', NULL, NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (229, 6, 12, N'52', N'派发切割文件', 0, CAST(0x0000ADF700ECB32B AS DateTime), N'发送文件失败:No host has been specified', NULL, NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (230, 6, 12, N'52', N'派发切割文件', 0, CAST(0x0000ADF700ECC1AC AS DateTime), N'发送文件失败:No host has been specified', NULL, NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (231, 2, 12, N'51', N'修改工单信息', 1, CAST(0x0000ADF700ED14CE AS DateTime), NULL, N'{"ID":51,"OrderID":0,"DataNumber":"SCGD202111020003","RawStockID":0,"PlanCount":1,"CompletedCount":0,"PlanStartTime":null,"PlanEndTime":null,"StartTime":null,"EndTime":null,"NFileName":"1.1005 - 副本.anc","DXFFileName":"1.1005 - 副本.dxf","FileNumber":null,"DevID":1,"OperID":1,"AddTime":"2021-11-02T15:35:21.287","Status":3,"NPath":"2021\\11\\2\\57582194bf4f47a39a99f6f6a302a47c","DXFPath":"2021\\11\\2\\3defb48ced8f482da16273388099a1ac","Remark":null,"Enabled":1,"RawStockNumber":null,"OrderNumber":null,"ContractNumber":null,"CustomerName":null,"StatusStr":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":51,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (232, 2, 1, N'40', N'修改用户信息', 1, CAST(0x0000ADF700F2D35B AS DateTime), NULL, N'{
  "ID": 40,
  "LoginName": "1",
  "UserName": "23",
  "Pwd": "01556A836EBC7832D2E351566C9B675E7F988F0A321B6EAAA89F8A6BFAA6F6D4",
  "Phone": "",
  "Email": "",
  "RoleID": 6,
  "AddTime": "2021-10-28T15:35:45.913",
  "Remark": "",
  "Enabled": 0,
  "JobNumber": ""
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 40,
    "Enabled": 1
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (233, 2, 1, N'40', N'修改用户信息', 1, CAST(0x0000ADF700F2D943 AS DateTime), NULL, N'{
  "ID": 40,
  "LoginName": "1",
  "UserName": "23",
  "Pwd": "01556A836EBC7832D2E351566C9B675E7F988F0A321B6EAAA89F8A6BFAA6F6D4",
  "Phone": "",
  "Email": "",
  "RoleID": 6,
  "AddTime": "2021-10-28T15:35:45.913",
  "Remark": "",
  "Enabled": 1,
  "JobNumber": ""
}', N'{
  "OperID": 1,
  "Data": {
    "LoginName": "1",
    "UserName": "23",
    "Phone": "",
    "Email": "",
    "RoleID": 6,
    "JobNumber": "eee",
    "Remark": "",
    "ID": 40
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (234, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADF700F2FB7C AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor","Value":"10400"},{"Label":"实时监控","Key":"Monitor_All","Value":"10401"},{"Label":"接口日志","Key":"Monitor_ILog","Value":"10402"},{"Label":"设备文件管理","Key":"Monitor_Files","Value":"10403"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502","2601","2602"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (235, 3, 1, N'40', N'删除用户信息', 1, CAST(0x0000ADF700F36F9D AS DateTime), N'1,23', N'{
  "ID": 40,
  "LoginName": "1",
  "UserName": "23",
  "Pwd": "01556A836EBC7832D2E351566C9B675E7F988F0A321B6EAAA89F8A6BFAA6F6D4",
  "Phone": "",
  "Email": "",
  "RoleID": 6,
  "AddTime": "2021-10-28T15:35:45.913",
  "Remark": "",
  "Enabled": 1,
  "JobNumber": "eee"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (236, 2, 1, N'27', N'修改用户信息', 1, CAST(0x0000ADF800F3BA17 AS DateTime), NULL, N'{
  "ID": 27,
  "LoginName": "H02778",
  "UserName": "用户13",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 9,
  "AddTime": "2021-02-02T10:45:02.83",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "h02778",
  "JobNumber": "H02778"
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 27,
    "Enabled": 0
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (237, 2, 1, N'27', N'修改用户信息', 1, CAST(0x0000ADF800F3BDFF AS DateTime), NULL, N'{
  "ID": 27,
  "LoginName": "H02778",
  "UserName": "用户13",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 9,
  "AddTime": "2021-02-02T10:45:02.83",
  "Remark": "",
  "Enabled": 0,
  "Department": "",
  "DevUser": "h02778",
  "JobNumber": "H02778"
}', N'{
  "OperID": 1,
  "Data": {
    "ID": 27,
    "Enabled": 1
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (238, 2, 2, N'7', N'修改角色信息', 1, CAST(0x0000ADF800FD7684 AS DateTime), NULL, N'{"ID":7,"RoleName":"要要要","Enabled":1,"AddTime":"2021-10-21T16:06:25.543","Remark":"","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (239, 2, 2, N'7', N'修改角色信息', 1, CAST(0x0000ADF800FD7A6C AS DateTime), NULL, N'{"ID":7,"RoleName":"要要要","Enabled":0,"AddTime":"2021-10-21T16:06:25.543","Remark":"","Menus":[],"Purviews":[]}', N'{"Params":null,"OperID":1,"Data":{"ID":7,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (240, 2, 2, N'2', N'修改角色信息', 1, CAST(0x0000ADFA00B63074 AS DateTime), NULL, N'{"ID":2,"RoleName":"要","Enabled":1,"AddTime":"2021-10-21T15:37:37.29","Remark":"要","Menus":[],"Purviews":[{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"导出","Key":"Employee_Export","Value":"1302"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Menus":["10101","10102","10200","10201","10202","10300","10301","10302","10303","10400","10401","10402","10403","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606","10100"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (241, 2, 3, N'1', N'修改部门信息', 1, CAST(0x0000ADFA00E18547 AS DateTime), NULL, N'{"ID":1,"DataNumber":"33","Name":"千瑞达","HeaderID":2,"AddTime":"2021-09-02T10:21:55.03","Remark":null,"Enabled":0,"Parent":0,"SortIndex":null,"OperID":null,"ParentName":null,"HeaderName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (242, 2, 3, N'1', N'修改部门信息', 1, CAST(0x0000ADFA00E194B3 AS DateTime), NULL, N'{"ID":1,"DataNumber":"33","Name":"千瑞达","HeaderID":2,"AddTime":"2021-09-02T10:21:55.03","Remark":null,"Enabled":1,"Parent":0,"SortIndex":null,"OperID":null,"ParentName":null,"HeaderName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (243, 2, 14, N'1', N'修改员工信息', 1, CAST(0x0000ADFA00E3FD17 AS DateTime), NULL, N'{"ID":1,"Name":"1号","Sex":null,"DepartmentID":0,"Position":null,"Title":null,"JobNumber":"","JobStatus":"","Phone":null,"Remark":null,"Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (244, 2, 14, N'1', N'修改员工信息', 1, CAST(0x0000ADFA00E400EB AS DateTime), NULL, N'{"ID":1,"Name":"1号","Sex":null,"DepartmentID":0,"Position":null,"Title":null,"JobNumber":"","JobStatus":"","Phone":null,"Remark":null,"Enabled":0,"OperID":null,"AddTime":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (245, 3, 14, N'3', N'删除员工信息', 1, CAST(0x0000ADFA00E4358D AS DateTime), N'要要', N'{"ID":3,"Name":"要要","Sex":null,"DepartmentID":null,"Position":null,"Title":null,"JobNumber":"","JobStatus":"","Phone":null,"Remark":null,"Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (246, 3, 14, N'1', N'删除员工信息', 1, CAST(0x0000ADFA00E8FF84 AS DateTime), N'1号', N'{"ID":1,"Name":"1号","Sex":null,"DepartmentID":0,"Position":null,"Title":null,"JobNumber":"","JobStatus":"","Phone":null,"Remark":null,"Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (247, 3, 1, N'22', N'删除用户信息', 1, CAST(0x0000ADFA00E92EF2 AS DateTime), N'X00662,用户8', N'{
  "ID": 22,
  "LoginName": "X00662",
  "UserName": "用户8",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 24,
  "AddTime": "2021-02-02T10:41:21.11",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "x00662",
  "JobNumber": "X00662"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (248, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADFD00BA8BC2 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor","Value":"10400"},{"Label":"实时监控","Key":"Monitor_All","Value":"10401"},{"Label":"接口日志","Key":"Monitor_ILog","Value":"10402"},{"Label":"设备文件管理","Key":"Monitor_Files","Value":"10403"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10400","10401","10402","10403","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (249, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADFD00BAEDE4 AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor","Value":"10400"},{"Label":"实时监控","Key":"Monitor_All","Value":"10401"},{"Label":"接口日志","Key":"Monitor_ILog","Value":"10402"},{"Label":"设备文件管理","Key":"Monitor_Files","Value":"10403"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_DataDic","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Menus":["10100","10101","10102","10103","10104","10200","10201","10202","10300","10301","10302","10303","10400","10401","10402","10403","10500","10501","10502","10503","10504","10510","10511","10512","10513","10600","10601","10602","10603","10604","10605","10606"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (250, 2, 2, N'1', N'修改角色信息', 1, CAST(0x0000ADFD00BDAE6D AS DateTime), NULL, N'{"ID":1,"RoleName":"超级管理员","Enabled":1,"AddTime":"2021-07-13T14:59:16.397","Remark":"枯在","Menus":[{"Label":"生产管理","Key":"Production","Value":"10100"},{"Label":"客户管理","Key":"Production_Customers","Value":"10101"},{"Label":"合同管理","Key":"Production_Contracts","Value":"10102"},{"Label":"订单管理","Key":"Production_Orders","Value":"10103"},{"Label":"生产工单","Key":"Production_Productions","Value":"10104"},{"Label":"库存管理","Key":"StockM","Value":"10200"},{"Label":"供应商管理","Key":"StockM_Suppliers","Value":"10201"},{"Label":"原料库存","Key":"StockM_RawStocks","Value":"10202"},{"Label":"设备管理","Key":"DeviceM","Value":"10300"},{"Label":"设备管理","Key":"DeviceM_Devices","Value":"10301"},{"Label":"设备维保","Key":"DeviceM_Maintenances","Value":"10302"},{"Label":"设备报警","Key":"DeviceM_Alarms","Value":"10303"},{"Label":"设备监控","Key":"Monitor","Value":"10400"},{"Label":"实时监控","Key":"Monitor_All","Value":"10401"},{"Label":"接口日志","Key":"Monitor_ILog","Value":"10402"},{"Label":"设备文件管理","Key":"Monitor_Files","Value":"10403"},{"Label":"报表管理","Key":"Report","Value":"10500"},{"Label":"生产明细表","Key":"Report_DevProd","Value":"10501"},{"Label":"切割机","Key":"Report_DevProd_Laser","Value":"10502"},{"Label":"分拣","Key":"Report_DevProd_Sort","Value":"10503"},{"Label":"折弯","Key":"Report_DevProd_Bend","Value":"10504"},{"Label":"生产日报表","Key":"Report_DayDetail","Value":"10510"},{"Label":"生产日报总表","Key":"Report_Day","Value":"10511"},{"Label":"生产月报表","Key":"Report_Month","Value":"10512"},{"Label":"生产年报表","Key":"Report_Year","Value":"10513"},{"Label":"系统管理","Key":"Database","Value":"10600"},{"Label":"帐号管理","Key":"Database_Users","Value":"10601"},{"Label":"角色管理","Key":"Database_Roles","Value":"10602"},{"Label":"部门管理","Key":"Database_Departments","Value":"10603"},{"Label":"员工管理","Key":"Database_Employees","Value":"10604"},{"Label":"数据字典","Key":"Database_Dictionary","Value":"10605"},{"Label":"系统日志","Key":"Database_SysLog","Value":"10606"}],"Purviews":[{"Label":"浏览","Key":"User_Gets","Value":"1001"},{"Label":"导出","Key":"User_Export","Value":"1002"},{"Label":"添加","Key":"User_Add","Value":"1003"},{"Label":"修改","Key":"User_Modify","Value":"1004"},{"Label":"删除","Key":"User_Delete","Value":"1005"},{"Label":"浏览","Key":"Role_Gets","Value":"1101"},{"Label":"导出","Key":"Role_Export","Value":"1102"},{"Label":"添加","Key":"Role_Add","Value":"1103"},{"Label":"修改","Key":"Role_Modify","Value":"1104"},{"Label":"删除","Key":"Role_Delete","Value":"1105"},{"Label":"浏览","Key":"Department_Gets","Value":"1201"},{"Label":"导出","Key":"Department_Export","Value":"1202"},{"Label":"添加","Key":"Department_Add","Value":"1203"},{"Label":"修改","Key":"Department_Modify","Value":"1204"},{"Label":"删除","Key":"Department_Delete","Value":"1205"},{"Label":"浏览","Key":"Employee_Gets","Value":"1301"},{"Label":"导出","Key":"Employee_Export","Value":"1302"},{"Label":"添加","Key":"Employee_Add","Value":"1303"},{"Label":"修改","Key":"Employee_Modify","Value":"1304"},{"Label":"删除","Key":"Employee_Delete","Value":"1305"},{"Label":"预览","Key":"Customer_Gets","Value":"1401"},{"Label":"导出","Key":"Customer_Export","Value":"1402"},{"Label":"添加","Key":"Customer_Add","Value":"1403"},{"Label":"修改","Key":"Customer_Modify","Value":"1404"},{"Label":"删除","Key":"Customer_Delete","Value":"1405"},{"Label":"浏览","Key":"Contract_Gets","Value":"1501"},{"Label":"查看金额","Key":"Contract_Price","Value":"1502"},{"Label":"导出","Key":"Contract_Export","Value":"1503"},{"Label":"添加","Key":"Contract_Add","Value":"1504"},{"Label":"修改","Key":"Contract_Modify","Value":"1505"},{"Label":"删除","Key":"Contract_Delete","Value":"1506"},{"Label":"浏览","Key":"Order_Gets","Value":"1601"},{"Label":"导出","Key":"Order_Export","Value":"1602"},{"Label":"添加","Key":"Order_Add","Value":"1603"},{"Label":"修改","Key":"Order_Modify","Value":"1604"},{"Label":"删除","Key":"Order_Delete","Value":"1605"},{"Label":"浏览","Key":"Device_Gets","Value":"1701"},{"Label":"导出","Key":"Device_Export","Value":"1702"},{"Label":"添加","Key":"Device_Add","Value":"1703"},{"Label":"修改","Key":"Device_Modify","Value":"1704"},{"Label":"删除","Key":"Device_Delete","Value":"1705"},{"Label":"浏览","Key":"Maintenance_Gets","Value":"1801"},{"Label":"导出","Key":"Maintenance_Export","Value":"1802"},{"Label":"添加","Key":"Maintenance_Add","Value":"1803"},{"Label":"修改","Key":"Maintenance_Modify","Value":"1804"},{"Label":"删除","Key":"Maintenance_Delete","Value":"1805"},{"Label":"浏览","Key":"Repair_Gets","Value":"1901"},{"Label":"导出","Key":"Repair_Export","Value":"1902"},{"Label":"添加","Key":"Repair_Add","Value":"1903"},{"Label":"修改","Key":"Repair_Modify","Value":"1904"},{"Label":"删除","Key":"Repair_Delete","Value":"1905"},{"Label":"浏览","Key":"Log_Gets","Value":"2001"},{"Label":"导出","Key":"Log_Export","Value":"2002"},{"Label":"预览","Key":"Supplier_Gets","Value":"2101"},{"Label":"导出","Key":"Supplier_Export","Value":"2102"},{"Label":"添加","Key":"Supplier_Add","Value":"2103"},{"Label":"修改","Key":"Supplier_Modify","Value":"2104"},{"Label":"删除","Key":"Supplier_Delete","Value":"2105"},{"Label":"预览","Key":"RawStock_Gets","Value":"2201"},{"Label":"导出","Key":"RawStock_Export","Value":"2202"},{"Label":"添加","Key":"RawStock_Add","Value":"2203"},{"Label":"修改","Key":"RawStock_Modify","Value":"2204"},{"Label":"删除","Key":"RawStock_Delete","Value":"2205"},{"Label":"预览","Key":"Production_Gets","Value":"2301"},{"Label":"导出","Key":"Production_Export","Value":"2302"},{"Label":"添加","Key":"Production_Add","Value":"2303"},{"Label":"修改","Key":"Production_Modify","Value":"2304"},{"Label":"派工","Key":"Production_Dispatch","Value":"2305"},{"Label":"删除","Key":"Production_Delete","Value":"2306"},{"Label":"浏览","Key":"DevAlarm_Gets","Value":"2401"},{"Label":"导出","Key":"DevAlarm_Export","Value":"2402"},{"Label":"浏览","Key":"DevMonitor_Gets","Value":"2501"},{"Label":"导出","Key":"DevMonitor_Export","Value":"2502"},{"Label":"浏览","Key":"Report_Gets","Value":"2601"},{"Label":"导出","Key":"Report_Export","Value":"2602"}]}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Purviews":["1001","1002","1003","1004","1005","1101","1102","1103","1104","1105","1201","1202","1203","1204","1205","1301","1302","1303","1304","1305","1401","1402","1403","1404","1405","1501","1502","1503","1504","1505","1506","1601","1602","1603","1604","1605","1701","1702","1703","1704","1705","1801","1802","1803","1804","1805","1901","1902","1903","1904","1905","2001","2002","2101","2102","2103","2104","2105","2201","2202","2203","2204","2205","2301","2302","2303","2304","2305","2306","2401","2402","2501","2502","2601","2602",null,null,null,null,null,"2701","2702","2703","2704","2705"]},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (251, 2, 5, N'1', N'修改字典信息', 1, CAST(0x0000ADFD00E05F94 AS DateTime), NULL, N'{"ID":1,"Name":"用户性别","Keyword":"sys_user_sex","Enabled":1,"Remark":"用户和员工性别","AddTime":"2021-12-13T11:32:49.383"}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":0},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (252, 2, 5, N'1', N'修改字典信息', 1, CAST(0x0000ADFD00E06D92 AS DateTime), NULL, N'{"ID":1,"Name":"用户性别","Keyword":"sys_user_sex","Enabled":0,"Remark":"用户和员工性别","AddTime":"2021-12-13T11:32:49.383"}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Enabled":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (253, 3, 17, N'1', N'删除字典信息', 1, CAST(0x0000ADFD0104FF13 AS DateTime), N'', N'{"ID":1,"Keyword":null,"Value":"男","Sort":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-13T15:18:43.46","Name":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (254, 3, 8, N'2', N'删除字典信息', 1, CAST(0x0000ADFD0105059C AS DateTime), N'', N'{
  "ID": 2,
  "Value": "从",
  "Enabled": 1,
  "Remark": "",
  "OperID": 1,
  "AddTime": "2021-12-13T15:42:30.91"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (255, 3, 8, N'3', N'删除字典信息', 1, CAST(0x0000ADFD0105059C AS DateTime), N'', N'{
  "ID": 3,
  "Value": "在",
  "Enabled": 1,
  "Remark": "",
  "OperID": 1,
  "AddTime": "2021-12-13T15:43:13.17"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (256, 2, 17, N'4', N'修改字典信息', 1, CAST(0x0000ADFD01078E77 AS DateTime), NULL, N'{"ID":4,"Keyword":"sys_user_sex","Value":"要","Sort":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-13T15:44:29.487","Name":null}', N'{"Params":null,"OperID":1,"Data":{"ID":4,"Value":"要在","Remark":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (257, 2, 17, N'4', N'修改字典信息', 1, CAST(0x0000ADFD0108F7BB AS DateTime), NULL, N'{"ID":4,"Keyword":"sys_user_sex","Value":"要在","Sort":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-13T15:44:29.487","Name":null}', N'{"Params":null,"OperID":1,"Data":{"ID":4,"Value":"要","Remark":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (258, 2, 17, N'4', N'修改字典信息', 1, CAST(0x0000ADFD010949A5 AS DateTime), NULL, N'{"ID":4,"Keyword":"sys_user_sex","Value":"要","Sort":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-13T15:44:29.487","Name":null}', N'{"Params":null,"OperID":1,"Data":{"ID":4,"Value":"要","Remark":"有"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (259, 2, 17, N'4', N'修改字典信息', 1, CAST(0x0000ADFD01098990 AS DateTime), NULL, N'{"ID":4,"Keyword":"sys_user_sex","Value":"要","Sort":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-13T15:44:29.487","Name":null}', N'{"Params":null,"OperID":1,"Data":{"ID":4,"Value":"要","Remark":"厅"},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (260, 2, 17, N'8', N'修改字典信息', 1, CAST(0x0000ADFD01172B44 AS DateTime), NULL, N'{"ID":8,"Keyword":"sys_employee_jobstatus","Value":"试用期","Sort":null,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-13T16:52:50.423","Name":null}', N'{"Params":null,"OperID":1,"Data":{"ID":8,"Value":"试用期","Remark":"","Sort":1},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (261, 2, 17, N'1', N'修改字典信息', 1, CAST(0x0000ADFE009F0DCE AS DateTime), NULL, N'{"ID":1,"DicID":1,"Value":"男","Sort":1,"Enabled":1,"Remark":"","OperID":1,"AddTime":"2021-12-14T09:36:56.903","DicName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":1,"Value":"男","Remark":"","Sort":2},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (262, 1, 14, NULL, N'添加员工信息', 1, CAST(0x0000ADFE00C07B1D AS DateTime), N'测式', N'{"ID":null,"Name":"测式","Sex":"男","DepartmentID":null,"Position":"机械工程师","Title":"工程师P1","JobNumber":"","JobStatus":"试用期","Phone":"","Remark":"","Enabled":1,"OperID":1,"AddTime":"2021-12-14T11:40:48.0802453+08:00","DepartmentName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (263, 2, 14, N'2', N'修改员工信息', 1, CAST(0x0000ADFE00DDAF05 AS DateTime), NULL, N'{"ID":2,"Name":"测式","Sex":null,"DepartmentID":5,"Position":null,"Title":null,"JobNumber":"000988","JobStatus":"在职","Phone":null,"Remark":null,"Enabled":1,"OperID":null,"AddTime":null,"DepartmentName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":2,"Name":"测式","Sex":"男","Position":"程序员","Title":"高级","JobNumber":"000988","JobStatus":"在职","Phone":"18553343","Remark":"56","DepartmentID":5},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (264, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE00E5296F AS DateTime), NULL, N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "BH1r",
    "CodeID": "8ee266a3-540b-4a9b-ad92-8adab55cf2ec"
  }
}', NULL, 1, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (265, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE00FD0F03 AS DateTime), NULL, N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "2a5d",
    "CodeID": "d8216062-b8de-420e-a6f2-8da445b1d496"
  }
}', NULL, 1, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (266, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE00FFECA6 AS DateTime), N'admin;验证码异常', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "A0m",
    "CodeID": "575f6d25-8f02-4cf5-814c-261dc41754f5"
  }
}', NULL, -1, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (267, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE00FFEF4C AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "4aF9",
    "CodeID": "272288b3-88e8-472e-ab2a-b552b57cfb9d"
  }
}', NULL, 1, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (268, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE0101A363 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "od0m",
    "CodeID": "b38d54ef-8f9f-48a2-a6fe-954898abda91"
  }
}', NULL, 1, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (269, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE0101B31A AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "A70m",
    "CodeID": "3f9e7ad1-ac52-415b-a083-fbb1edb3cf71"
  }
}', NULL, 1, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (270, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFE01027350 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "q8m7",
    "CodeID": "8d8e68f0-1f28-4ec5-8bb5-06bb52a5e373"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (271, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFF00960725 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "aCed",
    "CodeID": "9534ad7e-1f5f-4bb3-bd96-70307a9a65ec"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (272, 7, 1, N'admin', N'登录', NULL, CAST(0x0000ADFF00AA5349 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Bf12",
    "CodeID": "d407e9e3-4ee4-4887-98cc-3295b70c4aae"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (273, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE0700E41626 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "hmAb",
    "CodeID": "09fb89b9-c6fc-4877-8fc7-e967ea09cdf6"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (274, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE1B00902936 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "mpm0",
    "CodeID": "20522106-2ae5-4c4e-9a15-fa6136fba6b0"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (275, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE290097DDAA AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "hg12",
    "CodeID": "252734bb-1ab3-4ce1-b933-73ffe87c5bdf"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (276, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE5F0114116D AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Ah2r",
    "CodeID": "ebebeaca-1192-45f1-a261-aa84d6c397fb"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (277, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE6100E4135E AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Agqd",
    "CodeID": "affc14fa-04ed-4f40-9245-d84582e148b5"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (278, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE6100EA031E AS DateTime), N'admin;验证码异常', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "8fGp",
    "CodeID": "50e00670-1a96-4222-81a9-89d4e34e1f50"
  }
}', NULL, -1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (279, 2, 5, N'9', N'修改设备信息', 1, CAST(0x0000AE6100F0DE08 AS DateTime), NULL, N'{"ID":9,"Name":"体制内","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2021-12-06T11:50:18.947","Enabled":0,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', N'{"Params":null,"OperID":1,"Data":{"ID":9,"Name":"测试","Type":"","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"MaintenanceTime":null,"DepartmentID":null,"Remark":""},"Array":null}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (280, 2, 1, N'42', N'修改用户信息', 1, CAST(0x0000AE6100F9FAEB AS DateTime), NULL, N'{
  "ID": 42,
  "LoginName": "12要",
  "UserName": "需要基本原则工枯",
  "Pwd": "E20EDB80DFBE65C958DD1C823A8AF80B9D29A680D3CC7D05750A44BDF684C010",
  "Phone": "地",
  "Email": "地",
  "RoleID": 1,
  "AddTime": "2021-10-28T15:40:03.067",
  "Remark": " 可想而知",
  "Enabled": 0,
  "JobNumber": ""
}', N'{
  "OperID": 1,
  "Data": {
    "LoginName": "12要",
    "UserName": "测试1",
    "Phone": "地",
    "Email": "地",
    "RoleID": 1,
    "JobNumber": "",
    "Remark": " 可想而知",
    "ID": 42
  }
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (281, 3, 2, N'7', N'删除角色信息', 1, CAST(0x0000AE6100FD476E AS DateTime), N'要要要', N'{
  "ID": 7,
  "RoleName": "要要要",
  "Enabled": 1,
  "AddTime": "2021-10-21T16:06:25.543",
  "Remark": "",
  "Menus": [],
  "Purviews": []
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (282, 3, 2, N'6', N'删除角色信息', 1, CAST(0x0000AE6100FD4BE2 AS DateTime), N'要在', N'{
  "ID": 6,
  "RoleName": "要在",
  "Enabled": 1,
  "AddTime": "2021-10-21T16:06:10.277",
  "Remark": "",
  "Menus": [],
  "Purviews": []
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (283, 3, 2, N'4', N'删除角色信息', 1, CAST(0x0000AE6100FD523C AS DateTime), N'要能', N'{
  "ID": 4,
  "RoleName": "要能",
  "Enabled": 1,
  "AddTime": "2021-10-21T15:57:04.97",
  "Remark": "",
  "Menus": [],
  "Purviews": []
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (284, 3, 2, N'2', N'删除角色信息', 1, CAST(0x0000AE6100FD55C4 AS DateTime), N'要', N'{
  "ID": 2,
  "RoleName": "要",
  "Enabled": 1,
  "AddTime": "2021-10-21T15:37:37.29",
  "Remark": "要",
  "Menus": [
    {
      "Label": "客户管理",
      "Key": "Production_Customers",
      "Value": "10101"
    },
    {
      "Label": "合同管理",
      "Key": "Production_Contracts",
      "Value": "10102"
    },
    {
      "Label": "库存管理",
      "Key": "StockM",
      "Value": "10200"
    },
    {
      "Label": "供应商管理",
      "Key": "StockM_Suppliers",
      "Value": "10201"
    },
    {
      "Label": "原料库存",
      "Key": "StockM_RawStocks",
      "Value": "10202"
    },
    {
      "Label": "设备管理",
      "Key": "DeviceM",
      "Value": "10300"
    },
    {
      "Label": "设备管理",
      "Key": "DeviceM_Devices",
      "Value": "10301"
    },
    {
      "Label": "设备维保",
      "Key": "DeviceM_Maintenances",
      "Value": "10302"
    },
    {
      "Label": "设备报警",
      "Key": "DeviceM_Alarms",
      "Value": "10303"
    },
    {
      "Label": "设备监控",
      "Key": "Monitor",
      "Value": "10400"
    },
    {
      "Label": "实时监控",
      "Key": "Monitor_All",
      "Value": "10401"
    },
    {
      "Label": "接口日志",
      "Key": "Monitor_ILog",
      "Value": "10402"
    },
    {
      "Label": "设备文件管理",
      "Key": "Monitor_Files",
      "Value": "10403"
    },
    {
      "Label": "报表管理",
      "Key": "Report",
      "Value": "10500"
    },
    {
      "Label": "生产明细表",
      "Key": "Report_DevProd",
      "Value": "10501"
    },
    {
      "Label": "切割机",
      "Key": "Report_DevProd_Laser",
      "Value": "10502"
    },
    {
      "Label": "分拣",
      "Key": "Report_DevProd_Sort",
      "Value": "10503"
    },
    {
      "Label": "折弯",
      "Key": "Report_DevProd_Bend",
      "Value": "10504"
    },
    {
      "Label": "生产日报表",
      "Key": "Report_DayDetail",
      "Value": "10510"
    },
    {
      "Label": "生产日报总表",
      "Key": "Report_Day",
      "Value": "10511"
    },
    {
      "Label": "生产月报表",
      "Key": "Report_Month",
      "Value": "10512"
    },
    {
      "Label": "生产年报表",
      "Key": "Report_Year",
      "Value": "10513"
    },
    {
      "Label": "系统管理",
      "Key": "Database",
      "Value": "10600"
    },
    {
      "Label": "帐号管理",
      "Key": "Database_Users",
      "Value": "10601"
    },
    {
      "Label": "角色管理",
      "Key": "Database_Roles",
      "Value": "10602"
    },
    {
      "Label": "部门管理",
      "Key": "Database_Departments",
      "Value": "10603"
    },
    {
      "Label": "员工管理",
      "Key": "Database_Employees",
      "Value": "10604"
    },
    {
      "Label": "数据字典",
      "Key": "Database_Dictionary",
      "Value": "10605"
    },
    {
      "Label": "系统日志",
      "Key": "Database_SysLog",
      "Value": "10606"
    },
    {
      "Label": "生产管理",
      "Key": "Production",
      "Value": "10100"
    }
  ],
  "Purviews": [
    {
      "Label": "浏览",
      "Key": "Role_Gets",
      "Value": "1101"
    },
    {
      "Label": "导出",
      "Key": "Role_Export",
      "Value": "1102"
    },
    {
      "Label": "添加",
      "Key": "Role_Add",
      "Value": "1103"
    },
    {
      "Label": "修改",
      "Key": "Role_Modify",
      "Value": "1104"
    },
    {
      "Label": "删除",
      "Key": "Role_Delete",
      "Value": "1105"
    },
    {
      "Label": "添加",
      "Key": "Department_Add",
      "Value": "1203"
    },
    {
      "Label": "导出",
      "Key": "Employee_Export",
      "Value": "1302"
    }
  ]
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (285, 3, 2, N'8', N'删除角色信息', 1, CAST(0x0000AE6100FD596F AS DateTime), N'有', N'{
  "ID": 8,
  "RoleName": "有",
  "Enabled": 0,
  "AddTime": "2021-10-21T15:37:39.42",
  "Remark": "要",
  "Menus": [],
  "Purviews": [
    {
      "Label": "添加",
      "Key": "Device_Add",
      "Value": "1703"
    },
    {
      "Label": "修改",
      "Key": "Device_Modify",
      "Value": "1704"
    },
    {
      "Label": "删除",
      "Key": "Device_Delete",
      "Value": "1705"
    },
    {
      "Label": "浏览",
      "Key": "Maintenance_Gets",
      "Value": "1801"
    },
    {
      "Label": "导出",
      "Key": "Maintenance_Export",
      "Value": "1802"
    },
    {
      "Label": "添加",
      "Key": "Maintenance_Add",
      "Value": "1803"
    },
    {
      "Label": "修改",
      "Key": "Maintenance_Modify",
      "Value": "1804"
    },
    {
      "Label": "删除",
      "Key": "Maintenance_Delete",
      "Value": "1805"
    },
    {
      "Label": "浏览",
      "Key": "Repair_Gets",
      "Value": "1901"
    },
    {
      "Label": "导出",
      "Key": "Repair_Export",
      "Value": "1902"
    },
    {
      "Label": "添加",
      "Key": "Repair_Add",
      "Value": "1903"
    },
    {
      "Label": "修改",
      "Key": "Repair_Modify",
      "Value": "1904"
    },
    {
      "Label": "删除",
      "Key": "Repair_Delete",
      "Value": "1905"
    }
  ]
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (286, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE6600B59AD0 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "h1H4",
    "CodeID": "7d328c28-336c-414f-a568-3f9b32c71113"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (287, 3, 1, N'35', N'删除用户信息', 1, CAST(0x0000AE6600E70B12 AS DateTime), N'H00858,祖三妹', N'{
  "ID": 35,
  "LoginName": "H00858",
  "UserName": "祖三妹",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 24,
  "AddTime": "2021-02-02T10:52:12.32",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "h00858",
  "JobNumber": "H00858"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (288, 3, 1, N'36', N'删除用户信息', 1, CAST(0x0000AE6600E70B12 AS DateTime), N'H02691,肖继龙', N'{
  "ID": 36,
  "LoginName": "H02691",
  "UserName": "肖继龙",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 9,
  "AddTime": "2021-02-02T10:52:51.477",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "h02691",
  "JobNumber": "H02691"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (289, 3, 1, N'34', N'删除用户信息', 1, CAST(0x0000AE6600E70B12 AS DateTime), N'X00661,陈龙财', N'{
  "ID": 34,
  "LoginName": "X00661",
  "UserName": "陈龙财",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 24,
  "AddTime": "2021-02-02T10:51:41.357",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "x00661",
  "JobNumber": "X00661"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (290, 3, 1, N'37', N'删除用户信息', 1, CAST(0x0000AE6600E71244 AS DateTime), N'Z00192,张世军', N'{
  "ID": 37,
  "LoginName": "Z00192",
  "UserName": "张世军",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 9,
  "AddTime": "2021-02-02T10:53:22.083",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "z00192",
  "JobNumber": "Z00192"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (291, 3, 1, N'30', N'删除用户信息', 1, CAST(0x0000AE6600E71A67 AS DateTime), N'Z03070,高校', N'{
  "ID": 30,
  "LoginName": "Z03070",
  "UserName": "高校",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 9,
  "AddTime": "2021-02-02T10:49:57.02",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "z03070",
  "JobNumber": "Z03070"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (292, 3, 1, N'38', N'删除用户信息', 1, CAST(0x0000AE6600E720D2 AS DateTime), N'Z03957,彭烨', N'{
  "ID": 38,
  "LoginName": "Z03957",
  "UserName": "彭烨",
  "Pwd": "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92",
  "Phone": "",
  "Email": "",
  "RoleID": 9,
  "AddTime": "2021-02-02T10:53:54.137",
  "Remark": "",
  "Enabled": 1,
  "Department": "",
  "DevUser": "z03957",
  "JobNumber": "Z03957"
}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (293, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AE7000BC033A AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "A7o3",
    "CodeID": "ebb37086-92a6-4fbd-9d16-d2b66e4f447c"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (294, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AEAE0097FF3C AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "I658",
    "CodeID": "b93ad135-b869-400b-bc7c-91bacd831bec"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (295, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AEAE0099F900 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "GCda",
    "CodeID": "61617c0a-0698-4dbf-b0ad-ac1d676a79f8"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (296, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AEAE00B411F0 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Fg1D",
    "CodeID": "45bc8193-6e53-4071-a180-1e573dec420b"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (297, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AEAE00BBE699 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "C3ec",
    "CodeID": "d7ba5cb2-60c7-406b-908f-301ba358ac33"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (298, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AEB600F30110 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "8kgb",
    "CodeID": "2e0c1122-72de-4562-b26e-f4a19564f08e"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (299, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AEBA00EA2807 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "15dD",
    "CodeID": "ba7c2435-f4f2-4046-be4b-dee01ac54b25"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (300, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AFAF010425BA AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "ggfG",
    "CodeID": "0892e397-e6b5-4177-8b10-fadfa6b98af6"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (301, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AFE900D8E3F6 AS DateTime), N'admin;验证码异常', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Akf0",
    "CodeID": "71b90e62-8a88-49f3-a494-adba6be9bf13"
  }
}', NULL, -1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (302, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AFE900D8E6A8 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "2knE",
    "CodeID": "4f59fb2a-9a46-4d34-b57b-efa2305fed03"
  }
}', NULL, 1, N'127.0.0.1')
GO
print 'Processed 300 total records'
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (303, 7, 1, N'admin', N'登录', NULL, CAST(0x0000AFE90117693B AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "heH2",
    "CodeID": "49a0e782-a02a-4c52-9a20-eb827afe5b1d"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (304, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B0050112E63B AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "n31f",
    "CodeID": "e4e3be8b-83a3-4253-83ea-adc2f67b9864"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (305, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00600FABF39 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "0mEG",
    "CodeID": "dd66dff4-57ba-41e2-b4ce-3c1f314b3c23"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (306, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00600FF3083 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "GmFg",
    "CodeID": "8beb1e9a-d10c-4292-859d-aa1d7648d87b"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (307, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B0060106D02F AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "DBgo",
    "CodeID": "9feab35c-a17f-4fc3-889f-7c6a6fc46225"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (308, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00700924FBC AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "7BF8",
    "CodeID": "d1cf0ba9-c089-40b4-83ff-17d83067ebb8"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (309, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00A0089B043 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "eGF3",
    "CodeID": "108845d0-eefd-4e1b-9386-6094f7c0cfa2"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (310, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00A011174EE AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "5GHe",
    "CodeID": "36c41a2f-f4e9-4c74-8bef-619a7c5333b7"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (311, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00B0090D631 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "hn4f",
    "CodeID": "dad768c7-bb31-4621-93cc-17fc47fd2c1c"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (312, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00B00F8D92A AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "3Dqe",
    "CodeID": "514f4066-9e13-4087-9c65-be81f034b465"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (313, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00B00F8FA59 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "7gIe",
    "CodeID": "d0ab8f95-d0a0-4c19-bab6-cc483473c18d"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (314, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00B00F99BBE AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "bF1f",
    "CodeID": "b9a1636c-455b-4958-ab18-021c931e19a8"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (315, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00B00F9BBC4 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Hnko",
    "CodeID": "5d32ab28-e6a5-4bd8-9d84-4181e48ecdca"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (316, 1, 5, NULL, N'添加设备信息', 1, CAST(0x0000B00B01041E6F AS DateTime), N'激光', N'{"ID":null,"Name":"激光","Type":"laser","DevNo":"","Model":"","Company":"","InTime":null,"AcceptTime":null,"AddTime":"2023-05-23T15:47:03.8192574+08:00","Enabled":1,"Remark":"","DepartmentID":null,"MaintenanceTime":null,"OperID":1,"IP":null,"FtpUser":null,"FtpPwd":null,"FtpPort":null,"DepartmentName":null,"OperName":null}', NULL, NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (317, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B00D00B9E9B2 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "3eGb",
    "CodeID": "081e9cee-b656-40a1-8397-b83fd6c2b6c5"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (318, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B01200B47BA4 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "4oA1",
    "CodeID": "d36118d1-8b01-4594-a7b1-4b072b29bd23"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (319, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B0130140C495 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "pF1n",
    "CodeID": "f6438aa7-e917-4504-9f50-900615f1f43c"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (320, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B01800916DFD AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "a3rg",
    "CodeID": "4e9b73b6-53d5-433b-9268-3b4edfcf9843"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (321, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B01A0122EB46 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "6BI1",
    "CodeID": "c1ed42ae-04a1-4089-9b4c-1d5317f02787"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (322, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B01B008DE294 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "3hD8",
    "CodeID": "410fd89a-a73c-4d26-95ae-29e3beb078f2"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (323, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B01B00FC1E1B AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "3ape",
    "CodeID": "44f52487-3751-4202-b2d7-2b52ec3c976f"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (324, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B01F00A96D5D AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "nrGp",
    "CodeID": "3f15d0e1-5b6e-4fed-8d89-d3eaae5df5d5"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (325, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B020013A9342 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "65Eh",
    "CodeID": "a61025f0-525a-403f-bb3d-d22d258abaea"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (326, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B020013ACEAC AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "dG9H",
    "CodeID": "bfdf9498-2af7-42d3-8df1-2d40901423fb"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (327, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B020013AE5B0 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "fnoC",
    "CodeID": "60df9b70-0e19-41c9-b948-b056513f5234"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (328, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B020013D3D43 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "nCg0",
    "CodeID": "7d3ff7ef-98ef-4835-85c1-9a307105cdd0"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (329, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B020013E3F8E AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "g8A6",
    "CodeID": "616900f5-72c6-47a8-94b8-2655203998c6"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (330, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B020013E4259 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "61cD",
    "CodeID": "21709c6b-a37e-48eb-b74c-a682f4215690"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (331, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B021009C43AC AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "EDcq",
    "CodeID": "a53e9c9d-e0a0-43f7-bd5f-cedd74852fa5"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (332, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100A0A90B AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "epgh",
    "CodeID": "d4070135-5ae1-48c2-87ca-27aa11b4a0ca"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (333, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100A731E1 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "qnp8",
    "CodeID": "31ec7e51-5d49-4674-b296-46ef9a08776e"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (334, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100A8AA4B AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "2neq",
    "CodeID": "6ff5d287-1fc0-4d54-855c-e0f12384890f"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (335, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100A95FE0 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "gcCd",
    "CodeID": "a6763118-600f-4efd-811c-7f194c1d6736"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (336, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100AA9E5D AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "EBd0",
    "CodeID": "32a5d6d4-1578-458a-bb74-f03f6ccf075a"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (337, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100AB5619 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "oggf",
    "CodeID": "da977517-6b88-4364-b4af-3a26cc817257"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (338, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100B3F8FC AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "n6G8",
    "CodeID": "abe4cd30-5024-4785-aebf-358fb42ebbb5"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (339, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100BB3FCC AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "cgom",
    "CodeID": "226fd859-fc6d-4f99-8233-184bd7513225"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (340, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02100C4CC2C AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "cFIo",
    "CodeID": "c5d88a92-ff48-4f7c-ad27-25c736e59bf8"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (341, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000B021010D31EC AS DateTime), NULL, N'{"ID":7,"DevName":"laser1_2","DevText":"1-2 切割机","DevType":"Laser","Enabled":0,"IP":"127.0.0.1","Url":"http://127.0.0.1:8086","FtpUser":null,"FtpPwd":null,"FtpPort":null,"AddTime":null,"OperID":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (342, 2, 5, N'9', N'修改设备信息', 1, CAST(0x0000B021010D58D0 AS DateTime), NULL, N'{"ID":9,"DevName":"laser2_2","DevText":"2-2 切割机","DevType":"Laser","Enabled":0,"IP":"127.0.0.1","Url":"http://127.0.0.1:8088","FtpUser":null,"FtpPwd":null,"FtpPort":null,"AddTime":null,"OperID":null,"OperName":null}', N'{
  "ID": 9,
  "Enabled": 1
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (343, 2, 5, N'7', N'修改设备信息', 1, CAST(0x0000B021010DADFC AS DateTime), NULL, N'{"ID":7,"DevName":"laser1_2","DevText":"1-2 切割机","DevType":"Laser","Enabled":1,"IP":"127.0.0.1","Url":"http://127.0.0.1:8086","FtpUser":null,"FtpPwd":null,"FtpPort":null,"AddTime":null,"OperID":null,"OperName":null}', N'{
  "ID": 7,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (344, 2, 5, N'9', N'修改设备信息', 1, CAST(0x0000B021010DBA51 AS DateTime), NULL, N'{"ID":9,"DevName":"laser2_2","DevText":"2-2 切割机","DevType":"Laser","Enabled":1,"IP":"127.0.0.1","Url":"http://127.0.0.1:8088","FtpUser":null,"FtpPwd":null,"FtpPort":null,"AddTime":null,"OperID":null,"OperName":null}', N'{
  "ID": 9,
  "Enabled": 0
}', NULL, NULL)
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (345, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02200A8EA07 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "cdEo",
    "CodeID": "92464283-43a0-400f-94fa-ee22b0507087"
  }
}', NULL, 1, N'127.0.0.1')
INSERT [dbo].[Log] ([ID], [Type], [Module], [Identifier], [Title], [OperID], [AddTime], [Remark], [Param1], [Param2], [Status], [UserHostAddress]) VALUES (346, 7, 1, N'admin', N'登录', NULL, CAST(0x0000B02800A08575 AS DateTime), N'admin;', N'{
  "OperID": 0,
  "Data": {
    "LoginName": "admin",
    "Pwd": "313621002",
    "Code": "Fdre",
    "CodeID": "17bb0aaf-d68e-4679-965b-df98b218a15e"
  }
}', NULL, 1, N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[Log] OFF
/****** Object:  Table [dbo].[LaserProd]    Script Date: 06/21/2023 15:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LaserProd](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DevID] [bigint] NULL,
	[TaskNo] [varchar](50) NULL,
	[FileName] [nvarchar](255) NULL,
	[NestName] [nvarchar](255) NULL,
	[PlateThick] [varchar](50) NULL,
	[PlateLength] [varchar](50) NULL,
	[PlateWidth] [varchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
	[Material] [nvarchar](50) NULL,
	[CutTime] [varchar](50) NULL,
	[PlanCutTime] [varchar](50) NULL,
 CONSTRAINT [PK_DevLaser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LaserProd] ON
INSERT [dbo].[LaserProd] ([ID], [DevID], [TaskNo], [FileName], [NestName], [PlateThick], [PlateLength], [PlateWidth], [StartTime], [EndTime], [AddTime], [Material], [CutTime], [PlanCutTime]) VALUES (18, 1, N'13591409132806597807572304', N'9.0005', N'9.0005', N'2', N'3000', N'1500', CAST(0x0000ADDC01013056 AS DateTime), CAST(0x0000ADDC0101E24E AS DateTime), CAST(0x0000ADDC0101E24E AS DateTime), N'MS', N'00:02:31.8660048', N'18:26')
INSERT [dbo].[LaserProd] ([ID], [DevID], [TaskNo], [FileName], [NestName], [PlateThick], [PlateLength], [PlateWidth], [StartTime], [EndTime], [AddTime], [Material], [CutTime], [PlanCutTime]) VALUES (19, 1, N'13591409132806597807572304', N'9.0005', N'9.0005', N'2', N'3000', N'1500', CAST(0x0000ADDC01049EEB AS DateTime), CAST(0x0000ADDC010550FD AS DateTime), CAST(0x0000ADDC010550FD AS DateTime), N'MS', N'00:02:31.9539499', N'18:26')
INSERT [dbo].[LaserProd] ([ID], [DevID], [TaskNo], [FileName], [NestName], [PlateThick], [PlateLength], [PlateWidth], [StartTime], [EndTime], [AddTime], [Material], [CutTime], [PlanCutTime]) VALUES (20, 1, N'13591409132806597807572304', N'9.0005', N'9.0005', N'2', N'3000', N'1500', NULL, CAST(0x0000ADF600B6B2B4 AS DateTime), CAST(0x0000ADF600B6B2B4 AS DateTime), N'MS', NULL, NULL)
INSERT [dbo].[LaserProd] ([ID], [DevID], [TaskNo], [FileName], [NestName], [PlateThick], [PlateLength], [PlateWidth], [StartTime], [EndTime], [AddTime], [Material], [CutTime], [PlanCutTime]) VALUES (21, 1, N'13591409132806597807572304', N'9.0005', N'9.0005', N'2', N'3000', N'1500', NULL, CAST(0x0000ADF600B6B649 AS DateTime), CAST(0x0000ADF600B6B649 AS DateTime), N'MS', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LaserProd] OFF
/****** Object:  Table [dbo].[InfoDevice]    Script Date: 06/21/2023 15:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoDevice](
	[ID] [bigint] NOT NULL,
	[DevName] [nvarchar](50) NOT NULL,
	[DevType] [nvarchar](50) NOT NULL,
	[DevText] [nvarchar](50) NOT NULL,
	[Enabled] [int] NOT NULL,
	[IP] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[FtpUser] [nvarchar](50) NULL,
	[FtpPwd] [nvarchar](50) NULL,
	[FtpPort] [int] NULL,
	[AddTime] [datetime] NULL,
	[OperID] [bigint] NULL,
	[OperName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (1, N'WMS', N'WMS', N'立体料库', 1, N'127.0.0.1', N'http://127.0.0.1:8080', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (2, N'delivery1', N'Delivery', N'1号上下料', 1, N'127.0.0.1', N'http://127.0.0.1:8081', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (3, N'delivery2', N'Delivery', N'2号上下料', 1, N'127.0.0.1', N'http://127.0.0.1:8082', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (4, N'marker1', N'Marker', N'1号打码机', 1, N'127.0.0.1', N'http://127.0.0.1:8083', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (5, N'marker2', N'Marker', N'2号打码机', 1, N'127.0.0.1', N'http://127.0.0.1:8084', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (6, N'laser1_1', N'Laser', N'1-1 切割机', 1, N'127.0.0.1', N'http://127.0.0.1:8085', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (7, N'laser1_2', N'Laser', N'1-2 切割机', 0, N'127.0.0.1', N'http://127.0.0.1:8086', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (8, N'laser2_1', N'Laser', N'2-1 切割机', 1, N'127.0.0.1', N'http://127.0.0.1:8087', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (9, N'laser2_2', N'Laser', N'2-2 切割机', 0, N'127.0.0.1', N'http://127.0.0.1:8088', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InfoDevice] ([ID], [DevName], [DevType], [DevText], [Enabled], [IP], [Url], [FtpUser], [FtpPwd], [FtpPort], [AddTime], [OperID], [OperName]) VALUES (10, N'mcs', N'MCS', N'中控服务器', 1, N'127.0.0.1', N'http://localhost:44306', NULL, NULL, NULL, NULL, NULL, NULL)
/****** Object:  Default [DF_UserInfo_CreateTime]    Script Date: 06/21/2023 15:47:24 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_UserInfo_UpdateTime]    Script Date: 06/21/2023 15:47:24 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_RoleInfo_CreateTime]    Script Date: 06/21/2023 15:47:24 ******/
ALTER TABLE [dbo].[RoleInfo] ADD  CONSTRAINT [DF_RoleInfo_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_LogOper_Type]    Script Date: 06/21/2023 15:47:24 ******/
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_LogOper_Type]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF_LogInfo_AddTime]    Script Date: 06/21/2023 15:47:24 ******/
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_LogInfo_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_LaserProd_AddTime]    Script Date: 06/21/2023 15:47:24 ******/
ALTER TABLE [dbo].[LaserProd] ADD  CONSTRAINT [DF_LaserProd_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
