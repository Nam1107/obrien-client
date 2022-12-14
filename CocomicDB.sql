USE [master]
GO
/****** Object:  Database [Webtoon]    Script Date: 8/26/2022 8:26:49 AM ******/
CREATE DATABASE [Webtoon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Webtoon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Webtoon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Webtoon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Webtoon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Webtoon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webtoon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webtoon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webtoon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webtoon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webtoon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webtoon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webtoon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Webtoon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webtoon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webtoon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webtoon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webtoon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webtoon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webtoon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webtoon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webtoon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Webtoon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webtoon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webtoon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webtoon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webtoon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webtoon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webtoon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webtoon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Webtoon] SET  MULTI_USER 
GO
ALTER DATABASE [Webtoon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webtoon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webtoon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webtoon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webtoon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Webtoon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Webtoon] SET QUERY_STORE = OFF
GO
USE [Webtoon]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterNum] [float] NULL,
	[ChapterID] [int] IDENTITY(1000,1) NOT NULL,
	[ComicID] [int] NULL,
	[ChapterName] [varchar](150) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter_Page]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter_Page](
	[PageID] [int] IDENTITY(1000,1) NOT NULL,
	[ComicID] [int] NULL,
	[ChapterID] [int] NULL,
	[Page] [int] NULL,
	[PageImgURL] [nvarchar](1250) NULL,
 CONSTRAINT [PK_Chapter_Page] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comic]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comic](
	[ComicID] [int] IDENTITY(1000,1) NOT NULL,
	[ComicName] [nvarchar](250) NULL,
	[Tags] [nvarchar](250) NULL,
	[AnotherName] [nvarchar](500) NULL,
	[ComicDescription] [nvarchar](1250) NULL,
	[LikeNo] [int] NULL,
	[ViewNo] [int] NULL,
	[FollowNo] [int] NULL,
	[CommentNo] [int] NULL,
	[Author] [nvarchar](250) NULL,
	[Status] [nvarchar](250) NULL,
	[LastUpdate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ComicImage] [nvarchar](1250) NULL,
	[ComicThumb] [nvarchar](1250) NULL,
	[IsPublic] [bit] NULL,
 CONSTRAINT [PK_Comic] PRIMARY KEY CLUSTERED 
(
	[ComicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NULL,
	[ComicID] [int] NULL,
	[Comment] [nvarchar](250) NULL,
	[CommentDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow_Comic]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow_Comic](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NULL,
	[ComicID] [int] NULL,
	[FollowDate] [datetime] NULL,
 CONSTRAINT [PK_Follow_Comic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like_Comic]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like_Comic](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NULL,
	[ComicID] [int] NULL,
	[LikeDate] [datetime] NULL,
 CONSTRAINT [PK_Like_Comic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_Token]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Token](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NULL,
	[Token] [nvarchar](150) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](50) NULL,
	[image] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagsName] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/26/2022 8:26:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1000,1) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[Avatar] [nvarchar](1250) NULL,
	[Password] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[CreateDate] [datetime] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (1, 2111, 1042, N'Chapter 1', CAST(N'2022-07-29T10:44:59.000' AS DateTime), CAST(N'2022-08-14T00:23:13.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (1, 2112, 1043, N'Chapter 1', CAST(N'2022-07-29T17:42:51.000' AS DateTime), CAST(N'2022-07-31T15:22:39.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (2, 2116, 1043, N'Chapter 2', CAST(N'2022-07-31T15:28:05.000' AS DateTime), CAST(N'2022-07-31T15:28:05.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (1, 2138, 1044, N'Chapter 1', CAST(N'2022-07-31T16:53:27.000' AS DateTime), CAST(N'2022-07-31T16:53:27.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (2, 2139, 1044, N'Chapter 2', CAST(N'2022-07-31T16:53:32.000' AS DateTime), CAST(N'2022-07-31T16:53:32.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (3, 2140, 1044, N'Chapter 3', CAST(N'2022-07-31T16:53:35.000' AS DateTime), CAST(N'2022-07-31T16:53:35.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (4, 2141, 1044, N'Chapter 4', CAST(N'2022-07-31T16:53:43.000' AS DateTime), CAST(N'2022-07-31T16:53:43.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (5, 2142, 1044, N'Chapter 5', CAST(N'2022-07-31T16:53:47.000' AS DateTime), CAST(N'2022-07-31T16:53:47.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (6, 2143, 1044, N'Chapter 6', CAST(N'2022-07-31T16:53:50.000' AS DateTime), CAST(N'2022-07-31T16:53:50.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (7, 2144, 1044, N'Chapter 7', CAST(N'2022-07-31T16:53:54.000' AS DateTime), CAST(N'2022-07-31T16:53:54.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (8, 2145, 1044, N'Chapter 8', CAST(N'2022-07-31T16:53:59.000' AS DateTime), CAST(N'2022-07-31T16:53:59.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (9, 2146, 1044, N'Chapter 9', CAST(N'2022-07-31T16:54:02.000' AS DateTime), CAST(N'2022-07-31T16:54:02.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (10, 2147, 1044, N'Chapter 10', CAST(N'2022-07-31T16:54:06.000' AS DateTime), CAST(N'2022-07-31T16:54:06.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (11, 2148, 1044, N'Chapter 11', CAST(N'2022-07-31T16:54:15.000' AS DateTime), CAST(N'2022-07-31T16:54:15.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (12, 2149, 1044, N'Chapter 12', CAST(N'2022-07-31T16:54:31.000' AS DateTime), CAST(N'2022-07-31T16:54:31.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (13, 2150, 1044, N'Chapter 13', CAST(N'2022-07-31T16:54:36.000' AS DateTime), CAST(N'2022-07-31T16:54:36.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (14, 2151, 1044, N'Chapter 14', CAST(N'2022-07-31T16:54:40.000' AS DateTime), CAST(N'2022-07-31T16:54:40.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (2, 2154, 1042, N'Chapter 2', CAST(N'2022-08-09T17:28:28.000' AS DateTime), CAST(N'2022-08-24T11:26:21.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (3, 2156, 1042, N'Chapter 3', CAST(N'2022-08-11T22:48:42.000' AS DateTime), CAST(N'2022-08-24T16:59:00.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (4, 2157, 1042, N'Chapter 4', CAST(N'2022-08-11T23:02:47.000' AS DateTime), CAST(N'2022-08-24T17:02:12.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (5, 2158, 1042, N'Chapter 5', CAST(N'2022-08-13T13:51:14.000' AS DateTime), CAST(N'2022-08-24T17:24:17.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (3, 2159, 1043, N'Chapter 3', CAST(N'2022-08-13T14:36:36.000' AS DateTime), CAST(N'2022-08-13T14:36:36.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (4, 2160, 1043, N'Chapter 4', CAST(N'2022-08-13T14:38:45.000' AS DateTime), CAST(N'2022-08-13T14:38:45.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (5, 2161, 1043, N'Chapter 5', CAST(N'2022-08-13T14:44:07.000' AS DateTime), CAST(N'2022-08-13T14:44:07.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (6, 2162, 1043, N'Chapter 6', CAST(N'2022-08-13T14:47:49.000' AS DateTime), CAST(N'2022-08-13T14:47:49.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (6, 2165, 1042, N'Chapter 6', CAST(N'2022-08-13T16:47:08.000' AS DateTime), CAST(N'2022-08-24T17:44:06.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (7, 2166, 1042, N'Chapter 7', CAST(N'2022-08-13T16:47:12.000' AS DateTime), CAST(N'2022-08-24T17:46:35.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (8, 2167, 1042, N'Chapter 8', CAST(N'2022-08-13T16:47:16.000' AS DateTime), CAST(N'2022-08-25T18:33:11.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (9, 2168, 1042, N'Chapter 9', CAST(N'2022-08-13T16:47:21.000' AS DateTime), CAST(N'2022-08-25T00:21:08.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (10, 2169, 1042, N'Chapter 10', CAST(N'2022-08-13T16:47:28.000' AS DateTime), CAST(N'2022-08-25T00:21:22.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (11, 2170, 1042, N'Chapter 11', CAST(N'2022-08-13T16:47:36.000' AS DateTime), CAST(N'2022-08-25T00:21:27.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (12, 2171, 1042, N'Chapter 12', CAST(N'2022-08-13T16:47:41.000' AS DateTime), CAST(N'2022-08-25T00:21:32.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (13, 2175, 1042, N'Chapter 13', CAST(N'2022-08-13T21:19:23.000' AS DateTime), CAST(N'2022-08-25T00:21:37.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (1, 2176, 1138, N'Chapter 1', CAST(N'2022-08-13T22:08:07.000' AS DateTime), CAST(N'2022-08-13T22:08:07.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (14, 2177, 1042, N'Chapter 14', CAST(N'2022-08-14T15:04:36.000' AS DateTime), CAST(N'2022-08-25T00:21:44.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (1, 2189, 1046, N'Chapter 1', CAST(N'2022-08-15T00:59:20.000' AS DateTime), CAST(N'2022-08-15T02:31:24.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (2, 2190, 1046, N'Chapter 2', CAST(N'2022-08-15T01:01:29.000' AS DateTime), CAST(N'2022-08-15T01:01:29.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (3, 2191, 1046, N'Chapter 3', CAST(N'2022-08-15T01:01:58.000' AS DateTime), CAST(N'2022-08-15T01:01:58.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (4, 2192, 1046, N'Chapter 4', CAST(N'2022-08-15T01:02:15.000' AS DateTime), CAST(N'2022-08-15T01:02:15.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (5, 2193, 1046, N'Chapter 5', CAST(N'2022-08-15T01:02:29.000' AS DateTime), CAST(N'2022-08-15T01:02:29.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (6, 2194, 1046, N'Chapter 6', CAST(N'2022-08-15T01:02:43.000' AS DateTime), CAST(N'2022-08-15T01:02:43.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (7, 2196, 1046, N'Chapter 7', CAST(N'2022-08-15T02:18:43.000' AS DateTime), CAST(N'2022-08-15T02:18:43.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (8, 2197, 1046, N'Chapter 8', CAST(N'2022-08-15T02:19:29.000' AS DateTime), CAST(N'2022-08-15T02:19:29.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (9, 2198, 1046, N'Chapter 9', CAST(N'2022-08-15T02:19:47.000' AS DateTime), CAST(N'2022-08-15T02:19:47.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (10, 2199, 1046, N'Chapter 10', CAST(N'2022-08-15T02:21:49.000' AS DateTime), CAST(N'2022-08-15T10:54:41.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (11, 2200, 1046, N'Chapter 11', CAST(N'2022-08-15T02:22:32.000' AS DateTime), CAST(N'2022-08-15T02:30:52.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (12, 2201, 1046, N'Chapter 12', CAST(N'2022-08-15T10:54:18.000' AS DateTime), CAST(N'2022-08-18T11:43:14.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (15, 2203, 1042, N'Chapter 15', CAST(N'2022-08-23T21:07:26.000' AS DateTime), CAST(N'2022-08-25T00:21:52.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (16, 2204, 1042, N'Chapter 16', CAST(N'2022-08-23T23:45:59.000' AS DateTime), CAST(N'2022-08-25T00:21:00.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (17, 2205, 1042, N'Chapter 17', CAST(N'2022-08-23T23:46:31.000' AS DateTime), CAST(N'2022-08-23T23:56:31.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (18, 2206, 1042, N'Chapter 18', CAST(N'2022-08-24T14:47:46.000' AS DateTime), CAST(N'2022-08-24T16:05:44.000' AS DateTime))
INSERT [dbo].[Chapter] ([ChapterNum], [ChapterID], [ComicID], [ChapterName], [CreateDate], [LastUpdate]) VALUES (19, 2208, 1042, N'Chapter 19', CAST(N'2022-08-24T14:57:26.000' AS DateTime), CAST(N'2022-08-24T16:51:48.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter_Page] ON 

INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1098, 1042, 2111, 1, N'https://s200.imacdn.com/tt24/2020/03/10/39ff7d0e1f5ca0ef_33161e447f3b3ac5_267085158385506321.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1099, 1042, 2111, 3, N'https://s200.imacdn.com/tt24/2020/03/10/06016b23f2db0df9_0b70b358c85eb7bb_282387158385506711.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1100, 1042, 2111, 2, N'https://s200.imacdn.com/tt24/2020/03/10/df46027e7d8d2db5_b9551f012029d0c0_490427158385507051.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1101, 1042, 2111, 4, N'https://s200.imacdn.com/tt24/2020/03/10/10b557a42ba33f24_35252119063ea924_288037158385507241.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1102, 1042, 2111, 5, N'https://s200.imacdn.com/tt24/2020/03/10/62875c7b463ac01c_30296c7dbb682894_303512158385507651.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1103, 1042, 2111, 6, N'https://s200.imacdn.com/tt24/2020/03/10/0327e9dd7fabb717_a3fc0c509a5b2fa2_363769158385508351.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1104, 1042, 2111, 7, N'https://s200.imacdn.com/tt24/2020/03/10/3d7507ddf0d3208d_64f5ec3a2685ad30_308993158385508671.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1105, 1042, 2111, 8, N'https://s200.imacdn.com/tt24/2020/03/10/95b13b3e58e8d542_d6d065be28430600_276242158385508951.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1106, 1042, 2111, 9, N'https://s200.imacdn.com/tt24/2020/03/10/80d21bb10ebf8ef6_0735d162cb6157a2_293056158385509131.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1107, 1042, 2111, 10, N'https://s200.imacdn.com/tt24/2020/03/10/450fb213318bd56e_b49c08037d4b0040_323026158385509561.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1108, 1042, 2111, 11, N'https://s200.imacdn.com/tt24/2020/03/10/6b15ac14d9df5b9d_4023f3abc10c413a_351733158385509781.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1109, 1042, 2111, 12, N'https://s200.imacdn.com/tt24/2020/03/10/0c8803e3b4cec983_bef6d023e2f3b74f_268750158385510071.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1110, 1042, 2111, 13, N'https://s200.imacdn.com/tt24/2020/03/10/437d795755066384_a6ed9e3498ec84cd_366381158385510481.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1111, 1042, 2111, 14, N'https://s200.imacdn.com/tt24/2020/03/10/8cd4b0f1bd7dd798_91fbf2278fd9099b_334856158385510841.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1112, 1042, 2111, 15, N'https://s200.imacdn.com/tt24/2020/03/10/8309b36a6583d1a5_aa590c2b5f5a5d13_311889158385511221.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1113, 1042, 2111, 16, N'https://s200.imacdn.com/tt24/2020/03/10/5cdc42176d669585_73dfb944556ef2f9_305313158385511541.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1114, 1042, 2111, 17, N'https://s200.imacdn.com/tt24/2020/03/10/d7a56e6db5ed7580_912af56e244a174d_331741158385511851.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1115, 1042, 2111, 18, N'https://s200.imacdn.com/tt24/2020/03/10/0371e9761a98f35d_deabe2e2de19a046_338842158385512081.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1116, 1042, 2111, 19, N'https://s200.imacdn.com/tt24/2020/03/10/ccba20b20c97ca85_5736618e81f74e0e_323859158385513341.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1117, 1042, 2111, 20, N'https://s200.imacdn.com/tt24/2020/03/10/db74a384f4b97a7e_fa343c7ca2f0af10_374059158385515671.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1118, 1042, 2111, 21, N'https://s200.imacdn.com/tt24/2020/03/10/3ccac0c8df0353da_f4ff27be0da5766b_296369158385517011.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1119, 1042, 2111, 22, N'https://s200.imacdn.com/tt24/2020/03/10/321ca65249c404ef_ca55c88b0545b006_286568158385517481.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1120, 1042, 2111, 23, N'https://s200.imacdn.com/tt24/2020/03/10/8d658b1645b28170_bf03c0b69db44aa5_273299158385517781.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1121, 1042, 2111, 24, N'https://s200.imacdn.com/tt24/2020/03/10/a233c44797c6e1f5_250f54a200364a70_288334158385518081.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1122, 1042, 2111, 25, N'https://s200.imacdn.com/tt24/2020/03/10/0f9f805123bb3282_51f7b9ef56493125_344964158385518641.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1123, 1042, 2111, 26, N'https://s200.imacdn.com/tt24/2020/03/10/1a30fe37a9766fe7_005b6af7756f809b_349346158385519031.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1124, 1042, 2111, 27, N'https://s200.imacdn.com/tt24/2020/03/10/25c782da3d640ca3_7966c93f30062b7b_312733158385519321.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1125, 1042, 2111, 28, N'https://s200.imacdn.com/tt24/2020/03/10/774ef4eedc5339dd_be6eb2f05d50f22b_278091158385519541.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1126, 1042, 2111, 29, N'https://s200.imacdn.com/tt24/2020/03/10/65634e1fb7d80a8b_faa9a2f5fb0c172b_232479158385519811.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1127, 1043, 2112, 1, N'https://s200.imacdn.com/tt24/2020/03/11/8f5f5eeb6c46b745_8c7881e0ed46374a_67994158389149881.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1131, 1043, 2112, 2, N'https://s200.imacdn.com/tt24/2020/03/11/8b83614296b7fe8a_6d1dd66b7a043269_206300158389150261.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1132, 1043, 2112, 3, N'https://s200.imacdn.com/tt24/2020/03/11/026ca3b02375fc97_04555242ef388337_735924158389150711.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1133, 1043, 2112, 4, N'https://s200.imacdn.com/tt24/2020/03/11/198ce7b1dbc35ba6_f9c37f9d1dfa239e_335383158389151021.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1134, 1043, 2112, 5, N'https://s200.imacdn.com/tt24/2020/03/11/9350d1ae90c97261_e4fc8624d4380209_308016158389151481.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1135, 1043, 2112, 6, N'https://s200.imacdn.com/tt24/2020/03/11/51ee90d538b2ea7f_564a09a6bb8b83c6_357299158389151931.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1136, 1043, 2112, 7, N'https://s200.imacdn.com/tt24/2020/03/11/dda61e439adaab23_14850028541616c6_223953158389152231.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1137, 1043, 2112, 8, N'https://s200.imacdn.com/tt24/2020/03/11/0f89fa4281219c5d_6b92a16a00d95fb2_146271158389152521.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1138, 1043, 2112, 9, N'https://s200.imacdn.com/tt24/2020/03/11/8190b9b6097425fe_f06aed2081811bc3_302176158389152811.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1139, 1043, 2112, 10, N'https://s200.imacdn.com/tt24/2020/03/11/13cb8f1bc5912029_ec7c244cbfa75e47_250044158389153181.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1140, 1043, 2112, 11, N'https://s200.imacdn.com/tt24/2020/03/11/f3c6a773ff12cb0d_3416746e825697f4_300183158389153541.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1141, 1043, 2112, 12, N'https://s200.imacdn.com/tt24/2020/03/11/f3c6a773ff12cb0d_3416746e825697f4_300183158389153541.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1142, 1043, 2112, 13, N'https://s200.imacdn.com/tt24/2020/03/11/b2509c16ac9ae0ca_013622ae7b87bfbc_252860158389154341.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1143, 1043, 2112, 14, N'https://s200.imacdn.com/tt24/2020/03/11/d0ca29a9e47cc931_dc85f77ca51d6f9c_171862158389154611.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1144, 1043, 2112, 15, N'https://s200.imacdn.com/tt24/2020/03/11/532c6ba7179c3182_2e34bd0f5787930e_466138158389155051.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1145, 1043, 2112, 16, N'https://s200.imacdn.com/tt24/2020/03/11/a5349dd95ff1c394_8bdfe6a7050ea37d_289915158389155311.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1146, 1043, 2112, 17, N'https://s200.imacdn.com/tt24/2020/03/11/663b6ea75281ed0f_383d4db8d38b47ca_313341158389155711.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1147, 1043, 2112, 18, N'https://s200.imacdn.com/tt24/2020/03/11/9c138a1f23661734_5a054df708d283ff_682834158389156061.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1148, 1043, 2112, 19, N'https://s200.imacdn.com/tt24/2020/03/11/41a80e7a0d21c9b1_332070d9c058e15c_598913158389156851.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1149, 1043, 2112, 20, N'https://s200.imacdn.com/tt24/2020/03/11/a9664b539ef5aac9_c2ee13fcbc0f3cc2_304609158389157271.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1150, 1043, 2116, 1, N'https://s200.imacdn.com/tt24/2020/03/11/815d0ef365a860bb_1041a43952d8fed3_175734158389159151.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1151, 1043, 2116, 2, N'https://s200.imacdn.com/tt24/2020/03/11/4aec521729c17230_ad7ac2ab7d92fb13_150243158389159481.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1152, 1043, 2116, 3, N'https://s200.imacdn.com/tt24/2020/03/11/28fb998fa46a8111_a3a4f838bbf5bb42_271886158389159711.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1153, 1043, 2116, 4, N'https://s200.imacdn.com/tt24/2020/03/11/8e094ddf8dbc0175_9cc465d10297739c_254501158389159931.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1154, 1043, 2116, 5, N'https://s200.imacdn.com/tt24/2020/03/11/40ebdda66c1fd21c_ae06a9233a0b30e4_265846158389160211.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1155, 1043, 2116, 6, N'https://s200.imacdn.com/tt24/2020/03/11/e087b6d9b0c2a14b_faee4c39ab9cd342_289695158389160431.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1156, 1043, 2116, 7, N'https://s200.imacdn.com/tt24/2020/03/11/e75f60dc1bc12123_c004bbd608ae3eb8_270850158389160711.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1157, 1043, 2116, 8, N'https://s200.imacdn.com/tt24/2020/03/11/e230a42af203848f_feb4b4fadc53374f_261295158389161141.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1158, 1043, 2116, 9, N'https://s200.imacdn.com/tt24/2020/03/11/d28cb4a2ffeecfaf_a17ef078ddb8f329_478507158389161411.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1159, 1043, 2116, 10, N'https://s200.imacdn.com/tt24/2020/03/11/c6d8013808391a66_8290c11c716270a5_336107158389161851.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1160, 1043, 2116, 11, N'https://s200.imacdn.com/tt24/2020/03/11/6d0223ace5d3885f_8029a365731e40a9_383631158389162161.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1161, 1043, 2116, 12, N'https://s200.imacdn.com/tt24/2020/03/11/2b4a1d835c41f6b1_dc76ea4ba42769b3_231806158389162481.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1162, 1043, 2116, 13, N'https://s200.imacdn.com/tt24/2020/03/11/b3c68e8139fef3c5_77b92411c054664c_398853158389162881.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1163, 1043, 2116, 14, N'https://s200.imacdn.com/tt24/2020/03/11/4acb0844787b0522_1d4670bf284e5a49_386981158389163121.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1164, 1043, 2116, 15, N'https://s200.imacdn.com/tt24/2020/03/11/2fa7fca041f98167_48a4a501335016bc_415039158389163521.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1187, 1044, 2138, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1188, 1044, 2139, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1189, 1044, 2140, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1190, 1044, 2141, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1191, 1044, 2142, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1192, 1044, 2143, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1193, 1044, 2144, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1194, 1044, 2145, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1195, 1044, 2146, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1196, 1044, 2147, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1197, 1044, 2148, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1198, 1044, 2149, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1199, 1044, 2150, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1200, 1044, 2151, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1203, 1042, 2154, 1, N'https://s200.imacdn.com/tt24/2020/03/10/20e53caa29587bba_f2caccc153a065ac_257387158385526931.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1214, 1042, 2154, 2, N'https://s200.imacdn.com/tt24/2020/03/10/efae4fe4819a2268_ca4c7945df2cbdb0_309309158385527211.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1215, 1042, 2154, 3, N'https://s200.imacdn.com/tt24/2020/03/10/4094fac88fb9aa89_081839f80add6c54_198873158385527421.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1216, 1042, 2154, 4, N'https://s200.imacdn.com/tt24/2020/03/10/af5d360f026ed306_724da57e486ce7a1_239886158385527691.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1217, 1042, 2154, 5, N'https://s200.imacdn.com/tt24/2020/03/10/774bbff5a80477f7_a0f2f74392a3fea8_244337158385527841.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1218, 1042, 2154, 6, N'https://s200.imacdn.com/tt24/2020/03/10/4dae9ec74de3c86d_80ede1c3edb532f5_318723158385528031.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1219, 1042, 2154, 7, N'https://s200.imacdn.com/tt24/2020/03/10/08829c1a65fa7063_fc2ff9a488e508da_288065158385528351.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1220, 1042, 2154, 8, N'https://s200.imacdn.com/tt24/2020/03/10/7f4507793452e840_7bb016e5a5300dc5_238223158385528561.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1221, 1042, 2154, 9, N'https://s200.imacdn.com/tt24/2020/03/10/6ba175f67c84c0a4_03ff6ba3f5a3c2e0_353257158385528711.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1222, 1042, 2154, 10, N'https://s200.imacdn.com/tt24/2020/03/10/50cc12219ce744c9_79be0e13c411c8e2_314980158385528921.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1223, 1042, 2154, 11, N'https://s200.imacdn.com/tt24/2020/03/10/9911203b94358ce2_64991839e8b66c50_288465158385529231.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1224, 1042, 2154, 12, N'https://s200.imacdn.com/tt24/2020/03/10/c9d5486955bc3081_59dc43cfe7c55b43_255919158385529581.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1225, 1042, 2154, 13, N'https://s200.imacdn.com/tt24/2020/03/10/f8578175ac81779c_41081b01edec23a6_306511158385529861.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1226, 1042, 2154, 14, N'https://s200.imacdn.com/tt24/2020/03/10/d7bd16ddea0e7541_911f10df56807c51_230359158385530011.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1227, 1042, 2154, 15, N'https://s200.imacdn.com/tt24/2020/03/10/d9510d1bbbf236e4_0508d8ddf2d97f4b_304109158385530271.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1228, 1042, 2154, 16, N'https://s200.imacdn.com/tt24/2020/03/10/f7e582558be0997a_a6d47af18cef41dd_241737158385530441.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1229, 1042, 2154, 17, N'https://s200.imacdn.com/tt24/2020/03/10/ce83f61d18559418_38ab741cd622b702_316626158385530871.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1230, 1042, 2154, 18, N'https://s200.imacdn.com/tt24/2020/03/10/8e369015e2f84362_34c9ea8cd1e82f8d_350053158385531041.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1231, 1042, 2154, 19, N'https://s200.imacdn.com/tt24/2020/03/10/fdedd6afa5cefa23_bcbae080467c2fd5_323460158385531271.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1232, 1042, 2154, 20, N'https://s200.imacdn.com/tt24/2020/03/10/13533f2ba0ef417f_3efd3309ea85dca8_291046158385531521.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1233, 1042, 2154, 21, N'https://s200.imacdn.com/tt24/2020/03/10/b53eb7e55d37dd9b_8ab855fe7f3480de_326194158385531871.jpg')
GO
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1234, 1042, 2154, 22, N'https://s200.imacdn.com/tt24/2020/03/10/61cf781f537d349d_3ece459987145851_250076158385532031.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1235, 1042, 2154, 23, N'https://s200.imacdn.com/tt24/2020/03/10/684de53b73fd9c5e_f1d30f9ae590a7d2_244465158385532361.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1236, 1042, 2154, 24, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1238, 1043, 2159, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1239, 1043, 2160, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1240, 1043, 2161, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1241, 1043, 2162, 1, N'https://s200.imacdn.com/tt24/2020/03/11/1e77c9281c5789e8_5ec74165d727332c_173513158389196441.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1242, 1043, 2162, 2, N'https://s200.imacdn.com/tt24/2020/03/11/83cb2c275c34e6d3_443337713b2a8d5d_87269158389196811.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1243, 1043, 2162, 3, N'https://s200.imacdn.com/tt24/2020/03/11/65cec9858b60ffb7_354744056e959181_332292158389197281.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1244, 1043, 2162, 4, N'https://s200.imacdn.com/tt24/2020/03/11/dc2602a8d744e341_40912bb8603a23af_350264158389197551.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1245, 1043, 2162, 5, N'https://s200.imacdn.com/tt24/2020/03/11/89167f9ec5ee180e_f350f6d91930bdc1_417594158389198051.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1246, 1043, 2162, 6, N'https://s200.imacdn.com/tt24/2020/03/11/b4eff0975c610e7e_2703b7dacaa10c1f_352112158389198411.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1247, 1043, 2162, 7, N'https://s200.imacdn.com/tt24/2020/03/11/a87b69a26fb3e763_c76ccdda736da32c_290487158389198911.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1248, 1043, 2162, 8, N'https://s200.imacdn.com/tt24/2020/03/11/c5844011186a10b5_231c2057745e20fc_338301158389199211.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1249, 1043, 2162, 9, N'https://s200.imacdn.com/tt24/2020/03/11/6b6a975da30af30f_053777b47bd360a9_339849158389199441.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1250, 1043, 2162, 10, N'https://s200.imacdn.com/tt24/2020/03/11/9da5d5a1ddc2a983_107c31196f087250_355086158389199741.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1251, 1043, 2162, 11, N'https://s200.imacdn.com/tt24/2020/03/11/8262db97036efb8a_02d82a232f4dabb3_361735158389200141.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1252, 1043, 2162, 12, N'https://s200.imacdn.com/tt24/2020/03/11/6862befbf0e78fae_a261120ceddc9762_382537158389200431.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1253, 1043, 2162, 13, N'https://s200.imacdn.com/tt24/2020/03/11/6860c7679b3c92ca_6135f2d997e3da09_383354158389200861.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1254, 1043, 2162, 14, N'https://s200.imacdn.com/tt24/2020/03/11/c8b5fb6d0724344c_50ef431b7cf4ad3d_377875158389201111.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1255, 1043, 2162, 15, N'https://s200.imacdn.com/tt24/2020/03/11/4055ff949f5bd07a_a7761e5aa9ae9fdf_458250158389201581.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1256, 1043, 2162, 16, N'https://s200.imacdn.com/tt24/2020/03/11/51c14fd2c395e9dd_89fa1e15756d20c1_452915158389201921.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1257, 1043, 2162, 17, N'https://s200.imacdn.com/tt24/2020/03/11/2bcd12834f844313_714dbb27caa4b89a_410619158389202551.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1258, 1043, 2162, 18, N'https://s200.imacdn.com/tt24/2020/03/11/1ef42d2a06fb05a9_b61ad95e58b81437_260658158389202861.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1259, 1043, 2162, 19, N'https://s200.imacdn.com/tt24/2020/03/11/bad591e5b9760783_9e0c6280dc9824db_313272158389203111.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1260, 1043, 2162, 20, N'https://s200.imacdn.com/tt24/2020/03/11/5ac72c9cd300b4eb_46d75a680442038a_429174158389203661.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1261, 1043, 2162, 21, N'https://s200.imacdn.com/tt24/2020/03/11/dba6d52e64e5b7c2_cceb982208c6abcc_452350158389204161.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1262, 1043, 2162, 22, N'https://s200.imacdn.com/tt24/2020/03/11/69cb0af6ba9ddbaa_b5b9fa3d6201b480_428038158389204421.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1263, 1043, 2162, 23, N'https://s200.imacdn.com/tt24/2020/03/11/93431b0e3334c3f0_4ef89e79025a5590_285265158389204761.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1264, 1043, 2162, 24, N'https://s200.imacdn.com/tt24/2020/03/11/794b1854b2327b37_49d27601ec19ed7b_426441158389205261.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1265, 1043, 2162, 25, N'https://s200.imacdn.com/tt24/2020/03/11/2127427b077c7960_4d4af08311161eea_294101158389205521.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1284, 1138, 2176, 1, N'https://s200.imacdn.com/tt24/2020/03/27/fccc4de4d28f8263_8db581af8b629dd8_5064981585294244545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1285, 1138, 2176, 2, N'https://s200.imacdn.com/tt24/2020/03/27/25530fe7a3a241a9_62c9821f6d7bfd49_9787841585294246945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1286, 1138, 2176, 3, N'https://s200.imacdn.com/tt24/2020/03/27/6565361bd2225acf_7d9b2931aab30afe_3520241585294247545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1287, 1138, 2176, 4, N'https://s200.imacdn.com/tt24/2020/03/27/d376980c05beb72a_913f3f9638cf138b_5548941585294249345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1288, 1138, 2176, 5, N'https://s200.imacdn.com/tt24/2020/03/27/6083dbb0d731b8f6_662ef231a6edb00a_6028111585294251445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1289, 1138, 2176, 6, N'https://s200.imacdn.com/tt24/2020/03/27/3c739b0edc1b0771_8aef2d15f46376ee_5423901585294252545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1290, 1138, 2176, 7, N'https://s200.imacdn.com/tt24/2020/03/27/789a7779835fb432_d73f281052d71119_5095161585294254645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1291, 1138, 2176, 8, N'https://s200.imacdn.com/tt24/2020/03/27/04dfe7460a64a7f4_cc2c610c44f12280_5439801585294256445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1292, 1138, 2176, 9, N'https://s200.imacdn.com/tt24/2020/03/27/016b3b1915dd75e0_42655d3b445cb0a8_6853011585294257445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1293, 1138, 2176, 10, N'https://s200.imacdn.com/tt24/2020/03/27/4261b9c706e454ad_710abfb7f619eaa2_4478641585294259345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1294, 1138, 2176, 11, N'https://s200.imacdn.com/tt24/2020/03/27/9bcfb3aa966f3a2a_a8ebf5bde975f769_5276011585294261445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1295, 1138, 2176, 12, N'https://s200.imacdn.com/tt24/2020/03/27/b16a884fb8e8ec8f_9de605e438c81427_5246191585294263645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1296, 1138, 2176, 13, N'https://s200.imacdn.com/tt24/2020/03/27/352ea4a8abc68d4f_84310152a92529fe_4702581585294264945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1297, 1138, 2176, 14, N'https://s200.imacdn.com/tt24/2020/03/27/6f2977bbfcc02528_a9a31fa6ac841799_5900501585294266545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1298, 1138, 2176, 15, N'https://s200.imacdn.com/tt24/2020/03/27/46ba54ab96b5039f_03208809fb74ac80_5229661585294268445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1299, 1138, 2176, 16, N'https://s200.imacdn.com/tt24/2020/03/27/801b920f714bc69c_fc00e1528767703f_5313461585294269945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1300, 1138, 2176, 17, N'https://s200.imacdn.com/tt24/2020/03/27/28fb736d47e18892_2aa9ab3b51d23bfd_4898031585294271945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1301, 1138, 2176, 18, N'https://s200.imacdn.com/tt24/2020/03/27/23313de637c22be1_5020ee511d22c5a4_4960631585294276845957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1302, 1138, 2176, 19, N'https://s200.imacdn.com/tt24/2020/03/27/f03a3e6e226c1d9a_8aa8266d258f3341_5630031585294277245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1303, 1138, 2176, 20, N'https://s200.imacdn.com/tt24/2020/03/27/879c595aa4382e18_ea5c5cffb26d342f_7368861585294279845957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1304, 1138, 2176, 21, N'https://s200.imacdn.com/tt24/2020/03/27/e84eeac5ed59606e_818cb2991e919710_4967161585294281145957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1305, 1138, 2176, 22, N'https://s200.imacdn.com/tt24/2020/03/27/fa04580b4923d1b4_76db678d8582a0c3_4802721585294287345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1306, 1138, 2176, 23, N'https://s200.imacdn.com/tt24/2020/03/27/1b1052cdf82767db_6dd4d5cd6aa76830_5560031585294290645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1307, 1138, 2176, 24, N'https://s200.imacdn.com/tt24/2020/03/27/8d22e113c4aae558_a4cd2e681466700a_4746421585294291245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1308, 1138, 2176, 25, N'https://s200.imacdn.com/tt24/2020/03/27/af6f155c11b8318a_40f2dceff6728a20_13841221585294294345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1309, 1138, 2176, 26, N'https://s200.imacdn.com/tt24/2020/03/27/2564c2ea3c9f59c1_6079404c46fe3469_5442081585294297245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1312, 1046, NULL, 1, N'https://s200.imacdn.com/tt24/2020/03/19/7abaacf645971692_6d7523594aef811c_3189681584606710645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1313, 1046, NULL, 2, N'https://s200.imacdn.com/tt24/2020/03/19/e2626a48c85195b1_c26f0b565eb2cc06_2459381584606712845957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1314, 1046, NULL, 3, N'https://s200.imacdn.com/tt24/2020/03/19/0593a9ce9306f4a0_23a896058f8b3fb8_2661621584606714745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1315, 1046, NULL, 4, N'https://s200.imacdn.com/tt24/2020/03/19/2e71b19faeb88a94_164ed31383f8e52e_3413831584606717145957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1316, 1046, NULL, 5, N'https://s200.imacdn.com/tt24/2020/03/19/8d5854c93634d427_2a3392f82914752a_2863781584606720345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1317, 1046, NULL, 6, N'https://s200.imacdn.com/tt24/2020/03/19/f6c6693e56e69c90_877c366dd3667ace_953371584606722345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1318, 1046, NULL, 7, N'https://s200.imacdn.com/tt24/2020/03/19/5bfebf91c8723e25_21cfdbf5484ed015_3767291584606723745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1319, 1046, NULL, 8, N'https://s200.imacdn.com/tt24/2020/03/19/fe618ccdae67c612_6a172ff211c821ca_3179991584606728745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1320, 1046, NULL, 9, N'https://s200.imacdn.com/tt24/2020/03/19/2a65073af60f99d6_debbd80a1cb44db7_3325471584606731645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1321, 1046, NULL, 10, N'https://s200.imacdn.com/tt24/2020/03/19/4908bd5d84354e7b_7443498657d4a681_3287011584606735545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1322, 1046, NULL, 11, N'https://s200.imacdn.com/tt24/2020/03/19/73f9f2c4181eb460_0b9f40a5d1365544_3245631584606737645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1323, 1046, NULL, 12, N'https://s200.imacdn.com/tt24/2020/03/19/8a52b35adbdcbb29_b753e4ed6770c389_4127611584606739645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1324, 1046, NULL, 13, N'https://s200.imacdn.com/tt24/2020/03/19/46c6c355e914a3ed_20dfee931502ad7f_4222111584606742645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1325, 1046, NULL, 14, N'https://s200.imacdn.com/tt24/2020/03/19/3feb5396886b75a3_46d87404f8e9ae5c_3792601584606744545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1326, 1046, NULL, 15, N'https://s200.imacdn.com/tt24/2020/03/19/2a1148528646452b_246c7495a59f1cfa_3701841584606746145957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1327, 1046, NULL, 16, N'https://s200.imacdn.com/tt24/2020/03/19/5250d6a0bba7cd2c_2903958f9d5c0361_3616461584606748645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1328, 1046, NULL, 17, N'https://s200.imacdn.com/tt24/2020/03/19/ae1d52cc4bca1d90_e956a481b4c00d9b_4229181584606750945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1329, 1046, NULL, 18, N'https://s200.imacdn.com/tt24/2020/03/19/e14fbd48ef44b5c6_5f24cfa6d1e3054a_4063591584606753245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1330, 1046, NULL, 19, N'https://s200.imacdn.com/tt24/2020/03/19/35f21d8aae322e19_7d8cbfdfce555c70_3806661584606755545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1331, 1046, NULL, 20, N'https://s200.imacdn.com/tt24/2020/03/19/99c9feade2a6c972_9e6f164ba4e10d8d_4131311584606758545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1332, 1046, NULL, 21, N'https://s200.imacdn.com/tt24/2020/03/19/2a0445fcc893812a_e20c52e2b418016c_3568701584606760945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1333, 1046, NULL, 22, N'https://s200.imacdn.com/tt24/2020/03/19/ff2635bdec317ada_815041815517538d_3534801584606762645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1334, 1046, NULL, 23, N'https://s200.imacdn.com/tt24/2020/03/19/723fb2ac4f3b8b4d_6e119cb00a96be4f_3635281584606764645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1335, 1046, NULL, 24, N'https://s200.imacdn.com/tt24/2020/03/19/45b8a8d4cc564868_2ceefbc7b727acfa_3530871584606768745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1336, 1046, NULL, 25, N'https://s200.imacdn.com/tt24/2020/03/19/ee5577a3aaf1d163_9bf2a214d995622b_3897081584606770245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1337, 1046, NULL, 26, N'https://s200.imacdn.com/tt24/2020/03/19/cc098f92a5ee361e_8b32e80a23664dd5_4128061584606772145957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1338, 1046, NULL, 27, N'https://s200.imacdn.com/tt24/2020/03/19/c6229cdd65be5e23_521232394d405090_3330571584606774745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1339, 1046, NULL, 28, N'https://s200.imacdn.com/tt24/2020/03/19/88008b10a73cef2c_5b413bfa17ed412b_3975181584606778645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1340, 1046, NULL, 29, N'https://s200.imacdn.com/tt24/2020/03/19/88008b10a73cef2c_5b413bfa17ed412b_3975181584606778645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1341, 1046, NULL, 30, N'https://s200.imacdn.com/tt24/2020/03/19/b20375a865c1bceb_645da7a2884e8861_3788491584606780345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1342, 1046, NULL, 31, N'https://s200.imacdn.com/tt24/2020/03/19/d7b964775ecc7318_af9d12f246931be7_2778331584606782645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1345, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1346, 1046, NULL, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1347, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1348, 1046, NULL, 1, N'104')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1349, 1046, NULL, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1350, 1046, NULL, 3, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1351, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1352, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1353, 1046, NULL, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1354, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1355, 1046, NULL, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1356, 1046, NULL, 1, N'')
GO
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1358, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1359, 1046, NULL, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1360, 1046, NULL, 3, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1361, 1046, NULL, 4, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1362, 1046, NULL, 5, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1363, 1046, NULL, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1364, 1046, NULL, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1365, 1046, NULL, 3, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1366, 1046, NULL, 4, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1367, 1046, NULL, 5, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1368, 1046, NULL, 6, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1369, 1046, NULL, 7, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1370, 1046, NULL, 8, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1372, 1046, 2189, 1, N'https://s200.imacdn.com/tt24/2020/03/19/7abaacf645971692_6d7523594aef811c_3189681584606710645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1373, 1046, 2189, 2, N'https://s200.imacdn.com/tt24/2020/03/19/e2626a48c85195b1_c26f0b565eb2cc06_2459381584606712845957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1374, 1046, 2189, 3, N'https://s200.imacdn.com/tt24/2020/03/19/0593a9ce9306f4a0_23a896058f8b3fb8_2661621584606714745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1375, 1046, 2189, 4, N'https://s200.imacdn.com/tt24/2020/03/19/2e71b19faeb88a94_164ed31383f8e52e_3413831584606717145957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1376, 1046, 2189, 5, N'https://s200.imacdn.com/tt24/2020/03/19/2e71b19faeb88a94_164ed31383f8e52e_3413831584606717145957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1377, 1046, 2189, 6, N'https://s200.imacdn.com/tt24/2020/03/19/8d5854c93634d427_2a3392f82914752a_2863781584606720345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1378, 1046, 2189, 7, N'https://s200.imacdn.com/tt24/2020/03/19/f6c6693e56e69c90_877c366dd3667ace_953371584606722345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1379, 1046, 2189, 8, N'https://s200.imacdn.com/tt24/2020/03/19/5bfebf91c8723e25_21cfdbf5484ed015_3767291584606723745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1380, 1046, 2189, 9, N'https://s200.imacdn.com/tt24/2020/03/19/fe618ccdae67c612_6a172ff211c821ca_3179991584606728745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1381, 1046, 2189, 10, N'https://s200.imacdn.com/tt24/2020/03/19/2a65073af60f99d6_debbd80a1cb44db7_3325471584606731645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1382, 1046, 2189, 11, N'https://s200.imacdn.com/tt24/2020/03/19/4908bd5d84354e7b_7443498657d4a681_3287011584606735545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1383, 1046, 2189, 12, N'https://s200.imacdn.com/tt24/2020/03/19/73f9f2c4181eb460_0b9f40a5d1365544_3245631584606737645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1384, 1046, 2189, 13, N'https://s200.imacdn.com/tt24/2020/03/19/8a52b35adbdcbb29_b753e4ed6770c389_4127611584606739645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1385, 1046, 2189, 14, N'https://s200.imacdn.com/tt24/2020/03/19/46c6c355e914a3ed_20dfee931502ad7f_4222111584606742645957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1386, 1046, 2189, 15, N'https://s200.imacdn.com/tt24/2020/03/19/3feb5396886b75a3_46d87404f8e9ae5c_3792601584606744545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1387, 1046, 2190, 1, N'https://s200.imacdn.com/tt24/2020/03/19/c176259fa109f5f3_3f38c83eba498136_1666901584606806245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1388, 1046, 2190, 2, N'https://s200.imacdn.com/tt24/2020/03/19/c3377348a1244dcc_493b6a3c8d49e3ca_3140381584606808945957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1389, 1046, 2190, 3, N'https://s200.imacdn.com/tt24/2020/03/19/684c28725b0cc367_fa1e2c357477a60f_3017041584606814545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1390, 1046, 2191, 1, N'https://s200.imacdn.com/tt24/2020/03/19/5964cd6c86cc8d22_97bfdd642d6be3a8_1690141584606875845957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1391, 1046, 2191, 2, N'https://s200.imacdn.com/tt24/2020/03/19/76edb6ffe1ae6489_720a294425a08bd3_3558251584606877445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1392, 1046, 2192, 1, N'https://s200.imacdn.com/tt24/2020/03/19/9e9344b73eeaa76e_55ccabe19754f4c9_1588401584606920545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1393, 1046, 2193, 1, N'https://s200.imacdn.com/tt24/2020/03/19/cee588dd558fa496_9e5db6fbee9698f6_2167491584606962845957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1394, 1046, 2194, 1, N'https://s200.imacdn.com/tt24/2020/03/19/27c71afe4be34d4c_0f4050903d5a7924_2137171584607002345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1396, 1046, 2196, 1, N'https://s200.imacdn.com/tt24/2020/03/19/057ca20651bda708_41d26b76879bc368_2973791584607107245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1397, 1046, 2197, 1, N'https://s200.imacdn.com/tt24/2020/03/19/794b4a2ecdd2dd70_d4e889b0f7e9a9a6_3058941584607151745957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1398, 1046, 2198, 1, N'https://s200.imacdn.com/tt24/2020/03/19/7a9cf9b3b53e62af_cb93b01676c4c120_2343281584607201345957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1400, 1046, 2200, 1, N'https://s200.imacdn.com/tt24/2020/03/19/6836f009e0569c57_fe9a2daedc604612_2889441584607302545957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1401, 1046, 2200, 2, N'https://s200.imacdn.com/tt24/2020/03/19/b86b143b3cfb989a_2097b938d51b8925_3874231584607304245957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1402, 1046, 2200, 3, N'https://s200.imacdn.com/tt24/2020/03/19/9c609304e0b53dd6_12e9a8fdb74c587c_4142961584607306445957.jpg')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1410, 1046, 2201, 1, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1411, 1046, 2201, 2, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1412, 1046, 2201, 3, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1413, 1046, 2201, 4, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1414, 1046, 2201, 5, N'')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1447, 1042, 2208, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(1).jpg?alt=media&token=a0761d42-75a1-496e-81db-7b2038d049e3')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1448, 1042, 2208, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(2).jpg?alt=media&token=93839c73-9ec8-45cd-add0-6870480b49b7')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1449, 1042, 2208, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(3).jpg?alt=media&token=a04a0c70-e0ee-47de-a237-5b328fb35476')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1450, 1042, 2208, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(4).jpg?alt=media&token=1b1c6a3b-3bb6-474d-8d44-b05bc6d97956')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1451, 1042, 2208, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(5).jpg?alt=media&token=ef27868a-6b70-4f3c-8e67-83da3adc56d3')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1452, 1042, 2208, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(6).jpg?alt=media&token=f8a8a114-45f0-4136-8bde-3aa7eb580f01')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1453, 1042, 2208, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(7).jpg?alt=media&token=3c4a333d-a32f-4bca-91cf-4c079f98cb6b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1454, 1042, 2208, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(8).jpg?alt=media&token=fb8e326a-9ff9-4614-a418-55e5420b6a19')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1455, 1042, 2208, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(9).jpg?alt=media&token=9ee68c8f-ee0c-4296-83b2-b4dfc401719b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1456, 1042, 2208, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(10).jpg?alt=media&token=d80ce607-6d3a-4ff4-ba34-8275917196a3')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1457, 1042, 2208, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(11).jpg?alt=media&token=699a8aca-21ea-46ce-bc88-f8777205178a')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1458, 1042, 2208, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(12).jpg?alt=media&token=87faf3bf-fdb9-4d2b-86d5-681f5548cccf')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1459, 1042, 2208, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(13).jpg?alt=media&token=a0163da4-c9c3-41e2-8dcc-a83ce6fa8927')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1460, 1042, 2208, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(14).jpg?alt=media&token=5d81c027-24df-4cb3-8322-38628a93a0d0')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1461, 1042, 2208, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(15).jpg?alt=media&token=08249b86-0387-4777-8e7d-7a9ec4892dc1')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1462, 1042, 2208, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(16).jpg?alt=media&token=64e2e3af-8e80-4e1d-b4d4-f09abf715448')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1463, 1042, 2208, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(17).jpg?alt=media&token=4dd92fa3-2edb-4880-8324-b20b4923d6d8')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1464, 1042, 2208, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(18).jpg?alt=media&token=3c339fe1-4431-48f0-a902-50f008a7df8b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1465, 1042, 2208, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(19).jpg?alt=media&token=3bb90895-a5c1-413f-ac1e-4054c3db676b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1466, 1042, 2208, 20, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F19%2F1%20(20).jpg?alt=media&token=576325be-dbf9-4f19-b007-e388912afb5d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1467, 1042, 2206, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(1).jpg?alt=media&token=51b982c0-1764-46df-a3c0-ff055b704c9f')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1468, 1042, 2206, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(2).jpg?alt=media&token=710d84e1-7736-4e9c-88cb-dbd99dcba177')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1469, 1042, 2206, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(3).jpg?alt=media&token=76d5f1ee-1e13-4bca-b076-e725e82ba03c')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1470, 1042, 2206, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(4).jpg?alt=media&token=11a33746-d57f-415c-8ac7-90463b8a5b5d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1471, 1042, 2206, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(5).jpg?alt=media&token=5a56534e-1f2c-48b1-b6d6-8dacd6821930')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1472, 1042, 2206, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(6).jpg?alt=media&token=904fa43d-a369-4609-b6c9-bda7a2689cd7')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1473, 1042, 2206, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(7).jpg?alt=media&token=5283390e-f15e-46b5-b453-afd77eaaddb3')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1474, 1042, 2206, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(8).jpg?alt=media&token=16779cbc-6bff-4dc8-90cc-018342f52c35')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1475, 1042, 2206, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(9).jpg?alt=media&token=c49c7077-58ec-46f3-9d31-caa21e24532b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1476, 1042, 2206, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(10).jpg?alt=media&token=e6d3b33a-e7a3-42ce-bddb-289ead84d426')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1477, 1042, 2206, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(11).jpg?alt=media&token=8e6ded11-721b-470f-98b5-7a66fde3a8e2')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1478, 1042, 2206, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(12).jpg?alt=media&token=e85b35a5-d874-48e9-9622-ee10a1dbf522')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1479, 1042, 2206, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(13).jpg?alt=media&token=81c85a6e-bc72-4f7e-83c8-855ba570bbcd')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1480, 1042, 2206, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(14).jpg?alt=media&token=fed568a9-61b5-4d5e-8ecf-2467e5650d72')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1481, 1042, 2206, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(15).jpg?alt=media&token=f356d44e-3ad5-4916-8b21-9b33c05b31ed')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1482, 1042, 2206, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(16).jpg?alt=media&token=8856cd04-4d2a-45e9-bbbd-9827dcc49cbd')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1483, 1042, 2206, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(17).jpg?alt=media&token=4c0a84e8-c3e4-429d-aa20-cb24f3380373')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1484, 1042, 2206, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(18).jpg?alt=media&token=ccb2e66d-c6e2-4d1e-b1e5-b5ddbc94ef72')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1485, 1042, 2206, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F18%2F1%20(19).jpg?alt=media&token=4c19fcf3-d661-4431-9a16-077e1f359d9a')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1489, 1042, 2156, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(1).jpg?alt=media&token=d5af9f3c-5c58-496e-88e7-c023f887e57c')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1490, 1042, 2156, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(2).jpg?alt=media&token=53c68f02-0b99-45a0-8e70-52495567303a')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1491, 1042, 2156, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(3).jpg?alt=media&token=419dce07-c0fe-44c6-8c0f-14f39dce79ce')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1492, 1042, 2156, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(4).jpg?alt=media&token=ff74b716-0284-4143-b914-d0432be39724')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1493, 1042, 2156, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(5).jpg?alt=media&token=625efa43-da13-46d6-b956-0d3a1063a91c')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1494, 1042, 2156, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(6).jpg?alt=media&token=79a1af6c-2f0f-41cf-91af-ae3abb73850f')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1495, 1042, 2156, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(7).jpg?alt=media&token=08a11e79-f856-48be-8e1b-ffacd7f57975')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1496, 1042, 2156, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(8).jpg?alt=media&token=95f49363-e857-426c-abd5-60749601aa76')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1497, 1042, 2156, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(9).jpg?alt=media&token=08083ddd-3207-40f5-975a-035dddb744ea')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1498, 1042, 2156, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(10).jpg?alt=media&token=53b73976-2d40-4656-9160-7ed37e9bed31')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1499, 1042, 2156, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(11).jpg?alt=media&token=b0abfb86-7def-4ced-b47f-00063d0756b4')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1500, 1042, 2156, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(12).jpg?alt=media&token=d72c8bab-804a-44ce-b9b1-15706de65133')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1501, 1042, 2156, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(13).jpg?alt=media&token=35181df9-4c97-4ec5-9e2e-53692262ab2b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1502, 1042, 2156, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(14).jpg?alt=media&token=1d1fc659-0cad-439a-ae6b-d0b2a60b912b')
GO
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1503, 1042, 2156, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(15).jpg?alt=media&token=633faaa5-36f2-4756-a0d0-a165d6650a8b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1504, 1042, 2156, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(16).jpg?alt=media&token=fd07b847-9e79-4a9a-949f-075ecaf36901')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1505, 1042, 2156, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(17).jpg?alt=media&token=bef80f1a-e376-4dd5-827f-9c963e29ccf9')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1506, 1042, 2156, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(18).jpg?alt=media&token=9646fb6d-7921-43af-aac4-a9814ea1d2a7')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1507, 1042, 2156, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(19).jpg?alt=media&token=8b350bb9-b5fa-494e-b827-13f3b26381b0')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1508, 1042, 2156, 20, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(20).jpg?alt=media&token=169387fc-79c3-48bf-a078-2f84c679c1a7')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1509, 1042, 2156, 21, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(21).jpg?alt=media&token=46856f38-2fa7-420d-821a-f6bdb243321d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1510, 1042, 2156, 22, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F3%2F3%20(22).jpg?alt=media&token=9d686e30-d694-4279-a96a-696b4ddbc462')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1511, 1042, 2157, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(1).jpg?alt=media&token=0fda42b1-1868-4e80-a80c-7b65bb5a362e')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1512, 1042, 2157, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(2).jpg?alt=media&token=703d8c65-5361-4442-8b58-5b8f7e71a400')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1513, 1042, 2157, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(3).jpg?alt=media&token=50151a5a-dafd-4b24-8b82-b8da65e82393')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1514, 1042, 2157, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(4).jpg?alt=media&token=d5e17b0a-47e6-4e98-a0a0-a240346be836')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1515, 1042, 2157, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(5).jpg?alt=media&token=e2fba6f9-6e8d-4855-9a53-56c16e540141')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1516, 1042, 2157, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(6).jpg?alt=media&token=5f0002e0-5f1f-4b1e-8d86-f6380e17512d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1517, 1042, 2157, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(7).jpg?alt=media&token=1ac7e09a-21f0-49a4-815c-b991f9f025ae')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1518, 1042, 2157, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(8).jpg?alt=media&token=c3f493a7-7e9f-44b1-af66-0a0aa6c52034')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1519, 1042, 2157, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(9).jpg?alt=media&token=9d81a4ed-ae3f-42fb-9374-ab7476898dcd')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1520, 1042, 2157, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(10).jpg?alt=media&token=8c65b8a5-5397-417d-9a33-a459f88a47eb')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1521, 1042, 2157, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(11).jpg?alt=media&token=d8c35e18-0a26-46a4-b566-e4fe6b4878f2')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1522, 1042, 2157, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(12).jpg?alt=media&token=6541007b-d840-417f-92cb-bc9e6d614548')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1523, 1042, 2157, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(13).jpg?alt=media&token=f0f2b276-c139-41b4-9713-2370e725e1eb')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1524, 1042, 2157, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(14).jpg?alt=media&token=6cde0586-6bd9-4aaf-a2f5-c7c6b8edefdc')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1525, 1042, 2157, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(15).jpg?alt=media&token=cd4abf18-930b-4490-8586-aa461359ad54')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1526, 1042, 2157, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(16).jpg?alt=media&token=9eac32be-6049-4832-aa24-e7cc5435594b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1527, 1042, 2157, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(17).jpg?alt=media&token=c3bde628-b8dd-4524-a38a-075425d4a852')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1528, 1042, 2157, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F4%2F4%20(18).jpg?alt=media&token=c8649f7f-3e0e-4d35-ae36-4699f0102aa0')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1529, 1042, 2158, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(1).jpg?alt=media&token=ab05780e-aa28-4a17-8dd4-cfc2b43b0f82')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1530, 1042, 2158, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(2).jpg?alt=media&token=0bc40cb0-9404-49f0-a3b9-3a8dfedab920')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1531, 1042, 2158, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(3).jpg?alt=media&token=1b0e500e-f716-43a2-84bf-e734791a9d76')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1532, 1042, 2158, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(4).jpg?alt=media&token=cb7c97d2-ee6c-4dab-bd1e-7025e6e12795')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1533, 1042, 2158, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(5).jpg?alt=media&token=525442d1-2c09-4ef8-8eea-a90cb0e1e4b4')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1534, 1042, 2158, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(6).jpg?alt=media&token=e2c1d3a5-e99d-4304-a4ab-5b3236b7ee7d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1535, 1042, 2158, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(7).jpg?alt=media&token=411fa796-dba3-42d4-8ff1-35a97c8c0b96')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1536, 1042, 2158, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(8).jpg?alt=media&token=6da52bd5-80cd-4cde-92a2-5662f1f6beed')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1537, 1042, 2158, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(9).jpg?alt=media&token=efa43bfd-785a-432d-a14f-d1293fe55a16')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1538, 1042, 2158, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(10).jpg?alt=media&token=6a230312-ee16-4ab8-ad3a-f8ec6199510e')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1539, 1042, 2158, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(11).jpg?alt=media&token=4abaec1b-c438-41a2-9ddf-00a807f9c096')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1540, 1042, 2158, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(12).jpg?alt=media&token=03b8e354-5459-46ce-9def-36fbc110e5db')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1541, 1042, 2158, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(13).jpg?alt=media&token=53b4b938-b576-4d29-b2ea-1d35c1720541')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1542, 1042, 2158, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(14).jpg?alt=media&token=c51d0442-a3ec-474a-aeee-c58e8db1f4c5')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1543, 1042, 2158, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(15).jpg?alt=media&token=d0749e06-a555-4b7c-a432-f179619bd0fc')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1544, 1042, 2158, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(16).jpg?alt=media&token=0b9a73a9-eb24-47c1-9305-3736ff8274d1')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1545, 1042, 2158, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(17).jpg?alt=media&token=ec76b285-ab11-44f2-94b0-cdf86a09d7b9')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1546, 1042, 2158, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(18).jpg?alt=media&token=4d4836bc-ca11-4078-b97d-7f5de2f05cc7')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1547, 1042, 2158, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F5%2FOP-5%20(19).jpg?alt=media&token=d0f706d6-85a5-4aeb-8017-8d245683e820')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1548, 1042, 2165, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(1).jpg?alt=media&token=a03f7df7-6530-48cf-b4b3-f1759b7f8fb4')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1549, 1042, 2165, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(2).jpg?alt=media&token=43b72484-0153-455a-9870-3d5480b3e514')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1550, 1042, 2165, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(3).jpg?alt=media&token=035c5184-e6c0-4aee-9258-49808ec30222')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1551, 1042, 2165, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(4).jpg?alt=media&token=bc7470b4-96a8-470c-b88d-2a5a7357cc5b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1552, 1042, 2165, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(5).jpg?alt=media&token=3af0137b-bb13-4012-a57d-0d5c864efc47')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1553, 1042, 2165, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(6).jpg?alt=media&token=a0f22dae-8ca7-43ac-abe9-8b8b534e57ab')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1554, 1042, 2165, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(7).jpg?alt=media&token=1acb77db-c99b-4d57-9c1a-9d3ba1dde8ea')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1555, 1042, 2165, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(8).jpg?alt=media&token=1ce92b17-d6d4-4ccc-9c91-59be3223c792')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1556, 1042, 2165, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(9).jpg?alt=media&token=5e795cc4-f3ef-43ed-9ed3-e2d573b5eb54')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1557, 1042, 2165, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(10).jpg?alt=media&token=ace336e2-fd2b-48af-b02c-709c68944cb6')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1558, 1042, 2165, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(11).jpg?alt=media&token=6aed04df-5260-4162-bcd6-7a08564b4c3e')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1559, 1042, 2165, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(12).jpg?alt=media&token=5589788a-fb9f-4a51-8933-e00195715bcb')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1560, 1042, 2165, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(13).jpg?alt=media&token=7a483ab8-7383-4672-93d8-62ab3f1837af')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1561, 1042, 2165, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(14).jpg?alt=media&token=929e2630-2e68-4cc3-91b6-f76a9b10bf5b')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1562, 1042, 2165, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(15).jpg?alt=media&token=275aa62b-127a-4365-83d6-d5db1e4ef7c2')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1563, 1042, 2165, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(16).jpg?alt=media&token=71a7087b-7786-439f-8bfa-fb2b37a3c0b2')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1564, 1042, 2165, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(17).jpg?alt=media&token=01211e0f-aa44-41fc-865a-a7887dbfa608')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1565, 1042, 2165, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(18).jpg?alt=media&token=991e6e65-b618-4fd1-836d-e35b93a7cd04')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1566, 1042, 2165, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(19).jpg?alt=media&token=690a9928-f10b-4e66-af9b-82ad431262f9')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1567, 1042, 2165, 20, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(20).jpg?alt=media&token=62d24d0f-2b21-4a92-8b22-8b63a6703672')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1568, 1042, 2165, 21, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(21).jpg?alt=media&token=d54af44d-c819-46a9-a3ba-dc168a74e45c')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1569, 1042, 2165, 22, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F6%2FOP-6%20(22).jpg?alt=media&token=ae042952-4bba-4b98-b32f-24dd37305b96')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1570, 1042, 2166, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F0.jpg?alt=media&token=4b57368e-cb9b-454a-a52f-2608b2dd384a')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1571, 1042, 2166, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F1.jpg?alt=media&token=fb47bc80-c9f7-4b21-bd3b-deb297efbaf8')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1572, 1042, 2166, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F2.jpg?alt=media&token=3e7c1dbb-5f10-45f8-a280-dda659957b4e')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1573, 1042, 2166, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F3.jpg?alt=media&token=5193f2ee-68b3-4bc9-aea3-9b44ff92833a')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1574, 1042, 2166, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F4.jpg?alt=media&token=54133aa5-d530-49fb-9b08-6497f8a77ca6')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1575, 1042, 2166, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F5.jpg?alt=media&token=0bee874d-e241-4343-bfe3-2b958537a6dc')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1576, 1042, 2166, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F6.jpg?alt=media&token=10bdd50f-74e5-49a9-b05a-2c91afb11219')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1577, 1042, 2166, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F7.jpg?alt=media&token=04dc2ab4-dfb6-4d19-9455-b08e22d3484c')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1578, 1042, 2166, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F8.jpg?alt=media&token=b7b54e75-7383-4901-b7c8-2c71d55dc4f6')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1579, 1042, 2166, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F9.jpg?alt=media&token=21d5e31c-0937-44f2-829a-a4c769977029')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1580, 1042, 2166, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F10.jpg?alt=media&token=a0eb17dd-78dd-48a0-940e-7a325fa1d125')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1581, 1042, 2166, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F11.jpg?alt=media&token=7dd9934b-2614-49e0-b60c-59bb3c89b5d5')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1582, 1042, 2166, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F12.jpg?alt=media&token=0bd65d08-03e6-4068-a133-fb42e1907a1c')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1583, 1042, 2166, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F13.jpg?alt=media&token=d9f462b4-233e-44b4-b6ee-9b4aa949bbf3')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1584, 1042, 2166, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F14.jpg?alt=media&token=5124af83-ae6d-4ee7-92c4-d9786777b8ec')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1585, 1042, 2166, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F15.jpg?alt=media&token=fb275bca-5550-4913-9131-6bca4c2c4175')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1586, 1042, 2166, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F16.jpg?alt=media&token=cac20e59-3c5f-4883-ade2-4f206489443d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1587, 1042, 2166, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F17.jpg?alt=media&token=73c0261a-ed55-4033-b93f-8eb8813d253e')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1588, 1042, 2166, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F18.jpg?alt=media&token=5cbbf1a9-209b-489c-bf8a-028d54dbb96d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1589, 1042, 2166, 20, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F19.jpg?alt=media&token=07e0ee97-d21b-44aa-916e-2b62f7f612f4')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1590, 1042, 2166, 21, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F7%2F20.jpg?alt=media&token=3fea6b05-4870-4e88-8187-494f25605e07')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1591, 1042, 2167, 1, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(1).jpg?alt=media&token=e2184005-6812-49e7-8565-f1f002d041b4')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1592, 1042, 2167, 2, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(2).jpg?alt=media&token=7cec8af0-bc16-4ed3-a6ae-c483a2ac827f')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1593, 1042, 2167, 3, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(3).jpg?alt=media&token=e0a05f07-41ed-40ae-ac5c-28250b3acea0')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1594, 1042, 2167, 4, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(4).jpg?alt=media&token=c1922fea-cc0f-4804-99c9-6826ea487d23')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1595, 1042, 2167, 5, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(5).jpg?alt=media&token=93651311-6dc0-4e74-b0b9-6e11ddbe1e46')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1596, 1042, 2167, 6, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(6).jpg?alt=media&token=124cd4aa-9354-43a8-991f-d70ebe72950d')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1597, 1042, 2167, 7, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(7).jpg?alt=media&token=3b808261-2f63-49ea-9da1-af781b4a548f')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1598, 1042, 2167, 8, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(8).jpg?alt=media&token=8e6d5eef-2718-429e-9f06-72f919957d91')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1599, 1042, 2167, 9, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(9).jpg?alt=media&token=5ec4eb91-cbea-4334-ba7f-5a26666c8565')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1600, 1042, 2167, 10, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(10).jpg?alt=media&token=71a421c5-d6e0-473b-b29a-6887033cc7cf')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1601, 1042, 2167, 11, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(11).jpg?alt=media&token=3617e20d-a826-4641-bf93-35d2ed2a6b00')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1602, 1042, 2167, 12, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(12).jpg?alt=media&token=1e21d891-20f0-4c4e-8f13-18860700c1b7')
GO
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1603, 1042, 2167, 13, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(13).jpg?alt=media&token=91df3174-1f2d-4a69-a565-3c05c68f58af')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1604, 1042, 2167, 14, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(14).jpg?alt=media&token=b2bde7cd-4cb6-4541-851f-660ad499565e')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1605, 1042, 2167, 15, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(15).jpg?alt=media&token=8f37e4bb-200d-4006-819b-c2633401be27')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1606, 1042, 2167, 16, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(16).jpg?alt=media&token=27e4e1e8-9f86-4369-8e6b-8078d1fb3cfe')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1607, 1042, 2167, 17, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(17).jpg?alt=media&token=80ffa1f1-25ed-47cb-803d-717b14fa1475')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1608, 1042, 2167, 18, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(18).jpg?alt=media&token=4497541b-baf4-4668-ba2b-38511b385cd0')
INSERT [dbo].[Chapter_Page] ([PageID], [ComicID], [ChapterID], [Page], [PageImgURL]) VALUES (1609, 1042, 2167, 19, N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/1042%2F8%2FOP-8%20(19).jpg?alt=media&token=e1dee735-9b83-481a-9dee-a557be968131')
SET IDENTITY_INSERT [dbo].[Chapter_Page] OFF
GO
SET IDENTITY_INSERT [dbo].[Comic] ON 

INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1042, N'One Piece', N'Action', N'One Piece', N'Gol D. Roger, a man referred to as the "Pirate King," is set to be executed by the World Government. But just before his demise, he confirms the existence of a great treasure, One Piece, located somewhere within the vast ocean known as the Grand Line. Announcing that One Piece can be claimed by anyone worthy enough to reach it, the Pirate King is executed and the Great Age of Pirates begins. Twenty-two years later, a young man by the name of Monkey D. Luffy is ready to embark on his own adventure, searching for One Piece and striving to become the new Pirate King. Armed with just a straw hat, a small boat, and an elastic body, he sets out on a fantastic journey to gather his own crew and a worthy ship that will take them across the Grand Line to claim the greatest status on the high seas. ', 2, 905445, 3, 4, N'Oda Eiichiro', N'OnGoing', CAST(N'2022-08-25T18:33:11.000' AS DateTime), CAST(N'2022-07-29T10:40:52.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2Fonepiece-2-585x881-1.jpg?alt=media&token=66d44f5d-db31-4217-8449-8b1135dd16c4', N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicThumb%2F2-6.jpg?alt=media&token=444bb1ba-6027-4d6c-ab95-d771c96c192b', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1043, N'Onepunch Man', N'Action', N'One Punch Man, onepunchman', N'After rigorously training for three years, the ordinary Saitama has gained immense strength which allows him to take out anyone and anything with just one punch. He decides to put his new skill to good use by becoming a hero. However, he quickly becomes bored with easily defeating monsters, and wants someone to give him a challenge to bring back the spark of being a hero. Upon bearing witness to Saitama''s amazing power, Genos, a cyborg, is determined to become Saitama''s apprentice. During this time, Saitama realizes he is neither getting the recognition that he deserves nor known by the people due to him not being a part of the Hero Association. Wanting to boost his reputation, Saitama decides to have Genos register with him, in exchange for taking him in as a pupil. Together, the two begin working their way up toward becoming true heroes, hoping to find strong enemies and earn respect in the process.', 1, 520452, 1, 0, N'Murata Yuusuke', N'OnGoing', CAST(N'2022-08-23T13:54:03.000' AS DateTime), CAST(N'2022-07-29T11:20:00.000' AS DateTime), N'https://visubtv.net/image/poster/8091624430311.jpg', N'https://occ-0-116-448.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABYM9KvP-bpz9dnTQP1O7OhpXl-Vs21ImIUtsfrrwF34WX36c4S7ceysPRTiFe4MamL8AKhiCvsPsS_ON75eGeuJfhSEmUp4l6bM0.jpg?r=0e5', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1044, N'Tokyo Revengers', N'Action', N'Tokyo Manji Revengers Tokyo Revengers Toukyou Revengers', N'Takemichi is a 26-year-old unemployed virgin who learns that the girl he dated in middle school—the only girl he ever dated—has died. Then, after an accident he finds himself in a time leap back to his middle school years. He vows to change the future and save the girl, and to do that he aims to rise to the top of the Kantou region''s most brutal delinquent gang', 1, 45424, 1, 0, N' Wakui Ken', N'OnGoing', CAST(N'2022-08-24T23:07:07.000' AS DateTime), CAST(N'2022-07-29T11:20:05.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/08/03/f58a506e7b3dc03d_c973dce3950d2381_41090162798610749674.jpg', N'https://i.pinimg.com/originals/ce/63/8e/ce638eec3c148d803005f1ae6eb88d4d.png', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1045, N'Black Clover', N'Fantasy', N'Black Clover, Black Five Leaf Grass', N'Aster and Yuno were abandoned together at the same church, and have been inseparable since. As children, they promised that they would compete against each other to see who would become the next sorcerous emperor. However, as they grew up, some differences between them became plain. Yuno was a genius with magic, with amazing power and control, while Aster could not use magic at all, and tried to make up for his lack by training physically. When they received their grimoires at age 15, Yuno got a spectacular book with a four-leaf-clover (most people receive a three-leaf-clover), while Aster received nothing at all. However, when Yuno was threatened, the truth about Asterpower was revealed-- he received a five-leaf-clover grimoire, a black cloverbook of anti-magic. Now the two friends are heading out in the world, both seeking the same goal!', 1, 12045, 1, 0, N' Tabata Yuuki', N'OnGoing', CAST(N'2022-08-08T10:52:24.000' AS DateTime), CAST(N'2022-07-31T23:02:50.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/889f84dd4127c4c3_f46f1f911956fb50_36147158347140031.jpg', N'https://znews-photo.zingcdn.me/w660/Uploaded/piqbzcvo/2021_05_30/black_clovers.jpeg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1046, N'Detective Conan', N'Thriller', N'Detective Conan,Meitantei Conan', N'Shinichi Kudo is a high-school student who, by using observation and deduction, is good at solving mysteries. While investigating one, he is caught by the criminals that he was watching and forced to take an experimental drug. Leaving him for dead, the criminals disappear. Instead of killing him, however, the drug turns Shinichi into a little kid.To preserve the illusion of his disappearance, Shinichi adopts a new name based on his favorite author (Arthur Conan Doyle) and becomes Conan Edogawa. Ran, his (actually Shinichis) childhood friend takes this little boy under her wing and brings him to her home. Conan now lives at a detective agency run by Rans father, but his mind is as keen as ever and he continues to solve mysteries... always allowing Rans father to take all the credit.As far as everyones concerned, Conan is just a little kid anyway... even to Ran. This is *extremely* frustrating to Conan since nobody will listen to a little boy. Despite this, Conan has a mission... to find the criminals who did this to him and get the antidote to that drug.', 1, 772580, 1, 9, N'Gosho Aoyama', N'OnGoing', CAST(N'2022-08-18T11:43:14.000' AS DateTime), CAST(N'2022-07-31T23:02:54.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/19/5d47c1a3006c4106_fbb79ad7bbd42027_224941584606669445957.jpg', N'https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/tmuihk/2022_07_13/conan-1-6623.jpeg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1047, N'Fairy Tail: 100 Years Quest', N'Action', N'Fairy Tail 100 Years Quest ; Feari Teiru: Hyaku-nen Kuesuto', N'', 1, 42782, 1, 0, N'Mashima Hiro', N'Completed', CAST(N'2022-08-18T11:43:44.000' AS DateTime), CAST(N'2022-08-01T01:31:49.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/03/07/d413b01dfd3639c6_7f9c2d46f7059610_4149616466430388878769.jpg', N'https://i.ytimg.com/vi/-bBoFxDPk54/maxresdefault.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1048, N'Tensei Shitara Slime Datta Ken', N'Fantasy', N'Tensei Shitara Slime Datta Ken', N'A man is stabbed by a robber on the run after pushing his coworker and his coworker''s new fiance out of the way. As he lays dying, bleeding on the ground, he hears a voice. This voice is strange and interprets his dying regret of being a virgin by gives him the [Great Sage] unique skill! Is he being made fun of !?!', 1, 10458, 1, 0, N'Kawakami Taiki, Fuse', N'OnGoing', CAST(N'2022-08-01T01:32:37.000' AS DateTime), CAST(N'2022-08-01T01:32:37.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/11/d0a6d098a0c55b5c_6fe29c12231af20b_419611583929619345957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1049, N'War of Love and Brains', N'Drama', N'War of Love and Brains; Kaguya-sama wa Kokurasetai - Tensaitachi no Renai Zunousen; Kaguya Wants to be Confessed To - The Geniuses'' War of Love and Brains', N'Kaguya Shinomiya and Miyuki Shirogane are the members of the incredibly prestigious Shuichiin Academys student council, asserting their positions as geniuses among geniuses. All the time they spend together has caused the two of them to develop feelings for each other, but their pride will not allow them to be the one to confess and become the submissive one in the relationship! Love is war, and their battle to make the other confess begins now!', 1, 12452, 1, 0, N'Akasaka, Aka (Story & Art)', N'OnGoing', CAST(N'2022-08-25T11:04:35.000' AS DateTime), CAST(N'2022-08-01T01:33:35.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/8c6cd851932f7fbb_2016367a08c91763_32664158348037229674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1050, N'Karakai Jouzu No (Moto) Takagi-San', N'Drama', N'Karakai Jouzu No (Moto) Takagi-San  Skilled Teaser (Former) Takagi-san ; Teasing Master (née) Takagi-san', N'', 1, 10142, 1, 0, N' Yamamoto Souichirou', N'OnGoing', CAST(N'2022-08-24T23:07:12.000' AS DateTime), CAST(N'2022-08-01T01:35:07.000' AS DateTime), N'https://s200.imacdn.com/tt24/2022/02/03/acc9d6c6921e2cde_9442dfab414b227d_22688164387474739674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1051, N'Four Knights of the Apocalypse', N'Fantasy', N'Four Knights of the Apocalypse Mokushiroku no Yonkishi', N'', 2, 10421, 2, 2, N'', N'OnGoing', CAST(N'2022-08-25T08:34:15.000' AS DateTime), CAST(N'2022-08-01T01:36:13.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/05/03/85eb395126d8a3f8_dd8325d22bf492af_32873165157320289674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1052, N'Jujutsu Kaisen', N'Fantasy', N'Jujutsu Kaisen', N'', 0, 10144, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:37:29.000' AS DateTime), CAST(N'2022-08-01T01:37:29.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/01/20/906587cc2f226d4d_843cd593179d86b0_467071611141384745957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1053, N'Heroaca; My Hero Academia', N'Action', N'Heroaca; My Hero Academia, Boku No Hero Academia', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-06T16:51:00.000' AS DateTime), CAST(N'2022-08-01T01:38:05.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/09/04/f56d4081f1094cc4_be8010977e3cc9db_48240163075663289674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1054, N'Chainsaw Man ', N'Action', N'Chainsaw Man ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-06T16:52:24.000' AS DateTime), CAST(N'2022-08-01T01:38:21.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/04/16/bcdba194e82a42fe_2616e65d7e3159e0_545061586997547945957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1055, N'Dragon Ball Super', N'Action', N'Dragon Ball Super', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:39:17.000' AS DateTime), CAST(N'2022-08-01T01:39:17.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/08/21/d789516c529f85fa_09c4b00c4ef4e579_44821162954603359674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1056, N'Record of Ragnarok', N'Action', N'Record of Ragnarok', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:39:34.000' AS DateTime), CAST(N'2022-08-01T01:39:34.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/12/31/4b281c75d39e055f_16bc475c3f0bcb4b_358971609411672245957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1057, N'Kimetsu No Yaiba', N'Action', N'Kimetsu No Yaiba Demon Slayer', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-07T22:31:35.000' AS DateTime), CAST(N'2022-08-01T01:39:52.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/a3a62084f603a892_09e48447777abb46_43465158347151141.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1058, N'Grand Blue', N'Drama', N'Grand Blue', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:40:07.000' AS DateTime), CAST(N'2022-08-01T01:40:07.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/10/24/f576b02103a906f6_0a3c38902c540879_37124163505858979674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1059, N'Naruto', N'Action', N'Naruto', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:40:18.000' AS DateTime), CAST(N'2022-08-01T01:40:18.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/fc11f9b484cd4f2b_4bd4899a9a74430b_37304158347131971.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1060, N'Mairimashita! Iruma-Kun', N'Action', N'Mairimashita! Iruma-Kun', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:40:31.000' AS DateTime), CAST(N'2022-08-01T01:40:31.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/05/13/34d6d47a9a9b1549_e63854c61da6231c_514181589331148745957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1061, N'Boruto: Naruto Next Generations', N'Action', N'Boruto: Naruto Next Generations', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:41:05.000' AS DateTime), CAST(N'2022-08-01T01:41:05.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/06/27/44052577c74200b9_323794ce80f21f17_29998162478009179674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1062, N'Shokugeki No Soma', N'Fantasy', N'Shokugeki No Soma', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-13T13:15:22.000' AS DateTime), CAST(N'2022-08-01T01:41:20.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/10/819e5aa7ffc7e9aa_153b6c2cfa060d6c_35697158385790399674.jpg', N'https://gamek.mediacdn.vn/133514250583805952/2021/6/28/shokugeki-no-souma-ni-no-sara-ss1-vua-dau-bep-phan-1-1624875769596670185383.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1063, N'Komi-San Wa Komyushou Desu', N'Drama', N'Komi-San Wa Komyushou Desu', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-13T13:16:24.000' AS DateTime), CAST(N'2022-08-01T01:41:36.000' AS DateTime), N'https://www.dtv-ebook.com/images/files_2/2020/komi-khong-the-giao-tiep.png', N'https://gamenewsnetwork.net/wp-content/uploads/2022/05/Komi-Cant-Communicate-Season-3.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1064, N'Nise Koi', N'Drama', N'Nise Koi', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-07T11:06:17.000' AS DateTime), CAST(N'2022-08-01T01:42:24.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/05/12/cb4cb13634dc02ed_f09e0866cc318f7e_383711589289882345957.jpg', N'', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1065, N'Enen No Shouboutai', N'Drama', N'Enen No Shouboutai', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-06T16:52:04.000' AS DateTime), CAST(N'2022-08-01T01:42:37.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/05/14/66c96664a4b63253_30215202ab170c29_455531589439365445957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1066, N'Dr.Stone', N'Fantasy', N'Dr.Stone', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:42:48.000' AS DateTime), CAST(N'2022-08-01T01:42:48.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/1e780f1016157342_068ff9c4697fd38b_32305158347016821.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1067, N'Hunter X Hunter', N'Action', N'Hunter X Hunter', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:43:01.000' AS DateTime), CAST(N'2022-08-01T01:43:01.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/05/27/5fe7aa3fede8d359_f8c02a4bb43c1db2_41595165366182759674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1068, N'Yugi-Oh! ', N'Fantasy', N'Yugi-Oh! ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:43:13.000' AS DateTime), CAST(N'2022-08-01T01:43:13.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/26/edfafb4e7e9e551e_413f5dafcd89cdb4_319031585241373245957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1069, N'Overlord', N'Fantasy', N'Overlord', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:43:23.000' AS DateTime), CAST(N'2022-08-01T01:43:23.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/10/23/d5c8cadb8138d1ea_b341deb7cbd9e1b5_39577163498082079674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1070, N'Tate no Yuusha no Nariagari', N'Fantasy', N'Tate no Yuusha no Nariagari', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:43:35.000' AS DateTime), CAST(N'2022-08-01T01:43:35.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/27/20eb6bf9f01c0f45_01ca38e151232ded_426971585242237345957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1071, N'Kumo Desu Ga, Nani Ka? ', N'Fantasy', N'Kumo Desu Ga, Nani Ka? ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-25T10:50:10.000' AS DateTime), CAST(N'2022-08-01T01:43:46.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/17/5df82442a7983861_3cd85e12df135411_433881584437479245957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1072, N'Attack on Titan', N'Action', N'Attack on Titan', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:44:01.000' AS DateTime), CAST(N'2022-08-01T01:44:01.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/10/24/c8b79327cd96e8b8_03834e9292baaf0e_3697216350438498828291.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1073, N'SPY X FAMILY', N'Drama', N'SPY X FAMILY', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:44:13.000' AS DateTime), CAST(N'2022-08-01T01:44:13.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/05/14/92cae13a91cec97a_233a84b7bf48842d_272651589430552545957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1074, N'The God Of High School', N'Action', N'The God Of High School', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:44:24.000' AS DateTime), CAST(N'2022-08-01T01:44:24.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/09/02/0e4d7ec1f248a862_f583ad09530e8bdc_482821599008961745957.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1075, N'Paripi Koumei', N'Drama', N'Paripi Koumei', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:44:34.000' AS DateTime), CAST(N'2022-08-01T01:44:34.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/04/26/7320277562288939_9aa537180a57276c_4220616509574003828291.jpg', N'', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1076, N'Rent-a-Girlfriend', N'Drama', N'Rent-a-Girlfriend', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:46:26.000' AS DateTime), CAST(N'2022-08-01T01:46:26.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/09/05/88a96dbcf56d12aa_9392c9683c2af539_43648163083733619674.jpg', N'', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1077, N'World Trigger ', N'Action', N'World Trigger ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:47:06.000' AS DateTime), CAST(N'2022-08-01T01:47:06.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/11/09/b869d28ef09f07aa_f02d8a8695a3582a_24930163644209329674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1078, N'Prison School ', N'Drama', N'Prison School ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:47:14.000' AS DateTime), CAST(N'2022-08-01T01:47:14.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/05/23/d9b09d949d12ee0b_4b5f8455977573eb_361801590196706645957.jpg', N'', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1079, N'Haikyu', N'Drama', N'Haikyu Haikyuu!! Haruichi Furudate.', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-06T23:44:52.000' AS DateTime), CAST(N'2022-08-01T01:47:25.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/07/05/91a42e641197f6b5_89711b3d9576358e_38827165700603279674.jpg', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1080, N'Nanatsu no Taizai ', N'Drama', N'Nanatsu no Taizai ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:47:36.000' AS DateTime), CAST(N'2022-08-01T01:47:36.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/02/28/0dc08b81fd30ca40_c41fb7438c4266f3_42626158288158319674.jpg', N'', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1081, N'The Promised Neverland ', N'Drama', N'The Promised Neverland ', N'', 0, 0, 0, 0, N'', N'OnGoing', CAST(N'2022-08-01T01:47:48.000' AS DateTime), CAST(N'2022-08-01T01:47:48.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/05/18/4b9e55854d3aa676_5d4eebecaeaa9386_555311589808478245957.jpg', N'', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1125, N'Bleach', N'Action', N'Bleach', N'', 0, 0, 0, 0, N' Kubo Tite', N'OnGoing', CAST(N'2022-08-13T19:10:51.000' AS DateTime), CAST(N'2022-08-08T16:20:53.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/a6afa7cb9fb24431_10cb725ec2c064eb_31660158347260521.jpg', N'https://image.winudf.com/v2/image1/Y29tLnR0bGlrZS5tYnNhZW4uYW5kcm9pZF9zY3JlZW5fMF8xNjA4MDE4NDgzXzAwOQ/screen-0.jpg?fakeurl=1&type=.webp', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1126, N'Reincarnated As An Aristocrat With An Appraisal Skill', N'Drama', N'Reincarnated As An Aristocrat With An Appraisal Skill', N'', 0, 0, 0, 0, N'Miraijin A', N'OnGoing', CAST(N'2022-08-09T10:11:38.000' AS DateTime), CAST(N'2022-08-09T10:11:38.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/12/10/bb8e14671338f4b7_2b5d2840abe60c20_412531607608063245957.jpg', N'https://otakukart.com/wp-content/uploads/2021/07/Screenshot-2021-07-27-171755.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1129, N'Fairy Tail ', N'Fantasy', N'Fairy Tail ', N'', 0, 0, 0, 0, N'Mashima Hiro', N'OnGoing', CAST(N'2022-08-13T21:25:42.000' AS DateTime), CAST(N'2022-08-13T21:25:42.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/06/2eb820993722a076_c590fc57a304ff4a_38105158348133681.jpg', N'https://ecdn.game4v.com/g4v-content/uploads/2020/06/Fairy-Tail-phep-thuat-1-game4v.png', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1130, N'Blue Lock', N'Drama', N'Blue Lock', N'', 0, 0, 0, 0, N'Nomura Yuusuke', N'OnGoing', CAST(N'2022-08-13T21:27:57.000' AS DateTime), CAST(N'2022-08-13T21:27:57.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/26/94cdf6ec5a01537d_b28b9a7c8449aac0_327681585241518445957.jpg', N'https://vietotaku.com/wp-content/uploads/2021/08/top-10-cau-thu-xuat-sac-nhat-blue-lock.jpg?v=1636337854', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1131, N'Gotoubun no Hanayome ', N'Drama', N'Gotoubun no Hanayome ', N'', 0, 0, 0, 0, N' Haruba Negi', N'OnGoing', CAST(N'2022-08-13T21:29:13.000' AS DateTime), CAST(N'2022-08-13T21:29:13.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/27/b4c2ae0167d02e6f_89181cceecbd8038_300791585324678145957.jpg', N'https://gamek.mediacdn.vn/133514250583805952/2020/2/20/photo-1-1582184931314585926077.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1132, N'Edens Zero ', N'Drama', N'Edens Zero ', N'', 0, 0, 0, 0, N'Mashima Hiro', N'OnGoing', CAST(N'2022-08-25T11:04:50.000' AS DateTime), CAST(N'2022-08-13T21:30:17.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/06/18/f4484d18d9cfdc35_7fd5c79d3cfd6af6_3631616555510053878769.jpg', N'https://s199.imacdn.com/ta/2020/06/12/1e854e3e094678ee_4159c380bc0eff8d_16552115919682916185710.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1133, N'Fuuto Tantei', N'Drama', N'Fuuto Tantei', N'', 0, 0, 0, 0, N'Sanjou, Riku (Story) Satou, Masaki (Art)', N'OnGoing', CAST(N'2022-08-13T21:43:57.000' AS DateTime), CAST(N'2022-08-13T21:43:57.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/07/29/b6b76eeb567e6f4c_c70755cf3b535a2d_28523165908214979674.jpg', N'https://photos.animetvn.tv/upload/film_big/DkaVstX.png', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1134, N'Nise Seiken Monogatari ', N'Drama', N'Nise Seiken Monogatari ', N'', 0, 0, 0, 0, N' Đây là một huyền thoại sai lệch về một anh hùng và một thánh nữ với tính cách tệ hại đã ngáng chân nhau trên bước đường mưu cầu hạnh phúc', N'OnGoing', CAST(N'2022-08-13T22:01:19.000' AS DateTime), CAST(N'2022-08-13T21:46:33.000' AS DateTime), N'https://s199.imacdn.com/tt24/2022/04/16/5600e6dc0ab263cd_4627c9af12b00900_4189616500961057828291.jpg', N'https://s199.imacdn.com/tt24/2022/04/16/773817a8923f5475_a004817bfc3fae3c_7402616500961057828291.jpg', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1135, N'Sekai Saikou no Ansatsusha, Isekai Kizoku ni Tensei suru ', N'Drama', N'Sekai Saikou no Ansatsusha, Isekai Kizoku ni Tensei suru ', N'', 0, 0, 0, 0, N' Tsukiyo Rui', N'Completed', CAST(N'2022-08-13T22:01:17.000' AS DateTime), CAST(N'2022-08-13T21:51:57.000' AS DateTime), N'https://cdn-amz.woka.io/images/I/91sRQtg4oXL.jpg', N'https://animecorner.me/wp-content/uploads/2021/10/ansatsu-episode-01-8.png', 0)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1136, N'Your Name ', N'Drama', N'Your Name Kimi no Na wa', N'', 0, 0, 0, 0, N'Shinkai Makoto', N'Completed', CAST(N'2022-08-13T22:01:14.000' AS DateTime), CAST(N'2022-08-13T21:53:09.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/12/09/a7ac28e47143007d_d3ce5b998872abc6_2677016390635852828291.jpg', N'http://genk.mediacdn.vn/2016/4-660x443-1474988820158.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1137, N'Be Blues! - Ao Ni Nare', N'Drama', N'Be Blues! - Ao Ni Nare', N'', 0, 0, 0, 0, N'Tanaka Motoyuki', N'Completed', CAST(N'2022-08-13T22:01:12.000' AS DateTime), CAST(N'2022-08-13T21:56:37.000' AS DateTime), N'https://s200.imacdn.com/tt24/2021/11/20/f50685243d6475a5_887e15c293e13fab_3753316373647906814814.jpg', N'https://i7.xem-truyen.com/manga/29/29235/317013be-bluese99d92e381abe381aae3828c.thumb_500x.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1138, N'Kindaichi 37-sai no Jikenbo ', N'Thriller', N'37 Year Old Kindaichi HajimeKindaichi 37-sai no Jikenbo ', N'', 0, 0, 0, 0, N'Kanari Yozaburo', N'OnGoing', CAST(N'2022-08-23T12:52:16.000' AS DateTime), CAST(N'2022-08-13T21:59:23.000' AS DateTime), N'https://s200.imacdn.com/tt24/2020/03/26/a873d78dda7cd91d_600ca94cd6a460fc_526861585241960345957.jpg', N'https://animehunch.com/wp-content/uploads/2022/05/Kindaichi-Case-Files.jpg', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1140, N'Beyond the Realm of Conscience', N'Romance', N'Beyond the Realm of Conscience', N'Being pushed into a stove by the first born of An’s family, MiaoGe An escaped with bare life and decided to change her weak personality. A crazy MiaoGe An who caused general turmoil in An’s family thus appeared. The emperor is ruthless and tyrannical, it is said that he often beat his maids to death, which frightened all the girls from noble families, to pave the road for their first born, An’s family sent MiaoGe An to the imperial palace. As a result, MiaoGe An started to fight a battle of wits and courage with XiaoJing the moment she stepped into the imperial palace. All she wants are catching his eyes, getting back at her sister who will come into the imperial palace, being the empress who is a motherly model of the nation, and finally making those who look down upon her kneel to her.', 0, 0, 0, 0, N'Migu Comic', N'OnGoing', CAST(N'2022-08-25T21:50:24.000' AS DateTime), CAST(N'2022-08-25T21:50:24.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2Ff90e720f5ffb495de6e5c51b148c47dc.png?alt=media&token=7b2b3020-4ec7-49a8-9809-356ecb8ff0bd', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1141, N'Entered The Wrong Room', N'Romance', N'Entered The Wrong Room', N'Her boyfriend betrayed her and even made her sleep with his client for his business, but by mistake, she took the wrong room card and spent the night with Miguel Jian – a bossy president. The next day, her boyfriend and her younger sister came to the hotel, intending to catch her cheating. Fortunately, Miguel helped her out of the desperate situation. What''s more, she found Miguel''s son very familiar to her... All of this seems to have something to do with the conspiracy five years ago...
', 0, 0, 0, 0, N' MIFEN Culture', N'OnGoing', CAST(N'2022-08-25T21:52:07.000' AS DateTime), CAST(N'2022-08-25T21:52:07.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F7698eb11a85510d1ca55932dcc7e5c7b.png?alt=media&token=3592bfb3-2775-4119-bc8c-729c23faf79a', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1142, N'Bloodthirsty Surgeon', N'Romance', N'Bloodthirsty Surgeon', N'In her previous life, she was a genius well-versed in both medicine and poison before a plane crash ended her life. In this life, she became a first daughter, whose younger sister just snatched her fiancé. Right after entering this world, she found herself drenched in stench and mocked by sisters. Not long ago, her fiancé slapped her in the face, and she died from knocking into a fence. Now that she''s here, she won''t let those bad guys have their way. Why is the stern-faced lord, AKA, Warlord Yama different from the rumors? Anyway, whoever bullies her shall die! Whoever frames her shall perish! Whoever assassinates her shall face total annihilation!
', 0, 0, 0, 0, N'Kunwu Culture', N'OnGoing', CAST(N'2022-08-25T21:52:49.000' AS DateTime), CAST(N'2022-08-25T21:52:49.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F4251f538454d421cdf610ae982e4f506.png?alt=media&token=1a5d0921-7bd3-4e8f-8217-90a2edc111be', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1143, N'Unequal Treaty of Adoration', N'Romance', N'Unequal Treaty of Adoration', N'When she was betrayed by her fiancé and sister, she was so grief-stricken that she agreed to a blind CEO''s unexpected love confession. She became his babysitter before realizing she wasn''t privy to the full picture. He needs someone to feed him, dress him, bring him his towel when he forgets them in the shower, and cuddle him at night. Thus begins a marriage on unequal terms...
', 0, 0, 0, 0, N'Hongwu/Xiangwang+WUER COMIC+Kuaikan Comics', N'OnGoing', CAST(N'2022-08-25T21:53:27.000' AS DateTime), CAST(N'2022-08-25T21:53:27.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F5a294e53cdea710113f2a0c749a7ac35.png?alt=media&token=5be732ef-cec6-417e-a147-96787acc4eb3', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1144, N'Return of My Belittled Wife', N'Romance', N'Return of My Belittled Wife', N'Being punished and humiliated by her family, Rain Zhang feels despair thinking about the rest of her life. One day, she saves Aiden Gu’s son, and the little boy starts to get attached to her, even wanting her to become his mother?! How will a cute little boy and his domineering CEO daddy save our ‘Cinderella” from her strict grandmother and evil sister?', 0, 0, 0, 0, N' Ake Culture', N'OnGoing', CAST(N'2022-08-25T21:54:07.000' AS DateTime), CAST(N'2022-08-25T21:54:07.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F6c89377771dc75cd73e8f5141f5a838e.png?alt=media&token=9d972027-d1af-4906-844d-74b3fc306af2', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1145, N'You Belong To Me', N'Romance', N'You Belong To Me', N'Set up by her colleague, she barges into the CEO''s office and insists on applying medication to his private part. This enrages the CEO, and to make things worse, the CEO''s 5-year-old son was there as well. The little guy hugs her, "Daddy is this beautiful lady the model you got for me?" The CEO calmly push the little guy away, "Be good, this is your Mummy…"
', 0, 0, 0, 0, N'Kunwu Culture', N'OnGoing', CAST(N'2022-08-25T21:54:44.000' AS DateTime), CAST(N'2022-08-25T21:54:44.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F6c7986607eda645b82ddb379d92dd999.png?alt=media&token=b99e5062-25bb-4c8a-acc3-26253a01cf3d', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1146, N'Scammer Mommy and Her Wingman Baby', N'Romance', N'Scammer Mommy and Her Wingman Baby', N'Top-class hacker, An Jiujiu, snuck into an auction and wanted to steal a gemstone, but she lost her son in the process because she grabbed a boy who looked exactly the same as her son! When An Jiujiu, a professional heart-stealer extraordinaire, encountered the cunning boss Ji Jinchen, she tried avoiding him at all costs, but he still had her tight in his clutches.', 0, 0, 0, 0, N'iciyuan', N'OnGoing', CAST(N'2022-08-25T21:55:19.000' AS DateTime), CAST(N'2022-08-25T21:55:19.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F381712248d546838e9ca25cc2f59e79f.png?alt=media&token=4dc6755e-f1a4-4a99-971f-df622e431940', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1147, N'So What, You Are My Maid?', N'Romance', N'So What, You Are My Maid?', N'Eight years ago, a homeless Sissy was rescued by Steven, and became a servant of the Qi family. Many years of companionship created undeniable bond between those two! Steven''s mother getting in the way, Steven''s many admirers, and the oldest son of the Ji family who can''t stop his love for Sissy.... Will the truth from eight years ago come to light? After all these years, is it true love or just a game?
', 0, 0, 0, 0, N'Ake', N'OnGoing', CAST(N'2022-08-25T21:55:50.000' AS DateTime), CAST(N'2022-08-25T21:55:50.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2Fcb77c896b05f8df35b7aa534cf38a8bd.png?alt=media&token=7810113d-aa53-462f-a5ac-98724168b1fb', N'', 1)
INSERT [dbo].[Comic] ([ComicID], [ComicName], [Tags], [AnotherName], [ComicDescription], [LikeNo], [ViewNo], [FollowNo], [CommentNo], [Author], [Status], [LastUpdate], [CreateDate], [ComicImage], [ComicThumb], [IsPublic]) VALUES (1148, N'Whispers of the Devil', N'Romance', N'Whispers of the Devil', N'Jing Qiao and Jin Yan Shen swore an oath to each other on the day of their wedding, but what looked like a happy and blissful marriage was in fact just a revenge story. On the first night of the newly wed, under Jin Yan Shen’s humiliation and torture, the scenes of yore emerged in Jing Qiao’s mind one after another… After a ship crash, she was condemned to carry on her back the criminal name of “executioner” for the rest of her life.', 0, 0, 0, 0, N'Iciyuan', N'OnGoing', CAST(N'2022-08-25T21:56:29.000' AS DateTime), CAST(N'2022-08-25T21:56:29.000' AS DateTime), N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/ComicImage%2F14d41f8b5c623be9f8f45af29211a2d1.png?alt=media&token=3b997ca4-b206-4721-9102-ec9ff9acab74', N'', 1)
SET IDENTITY_INSERT [dbo].[Comic] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1000, 1057, 1046, N'I''ve watched all of the eps, episode 1 (not the reboot) is my favorite out of the entire franchise.', CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1001, 1058, 1046, N'my fav episode is 345 but the first one that fucked me up so much I thought to myself "holy shit, I love this" was episode 11', CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1002, 1058, 1046, N'Same goes for me!', CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1003, 1058, 1046, N'moonlight sonata as standalone case and i think its one entire special episode originally', CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1004, 1059, 1046, N'And don''t forget that Simon killing himself has a permanent affect on jimmy', CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1005, 1059, 1046, N'The episode where Jodie and akai are revealed to be FBI agents', CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1018, 1057, 1046, N'greate!', CAST(N'2022-08-18T12:40:58.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1020, 1057, 1042, N'Greate!', CAST(N'2022-08-18T14:32:45.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1021, 1057, 1042, N'Test', CAST(N'2022-08-18T14:36:17.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1023, 1057, 1046, N'yoyo?', CAST(N'2022-08-18T16:27:57.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1025, 1057, 1046, N'Akai is FBI member', CAST(N'2022-08-18T16:31:55.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1027, 1057, 1051, N'test', CAST(N'2022-08-21T18:01:51.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1028, 1056, 1042, N'one piece', CAST(N'2022-08-21T20:58:29.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1030, 1056, 1042, N'hehe', CAST(N'2022-08-24T11:10:03.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [UserID], [ComicID], [Comment], [CommentDate]) VALUES (1033, 1056, 1051, N'Hehe', CAST(N'2022-08-25T18:28:43.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Follow_Comic] ON 

INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1000, 1046, 1042, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1001, 1046, 1043, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1002, 1046, 1044, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1003, 1046, 1045, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1004, 1046, 1046, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1005, 1046, 1047, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1006, 1046, 1048, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1007, 1046, 1049, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1008, 1046, 1050, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1023, 1057, 1051, CAST(N'2022-08-21T18:02:10.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1025, 1056, 1042, CAST(N'2022-08-21T20:58:09.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1026, 1056, 1051, CAST(N'2022-08-21T20:58:39.000' AS DateTime))
INSERT [dbo].[Follow_Comic] ([ID], [UserID], [ComicID], [FollowDate]) VALUES (1027, 1057, 1042, CAST(N'2022-08-21T21:15:13.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Follow_Comic] OFF
GO
SET IDENTITY_INSERT [dbo].[Like_Comic] ON 

INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1001, 1059, 1043, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1002, 1057, 1044, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1003, 1058, 1045, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1004, 1058, 1046, CAST(N'2022-08-14T15:08:38.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1022, 1057, 1051, CAST(N'2022-08-21T18:02:07.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1024, 1056, 1042, CAST(N'2022-08-21T20:58:07.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1025, 1056, 1051, CAST(N'2022-08-21T20:58:40.000' AS DateTime))
INSERT [dbo].[Like_Comic] ([ID], [UserID], [ComicID], [LikeDate]) VALUES (1026, 1057, 1042, CAST(N'2022-08-21T21:15:14.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Like_Comic] OFF
GO
SET IDENTITY_INSERT [dbo].[Login_Token] ON 

INSERT [dbo].[Login_Token] ([ID], [UserID], [Token], [CreateDate]) VALUES (1028, 1057, N'bef12fb655845c9263016ce83b38f9d0', CAST(N'2022-08-18T14:58:28.490' AS DateTime))
INSERT [dbo].[Login_Token] ([ID], [UserID], [Token], [CreateDate]) VALUES (1052, 1056, N'f6fb350732e8d488606cdd70e929dcd1', CAST(N'2022-08-26T00:33:22.787' AS DateTime))
INSERT [dbo].[Login_Token] ([ID], [UserID], [Token], [CreateDate]) VALUES (1046, 1061, N'8d40ad7f2ef07cccb06b3e09ee844224', CAST(N'2022-08-22T00:46:09.110' AS DateTime))
INSERT [dbo].[Login_Token] ([ID], [UserID], [Token], [CreateDate]) VALUES (1047, 1057, N'b45809586a19ea5b594b0baa7275ed30', CAST(N'2022-08-22T00:46:29.793' AS DateTime))
INSERT [dbo].[Login_Token] ([ID], [UserID], [Token], [CreateDate]) VALUES (1044, 1060, N'd5d290b581a65f01de0880866cf4c99b', CAST(N'2022-08-22T00:42:14.497' AS DateTime))
INSERT [dbo].[Login_Token] ([ID], [UserID], [Token], [CreateDate]) VALUES (1045, 1060, N'bb858e3d1303201b28969c99af44b328', CAST(N'2022-08-22T00:42:18.207' AS DateTime))
SET IDENTITY_INSERT [dbo].[Login_Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([id], [text], [image]) VALUES (1, N'ONE PIECE', N'https://ecdn.game4v.com/g4v-content/uploads/2022/02/18093656/Op-ket-thuc-1-game4v-1645151815-49.jpg')
INSERT [dbo].[Slider] ([id], [text], [image]) VALUES (2, N'ONE PUNCH MAN', N'https://xansan.com/wp-content/uploads/2017/10/opmwallpaper.jpg')
INSERT [dbo].[Slider] ([id], [text], [image]) VALUES (3, N'DETECTIVE CONAN', N'https://www.journaldugeek.com/content/uploads/2021/05/cm24tok-001-04-r.jpg')
INSERT [dbo].[Slider] ([id], [text], [image]) VALUES (4, N'KINDAICHI', N'https://firebasestorage.googleapis.com/v0/b/fir-image-915a7.appspot.com/o/Banner%2Fkindaichi.jpeg?alt=media&token=9c7d209a-667a-43ab-ad4a-c2c804cc51c3')
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (1, N'Romance')
INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (2, N'Fantasy')
INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (3, N'Action')
INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (4, N'Drama')
INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (5, N'Comedy')
INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (6, N'Thriller')
INSERT [dbo].[Tags] ([ID], [TagsName]) VALUES (7, N'Suspense')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1054, N'Hair', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$TFYYgygxTNcuZrkAfq/NDeyETYrZ4OF36gmdkfiQajdIc.dETmwA6', N'teenhainam2603@gmail.com', CAST(N'2022-07-28T21:36:58.053' AS DateTime), 0)
INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1056, N'admin', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$Hij3Zy76PgLF0EXbZiVCKeQ0CBnorHAI/BgU1IOkO2qhlhexkOGv6', N'admin@admin', CAST(N'2022-08-14T21:11:45.993' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1057, N'user', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$6zrhGU7fqLT06VyX6iH5Ze0yi7V9AbfEb3LOR6hM3mAZsX6RTawTC', N'user@user', CAST(N'2022-08-14T21:13:45.697' AS DateTime), 0)
INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1058, N'user', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$cf/a0uaSjHdc2RBdHPAyne1FBXPJ19/Hv8mybzWftgTjrfCZiosuO', N'user1@user', CAST(N'2022-08-14T21:13:59.717' AS DateTime), 0)
INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1059, N'user', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$ZVidIx0j0dYWTTBLWUxKj.9ibe9GLneXf6YK7d4gRSBokymTaA3Um', N'user2@user', CAST(N'2022-08-17T15:07:24.113' AS DateTime), 0)
INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1060, N'userx', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$/i3yeYOtQMTPdqRcrtchZeOeM.mI4cb5eIuyzis5iB1gKaRtl.Vj.', N'userx@user', CAST(N'2022-08-22T00:42:03.607' AS DateTime), 0)
INSERT [dbo].[User] ([UserID], [UserName], [Avatar], [Password], [Email], [CreateDate], [IsAdmin]) VALUES (1061, N'userz', N'http://noidangsong.vn/files/uploads/fb1735058496563345/1526444239-tt_avatar_small.jpg', N'$2y$10$SM.XRP0SWT95YXdlF77m/OwTPtFYG5ESCcZ/27riEuBFvwVtP8OUC', N'userz@user', CAST(N'2022-08-22T00:46:02.020' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Login_Token] ADD  CONSTRAINT [DF_Login_Token_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedTime]  DEFAULT (getdate()) FOR [CreateDate]
GO
USE [master]
GO
ALTER DATABASE [Webtoon] SET  READ_WRITE 
GO
