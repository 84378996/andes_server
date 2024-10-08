USE [master]
GO
/****** Object:  Database [db_hgqrd]    Script Date: 02/20/2023 15:54:16 ******/
CREATE DATABASE [db_hgqrd] ON  PRIMARY 
( NAME = N'db_hgqianruida', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_hgqianruida.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_hgqianruida_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_hgqianruida_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_hgqrd] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_hgqrd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_hgqrd] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_hgqrd] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_hgqrd] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_hgqrd] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_hgqrd] SET ARITHABORT OFF
GO
ALTER DATABASE [db_hgqrd] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [db_hgqrd] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_hgqrd] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [db_hgqrd] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_hgqrd] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_hgqrd] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_hgqrd] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_hgqrd] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_hgqrd] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_hgqrd] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_hgqrd] SET  DISABLE_BROKER
GO
ALTER DATABASE [db_hgqrd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_hgqrd] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_hgqrd] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_hgqrd] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_hgqrd] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_hgqrd] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_hgqrd] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [db_hgqrd] SET  READ_WRITE
GO
ALTER DATABASE [db_hgqrd] SET RECOVERY FULL
GO
ALTER DATABASE [db_hgqrd] SET  MULTI_USER
GO
ALTER DATABASE [db_hgqrd] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_hgqrd] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_hgqrd', N'ON'
GO
USE [db_hgqrd]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID] [bigint] NULL,
	[WarehouseNo] [int] NULL,
	[Length] [float] NULL,
	[Width] [float] NULL,
	[Thickness] [float] NULL,
	[Number] [int] NULL,
	[AddTime] [datetime] NULL,
	[CreateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 02/20/2023 15:54:17 ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[SimpleName] [nvarchar](20) NULL,
	[DataNumber] [varchar](20) NULL,
	[Type] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[ContactPhone] [varchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Remark] [nvarchar](max) NULL,
	[Enabled] [int] NULL,
	[AddTime] [datetime] NULL,
	[OperID] [bigint] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON
INSERT [dbo].[Supplier] ([ID], [Name], [SimpleName], [DataNumber], [Type], [Contact], [ContactPhone], [Address], [Remark], [Enabled], [AddTime], [OperID]) VALUES (6, N'essw', NULL, N'sdf', N'', N'', N'', N'', N'', 1, CAST(0x0000ADF700B87267 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
/****** Object:  Table [dbo].[SortProd]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SortProd](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NestNo] [nvarchar](50) NULL,
	[PlateNo] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[CompleteTime] [datetime] NULL,
	[PartNumber] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
	[NestFile] [nvarchar](250) NULL,
 CONSTRAINT [PK_SortProc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SortProd] ON
INSERT [dbo].[SortProd] ([ID], [NestNo], [PlateNo], [StartTime], [CompleteTime], [PartNumber], [AddTime], [NestFile]) VALUES (8, N'9.0001.dxf', N'13591409132806438912578631', CAST(0x0000ADD800C1DCE8 AS DateTime), CAST(0x0000ADD800C31824 AS DateTime), N'1', CAST(0x0000ADDA00DF7964 AS DateTime), NULL)
INSERT [dbo].[SortProd] ([ID], [NestNo], [PlateNo], [StartTime], [CompleteTime], [PartNumber], [AddTime], [NestFile]) VALUES (9, N'9.0001.dxf', N'13591409132806438912578631', CAST(0x0000ADD800C1DCE8 AS DateTime), CAST(0x0000ADDA00DFA8A4 AS DateTime), N'1', CAST(0x0000ADDA00DFA3C7 AS DateTime), NULL)
INSERT [dbo].[SortProd] ([ID], [NestNo], [PlateNo], [StartTime], [CompleteTime], [PartNumber], [AddTime], [NestFile]) VALUES (10, N'9.0001.dxf', N'13591409132806438912578631', CAST(0x0000ADD800C1DCE8 AS DateTime), CAST(0x0000ADDA00DFA8A4 AS DateTime), N'1', CAST(0x0000ADDE01188729 AS DateTime), NULL)
INSERT [dbo].[SortProd] ([ID], [NestNo], [PlateNo], [StartTime], [CompleteTime], [PartNumber], [AddTime], [NestFile]) VALUES (11, N'9.0001.dxf', N'13591409132806438912578631', CAST(0x0000ADD800C1DCE8 AS DateTime), CAST(0x0000ADDA00DFA8A4 AS DateTime), N'1', CAST(0x0000ADF600B6B9DF AS DateTime), NULL)
INSERT [dbo].[SortProd] ([ID], [NestNo], [PlateNo], [StartTime], [CompleteTime], [PartNumber], [AddTime], [NestFile]) VALUES (12, N'9.0001.dxf', N'13591409132806438912578631', CAST(0x0000ADD800C1DCE8 AS DateTime), CAST(0x0000ADDA00DFA8A4 AS DateTime), N'1', CAST(0x0000ADF600B6BCDC AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SortProd] OFF
/****** Object:  Table [dbo].[RolePurview]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RolePurview](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PurviewCode] [varchar](50) NULL,
	[RoleID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RolePurview] ON
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3116, N'10100', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3117, N'10101', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3118, N'10102', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3119, N'10103', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3120, N'10104', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3121, N'10200', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3122, N'10201', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3123, N'10202', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3124, N'10300', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3125, N'10301', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3126, N'10302', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3127, N'10303', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3128, N'10400', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3129, N'10401', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3130, N'10402', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3131, N'10403', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3132, N'10500', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3133, N'10501', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3134, N'10502', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3135, N'10503', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3136, N'10504', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3137, N'10510', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3138, N'10511', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3139, N'10512', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3140, N'10513', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3141, N'10600', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3142, N'10601', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3143, N'10602', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3144, N'10603', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3145, N'10604', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3146, N'10605', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3147, N'10606', 1, CAST(0x0000ADFD00BAEDC4 AS DateTime), 2)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3148, N'1001', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3149, N'1002', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3150, N'1003', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3151, N'1004', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3152, N'1005', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3153, N'1101', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3154, N'1102', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3155, N'1103', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3156, N'1104', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3157, N'1105', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3158, N'1201', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3159, N'1202', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3160, N'1203', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3161, N'1204', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3162, N'1205', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3163, N'1301', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3164, N'1302', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3165, N'1303', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3166, N'1304', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3167, N'1305', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3168, N'1401', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3169, N'1402', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3170, N'1403', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3171, N'1404', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3172, N'1405', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3173, N'1501', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3174, N'1502', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3175, N'1503', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3176, N'1504', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3177, N'1505', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3178, N'1506', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3179, N'1601', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3180, N'1602', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3181, N'1603', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3182, N'1604', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3183, N'1605', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3184, N'1701', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3185, N'1702', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3186, N'1703', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3187, N'1704', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3188, N'1705', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3189, N'1801', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3190, N'1802', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3191, N'1803', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3192, N'1804', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3193, N'1805', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3194, N'1901', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3195, N'1902', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3196, N'1903', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3197, N'1904', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3198, N'1905', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3199, N'2001', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3200, N'2002', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3201, N'2101', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3202, N'2102', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3203, N'2103', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3204, N'2104', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3205, N'2105', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3206, N'2201', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3207, N'2202', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3208, N'2203', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3209, N'2204', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3210, N'2205', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3211, N'2301', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3212, N'2302', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3213, N'2303', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3214, N'2304', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3215, N'2305', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3216, N'2306', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3217, N'2401', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3218, N'2402', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3219, N'2501', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3220, N'2502', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3221, N'2601', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3222, N'2602', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3223, N'', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3224, N'', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3225, N'', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3226, N'', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3227, N'', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3228, N'2701', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3229, N'2702', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3230, N'2703', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3231, N'2704', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
INSERT [dbo].[RolePurview] ([ID], [PurviewCode], [RoleID], [AddTime], [Type]) VALUES (3232, N'2705', 1, CAST(0x0000ADFD00BDAE4E AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RolePurview] OFF
/****** Object:  Table [dbo].[RoleOrg]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleOrg](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrgID] [bigint] NULL,
	[RoleID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[PurviewCode] [varchar](50) NULL,
 CONSTRAINT [PK_RoleOrg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 02/20/2023 15:54:17 ******/
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
/****** Object:  Table [dbo].[ReportMonth]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportMonth](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Cutting] [int] NULL,
	[Sort] [int] NULL,
	[Bend] [int] NULL,
	[ReportTime] [date] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ReportMonth] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReportMonth] ON
INSERT [dbo].[ReportMonth] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (3, 0, 0, 0, CAST(0x0F430B00 AS Date), CAST(0x0000ADEC00B824E9 AS DateTime))
INSERT [dbo].[ReportMonth] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (4, 2, 0, 0, CAST(0x2E430B00 AS Date), CAST(0x0000ADFF0095AB14 AS DateTime))
INSERT [dbo].[ReportMonth] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (5, 0, 0, 0, CAST(0x4C430B00 AS Date), CAST(0x0000ADFF0095AB17 AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportMonth] OFF
/****** Object:  Table [dbo].[ReportDayDetail]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportDayDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NULL,
	[Cutting] [int] NULL,
	[Sort] [int] NULL,
	[Bend] [int] NULL,
	[ReportTime] [date] NOT NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ReportDay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReportDayDetail] ON
INSERT [dbo].[ReportDayDetail] ([ID], [FileName], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (34, N'9.0005', 2, 0, 0, CAST(0x37430B00 AS Date), CAST(0x0000ADFF0095AAC5 AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportDayDetail] OFF
/****** Object:  Table [dbo].[ReportDay]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportDay](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Cutting] [int] NULL,
	[Sort] [int] NULL,
	[Bend] [int] NULL,
	[ReportTime] [date] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ReportDay_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReportDay] ON
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (25, 2, 0, 0, CAST(0x37430B00 AS Date), CAST(0x0000ADEC00AC52C3 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (26, 0, 0, 0, CAST(0x38430B00 AS Date), CAST(0x0000ADEC00AC56BA AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (27, 0, 0, 0, CAST(0x39430B00 AS Date), CAST(0x0000ADEC00AC59C7 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (28, 0, 0, 0, CAST(0x3A430B00 AS Date), CAST(0x0000ADEC00AC59CA AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (29, 0, 0, 0, CAST(0x3B430B00 AS Date), CAST(0x0000ADEC00AC59CC AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (30, 0, 0, 0, CAST(0x3C430B00 AS Date), CAST(0x0000ADEC00AC59CF AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (31, 0, 0, 0, CAST(0x3D430B00 AS Date), CAST(0x0000ADEC00AC59D1 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (32, 0, 0, 0, CAST(0x3E430B00 AS Date), CAST(0x0000ADEC00AC59D3 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (33, 0, 0, 0, CAST(0x3F430B00 AS Date), CAST(0x0000ADEC00AC59D5 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (34, 0, 0, 0, CAST(0x40430B00 AS Date), CAST(0x0000ADEC00B824D3 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (35, 0, 0, 0, CAST(0x41430B00 AS Date), CAST(0x0000ADEC00B824D9 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (36, 0, 0, 0, CAST(0x42430B00 AS Date), CAST(0x0000ADEC00B824DB AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (37, 0, 0, 0, CAST(0x43430B00 AS Date), CAST(0x0000ADEC00B824DE AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (38, 0, 0, 0, CAST(0x44430B00 AS Date), CAST(0x0000ADEC00B824E0 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (39, 0, 0, 0, CAST(0x45430B00 AS Date), CAST(0x0000ADEC00B824E2 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (40, 0, 0, 0, CAST(0x46430B00 AS Date), CAST(0x0000ADFE0116829E AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (41, 0, 0, 0, CAST(0x47430B00 AS Date), CAST(0x0000ADFE011682A2 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (42, 0, 0, 0, CAST(0x48430B00 AS Date), CAST(0x0000ADFE011682A6 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (43, 0, 0, 0, CAST(0x49430B00 AS Date), CAST(0x0000ADFE011682A9 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (44, 0, 0, 0, CAST(0x4A430B00 AS Date), CAST(0x0000ADFE011682AB AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (45, 0, 0, 0, CAST(0x4B430B00 AS Date), CAST(0x0000ADFE011682AE AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (46, 0, 0, 0, CAST(0x4C430B00 AS Date), CAST(0x0000ADFE011682B1 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (47, 0, 0, 0, CAST(0x4D430B00 AS Date), CAST(0x0000ADFE011682B4 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (48, 0, 0, 0, CAST(0x4E430B00 AS Date), CAST(0x0000ADFE011682B7 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (49, 0, 0, 0, CAST(0x4F430B00 AS Date), CAST(0x0000ADFE011682BB AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (50, 0, 0, 0, CAST(0x50430B00 AS Date), CAST(0x0000ADFE011682BD AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (51, 0, 0, 0, CAST(0x51430B00 AS Date), CAST(0x0000ADFE011682C0 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (52, 0, 0, 0, CAST(0x52430B00 AS Date), CAST(0x0000ADFE011682C3 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (53, 0, 0, 0, CAST(0x53430B00 AS Date), CAST(0x0000ADFF0095AAFF AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (54, 0, 0, 0, CAST(0x54430B00 AS Date), CAST(0x0000ADFF0095AB05 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (55, 0, 0, 0, CAST(0x55430B00 AS Date), CAST(0x0000ADFF0095AB08 AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (56, 0, 0, 0, CAST(0x56430B00 AS Date), CAST(0x0000ADFF0095AB0A AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (57, 0, 0, 0, CAST(0x57430B00 AS Date), CAST(0x0000ADFF0095AB0C AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (58, 0, 0, 0, CAST(0x58430B00 AS Date), CAST(0x0000ADFF0095AB0E AS DateTime))
INSERT [dbo].[ReportDay] ([ID], [Cutting], [Sort], [Bend], [ReportTime], [AddTime]) VALUES (59, 0, 0, 0, CAST(0x59430B00 AS Date), CAST(0x0000ADFF0095AB10 AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportDay] OFF
/****** Object:  Table [dbo].[Repair]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DevID] [bigint] NULL,
 CONSTRAINT [PK_Repair] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RawStock]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RawStock](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SupplierID] [bigint] NULL,
	[BatchNumber] [varchar](50) NULL,
	[DataNumber] [varchar](50) NULL,
	[Material] [nvarchar](50) NULL,
	[PlateThick] [varchar](50) NULL,
	[PlateLength] [varchar](50) NULL,
	[PlateWidth] [varchar](50) NULL,
	[InCount] [int] NULL,
	[OutCount] [int] NULL,
	[Count] [int] NULL,
	[InTime] [datetime] NULL,
	[Status] [int] NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[Remark] [nvarchar](max) NULL,
	[Enabled] [int] NULL,
 CONSTRAINT [PK_RawStock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RawStock] ON
INSERT [dbo].[RawStock] ([ID], [Name], [SupplierID], [BatchNumber], [DataNumber], [Material], [PlateThick], [PlateLength], [PlateWidth], [InCount], [OutCount], [Count], [InTime], [Status], [OperID], [AddTime], [Remark], [Enabled]) VALUES (11, N'ewrer', NULL, N'', N'S202112070001', N'', N'', N'', N'', 0, 0, 0, NULL, NULL, 1, CAST(0x0000ADF700EE9A9E AS DateTime), N'', 1)
INSERT [dbo].[RawStock] ([ID], [Name], [SupplierID], [BatchNumber], [DataNumber], [Material], [PlateThick], [PlateLength], [PlateWidth], [InCount], [OutCount], [Count], [InTime], [Status], [OperID], [AddTime], [Remark], [Enabled]) VALUES (12, N'ertret', NULL, N'', N'S202112070001', N'', N'', N'', N'', 0, 0, 0, NULL, NULL, 1, CAST(0x0000ADF700EED42E AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[RawStock] OFF
/****** Object:  Table [dbo].[Production]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Production](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
	[OrderID] [bigint] NULL,
	[DataNumber] [varchar](50) NULL,
	[RawStockID] [bigint] NULL,
	[PlanCount] [int] NULL,
	[CompletedCount] [int] NULL,
	[PlanStartTime] [datetime] NULL,
	[PlanEndTime] [datetime] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[NFileName] [nvarchar](250) NULL,
	[DXFFileName] [nvarchar](250) NULL,
	[DevID] [bigint] NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[NPath] [nvarchar](250) NULL,
	[DXFPath] [nvarchar](250) NULL,
	[Remark] [nvarchar](250) NULL,
	[Enabled] [int] NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Production] ON
INSERT [dbo].[Production] ([ID], [Status], [OrderID], [DataNumber], [RawStockID], [PlanCount], [CompletedCount], [PlanStartTime], [PlanEndTime], [StartTime], [EndTime], [NFileName], [DXFFileName], [DevID], [OperID], [AddTime], [NPath], [DXFPath], [Remark], [Enabled]) VALUES (51, 3, 0, N'SCGD202111020003', 0, 1, 0, NULL, NULL, NULL, NULL, N'1.1005 - 副本.anc', N'1.1005 - 副本.dxf', 1, 1, CAST(0x0000ADD40100E722 AS DateTime), N'2021\11\2\57582194bf4f47a39a99f6f6a302a47c', N'2021\11\2\3defb48ced8f482da16273388099a1ac', NULL, 0)
INSERT [dbo].[Production] ([ID], [Status], [OrderID], [DataNumber], [RawStockID], [PlanCount], [CompletedCount], [PlanStartTime], [PlanEndTime], [StartTime], [EndTime], [NFileName], [DXFFileName], [DevID], [OperID], [AddTime], [NPath], [DXFPath], [Remark], [Enabled]) VALUES (52, 3, 0, N'SCGD202111020004', 0, 1, 0, CAST(0x0000ADD400000000 AS DateTime), CAST(0x0000ADED00000000 AS DateTime), NULL, NULL, N'1.1005 - 副本.anc', N'1.1005 - 副本.dxf', 1, 1, CAST(0x0000ADD401017C39 AS DateTime), N'2021\11\2\340dfcbd8a0f4e7c893c74a1e7770b0a', N'2021\11\2\7395c085046b4404adc86b22cdb4efbb', NULL, 1)
INSERT [dbo].[Production] ([ID], [Status], [OrderID], [DataNumber], [RawStockID], [PlanCount], [CompletedCount], [PlanStartTime], [PlanEndTime], [StartTime], [EndTime], [NFileName], [DXFFileName], [DevID], [OperID], [AddTime], [NPath], [DXFPath], [Remark], [Enabled]) VALUES (53, 3, 15, N'SCGD202111120001', 0, 1, 0, CAST(0x0000ADDE00000000 AS DateTime), CAST(0x0000ADDF00000000 AS DateTime), NULL, NULL, N'1.1005.anc', N'1.1005.dxf', 1, 1, CAST(0x0000ADDE00F31DC2 AS DateTime), N'2021\11\12\5a36d13da83a468aa4e17cc59977204b', N'2021\11\12\3f998b3bfbdd4b0b8f87ffdae16db5fe', NULL, 1)
SET IDENTITY_INSERT [dbo].[Production] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[DataNumber] [varchar](50) NULL,
	[Status] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[ContractID] [bigint] NULL,
	[CustomerID] [bigint] NULL,
	[PlanCount] [int] NULL,
	[Count] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[PlanStartTime] [datetime] NULL,
	[PlanEndTime] [datetime] NULL,
	[Remark] [nvarchar](max) NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[Enabled] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Order_DataNumber] ON [dbo].[Order] 
(
	[DataNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([ID], [Name], [DataNumber], [Status], [Type], [ContractID], [CustomerID], [PlanCount], [Count], [StartTime], [EndTime], [PlanStartTime], [PlanEndTime], [Remark], [OperID], [AddTime], [Enabled]) VALUES (13, N'枯', N'在', 1, N' 1', 3, NULL, NULL, 21, NULL, NULL, CAST(0x0000ADDD00000000 AS DateTime), CAST(0x0000ADEB00000000 AS DateTime), N'2以', 1, CAST(0x0000ADD400ABC839 AS DateTime), 1)
INSERT [dbo].[Order] ([ID], [Name], [DataNumber], [Status], [Type], [ContractID], [CustomerID], [PlanCount], [Count], [StartTime], [EndTime], [PlanStartTime], [PlanEndTime], [Remark], [OperID], [AddTime], [Enabled]) VALUES (14, N'33', N'SCDD202111120001', 1, N'', 6, 0, 0, NULL, NULL, NULL, NULL, NULL, N'', 1, CAST(0x0000ADDE00A7E71B AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[Notice]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notice](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
	[Type] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[DevID] [bigint] NULL,
	[SendID] [bigint] NULL,
	[RecvID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[Remark] [nvarchar](250) NULL,
	[Param] [nvarchar](max) NULL,
	[Identifier] [varchar](50) NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Notice] ON
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (23, 0, 4, N'报警', NULL, -3, 0, CAST(0x0000ADC7010424A9 AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (24, 0, 4, N'报警', NULL, -3, 0, CAST(0x0000ADC701048ACC AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (25, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC701055AEF AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (26, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70105B40F AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (27, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70105B413 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (28, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC70105B9A7 AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (29, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC70106ECAD AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (30, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70106ECAC AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (31, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70106ECB3 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (32, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC7010720F8 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (33, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC7010720F9 AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (34, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC7010720FD AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (35, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC701073077 AS DateTime), NULL, NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (36, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC70107307E AS DateTime), NULL, NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (37, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70107C787 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (38, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70108F812 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (39, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC70108F814 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (40, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70108F819 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (41, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC70108F81A AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (42, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC70108F81E AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (43, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC701097B9B AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (44, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC701097B9D AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (45, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC701097BA1 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (46, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC701097BA5 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (47, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC701097BAA AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (48, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC70109E2AB AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (49, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC70109E2B1 AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (50, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70109E2B3 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (51, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC70109E2B7 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (52, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC70109E2BB AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (53, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC70109E2BF AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (54, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC70109E2C3 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (55, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC7010F8C8E AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (56, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC7010F8C93 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (57, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC7010F8C95 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (58, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC7010F8C9C AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (59, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC7010F8CA1 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (60, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC7010F8CA3 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (61, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC7010F8CAD AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (62, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC7010FC7C5 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (63, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC7010FC7CB AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (64, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC7010FC7CD AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (65, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC7010FC7D4 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (66, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC7010FC7D8 AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (67, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC7010FC7DD AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (68, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC7010FC7E2 AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (69, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC8009EFF9C AS DateTime), N'测试，激光器异常', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (70, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC8009EFF9C AS DateTime), N'测试，激光器未开', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (71, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC8009EFF9C AS DateTime), N'视觉识别失败', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (72, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC8009EFF9C AS DateTime), N's', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (73, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC8009EFF9C AS DateTime), N'初始化流程中，吸盘横移电机故障', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (74, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC8009F42D5 AS DateTime), N'激光器异常(测试)', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (75, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC8009F42D9 AS DateTime), N'激光器未开(测试)', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (76, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC8009F42DA AS DateTime), N'视觉识别失败(测试)', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (77, 0, 4, N'报警', 4, 0, 0, CAST(0x0000ADC8009F42DA AS DateTime), N'通讯异常(测试)', NULL, N'1', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (78, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC8009F42DA AS DateTime), N'初始化流程中，吸盘横移电机故障(测试)', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (79, 0, 4, N'报警', 3, 0, 0, CAST(0x0000ADC900A5966E AS DateTime), N'备用', NULL, N'2', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (80, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900A5966E AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (81, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900A5966E AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (82, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900A59681 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (83, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900A664CB AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (84, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900A664E0 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (85, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900A664CB AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (86, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900A666C3 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (87, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900E9DA16 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (88, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900E9DA1A AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (89, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900E9DA20 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (90, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900E9DA22 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (91, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EB2A4D AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (92, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EB2A51 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (93, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EB2A55 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (94, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EB2A59 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (95, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EB60D4 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (96, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EB60D4 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (97, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EB63B0 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (98, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EB63B0 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (99, 0, 4, N'报警', 5, 0, 0, CAST(0x0000ADC900EB63B7 AS DateTime), N'设备急停', NULL, N'100', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (100, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EE3AB2 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (101, 0, 4, N'报警', 5, 0, 0, CAST(0x0000ADC900EE3AB7 AS DateTime), N'设备急停', NULL, N'100', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (102, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EE3AB9 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (103, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EE3AB6 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (104, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EE3ABF AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (105, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EE9B7A AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (106, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EE9B7C AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (107, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900EE9B82 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (108, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900EE9B84 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (109, 0, 4, N'报警', 5, 0, 0, CAST(0x0000ADC900EE9B88 AS DateTime), N'设备急停', NULL, N'100', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (110, 0, 4, N'报警', 5, 0, 0, CAST(0x0000ADC900F123D5 AS DateTime), N'设备急停', NULL, N'100', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (111, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900F123D7 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (112, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900F123DF AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (113, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900F123E1 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (114, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900F123E5 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (115, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900FB2415 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (116, 0, 4, N'报警', 5, 0, 0, CAST(0x0000ADC900FB241C AS DateTime), N'设备急停', NULL, N'100', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (117, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900FB2423 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (118, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900FB242A AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (119, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900FB2436 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (120, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900FBB2CC AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (121, 0, 4, N'报警', 1, 0, 0, CAST(0x0000ADC900FBB2D4 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (122, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900FBB2F0 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (123, 0, 4, N'报警', 2, 0, 0, CAST(0x0000ADC900FBB2F7 AS DateTime), N'Level 0：信息 1： 警告  2：错误', NULL, N'0', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (124, 0, 1, N'切割完成', NULL, -1, 0, CAST(0x0000ADD4010E1B31 AS DateTime), N'激光#2 1.8010.anc 切割完成', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (125, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADD4010EB2C8 AS DateTime), N'激光#2 1.8010.anc', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (126, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADD600C4B849 AS DateTime), N'1.8010.anc', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (127, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADD600E21BFD AS DateTime), N'1.8010.anc', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (128, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADD600E24822 AS DateTime), N'1.8010.anc', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (129, 1, 1, N'切割完成', 2, -2, 0, CAST(0x0000ADDC00F98780 AS DateTime), N'9.0001', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (130, 1, 1, N'切割完成', 2, -2, 0, CAST(0x0000ADDC00FA6CAD AS DateTime), N'9.0001', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (131, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADDC00FCBDC4 AS DateTime), N'9.0005', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (132, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADDC00FFD6B7 AS DateTime), N'9.0005', NULL, N'', NULL)
INSERT [dbo].[Notice] ([ID], [Status], [Type], [Title], [DevID], [SendID], [RecvID], [AddTime], [Remark], [Param], [Identifier], [UpdateTime]) VALUES (133, 1, 1, N'切割完成', 1, -1, 0, CAST(0x0000ADDC0101E251 AS DateTime), N'9.0005', NULL, N'', NULL)
SET IDENTITY_INSERT [dbo].[Notice] OFF
/****** Object:  Table [dbo].[Maintenance]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Maintenance](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DevID] [bigint] NULL,
	[Name] [nvarchar](100) NULL,
	[DataNumber] [varchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Cost] [varchar](50) NULL,
	[Company] [nvarchar](100) NULL,
	[Acceptance] [nvarchar](50) NULL,
	[AcceptanceTime] [datetime] NULL,
	[AcceptanceOperID] [bigint] NULL,
	[NextTime] [datetime] NULL,
	[Remark] [nvarchar](max) NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[Enabled] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenance] ON
INSERT [dbo].[Maintenance] ([ID], [DevID], [Name], [DataNumber], [StartTime], [EndTime], [Cost], [Company], [Acceptance], [AcceptanceTime], [AcceptanceOperID], [NextTime], [Remark], [OperID], [AddTime], [Enabled], [Status]) VALUES (1, 2, N'维修sdfsfd', N'WB202111150001', CAST(0x0000ADD600000000 AS DateTime), CAST(0x0000ADE600000000 AS DateTime), N'2033', N'4333', N'通过3434', CAST(0x0000ADE400000000 AS DateTime), 3, NULL, N'切割头常规保养33333', 1, CAST(0x0000ADE100E675DE AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Maintenance] OFF
/****** Object:  Table [dbo].[Log]    Script Date: 02/20/2023 15:54:17 ******/
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
SET IDENTITY_INSERT [dbo].[Log] OFF
/****** Object:  Table [dbo].[LaserProd]    Script Date: 02/20/2023 15:54:17 ******/
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
/****** Object:  Table [dbo].[FileItem]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileItem](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DataNumber] [varchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[Size] [int] NULL,
	[Type] [int] NULL,
	[FileContent] [varbinary](max) NULL,
	[Path] [nvarchar](250) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FileItem] ON [dbo].[FileItem] 
(
	[DataNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[DepartmentID] [bigint] NULL,
	[Position] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[JobNumber] [varchar](50) NULL,
	[JobStatus] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Remark] [nvarchar](250) NULL,
	[AddTime] [datetime] NULL,
	[OperID] [bigint] NULL,
	[Enabled] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([ID], [Name], [Sex], [DepartmentID], [Position], [Title], [JobNumber], [JobStatus], [Phone], [Remark], [AddTime], [OperID], [Enabled]) VALUES (2, N'测式', N'男', 5, N'程序员', N'高级', N'000988', N'在职', N'18553343', N'56', CAST(0x0000ADD500BD7179 AS DateTime), 1, 1)
INSERT [dbo].[Employee] ([ID], [Name], [Sex], [DepartmentID], [Position], [Title], [JobNumber], [JobStatus], [Phone], [Remark], [AddTime], [OperID], [Enabled]) VALUES (7, N'测式', N'男', NULL, N'机械工程师', N'工程师P1', N'', N'试用期', N'', N'', CAST(0x0000ADFE00C07B18 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  Table [dbo].[Dictionary]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dictionary](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Keyword] [varchar](50) NULL,
	[Remark] [nvarchar](250) NULL,
	[AddTime] [datetime] NULL,
	[Enabled] [int] NULL,
	[OperID] [bigint] NULL,
 CONSTRAINT [PK_DataDic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dictionary] ON [dbo].[Dictionary] 
(
	[Keyword] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dictionary] ON
INSERT [dbo].[Dictionary] ([ID], [Name], [Keyword], [Remark], [AddTime], [Enabled], [OperID]) VALUES (1, N'用户性别', N'sys_employee_sex', N'员工性别', CAST(0x0000ADFD00BE4A1F AS DateTime), 1, NULL)
INSERT [dbo].[Dictionary] ([ID], [Name], [Keyword], [Remark], [AddTime], [Enabled], [OperID]) VALUES (2, N'在职状态', N'sys_employee_jobstatus', N'员工的在职状态', CAST(0x0000ADFD01155056 AS DateTime), 1, NULL)
INSERT [dbo].[Dictionary] ([ID], [Name], [Keyword], [Remark], [AddTime], [Enabled], [OperID]) VALUES (3, N'职位', N'sys_employee_position', N'员工的职位', CAST(0x0000ADFE00A93F96 AS DateTime), 1, NULL)
INSERT [dbo].[Dictionary] ([ID], [Name], [Keyword], [Remark], [AddTime], [Enabled], [OperID]) VALUES (4, N'职称', N'sys_employee_title', N'员工的职称', CAST(0x0000ADFE00B48E30 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Dictionary] OFF
/****** Object:  Table [dbo].[DicData]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DicData](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DicID] [bigint] NULL,
	[Value] [nvarchar](250) NULL,
	[Sort] [int] NULL,
	[Enabled] [int] NULL,
	[Remark] [nvarchar](250) NULL,
	[AddTime] [datetime] NULL,
	[OperID] [bigint] NULL,
 CONSTRAINT [PK_DicData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DicData] ON
INSERT [dbo].[DicData] ([ID], [DicID], [Value], [Sort], [Enabled], [Remark], [AddTime], [OperID]) VALUES (1, 1, N'男', 2, 1, N'', CAST(0x0000ADFE009E76AF AS DateTime), 1)
INSERT [dbo].[DicData] ([ID], [DicID], [Value], [Sort], [Enabled], [Remark], [AddTime], [OperID]) VALUES (2, 1, N'女', 1, 1, N'', CAST(0x0000ADFE009E7BA3 AS DateTime), 1)
INSERT [dbo].[DicData] ([ID], [DicID], [Value], [Sort], [Enabled], [Remark], [AddTime], [OperID]) VALUES (3, 2, N'试用期', 1, 1, N'', CAST(0x0000ADFE009F3F20 AS DateTime), 1)
INSERT [dbo].[DicData] ([ID], [DicID], [Value], [Sort], [Enabled], [Remark], [AddTime], [OperID]) VALUES (4, 3, N'机械工程师', 1, 1, N'', CAST(0x0000ADFE00B3818F AS DateTime), 1)
INSERT [dbo].[DicData] ([ID], [DicID], [Value], [Sort], [Enabled], [Remark], [AddTime], [OperID]) VALUES (5, 4, N'助理', 1, 1, N'', CAST(0x0000ADFE00BC56C5 AS DateTime), 1)
INSERT [dbo].[DicData] ([ID], [DicID], [Value], [Sort], [Enabled], [Remark], [AddTime], [OperID]) VALUES (6, 4, N'工程师P1', 2, 1, N'', CAST(0x0000ADFE00BC6E31 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DicData] OFF
/****** Object:  Table [dbo].[Device]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Device](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](100) NULL,
	[DevNo] [varchar](50) NULL,
	[Model] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NULL,
	[Enabled] [int] NULL,
	[AddTime] [datetime] NULL,
	[Remark] [nvarchar](256) NULL,
	[InTime] [date] NULL,
	[AcceptTime] [date] NULL,
	[DepartmentID] [bigint] NULL,
	[MaintenanceTime] [date] NULL,
	[OperID] [bigint] NULL,
	[IP] [varchar](50) NULL,
	[FtpUser] [varchar](50) NULL,
	[FtpPwd] [varchar](50) NULL,
	[FtpPort] [int] NULL,
 CONSTRAINT [PK_DeviceInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Device] ON
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (1, N'切割机#1', N'laser', N'', N'', N'', 1, CAST(0x0000AD7400BD10D8 AS DateTime), N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (2, N'切割机#2', N'laser', N'', N'', N'', 1, CAST(0x0000AD7400BD1FC9 AS DateTime), N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (3, N'料库', N'sxl', NULL, NULL, NULL, 1, CAST(0x0000AD7400BD57DB AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (4, N'分拣', N'sort', NULL, NULL, NULL, 1, CAST(0x0000AD7400BD7076 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (5, N'折弯机', N'bend', NULL, NULL, NULL, 1, CAST(0x0000ADC900ED1726 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (9, N'测试', N'', N'', N'', N'', 0, CAST(0x0000ADF600C31814 AS DateTime), N'', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Device] ([ID], [Name], [Type], [DevNo], [Model], [Company], [Enabled], [AddTime], [Remark], [InTime], [AcceptTime], [DepartmentID], [MaintenanceTime], [OperID], [IP], [FtpUser], [FtpPwd], [FtpPort]) VALUES (10, N'edr', N'', N'', N'', N'', 0, CAST(0x0000ADF700BB4F4C AS DateTime), N'', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Device] OFF
/****** Object:  Table [dbo].[DevAlarm]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DevAlarm](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DevID] [bigint] NULL,
	[MessageID] [varchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[StartTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_Alarm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DevAlarm] ON
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (1, 3, N'2', N'备用', CAST(0x0000ADC700F55493 AS DateTime), CAST(0x0000ADC700F576F7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (2, 3, N'2', N'备用', CAST(0x0000ADC700F676ED AS DateTime), CAST(0x0000ADC700F68208 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (3, 3, N'2', N'备用', CAST(0x0000ADC70101FC1C AS DateTime), CAST(0x0000ADC70101FC24 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (4, 3, N'2', N'备用', CAST(0x0000ADC70104249F AS DateTime), CAST(0x0000ADC7010424A5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (5, 3, N'2', N'备用', CAST(0x0000ADC701048AC1 AS DateTime), CAST(0x0000ADC701048AC8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (6, 3, N'2', N'备用', CAST(0x0000ADC701055AE6 AS DateTime), CAST(0x0000ADC701055AEC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (7, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC70105B40B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (8, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC70105B411 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (9, 3, N'2', N'备用', CAST(0x0000ADC70105B9A3 AS DateTime), CAST(0x0000ADC70105B9A6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (10, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC70106ECA9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (11, 3, N'2', N'备用', CAST(0x0000ADC70106ECA2 AS DateTime), CAST(0x0000ADC70106ECAC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (12, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC70106ECB2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (13, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC701072008 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (14, 3, N'2', N'备用', CAST(0x0000ADC701071F2D AS DateTime), CAST(0x0000ADC70107208C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (15, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC7010720FB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (16, 1, N'0', NULL, CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC701073075 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (17, 1, N'0', NULL, CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70107307C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (18, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC70107C77F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (19, 1, NULL, N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70107C782 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (20, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC70108F80B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (21, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70108F810 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (22, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC70108F815 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (23, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70108F817 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (24, 3, N'2', N'备用', CAST(0x0000ADC70108F804 AS DateTime), CAST(0x0000ADC70108F819 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (25, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC701097B96 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (26, 3, N'2', N'备用', CAST(0x0000ADC701097B8D AS DateTime), CAST(0x0000ADC701097B99 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (27, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC701097B9F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (28, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC701097B9D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (29, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC701097BA7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (30, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70109E2A8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (31, 3, N'2', N'备用', CAST(0x0000ADC70109E29E AS DateTime), CAST(0x0000ADC70109E2AD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (32, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC70109E2A9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (33, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC70109E2B5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (34, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70109E2B1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (35, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70109E2BD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (36, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC70109E2AD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (37, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC7010F8C88 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (38, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010F8C90 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (39, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC7010F8C90 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (40, 3, N'2', N'备用', CAST(0x0000ADC7010F8C7E AS DateTime), CAST(0x0000ADC7010F8C99 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (41, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010F8C99 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (42, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010F8C8B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (43, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010F8CAB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (44, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010FC7C0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (45, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010FC7C8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (46, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010FC7C9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (47, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC7010FC7CF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (48, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADC7010FC7C3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (49, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADC7010FC7DA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (50, 3, N'2', N'备用', CAST(0x0000ADC7010FC7B7 AS DateTime), CAST(0x0000ADC7010FC7CF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (51, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A5965A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (52, 3, N'2', N'备用', CAST(0x0000ADC900A59646 AS DateTime), CAST(0x0000ADC900A59665 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (53, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A5966A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (54, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A5967B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (55, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A65244 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (56, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A664C0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (57, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A664D8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (58, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900A666BF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (59, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900E9DA12 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (60, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900E9DA16 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (61, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900E9DA1C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (62, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900E9DA1E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (63, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB2A4A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (64, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB2A4E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (65, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB2A53 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (66, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB2A51 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (67, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB5D1E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (68, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB5D50 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (69, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB6182 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (70, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EB6184 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (71, 5, N'100', N'设备急停', NULL, CAST(0x0000ADC900EB63B2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (72, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE3AAD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (73, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE3AB0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (74, 5, N'100', N'设备急停', CAST(0x0000ADC900EE3AA3 AS DateTime), CAST(0x0000ADC900EE3AB2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (75, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE3AB6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (76, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE3ABD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (77, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE9B75 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (78, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE9B78 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (79, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE9B7E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (80, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900EE9B80 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (81, 5, N'100', N'设备急停', CAST(0x0000ADC900EE9B6C AS DateTime), CAST(0x0000ADC900EE9B80 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (82, 5, N'100', N'设备急停', CAST(0x0000ADC900F123C7 AS DateTime), CAST(0x0000ADC900F123D1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (83, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900F123D4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (84, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900F123D9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (85, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900F123DD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (86, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900F123E3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (87, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FB240D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (88, 5, N'100', N'设备急停', CAST(0x0000ADC900FB23A2 AS DateTime), CAST(0x0000ADC900FB2415 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (89, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FB241F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (90, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FB241C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (91, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FB2433 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (92, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FBB2C5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (93, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FBB2D1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (94, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FBB2C6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (95, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC900FBB2F4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (96, 3, N'2', N'备用', CAST(0x0000ADC9010CF267 AS DateTime), CAST(0x0000ADC9010CF280 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (97, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010CF286 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (98, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010CF286 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (99, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010CF28E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (100, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010CF292 AS DateTime), NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (101, 3, N'2', N'备用', CAST(0x0000ADC9010D90D7 AS DateTime), CAST(0x0000ADC9010D9108 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (102, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010D9109 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (103, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010D9113 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (104, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010D9113 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (105, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010D911B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (106, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010F85A1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (107, 3, N'2', N'备用', CAST(0x0000ADC9010F859B AS DateTime), CAST(0x0000ADC9010F85AB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (108, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010F85A0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (109, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010F85B6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (110, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC9010F85B6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (111, 3, N'13', N'备用', CAST(0x0000ADC9010FA867 AS DateTime), CAST(0x0000ADC9010FA86C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (112, 3, N'2', N'备用', CAST(0x0000ADC9010FEED3 AS DateTime), CAST(0x0000ADC9010FEEDD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (113, 3, N'13', N'备用', CAST(0x0000ADC901103BF7 AS DateTime), CAST(0x0000ADC901103C03 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (114, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADC90110D819 AS DateTime), CAST(0x0000ADC90110D83A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (115, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC90110D83B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (116, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC90110D845 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (117, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC90110D845 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (118, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADC90110D848 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (119, 3, N'2', N'备用', CAST(0x0000ADC9011106DB AS DateTime), CAST(0x0000ADC9011106EC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (120, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF02B1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (121, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF02B5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (122, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00AF029D AS DateTime), CAST(0x0000ADCC00AF02B7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (123, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF02B2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (124, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF02BC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (125, 3, N'2', N'备用', CAST(0x0000ADCC00AF3D3F AS DateTime), CAST(0x0000ADCC00AF3D42 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (126, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00AF98C2 AS DateTime), CAST(0x0000ADCC00AF98CE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (127, 5, N'100', N'设备急停', CAST(0x0000ADCC00AF98C3 AS DateTime), CAST(0x0000ADCC00AF98CE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (128, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF98D3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (129, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF98D5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (130, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF98D6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (131, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00AF98D8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (132, 3, N'2', N'备用', CAST(0x0000ADCC00AFCB8B AS DateTime), CAST(0x0000ADCC00AFCB8D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (133, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00B011FA AS DateTime), CAST(0x0000ADCC00B011FD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (134, 3, N'2', N'备用', CAST(0x0000ADCC00B0586B AS DateTime), CAST(0x0000ADCC00B0586E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (135, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00B09ED8 AS DateTime), CAST(0x0000ADCC00B09EDA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (136, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00B1B501 AS DateTime), CAST(0x0000ADCC00B1B50D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (137, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B1B50D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (138, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B1B511 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (139, 5, N'100', N'设备急停', CAST(0x0000ADCC00B1B501 AS DateTime), CAST(0x0000ADCC00B1B513 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (140, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B1B515 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (141, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B1B511 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (142, 3, N'2', N'备用', CAST(0x0000ADCC00B1FB65 AS DateTime), CAST(0x0000ADCC00B1FB69 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (143, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00B241D1 AS DateTime), CAST(0x0000ADCC00B241D5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (144, 3, N'2', N'备用', CAST(0x0000ADCC00B2883F AS DateTime), CAST(0x0000ADCC00B28845 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (145, 3, N'2', N'备用', CAST(0x0000ADCC00B4BB0C AS DateTime), CAST(0x0000ADCC00B4BB1A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (146, 5, N'100', N'设备急停', CAST(0x0000ADCC00B4BB0D AS DateTime), CAST(0x0000ADCC00B4BB1E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (147, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B4BB20 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (148, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B4BB22 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (149, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B4BB24 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (150, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B4BB26 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (151, 3, N'2', N'备用', CAST(0x0000ADCC00B55BF9 AS DateTime), CAST(0x0000ADCC00B55C0D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (152, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B55C13 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (153, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B55C15 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (154, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B55C17 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (155, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00B55C19 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (156, 5, N'101', N'机器人错误', CAST(0x0000ADCC00B55BF9 AS DateTime), CAST(0x0000ADCC00B55C10 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (157, 3, N'2', N'备用', CAST(0x0000ADCC00F96D4A AS DateTime), CAST(0x0000ADCC00F96D57 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (158, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00F96D5D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (159, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00F96D5F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (160, 5, N'101', N'机器人错误', CAST(0x0000ADCC00F96D4B AS DateTime), CAST(0x0000ADCC00F96D61 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (161, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00F96D5A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (162, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00F96D66 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (163, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00F9ADB1 AS DateTime), CAST(0x0000ADCC00F9ADB4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (164, 3, N'2', N'备用', CAST(0x0000ADCC00FA1ABF AS DateTime), CAST(0x0000ADCC00FA1ACD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (165, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00FA1ACE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (166, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00FA1AD2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (167, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00FA1AD4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (168, 5, N'101', N'机器人错误', CAST(0x0000ADCC00FA1ABF AS DateTime), CAST(0x0000ADCC00FA1AD4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (169, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC00FA1AD6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (170, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADCC00FA37FE AS DateTime), CAST(0x0000ADCC00FA3801 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (171, 3, N'2', N'备用', CAST(0x0000ADCC01121FD2 AS DateTime), CAST(0x0000ADCC01121FDF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (172, 5, N'101', N'机器人错误', CAST(0x0000ADCC01121FD2 AS DateTime), CAST(0x0000ADCC01121FE0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (173, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC01121FE4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (174, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC01121FE6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (175, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC01121FE4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (176, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADCC01121FEB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (177, 5, N'101', N'机器人错误', CAST(0x0000ADDA00910889 AS DateTime), CAST(0x0000ADDA0091089E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (178, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA009108A2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (179, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA009108A4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (180, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA0091089F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (181, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA009108A8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (182, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00A98D57 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (183, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00A98D5F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (184, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00A98D64 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (185, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00A98D64 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (186, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00A98D58 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (187, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00A98D73 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (188, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00AAA0BD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (189, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00AAA0C3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (190, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AAA0C7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (191, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AAA0CC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (192, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AAA0B8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (193, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AAA0D6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (194, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00AB175C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (195, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AB175D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (196, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AB1766 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (197, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00AB176A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (198, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AB176E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (199, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AB1767 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (200, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00ABE25A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (201, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ABE26C AS DateTime), NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (202, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ABE267 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (203, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ABE273 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (204, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00ABE273 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (205, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ABE279 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (206, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00AC39FA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (207, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AC3A03 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (208, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AC3A06 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (209, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AC3A0A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (210, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AC3A0E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (211, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00AC3A03 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (212, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ACE020 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (213, 4, N'1', N's', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00ACE021 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (214, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ACEEA4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (215, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ACEEAB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (216, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00ACEEA4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (217, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00ACEEB1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (218, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AE32F3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (219, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AE32FD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (220, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AE32F4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (221, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00AE3302 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (222, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AE36D6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (223, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00AE36DB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (224, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00AEE3D9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (225, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AEE3D2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (226, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AEE3DD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (227, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00AEE3DD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (228, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AEE3D1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (229, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00AEE3F1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (230, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00B36746 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (231, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00B36751 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (232, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B36747 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (233, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B3675C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (234, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B36746 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (235, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B36766 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (236, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B40478 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (237, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B4046A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (238, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00B4047D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (239, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B4047D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (240, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00B40486 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (241, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B40481 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (242, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00B48C6A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (243, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B48C71 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (244, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00B48C75 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (245, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B48C79 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (246, 5, N'101', N'机器人错误', CAST(0x0000ADDA00B48C49 AS DateTime), CAST(0x0000ADDA00B48C7D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (247, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B48C80 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (248, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00B48C8B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (249, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00E19A62 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (250, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00E19A68 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (251, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E19A6A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (252, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E19A6C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (253, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E19A66 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (254, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E19A71 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (255, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDA00E6DC3A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (256, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDA00E6DC3E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (257, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E6DC40 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (258, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E6DC43 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (259, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E6DC3B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (260, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA00E6DC47 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (261, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA010C0E11 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (262, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA010C0E18 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (263, 5, N'101', N'机器人错误', CAST(0x0000ADDA010C0DE9 AS DateTime), CAST(0x0000ADDA010C0E12 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (264, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA010C0E24 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (265, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDA010C0E28 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (266, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDB0090C588 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (267, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDB0090C58E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (268, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADDB0090C57B AS DateTime), CAST(0x0000ADDB0090C590 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (269, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB0090C592 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (270, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB0090C594 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (271, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB0090C58B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (272, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB0090C599 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (273, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDB00999E01 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (274, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00999E01 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (275, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDB00999E05 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (276, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00999E07 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (277, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00999E09 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (278, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00999E0B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (279, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADDB00999F75 AS DateTime), CAST(0x0000ADDB00999F78 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (280, 5, N'101', N'机器人错误', CAST(0x0000ADDB00999F73 AS DateTime), CAST(0x0000ADDB00999F7A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (281, 3, N'2', N'备用', CAST(0x0000ADDB0099D197 AS DateTime), CAST(0x0000ADDB0099D19F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (282, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADDB009A1F34 AS DateTime), CAST(0x0000ADDB009A1F42 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (283, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDB009A1F4A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (284, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDB009A1F4C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (285, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009A1F4C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (286, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009A1F4F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (287, 5, N'101', N'机器人错误', CAST(0x0000ADDB009A1F34 AS DateTime), CAST(0x0000ADDB009A1F47 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (288, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009A1F50 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (289, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009A1F5F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (290, 3, N'50', N'原料小车无板材，请回库后补充板材', CAST(0x0000ADDB009CF45D AS DateTime), CAST(0x0000ADDB009CF47A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (291, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDB009CF47D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (292, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009CF47D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (293, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDB009CF47F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (294, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009CF483 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (295, 5, N'101', N'机器人错误', CAST(0x0000ADDB009CF45D AS DateTime), CAST(0x0000ADDB009CF47A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (296, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009CF481 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (297, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009CF48C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (298, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009D73C2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (299, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDB009D73C3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (300, 5, N'101', N'机器人错误', CAST(0x0000ADDB009D73B0 AS DateTime), CAST(0x0000ADDB009D73C2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (301, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009D73C9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (302, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDB009D73CB AS DateTime), NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (303, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009D73CD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (304, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB009D73CB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (305, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A03D19 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (306, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A03D18 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (307, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A03D1E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (308, 4, N'1', N'wwws', CAST(0x0000ADAA00000000 AS DateTime), CAST(0x0000ADDB00A03D1F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (309, 4, N'1', N's', CAST(0x0000ADAB00000000 AS DateTime), CAST(0x0000ADDB00A03D21 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (310, 5, N'101', N'机器人错误', CAST(0x0000ADDB00A03D00 AS DateTime), CAST(0x0000ADDB00A03D23 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (311, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A03D1E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (312, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A60633 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (313, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A60636 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (314, 5, N'101', N'机器人错误', CAST(0x0000ADDB00A6062B AS DateTime), CAST(0x0000ADDB00A60639 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (315, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A60633 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (316, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00A6063D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (317, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00ADAE9F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (318, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00ADAEAB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (319, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00ADAEAB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (320, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00ADAEAF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (321, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B59AED AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (322, 5, N'101', N'机器人错误', CAST(0x0000ADDB00B59AE2 AS DateTime), CAST(0x0000ADDB00B59AF2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (323, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B59AF4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (324, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B59AF4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (325, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B59AFA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (326, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B6E7FC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (327, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B6E809 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (328, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B6E808 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (329, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B6E80E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (330, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B74EBE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (331, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B74EB8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (332, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B75353 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (333, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B75353 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (334, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B7D847 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (335, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B7D84B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (336, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B7D848 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (337, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00B7D853 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (338, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00DDE691 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (339, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00DDE691 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (340, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00DDE696 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (341, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00DDE696 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (342, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E1C712 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (343, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E1C716 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (344, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E1C713 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (345, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E1C71C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (346, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E49F6F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (347, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E49F70 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (348, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E49F75 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (349, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E49F78 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (350, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E56666 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (351, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E56669 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (352, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E5666C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (353, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E56670 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (354, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E5E533 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (355, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E5E52D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (356, 2, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E5E535 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (357, 5, N'102', N'折弯机错误', CAST(0x0000ADDB00E5E523 AS DateTime), CAST(0x0000ADDB00E5E537 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (358, 1, N'0', N'Level 0：信息 1： 警告  2：错误', CAST(0x0000ADC1009D28D0 AS DateTime), CAST(0x0000ADDB00E5E535 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (359, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDB00E63156 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (360, 2, NULL, NULL, NULL, CAST(0x0000ADDB010FA6CA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (361, 1, N'1', N'急停', NULL, CAST(0x0000ADDB010FA6F4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (362, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDB010FA6FD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (363, 2, NULL, NULL, NULL, CAST(0x0000ADDB010FA701 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (364, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDB010FA701 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (365, 5, N'102', N'折弯机错误', CAST(0x0000ADDB010FA6B9 AS DateTime), CAST(0x0000ADDB010FA709 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (366, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDB0110228A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (367, 2, N'1', N'急停', NULL, CAST(0x0000ADDB0110228E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (368, 2, NULL, NULL, NULL, CAST(0x0000ADDB01102298 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (369, 2, N'1', N'急停', NULL, CAST(0x0000ADDB0110229E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (370, 5, N'102', N'折弯机错误', CAST(0x0000ADDB01102281 AS DateTime), CAST(0x0000ADDB011022A2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (371, 2, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDB011022A2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (372, 1, N'1', N'急停', NULL, CAST(0x0000ADDB01102297 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (373, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDB011022B9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (374, 2, N'1', N'急停', NULL, CAST(0x0000ADDB0110F2F1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (375, 2, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDB0110F2F9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (376, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDB0110F2FE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (377, 1, N'1', N'急停', NULL, CAST(0x0000ADDB0110F2EA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (378, 5, N'102', N'折弯机错误', CAST(0x0000ADDB0110F2D7 AS DateTime), CAST(0x0000ADDB0110F30E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (379, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDB0110F312 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (380, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00DD3020 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (381, 2, N'1', N'急停', NULL, CAST(0x0000ADDC00DD3016 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (382, 1, N'1', N'急停', NULL, CAST(0x0000ADDC00DD3016 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (383, 2, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00DD3023 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (384, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00DD3016 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (385, 5, N'102', N'折弯机错误', CAST(0x0000ADDC00DD301E AS DateTime), CAST(0x0000ADDC00DD3027 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (386, 1, N'1', N'急停', NULL, CAST(0x0000ADDC00E2B49B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (387, 2, N'1', N'急停', NULL, CAST(0x0000ADDC00E2B4A2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (388, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00E2B4A6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (389, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00E2B49B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (390, 2, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00E2B4AB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (391, 5, N'102', N'折弯机错误', CAST(0x0000ADDC00E2B49B AS DateTime), CAST(0x0000ADDC00E2B4AC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (392, 1, N'1', N'急停', NULL, CAST(0x0000ADDC00E9C791 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (393, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00E9C791 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (394, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00E9C791 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (395, 2, N'1', N'急停', NULL, CAST(0x0000ADDC00E9C791 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (396, 2, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00E9C791 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (397, 1, N'102', N'折弯机错误', CAST(0x0000ADDC00E9C797 AS DateTime), CAST(0x0000ADDC00E9C7A2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (398, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00EA5518 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (399, 2, N'1', N'急停', NULL, CAST(0x0000ADDC00EA5518 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (400, 2, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00EA5518 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (401, 1, N'1', N'急停', NULL, CAST(0x0000ADDC00EA5518 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (402, 1, N'102', N'折弯机错误', CAST(0x0000ADDC00EA5518 AS DateTime), CAST(0x0000ADDC00EA551F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (403, 1, N'2', N'轴极限限位触发', NULL, CAST(0x0000ADDC00EA5518 AS DateTime), NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (404, 3, N'13', N'备用', CAST(0x0000ADDC00EA5523 AS DateTime), CAST(0x0000ADDC00EA5527 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (405, 2, N'1', N'急停', CAST(0x0000ADDC00ED1CA6 AS DateTime), CAST(0x0000ADDC00ED1CA6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (406, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00ED1CA6 AS DateTime), CAST(0x0000ADDC00ED1CA6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (407, 1, N'1', N'急停', CAST(0x0000ADDC00ED1CA6 AS DateTime), CAST(0x0000ADDC00ED1CA6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (408, 1, N'2', N'轴极限限位触发', CAST(0x0000ADDC00ED1CA6 AS DateTime), CAST(0x0000ADDC00ED1CA6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (409, 1, N'102', N'折弯机错误', CAST(0x0000ADDC00ED1CA6 AS DateTime), CAST(0x0000ADDC00ED1CB2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (410, 3, N'13', N'备用', CAST(0x0000ADDC00ED1CA6 AS DateTime), CAST(0x0000ADDC00ED1CAA AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (411, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00ED1CA6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (412, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00ED63A1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (413, 3, N'13', N'备用', CAST(0x0000ADDC00ED63A2 AS DateTime), CAST(0x0000ADDC00ED63A5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (414, 2, N'1', N'急停', CAST(0x0000ADDC00ED63A1 AS DateTime), CAST(0x0000ADDC00ED63A1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (415, 1, N'1', N'急停', CAST(0x0000ADDC00ED63A1 AS DateTime), CAST(0x0000ADDC00ED63A1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (416, 1, N'2', N'轴极限限位触发', CAST(0x0000ADDC00ED63A1 AS DateTime), CAST(0x0000ADDC00ED63A1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (417, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00ED63A1 AS DateTime), CAST(0x0000ADDC00ED63A1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (418, 1, N'1', N'急停', CAST(0x0000ADDC00EE07B5 AS DateTime), CAST(0x0000ADDC00EE07B5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (419, 1, N'2', N'轴极限限位触发', CAST(0x0000ADDC00EE07B5 AS DateTime), CAST(0x0000ADDC00EE07B5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (420, 3, N'13', N'备用', CAST(0x0000ADDC00EE07B9 AS DateTime), CAST(0x0000ADDC00EE07BC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (421, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00EE07B9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (422, 2, N'1', N'急停', CAST(0x0000ADDC00EE07B5 AS DateTime), CAST(0x0000ADDC00EE07B5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (423, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00EE07B5 AS DateTime), CAST(0x0000ADDC00EE07B5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (424, 1, N'1', N'急停', CAST(0x0000ADDC00EE641F AS DateTime), CAST(0x0000ADDC00EE641F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (425, 2, N'1', N'急停', CAST(0x0000ADDC00EE641F AS DateTime), CAST(0x0000ADDC00EE641F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (426, 1, N'2', N'轴极限限位触发', CAST(0x0000ADDC00EE641F AS DateTime), CAST(0x0000ADDC00EE641F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (427, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00EE641F AS DateTime), CAST(0x0000ADDC00EE641F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (428, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00EE641F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (429, 5, N'102', N'折弯机错误', CAST(0x0000ADDC00EE6424 AS DateTime), CAST(0x0000ADDC00EE642A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (430, 3, N'13', N'备用', CAST(0x0000ADDC00EE641F AS DateTime), CAST(0x0000ADDC00EE6426 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (431, 1, N'1', N'急停', CAST(0x0000ADDC00EEE89B AS DateTime), CAST(0x0000ADDC00EEE89B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (432, 1, N'2', N'轴极限限位触发', CAST(0x0000ADDC00EEE89B AS DateTime), CAST(0x0000ADDC00EEE89B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (433, 3, N'13', N'备用', CAST(0x0000ADDC00EEE89B AS DateTime), CAST(0x0000ADDC00EEE89E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (434, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00EEE8A0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (435, 2, N'1', N'急停', CAST(0x0000ADDC00EEE89B AS DateTime), CAST(0x0000ADDC00EEE89B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (436, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00EEE89B AS DateTime), CAST(0x0000ADDC00EEE89B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (437, 5, N'100', N'设备急停', CAST(0x0000ADDC00F02B4D AS DateTime), CAST(0x0000ADDC00F02B4D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (438, 5, N'102', N'折弯机错误', CAST(0x0000ADDC00F03704 AS DateTime), CAST(0x0000ADDC00F03704 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (439, 5, N'100', N'设备急停', CAST(0x0000ADDC00F042C3 AS DateTime), CAST(0x0000ADDC00F042C3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (440, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00F67F77 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (441, 2, N'1', N'急停', CAST(0x0000ADDC00F67F77 AS DateTime), CAST(0x0000ADDC00F67F77 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (442, 3, N'13', N'备用', CAST(0x0000ADDC00F67F7C AS DateTime), CAST(0x0000ADDC00F67F7C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (443, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00F67F77 AS DateTime), CAST(0x0000ADDC00F67F77 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (444, 2, N'1', N'急停', CAST(0x0000ADDC00F82CF3 AS DateTime), CAST(0x0000ADDC00F82CF3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (445, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00F82CF3 AS DateTime), CAST(0x0000ADDC00F82CF3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (446, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00F82CF3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (447, 3, N'13', N'备用', CAST(0x0000ADDC00F82CFB AS DateTime), CAST(0x0000ADDC00F82CFC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (448, 5, N'100', N'设备急停', CAST(0x0000ADDC00F96F9E AS DateTime), CAST(0x0000ADDC00F96F9E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (449, 5, N'102', N'折弯机错误', CAST(0x0000ADDC00F97B5F AS DateTime), CAST(0x0000ADDC00F97B5F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (450, 5, N'100', N'设备急停', CAST(0x0000ADDC00F98778 AS DateTime), CAST(0x0000ADDC00F98778 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (451, 2, N'1', N'急停', CAST(0x0000ADDC00FA93A3 AS DateTime), CAST(0x0000ADDC00FA93A3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (452, 3, N'13', N'备用', CAST(0x0000ADDC00FA93A4 AS DateTime), CAST(0x0000ADDC00FA93AC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (453, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00FA93A3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (454, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00FA93A3 AS DateTime), CAST(0x0000ADDC00FA93A3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (455, 2, N'1', N'急停', CAST(0x0000ADDC00FBF7B3 AS DateTime), CAST(0x0000ADDC00FBF7B3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (456, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00FBF7B3 AS DateTime), CAST(0x0000ADDC00FBF7B3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (457, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00FBF7B4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (458, 3, N'13', N'备用', CAST(0x0000ADDC00FBF7B8 AS DateTime), CAST(0x0000ADDC00FBF7BC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (459, 5, N'100', N'设备急停', CAST(0x0000ADDC00FD3A66 AS DateTime), CAST(0x0000ADDC00FD3A66 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (460, 5, N'102', N'折弯机错误', CAST(0x0000ADDC00FD4623 AS DateTime), CAST(0x0000ADDC00FD4623 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (461, 5, N'100', N'设备急停', CAST(0x0000ADDC00FD51DB AS DateTime), CAST(0x0000ADDC00FD51DB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (462, 2, N'1', N'急停', CAST(0x0000ADDC00FF0FE4 AS DateTime), CAST(0x0000ADDC00FF0FE4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (463, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC00FF0FE4 AS DateTime), CAST(0x0000ADDC00FF0FE4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (464, 3, N'13', N'备用', CAST(0x0000ADDC00FF0FEC AS DateTime), CAST(0x0000ADDC00FF0FEF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (465, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC00FF0FE4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (466, 2, N'1', N'急停', CAST(0x0000ADDC0101073F AS DateTime), CAST(0x0000ADDC0101073F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (467, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC0101073F AS DateTime), CAST(0x0000ADDC0101073F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (468, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC01010742 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (469, 3, N'13', N'备用', CAST(0x0000ADDC01010742 AS DateTime), CAST(0x0000ADDC01010747 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (470, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC01044FD0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (471, 2, N'1', N'急停', CAST(0x0000ADDC01044FD0 AS DateTime), CAST(0x0000ADDC01044FD0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (472, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC01044FD0 AS DateTime), CAST(0x0000ADDC01044FD0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (473, 3, N'13', N'备用', CAST(0x0000ADDC01044FDD AS DateTime), CAST(0x0000ADDC01044FDF AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (474, 2, N'1', N'急停', CAST(0x0000ADDC010475DB AS DateTime), CAST(0x0000ADDC010475DB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (475, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC010475DB AS DateTime), CAST(0x0000ADDC010475DB AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (476, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC010475DE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (477, 3, N'13', N'备用', CAST(0x0000ADDC010475E0 AS DateTime), CAST(0x0000ADDC010475E3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (478, 5, N'100', N'设备急停', CAST(0x0000ADDC0105B86F AS DateTime), CAST(0x0000ADDC0105B86F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (479, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADDC0106AF9D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (480, 2, N'1', N'急停', CAST(0x0000ADDC0106AF9E AS DateTime), CAST(0x0000ADDC0106AF9E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (481, 2, N'2', N'轴极限限位触发', CAST(0x0000ADDC0106AF9E AS DateTime), CAST(0x0000ADDC0106AF9E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (482, 3, N'13', N'备用', CAST(0x0000ADDC0106AFA2 AS DateTime), CAST(0x0000ADDC0106AFAD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (483, 5, N'100', N'设备急停', CAST(0x0000ADDC0107F242 AS DateTime), CAST(0x0000ADDC0107F242 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (484, 5, N'102', N'折弯机错误', CAST(0x0000ADDC0107FE00 AS DateTime), CAST(0x0000ADDC0107FE00 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (485, 5, N'100', N'设备急停', CAST(0x0000ADDC010809BD AS DateTime), CAST(0x0000ADDC010809BD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (486, 3, N'13', N'备用', CAST(0x0000ADE500FE91CD AS DateTime), CAST(0x0000ADE500FE91CE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (487, 2, N'1', N'急停', CAST(0x0000ADE500FE9776 AS DateTime), CAST(0x0000ADE500FE9776 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (488, 2, N'2', N'轴极限限位触发', CAST(0x0000ADE500FE9776 AS DateTime), CAST(0x0000ADE500FE9776 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (489, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADE500FE9781 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (490, 3, N'13', N'备用', CAST(0x0000ADE501016A3F AS DateTime), CAST(0x0000ADE501016A40 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (491, 2, N'1', N'急停', CAST(0x0000ADE501016E18 AS DateTime), CAST(0x0000ADE501016E18 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (492, 2, N'2', N'轴极限限位触发', CAST(0x0000ADE501016E18 AS DateTime), CAST(0x0000ADE501016E18 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (493, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADE501016E24 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (494, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADE900F597BD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (495, 3, N'13', N'备用', CAST(0x0000ADE900F597BD AS DateTime), CAST(0x0000ADE900F597BE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (496, 2, N'1', N'急停', CAST(0x0000ADE900F597C4 AS DateTime), CAST(0x0000ADE900F597C4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (497, 2, N'2', N'轴极限限位触发', CAST(0x0000ADE900F597C4 AS DateTime), CAST(0x0000ADE900F597C4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (498, 2, N'1', N'急停', CAST(0x0000ADE900F63D31 AS DateTime), CAST(0x0000ADE900F63D31 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (499, 2, N'2', N'轴极限限位触发', CAST(0x0000ADE900F63D31 AS DateTime), CAST(0x0000ADE900F63D31 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (500, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADE900F63D31 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (501, 3, N'13', N'备用', CAST(0x0000ADE900F63D39 AS DateTime), CAST(0x0000ADE900F63D3C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (502, 2, N'1', N'急停', CAST(0x0000ADE900F7290B AS DateTime), CAST(0x0000ADE900F7290B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (503, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADE900F7290B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (504, 2, N'2', N'轴极限限位触发', CAST(0x0000ADE900F7290B AS DateTime), CAST(0x0000ADE900F7290B AS DateTime), NULL)
GO
print 'Processed 500 total records'
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (505, 3, N'13', N'备用', CAST(0x0000ADE900F7290C AS DateTime), CAST(0x0000ADE900F72911 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (506, 5, N'100', N'设备急停', CAST(0x0000ADE900F86BB1 AS DateTime), CAST(0x0000ADE900F86BB1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (507, 5, N'102', N'折弯机错误', CAST(0x0000ADE900F8776B AS DateTime), CAST(0x0000ADE900F8776B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (508, 5, N'100', N'设备急停', CAST(0x0000ADE900F88324 AS DateTime), CAST(0x0000ADE900F88324 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (509, 5, N'100', N'设备急停', CAST(0x0000ADE900F9D1AD AS DateTime), CAST(0x0000ADE900F9D1AD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (510, 5, N'102', N'折弯机错误', CAST(0x0000ADE900F9DD6B AS DateTime), CAST(0x0000ADE900F9DD6B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (511, 5, N'100', N'设备急停', CAST(0x0000ADE900F9E928 AS DateTime), CAST(0x0000ADE900F9E928 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (512, 5, N'100', N'设备急停', CAST(0x0000ADE900FB37B1 AS DateTime), CAST(0x0000ADE900FB37B1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (513, 5, N'102', N'折弯机错误', CAST(0x0000ADE900FB436E AS DateTime), CAST(0x0000ADE900FB436E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (514, 5, N'100', N'设备急停', CAST(0x0000ADE900FB4F2C AS DateTime), CAST(0x0000ADE900FB4F2C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (515, 5, N'100', N'设备急停', CAST(0x0000ADE900FC9DAE AS DateTime), CAST(0x0000ADE900FC9DAE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (516, 5, N'102', N'折弯机错误', CAST(0x0000ADE900FCA967 AS DateTime), CAST(0x0000ADE900FCA967 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (517, 5, N'100', N'设备急停', CAST(0x0000ADE900FCB522 AS DateTime), CAST(0x0000ADE900FCB522 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (518, 5, N'100', N'设备急停', CAST(0x0000ADE900FE03A7 AS DateTime), CAST(0x0000ADE900FE03A7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (519, 5, N'102', N'折弯机错误', CAST(0x0000ADE900FE0F65 AS DateTime), CAST(0x0000ADE900FE0F65 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (520, 5, N'100', N'设备急停', CAST(0x0000ADE900FE1B22 AS DateTime), CAST(0x0000ADE900FE1B22 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (521, 5, N'100', N'设备急停', CAST(0x0000ADE900FF69A8 AS DateTime), CAST(0x0000ADE900FF69A8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (522, 5, N'102', N'折弯机错误', CAST(0x0000ADE900FF7562 AS DateTime), CAST(0x0000ADE900FF7562 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (523, 5, N'100', N'设备急停', CAST(0x0000ADE900FF8124 AS DateTime), CAST(0x0000ADE900FF8124 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (524, 5, N'100', N'设备急停', CAST(0x0000ADE90100CFA5 AS DateTime), CAST(0x0000ADE90100CFA5 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (525, 5, N'102', N'折弯机错误', CAST(0x0000ADE90100DB64 AS DateTime), CAST(0x0000ADE90100DB64 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (526, 5, N'100', N'设备急停', CAST(0x0000ADE90100E71F AS DateTime), CAST(0x0000ADE90100E71F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (527, 5, N'100', N'设备急停', CAST(0x0000ADE901023599 AS DateTime), CAST(0x0000ADE901023599 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (528, 5, N'102', N'折弯机错误', CAST(0x0000ADE901024155 AS DateTime), CAST(0x0000ADE901024155 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (529, 5, N'100', N'设备急停', CAST(0x0000ADE901024D15 AS DateTime), CAST(0x0000ADE901024D15 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (530, 5, N'100', N'设备急停', CAST(0x0000ADE901039B8B AS DateTime), CAST(0x0000ADE901039B8B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (531, 5, N'102', N'折弯机错误', CAST(0x0000ADE90103A74A AS DateTime), CAST(0x0000ADE90103A74B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (532, 5, N'100', N'设备急停', CAST(0x0000ADE90103B306 AS DateTime), CAST(0x0000ADE90103B306 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (533, 5, N'100', N'设备急停', CAST(0x0000ADE90105019A AS DateTime), CAST(0x0000ADE90105019A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (534, 5, N'102', N'折弯机错误', CAST(0x0000ADE901050D59 AS DateTime), CAST(0x0000ADE901050D59 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (535, 5, N'100', N'设备急停', CAST(0x0000ADE901051911 AS DateTime), CAST(0x0000ADE901051911 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (536, 5, N'100', N'设备急停', CAST(0x0000ADE901066796 AS DateTime), CAST(0x0000ADE901066796 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (537, 5, N'102', N'折弯机错误', CAST(0x0000ADE901067350 AS DateTime), CAST(0x0000ADE901067350 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (538, 5, N'100', N'设备急停', CAST(0x0000ADE901067F0E AS DateTime), CAST(0x0000ADE901067F0E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (539, 5, N'100', N'设备急停', CAST(0x0000ADE90107CD87 AS DateTime), CAST(0x0000ADE90107CD87 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (540, 5, N'102', N'折弯机错误', CAST(0x0000ADE90107D940 AS DateTime), CAST(0x0000ADE90107D940 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (541, 5, N'100', N'设备急停', CAST(0x0000ADE90107E4FC AS DateTime), CAST(0x0000ADE90107E4FC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (542, 5, N'100', N'设备急停', CAST(0x0000ADE901093381 AS DateTime), CAST(0x0000ADE901093381 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (543, 5, N'102', N'折弯机错误', CAST(0x0000ADE901093F3C AS DateTime), CAST(0x0000ADE901093F3C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (544, 5, N'100', N'设备急停', CAST(0x0000ADE901094AF8 AS DateTime), CAST(0x0000ADE901094AF8 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (545, 5, N'100', N'设备急停', CAST(0x0000ADE9010A9985 AS DateTime), CAST(0x0000ADE9010A9985 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (546, 5, N'102', N'折弯机错误', CAST(0x0000ADE9010AA543 AS DateTime), CAST(0x0000ADE9010AA543 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (547, 5, N'100', N'设备急停', CAST(0x0000ADE9010AB101 AS DateTime), CAST(0x0000ADE9010AB101 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (548, 5, N'100', N'设备急停', CAST(0x0000ADE9010BFF88 AS DateTime), CAST(0x0000ADE9010BFF88 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (549, 5, N'102', N'折弯机错误', CAST(0x0000ADE9010C0B42 AS DateTime), CAST(0x0000ADE9010C0B42 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (550, 5, N'100', N'设备急停', CAST(0x0000ADE9010C1703 AS DateTime), CAST(0x0000ADE9010C1703 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (551, 5, N'100', N'设备急停', CAST(0x0000ADE9010D6599 AS DateTime), CAST(0x0000ADE9010D6599 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (552, 5, N'102', N'折弯机错误', CAST(0x0000ADE9010D715A AS DateTime), CAST(0x0000ADE9010D715A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (553, 5, N'100', N'设备急停', CAST(0x0000ADE9010D7D13 AS DateTime), CAST(0x0000ADE9010D7D13 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (554, 5, N'100', N'设备急停', CAST(0x0000ADE9010ECB90 AS DateTime), CAST(0x0000ADE9010ECB90 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (555, 5, N'102', N'折弯机错误', CAST(0x0000ADE9010ED74B AS DateTime), CAST(0x0000ADE9010ED74B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (556, 5, N'100', N'设备急停', CAST(0x0000ADE9010EE309 AS DateTime), CAST(0x0000ADE9010EE309 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (557, 5, N'100', N'设备急停', CAST(0x0000ADE9011031A9 AS DateTime), CAST(0x0000ADE9011031A9 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (558, 5, N'102', N'折弯机错误', CAST(0x0000ADE901103D66 AS DateTime), CAST(0x0000ADE901103D66 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (559, 5, N'100', N'设备急停', CAST(0x0000ADE901104920 AS DateTime), CAST(0x0000ADE901104920 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (560, 5, N'100', N'设备急停', CAST(0x0000ADE9011197B1 AS DateTime), CAST(0x0000ADE9011197B1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (561, 5, N'102', N'折弯机错误', CAST(0x0000ADE90111A36D AS DateTime), CAST(0x0000ADE90111A36D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (562, 5, N'100', N'设备急停', CAST(0x0000ADE90111AF27 AS DateTime), CAST(0x0000ADE90111AF27 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (563, 5, N'100', N'设备急停', CAST(0x0000ADE90112FDC4 AS DateTime), CAST(0x0000ADE90112FDC4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (564, 5, N'102', N'折弯机错误', CAST(0x0000ADE901130980 AS DateTime), CAST(0x0000ADE901130980 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (565, 5, N'100', N'设备急停', CAST(0x0000ADE901131540 AS DateTime), CAST(0x0000ADE901131540 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (566, 5, N'100', N'设备急停', CAST(0x0000ADE9011463C4 AS DateTime), CAST(0x0000ADE9011463C4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (567, 5, N'102', N'折弯机错误', CAST(0x0000ADE901146F7F AS DateTime), CAST(0x0000ADE901146F7F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (568, 5, N'100', N'设备急停', CAST(0x0000ADE901147B3D AS DateTime), CAST(0x0000ADE901147B3D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (569, 2, N'1', N'急停', CAST(0x0000ADE90116BFFD AS DateTime), CAST(0x0000ADE90116BFFD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (570, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADE90116BFFD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (571, 2, N'2', N'轴极限限位触发', CAST(0x0000ADE90116BFFD AS DateTime), CAST(0x0000ADE90116BFFD AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (572, 3, N'13', N'备用', CAST(0x0000ADE90116BFFD AS DateTime), CAST(0x0000ADE90116BFFE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (573, 5, N'100', N'设备急停', CAST(0x0000ADE90118029F AS DateTime), CAST(0x0000ADE90118029F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (574, 5, N'102', N'折弯机错误', CAST(0x0000ADE901180E5C AS DateTime), CAST(0x0000ADE901180E5C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (575, 5, N'100', N'设备急停', CAST(0x0000ADE901181A1C AS DateTime), CAST(0x0000ADE901181A1C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (576, 5, N'100', N'设备急停', CAST(0x0000ADE901196894 AS DateTime), CAST(0x0000ADE901196894 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (577, 5, N'102', N'折弯机错误', CAST(0x0000ADE90119744D AS DateTime), CAST(0x0000ADE90119744D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (578, 5, N'100', N'设备急停', CAST(0x0000ADE90119800C AS DateTime), CAST(0x0000ADE90119800C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (579, 2, N'1', N'急停', CAST(0x0000ADEA0095111B AS DateTime), CAST(0x0000ADEA0095111B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (580, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADEA0095111B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (581, 2, N'2', N'轴极限限位触发', CAST(0x0000ADEA0095111B AS DateTime), CAST(0x0000ADEA0095111B AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (582, 3, N'13', N'备用', CAST(0x0000ADEA00951126 AS DateTime), CAST(0x0000ADEA00951129 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (583, 5, N'100', N'设备急停', CAST(0x0000ADEA009653BC AS DateTime), CAST(0x0000ADEA009653BC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (584, 5, N'102', N'折弯机错误', CAST(0x0000ADEA00965F79 AS DateTime), CAST(0x0000ADEA00965F79 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (585, 5, N'100', N'设备急停', CAST(0x0000ADEA00966B34 AS DateTime), CAST(0x0000ADEA00966B34 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (586, 5, N'100', N'设备急停', CAST(0x0000ADEA0097B9A4 AS DateTime), CAST(0x0000ADEA0097B9A4 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (587, 5, N'102', N'折弯机错误', CAST(0x0000ADEA0097C564 AS DateTime), CAST(0x0000ADEA0097C564 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (588, 5, N'100', N'设备急停', CAST(0x0000ADEA0097D120 AS DateTime), CAST(0x0000ADEA0097D120 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (589, 5, N'100', N'设备急停', CAST(0x0000ADEA00991FAC AS DateTime), CAST(0x0000ADEA00991FAC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (590, 5, N'102', N'折弯机错误', CAST(0x0000ADEA00992B6D AS DateTime), CAST(0x0000ADEA00992B6D AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (591, 5, N'100', N'设备急停', CAST(0x0000ADEA00993724 AS DateTime), CAST(0x0000ADEA00993724 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (592, 5, N'100', N'设备急停', CAST(0x0000ADEA009A85B0 AS DateTime), CAST(0x0000ADEA009A85B0 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (593, 5, N'102', N'折弯机错误', CAST(0x0000ADEA009A9167 AS DateTime), CAST(0x0000ADEA009A9167 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (594, 5, N'100', N'设备急停', CAST(0x0000ADEA0108BD10 AS DateTime), CAST(0x0000ADEA0108BD10 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (595, 5, N'102', N'折弯机错误', CAST(0x0000ADEA0108C8CE AS DateTime), CAST(0x0000ADEA0108C8CE AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (596, 5, N'100', N'设备急停', CAST(0x0000ADEA0108D48F AS DateTime), CAST(0x0000ADEA0108D48F AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (597, 5, N'100', N'设备急停', CAST(0x0000ADEA010A2316 AS DateTime), CAST(0x0000ADEA010A2316 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (598, 5, N'102', N'折弯机错误', CAST(0x0000ADEA010A2ED3 AS DateTime), CAST(0x0000ADEA010A2ED3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (599, 5, N'100', N'设备急停', CAST(0x0000ADEA010A3A90 AS DateTime), CAST(0x0000ADEA010A3A90 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (600, 5, N'100', N'设备急停', CAST(0x0000ADEA010B891C AS DateTime), CAST(0x0000ADEA010B891C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (601, 5, N'102', N'折弯机错误', CAST(0x0000ADEA010B94D7 AS DateTime), CAST(0x0000ADEA010B94D7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (602, 5, N'100', N'设备急停', CAST(0x0000ADEA010BA093 AS DateTime), CAST(0x0000ADEA010BA093 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (603, 5, N'100', N'设备急停', CAST(0x0000ADEA010CEF22 AS DateTime), CAST(0x0000ADEA010CEF22 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (604, 5, N'102', N'折弯机错误', CAST(0x0000ADEA010CFAE2 AS DateTime), CAST(0x0000ADEA010CFAE2 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (605, 5, N'100', N'设备急停', CAST(0x0000ADEA010D069F AS DateTime), CAST(0x0000ADEA010D069F AS DateTime), NULL)
GO
print 'Processed 600 total records'
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (606, 2, N'1', N'急停', CAST(0x0000ADEA010D3218 AS DateTime), CAST(0x0000ADEA010D3218 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (607, 2, N'2', N'轴极限限位触发', CAST(0x0000ADEA010D3218 AS DateTime), CAST(0x0000ADEA010D3218 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (608, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADEA010D321C AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (609, 3, N'13', N'备用', CAST(0x0000ADEA010D3223 AS DateTime), CAST(0x0000ADEA010D3226 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (610, 5, N'100', N'设备急停', CAST(0x0000ADEA010E74C3 AS DateTime), CAST(0x0000ADEA010E74C3 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (611, 5, N'102', N'折弯机错误', CAST(0x0000ADEA010E8082 AS DateTime), CAST(0x0000ADEA010E8082 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (612, 5, N'100', N'设备急停', CAST(0x0000ADEA010E8C3E AS DateTime), CAST(0x0000ADEA010E8C3E AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (613, 5, N'100', N'设备急停', CAST(0x0000ADEA010FDAA6 AS DateTime), CAST(0x0000ADEA010FDAA6 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (614, 5, N'102', N'折弯机错误', CAST(0x0000ADEA010FE667 AS DateTime), CAST(0x0000ADEA010FE667 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (615, 5, N'100', N'设备急停', CAST(0x0000ADEA010FF220 AS DateTime), CAST(0x0000ADEA010FF220 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (616, 2, N'1', N'急停', CAST(0x0000ADEA0112FE67 AS DateTime), CAST(0x0000ADEA0112FE67 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (617, 4, N'0', N'查询实时状态失败', CAST(0x0000ADDA00A835B8 AS DateTime), CAST(0x0000ADEA0112FE67 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (618, 2, N'2', N'轴极限限位触发', CAST(0x0000ADEA0112FE67 AS DateTime), CAST(0x0000ADEA0112FE67 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (619, 3, N'13', N'备用', CAST(0x0000ADEA0112FE6F AS DateTime), CAST(0x0000ADEA0112FE71 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (620, 5, N'100', N'设备急停', CAST(0x0000ADEA011440F7 AS DateTime), CAST(0x0000ADEA011440F7 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (621, 5, N'102', N'折弯机错误', CAST(0x0000ADEA01144CB1 AS DateTime), CAST(0x0000ADEA01144CB1 AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (622, 5, N'100', N'设备急停', CAST(0x0000ADEA0114586A AS DateTime), CAST(0x0000ADEA0114586A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (623, 5, N'100', N'设备急停', CAST(0x0000ADEA0115A6DC AS DateTime), CAST(0x0000ADEA0115A6DC AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (624, 5, N'102', N'折弯机错误', CAST(0x0000ADEA0115B29A AS DateTime), CAST(0x0000ADEA0115B29A AS DateTime), NULL)
INSERT [dbo].[DevAlarm] ([ID], [DevID], [MessageID], [Message], [StartTime], [AddTime], [EndTime]) VALUES (625, 5, N'100', N'设备急停', CAST(0x0000ADEA0115BE55 AS DateTime), CAST(0x0000ADEA0115BE55 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[DevAlarm] OFF
/****** Object:  Table [dbo].[Department]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DataNumber] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[AddTime] [datetime] NULL,
	[Remark] [nvarchar](256) NULL,
	[Enabled] [int] NULL,
	[Parent] [bigint] NULL,
	[SortIndex] [int] NULL,
	[HeaderID] [bigint] NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (1, N'33', N'千瑞达', CAST(0x0000AD9700AAD08D AS DateTime), NULL, 0, 0, NULL, 2, NULL)
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (2, NULL, N'葛店1', CAST(0x0000AD9700AE784D AS DateTime), NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (3, NULL, N'葛店2', CAST(0x0000AD9700E338B6 AS DateTime), NULL, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (4, NULL, N'ss', CAST(0x0000AD97011652E2 AS DateTime), NULL, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (5, NULL, N'ssdd', CAST(0x0000AD97011676F7 AS DateTime), NULL, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (6, NULL, NULL, CAST(0x0000ADD500ECEBAE AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Department] ([ID], [DataNumber], [Name], [AddTime], [Remark], [Enabled], [Parent], [SortIndex], [HeaderID], [Phone]) VALUES (7, N'13', N'能', CAST(0x0000ADD500ED6106 AS DateTime), N'2342342344324', 1, 3, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[SimpleName] [nvarchar](20) NULL,
	[DataNumber] [varchar](20) NULL,
	[Type] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[ContactPhone] [varchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Remark] [nvarchar](max) NULL,
	[Enabled] [int] NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([ID], [Name], [SimpleName], [DataNumber], [Type], [Contact], [ContactPhone], [Address], [Remark], [Enabled], [OperID], [AddTime]) VALUES (8, N'测试', N'', N'', N'', N'', N'', N'', N'', 1, NULL, CAST(0x0000ADD300A6ED97 AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [SimpleName], [DataNumber], [Type], [Contact], [ContactPhone], [Address], [Remark], [Enabled], [OperID], [AddTime]) VALUES (9, N'测试测试', N'3', N'23', N'434', N'342', N'234', N'23423', N'234234', 1, NULL, CAST(0x0000ADD300A702A7 AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [SimpleName], [DataNumber], [Type], [Contact], [ContactPhone], [Address], [Remark], [Enabled], [OperID], [AddTime]) VALUES (10, N'通票', NULL, NULL, N'21', NULL, NULL, NULL, N'无可奈何花落去 ', 1, 1, CAST(0x0000ADD5010ECBE9 AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[Contract]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CustomerID] [bigint] NULL,
	[DataNumber] [varchar](50) NOT NULL,
	[Type] [varchar](50) NULL,
	[Status] [int] NULL,
	[Price] [varchar](50) NULL,
	[SigningDate] [datetime] NULL,
	[Enabled] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Contents] [nvarchar](max) NULL,
	[Attachment] [nvarchar](max) NULL,
	[OperID] [bigint] NULL,
	[AddTime] [datetime] NULL,
	[PlanStartTime] [datetime] NULL,
	[PlanEndTime] [datetime] NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON
INSERT [dbo].[Contract] ([ID], [Name], [CustomerID], [DataNumber], [Type], [Status], [Price], [SigningDate], [Enabled], [StartTime], [EndTime], [Contents], [Attachment], [OperID], [AddTime], [PlanStartTime], [PlanEndTime], [Remark]) VALUES (3, N'华工激光', 4, N'wweer', N'分类1', 2, N'', NULL, 1, NULL, NULL, N'', NULL, NULL, CAST(0x0000ADB100BE0796 AS DateTime), CAST(0x0000ADD40107AC00 AS DateTime), NULL, N'众')
INSERT [dbo].[Contract] ([ID], [Name], [CustomerID], [DataNumber], [Type], [Status], [Price], [SigningDate], [Enabled], [StartTime], [EndTime], [Contents], [Attachment], [OperID], [AddTime], [PlanStartTime], [PlanEndTime], [Remark]) VALUES (6, N'地', NULL, N'C202111010001', N'', 2, N'', NULL, 1, NULL, NULL, NULL, NULL, 1, CAST(0x0000ADD30106A706 AS DateTime), NULL, NULL, N'')
INSERT [dbo].[Contract] ([ID], [Name], [CustomerID], [DataNumber], [Type], [Status], [Price], [SigningDate], [Enabled], [StartTime], [EndTime], [Contents], [Attachment], [OperID], [AddTime], [PlanStartTime], [PlanEndTime], [Remark]) VALUES (7, N'有', 8, N'C202111010002', N'', 1, N'', NULL, 1, NULL, NULL, N'', NULL, 1, CAST(0x0000ADD30106BF71 AS DateTime), NULL, NULL, N'')
INSERT [dbo].[Contract] ([ID], [Name], [CustomerID], [DataNumber], [Type], [Status], [Price], [SigningDate], [Enabled], [StartTime], [EndTime], [Contents], [Attachment], [OperID], [AddTime], [PlanStartTime], [PlanEndTime], [Remark]) VALUES (8, N'7', 8, N'C202111010003', N'', 1, N'', CAST(0x0000ADF100000000 AS DateTime), 1, NULL, NULL, N'', NULL, 1, CAST(0x0000ADD3010A4FE7 AS DateTime), NULL, NULL, N'')
SET IDENTITY_INSERT [dbo].[Contract] OFF
/****** Object:  Table [dbo].[BendProd]    Script Date: 02/20/2023 15:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BendProd](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PartNo] [int] NULL,
	[Part] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
	[BendTime] [varchar](50) NULL,
 CONSTRAINT [PK_BendProd] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BendProd] ON
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (1, NULL, NULL, CAST(0x0000ADDB00DDF230 AS DateTime), CAST(0x0000ADDB00DF69D0 AS DateTime), CAST(0x0000ADDB00DF69D0 AS DateTime), NULL)
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (2, NULL, NULL, CAST(0x0000ADDB00DF69D2 AS DateTime), CAST(0x0000ADDB00E0A0D0 AS DateTime), CAST(0x0000ADDB00E0A0D0 AS DateTime), NULL)
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (3, NULL, NULL, CAST(0x0000ADDC00EEF43B AS DateTime), CAST(0x0000ADDC00F042C3 AS DateTime), CAST(0x0000ADDC00F048A0 AS DateTime), NULL)
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (4, NULL, NULL, CAST(0x0000ADDC00F83889 AS DateTime), CAST(0x0000ADDC00F98778 AS DateTime), CAST(0x0000ADDC00F98D49 AS DateTime), NULL)
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (5, NULL, NULL, CAST(0x0000ADDC00FC034B AS DateTime), CAST(0x0000ADDC00FD51DB AS DateTime), CAST(0x0000ADDC00FD57BC AS DateTime), NULL)
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (6, NULL, NULL, CAST(0x0000ADDC0106BB38 AS DateTime), CAST(0x0000ADDC010809BD AS DateTime), CAST(0x0000ADDC01080F9C AS DateTime), N'00:04:45.4582153')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (7, NULL, NULL, CAST(0x0000ADE900F7349F AS DateTime), CAST(0x0000ADE900F88324 AS DateTime), CAST(0x0000ADE900F88902 AS DateTime), N'00:04:45.4566087')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (8, NULL, NULL, CAST(0x0000ADE900F88905 AS DateTime), CAST(0x0000ADE900F9E928 AS DateTime), CAST(0x0000ADE900F9EF05 AS DateTime), N'00:05:00.4883013')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (9, NULL, NULL, CAST(0x0000ADE900F9EF07 AS DateTime), CAST(0x0000ADE900FB4F2C AS DateTime), CAST(0x0000ADE900FB550F AS DateTime), N'00:05:00.4959899')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (10, NULL, NULL, CAST(0x0000ADE900FB5511 AS DateTime), CAST(0x0000ADE900FCB522 AS DateTime), CAST(0x0000ADE900FCBB03 AS DateTime), N'00:05:00.4308689')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (11, NULL, NULL, CAST(0x0000ADE900FCBB06 AS DateTime), CAST(0x0000ADE900FE1B22 AS DateTime), CAST(0x0000ADE900FE2103 AS DateTime), N'00:05:00.4676078')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (12, NULL, NULL, CAST(0x0000ADE900FE2105 AS DateTime), CAST(0x0000ADE900FF8124 AS DateTime), CAST(0x0000ADE900FF86FF AS DateTime), N'00:05:00.4753735')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (13, NULL, NULL, CAST(0x0000ADE900FF8701 AS DateTime), CAST(0x0000ADE90100E71F AS DateTime), CAST(0x0000ADE90100ECFC AS DateTime), N'00:05:00.4723032')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (14, NULL, NULL, CAST(0x0000ADE90100ECFF AS DateTime), CAST(0x0000ADE901024D15 AS DateTime), CAST(0x0000ADE9010252F2 AS DateTime), N'00:05:00.4480931')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (15, NULL, NULL, CAST(0x0000ADE9010252F4 AS DateTime), CAST(0x0000ADE90103B306 AS DateTime), CAST(0x0000ADE90103B8E7 AS DateTime), N'00:05:00.4327983')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (16, NULL, NULL, CAST(0x0000ADE90103B8EA AS DateTime), CAST(0x0000ADE901051911 AS DateTime), CAST(0x0000ADE901051EED AS DateTime), N'00:05:00.5027525')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (17, NULL, NULL, CAST(0x0000ADE901051EEF AS DateTime), CAST(0x0000ADE901067F0E AS DateTime), CAST(0x0000ADE9010684EB AS DateTime), N'00:05:00.4751087')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (18, NULL, NULL, CAST(0x0000ADE9010684EE AS DateTime), CAST(0x0000ADE90107E4FC AS DateTime), CAST(0x0000ADE90107EADA AS DateTime), N'00:05:00.4203503')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (19, NULL, NULL, CAST(0x0000ADE90107EADC AS DateTime), CAST(0x0000ADE901094AF8 AS DateTime), CAST(0x0000ADE9010950D7 AS DateTime), N'00:05:00.4687171')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (20, NULL, NULL, CAST(0x0000ADE9010950D9 AS DateTime), CAST(0x0000ADE9010AB101 AS DateTime), CAST(0x0000ADE9010AB6E0 AS DateTime), N'00:05:00.5043529')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (21, NULL, NULL, CAST(0x0000ADE9010AB6E2 AS DateTime), CAST(0x0000ADE9010C1703 AS DateTime), CAST(0x0000ADE9010C1CE4 AS DateTime), N'00:05:00.4830208')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (22, NULL, NULL, CAST(0x0000ADE9010C1CE7 AS DateTime), CAST(0x0000ADE9010D7D13 AS DateTime), CAST(0x0000ADE9010D82EF AS DateTime), N'00:05:00.5214234')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (23, NULL, NULL, CAST(0x0000ADE9010D82F2 AS DateTime), CAST(0x0000ADE9010EE309 AS DateTime), CAST(0x0000ADE9010EE8E6 AS DateTime), N'00:05:00.4503427')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (24, NULL, NULL, CAST(0x0000ADE9010EE8E8 AS DateTime), CAST(0x0000ADE901104920 AS DateTime), CAST(0x0000ADE901104EFF AS DateTime), N'00:05:00.5586918')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (25, NULL, NULL, CAST(0x0000ADE901104F01 AS DateTime), CAST(0x0000ADE90111AF27 AS DateTime), CAST(0x0000ADE90111B507 AS DateTime), N'00:05:00.4999857')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (26, NULL, NULL, CAST(0x0000ADE90111B509 AS DateTime), CAST(0x0000ADE901131540 AS DateTime), CAST(0x0000ADE901131B1E AS DateTime), N'00:05:00.5591701')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (27, NULL, NULL, CAST(0x0000ADE901131B20 AS DateTime), CAST(0x0000ADE901147B3D AS DateTime), CAST(0x0000ADE90114811C AS DateTime), N'00:05:00.4699114')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (28, NULL, NULL, CAST(0x0000ADE90116CBA0 AS DateTime), CAST(0x0000ADE901181A1C AS DateTime), CAST(0x0000ADE901181FFB AS DateTime), N'00:04:45.4268621')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (29, NULL, NULL, CAST(0x0000ADE901181FFF AS DateTime), CAST(0x0000ADE90119800C AS DateTime), CAST(0x0000ADE9011985EA AS DateTime), N'00:05:00.4174256')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (30, NULL, NULL, CAST(0x0000ADEA00951CBB AS DateTime), CAST(0x0000ADEA00966B34 AS DateTime), CAST(0x0000ADEA00967110 AS DateTime), N'00:04:45.4152068')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (31, NULL, NULL, CAST(0x0000ADEA00967113 AS DateTime), CAST(0x0000ADEA0097D120 AS DateTime), CAST(0x0000ADEA0097D6FE AS DateTime), N'00:05:00.4169359')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (32, NULL, NULL, CAST(0x0000ADEA0097D6FF AS DateTime), CAST(0x0000ADEA00993724 AS DateTime), CAST(0x0000ADEA00993D07 AS DateTime), N'00:05:00.4946182')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (33, NULL, NULL, CAST(0x0000ADEA00993D09 AS DateTime), CAST(0x0000ADEA009A85B0 AS DateTime), CAST(0x0000ADEA01077A53 AS DateTime), N'00:04:40.4501946')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (34, NULL, NULL, CAST(0x0000ADEA01077A56 AS DateTime), CAST(0x0000ADEA0108D48F AS DateTime), CAST(0x0000ADEA0108DA6B AS DateTime), N'00:04:55.4441876')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (35, NULL, NULL, CAST(0x0000ADEA0108DA6D AS DateTime), CAST(0x0000ADEA010A3A90 AS DateTime), CAST(0x0000ADEA010A406E AS DateTime), N'00:05:00.4911616')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (36, NULL, NULL, CAST(0x0000ADEA010A4070 AS DateTime), CAST(0x0000ADEA010BA093 AS DateTime), CAST(0x0000ADEA010BA672 AS DateTime), N'00:05:00.4884309')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (37, NULL, NULL, CAST(0x0000ADEA010BA675 AS DateTime), CAST(0x0000ADEA010D069F AS DateTime), CAST(0x0000ADEA010D0C7B AS DateTime), N'00:05:00.5145604')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (38, NULL, NULL, CAST(0x0000ADEA010D3DB2 AS DateTime), CAST(0x0000ADEA010E8C3E AS DateTime), CAST(0x0000ADEA010E921A AS DateTime), N'00:04:45.4798138')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (39, NULL, NULL, CAST(0x0000ADEA010E921D AS DateTime), CAST(0x0000ADEA010FF220 AS DateTime), CAST(0x0000ADEA010FF7FD AS DateTime), N'00:05:00.3846784')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (40, NULL, NULL, CAST(0x0000ADEA01130A02 AS DateTime), CAST(0x0000ADEA0114586A AS DateTime), CAST(0x0000ADEA01145E4E AS DateTime), N'00:04:45.3599961')
INSERT [dbo].[BendProd] ([ID], [PartNo], [Part], [StartTime], [EndTime], [AddTime], [BendTime]) VALUES (41, NULL, NULL, CAST(0x0000ADEA01145E51 AS DateTime), CAST(0x0000ADEA0115BE55 AS DateTime), CAST(0x0000ADEA0115C435 AS DateTime), N'00:05:00.3876481')
SET IDENTITY_INSERT [dbo].[BendProd] OFF
/****** Object:  Default [DF_UserInfo_CreateTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_UserInfo_UpdateTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
/****** Object:  Default [DF_Supplier_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_SortProc_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[SortProd] ADD  CONSTRAINT [DF_SortProc_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Permission_CreateTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[RolePurview] ADD  CONSTRAINT [DF_Permission_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_RoleOrg_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[RoleOrg] ADD  CONSTRAINT [DF_RoleOrg_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_RoleInfo_CreateTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[RoleInfo] ADD  CONSTRAINT [DF_RoleInfo_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_RawStock_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[RawStock] ADD  CONSTRAINT [DF_RawStock_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Production_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Order_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Notice_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Notice] ADD  CONSTRAINT [DF_Notice_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Maintenance_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Maintenance] ADD  CONSTRAINT [DF_Maintenance_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_LogOper_Type]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_LogOper_Type]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF_LogInfo_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_LogInfo_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_LaserProd_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[LaserProd] ADD  CONSTRAINT [DF_LaserProd_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_FileItem_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[FileItem] ADD  CONSTRAINT [DF_FileItem_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_DataDic_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Dictionary] ADD  CONSTRAINT [DF_DataDic_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_DeviceInfo_CreateTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Device] ADD  CONSTRAINT [DF_DeviceInfo_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Organization_CreateTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Organization_CreateTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Customer_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Contract_AddTime]    Script Date: 02/20/2023 15:54:17 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
