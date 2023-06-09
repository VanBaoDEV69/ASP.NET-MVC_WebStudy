USE [master]
GO
/****** Object:  Database [StudyWeb]    Script Date: 05/12/2022 10:41:40 SA ******/
CREATE DATABASE [StudyWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudyWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudyWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudyWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudyWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudyWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudyWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudyWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudyWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudyWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudyWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudyWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudyWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudyWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudyWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudyWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudyWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudyWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudyWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudyWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudyWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudyWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudyWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudyWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudyWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudyWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudyWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudyWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudyWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudyWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudyWeb] SET  MULTI_USER 
GO
ALTER DATABASE [StudyWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudyWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudyWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudyWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudyWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudyWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudyWeb] SET QUERY_STORE = OFF
GO
USE [StudyWeb]
GO
/****** Object:  User [vanbao]    Script Date: 05/12/2022 10:41:40 SA ******/
CREATE USER [vanbao] FOR LOGIN [vanbao] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bao]    Script Date: 05/12/2022 10:41:40 SA ******/
CREATE USER [bao] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idType] [int] NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[imageUser] [nvarchar](500) NULL,
	[maill] [nvarchar](100) NOT NULL,
	[phone] [nchar](11) NULL,
	[password] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NOT NULL,
	[chapterName] [nvarchar](500) NOT NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classs]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
	[imageClass] [nvarchar](100) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Classs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPosts] [int] NULL,
	[idUser] [int] NOT NULL,
	[idComment] [int] NULL,
	[contentComment] [nvarchar](4000) NOT NULL,
	[imageComment1] [nvarchar](500) NULL,
	[imageComment2] [nvarchar](500) NULL,
	[imageComment3] [nvarchar](500) NULL,
	[imageComment4] [nvarchar](500) NULL,
	[likeComment] [int] NULL,
	[dateComment] [datetime] NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[maill] [nvarchar](100) NOT NULL,
	[phone] [varchar](11) NULL,
	[address] [nvarchar](500) NULL,
	[message] [nvarchar](4000) NOT NULL,
	[dateSend] [datetime] NULL,
	[status] [nvarchar](500) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NULL,
	[contentDocument] [nvarchar](4000) NOT NULL,
	[linkDocument] [nvarchar](500) NULL,
	[imageDocument] [nvarchar](500) NULL,
	[dateUpload] [datetime] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idChapter] [int] NOT NULL,
	[contentLesson] [nvarchar](4000) NOT NULL,
	[linkLesson] [nvarchar](500) NULL,
	[status] [nvarchar](200) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[contentPosts] [nvarchar](4000) NOT NULL,
	[imagePosts1] [nvarchar](500) NULL,
	[imagePosts2] [nvarchar](500) NULL,
	[imagePosts3] [nvarchar](500) NULL,
	[imagePosts4] [nvarchar](500) NULL,
	[datePost] [datetime] NULL,
	[countLike] [int] NULL,
	[countComment] [int] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTest] [int] NOT NULL,
	[question] [nvarchar](4000) NOT NULL,
	[imageQuestion1] [nvarchar](500) NULL,
	[imageQuestion2] [nvarchar](500) NULL,
	[imageQuestion3] [nvarchar](500) NULL,
	[imageQuestion4] [nvarchar](500) NULL,
	[answer1] [nvarchar](4000) NULL,
	[answer2] [nvarchar](4000) NULL,
	[answer3] [nvarchar](4000) NULL,
	[answer4] [nvarchar](4000) NULL,
	[correctAnswer] [nvarchar](4000) NOT NULL,
	[imageAnswer1] [nvarchar](500) NULL,
	[imageAnswer2] [nvarchar](500) NULL,
	[imageAnswer3] [nvarchar](500) NULL,
	[imageAnswer4] [nvarchar](500) NULL,
	[score] [float] NOT NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTest] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[score] [float] NOT NULL,
	[dateAdd] [datetime] NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idClass] [int] NOT NULL,
	[subjectName] [nvarchar](500) NOT NULL,
	[imageSubjects] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NOT NULL,
	[nameTest] [nvarchar](500) NOT NULL,
	[timeTest] [int] NOT NULL,
	[dateUpload] [date] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](100) NOT NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_TypeAccount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 05/12/2022 10:41:40 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSubjects] [int] NOT NULL,
	[nameVideo] [nvarchar](200) NOT NULL,
	[describe] [nvarchar](4000) NOT NULL,
	[linkVideo] [nvarchar](500) NOT NULL,
	[dateUpload] [datetime] NULL,
	[countLike] [int] NULL,
	[countComment] [int] NULL,
	[status] [nvarchar](500) NULL,
	[display] [bit] NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (1, 1, N'Admin', N'man.png', N'studyweb.free@gmail.com', N'0335056409 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (2, 3, N'Bảo 1', N'3fc10f9e-7dea-4f60-b117-c138dc329c06.png', N'vanbaopm01@gmail.com', N'0335056407 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (3, 2, N'Bảo 2', N'skeleton.png', N'vanbaopmdp@gmail.com', N'0335056407 ', N'202cb962ac59075b964b07152d234b70', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (7, 2, N'Quỳnh', N'woman1.png', N'vanbaopmdp2@gmail.com', N'0335056407 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (8, 2, N'Tô Văn Bảo', NULL, N'vanbaopmdp3@gmail.com', N'0335056407 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (9, 3, N'Tô Văn Bảo', NULL, N'vanbaopmdp30@gmail.com', N'0335056407 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (10, 3, N'Tô Văn Bảo', NULL, N'vanbaopmdp303@gmail.com', N'0335056407 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
INSERT [dbo].[Account] ([id], [idType], [fullname], [imageUser], [maill], [phone], [password], [status], [display]) VALUES (11, 3, N'Tô Văn Bảo', NULL, N'vanbaopmdp320@gmail.com', N'0335056407 ', N'e10adc3949ba59abbe56e057f20f883e', N'Hoạt động', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([id], [idSubjects], [chapterName], [display]) VALUES (1, 1, N'Chương 1 : Giới thiệu', 1)
INSERT [dbo].[Chapter] ([id], [idSubjects], [chapterName], [display]) VALUES (2, 1, N'Chương 2 : Hình học cơ bản', 1)
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Classs] ON 

INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (1, N'Lớp 6', N'ddad20ec-182f-44ae-8fec-f82b7b6e472a.png', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (3, N'Lớp 7', N'7.png', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (4, N'Lớp 8', N'8.png', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (5, N'Lớp 9', N'9.png', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (6, N'Lớp 10', N'182c9c92-5033-462e-9ba6-f6c19600480a.png', 1)
INSERT [dbo].[Classs] ([id], [className], [imageClass], [display]) VALUES (7, N'Lớp 11', N'5dd3bdda-014d-48e1-9c99-322656ac28ac.png', 1)
SET IDENTITY_INSERT [dbo].[Classs] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (1, 1, 3, NULL, N'Giá cả như nào ạ ?', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (2, 1, 2, NULL, N'Cho xin giá với (T_T)', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-26T10:36:08.970' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (3, 1, 7, NULL, N'Xin giá...', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (6, 1, 7, NULL, N'Xin giá cuốn này:', N'93352166-34da-452a-9f61-4a74a9fbb50e.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-13T17:21:51.713' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (7, 3, 1, NULL, N'Xin chào !!', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-22T15:01:52.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (9, 8, 1, NULL, N'1+1=2?', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (10, 1, 2, NULL, N'Xin chao ', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-15T15:26:14.910' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (12, 1, 2, NULL, N'Cuốn này', N'b8d52bb9-dfe3-4b5b-93aa-f8b830669375.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-18T14:48:05.513' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (13, 3, 2, NULL, N'Cố lên !!!', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-18T14:56:17.990' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (14, 10, 1, NULL, N'I don''''t know!!!', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-22T14:07:09.350' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [idPosts], [idUser], [idComment], [contentComment], [imageComment1], [imageComment2], [imageComment3], [imageComment4], [likeComment], [dateComment], [display]) VALUES (15, 12, 1, NULL, N'haha
', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-12-03T16:34:28.820' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([id], [fullname], [maill], [phone], [address], [message], [dateSend], [status]) VALUES (1, N'Tô Văn Bảo', N'vanbaopm01@gmail.com', N'0335056407', N'số 8 đường 120', N'haha', CAST(N'2022-11-06T00:00:00.000' AS DateTime), N'Đã duyệt')
INSERT [dbo].[Contacts] ([id], [fullname], [maill], [phone], [address], [message], [dateSend], [status]) VALUES (3, N'Tô Văn Bảo', N'vanbaopmdp@gmail.com', N'0335056407', N'số 8 đường 120', N'Test thôi chứ không có gì! 8:43', CAST(N'2022-11-18T20:43:16.403' AS DateTime), N'Đã duyệt')
INSERT [dbo].[Contacts] ([id], [fullname], [maill], [phone], [address], [message], [dateSend], [status]) VALUES (4, N'Tô Văn Bảo', N'studyweb.free@gmail.com', N'0335056407', N'số 8 đường 120', N'Test thôi chứ không có gì! 9:00', CAST(N'2022-11-18T21:00:52.810' AS DateTime), N'Đã duyệt')
INSERT [dbo].[Contacts] ([id], [fullname], [maill], [phone], [address], [message], [dateSend], [status]) VALUES (5, N'Tô Văn Bảo', N'vanbaopmdp3@gmail.com', N'0335056407', N'số 8 đường 120', N'Cần tìm khóa học cho học sinh lớp 6', CAST(N'2022-11-21T22:44:14.040' AS DateTime), N'Đã duyệt')
INSERT [dbo].[Contacts] ([id], [fullname], [maill], [phone], [address], [message], [dateSend], [status]) VALUES (6, N'Tô Văn Bảo', N'vanbaopmdp@gmail.com', N'0335056407', N'số 8 đường 120', N'10:29', CAST(N'2022-12-05T10:29:52.513' AS DateTime), N'Đã duyệt')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (3, 1, N'Tài liệu chương 1', N'TTQT.W.pdf', N'', CAST(N'2022-11-18T00:20:56.130' AS DateTime), N'Chưa đọc', 1)
INSERT [dbo].[Document] ([id], [idSubjects], [contentDocument], [linkDocument], [imageDocument], [dateUpload], [status], [display]) VALUES (4, 11, N'Tài liệu chương 1', N'7. Team Sói Cô Độc - BT1.pdf', N'', CAST(N'2022-12-03T15:32:46.870' AS DateTime), N'Chưa đọc', NULL)
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([id], [idChapter], [contentLesson], [linkLesson], [status], [display]) VALUES (1, 1, N'Bài 1 : Toán cơ bản', N'bai1_toan6.pdf', N'Chưa học', 1)
INSERT [dbo].[Lesson] ([id], [idChapter], [contentLesson], [linkLesson], [status], [display]) VALUES (2, 1, N'Bài 2 : Tập hợp các số tự nhiên', N'TTQT.W.pdf', N'Chưa học', 1)
INSERT [dbo].[Lesson] ([id], [idChapter], [contentLesson], [linkLesson], [status], [display]) VALUES (3, 1, N'Thanh toán quốc tế', N'7. Team Sói Cô Độc - BT1 (3).pdf', N'Chưa học', NULL)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (1, 2, N'Mở bán vở in hình tự chọn giá học sinh, sinh viên. Ai có nhu cầu liên hệ mình theo số điện thoại: 0335056407', N'hoa-hoc.jpg', N'dia-ly.jpg', N'sinh-hoc.jpg', N'tieng-anh.jpg', CAST(N'2022-11-10T16:00:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (3, 1, N'Vui quá đi !   (^_^) Cuối cùng cũng làm được ! Yeah!!! Yeah!!!Quá đã !!!', NULL, NULL, NULL, NULL, CAST(N'2022-11-21T21:45:16.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (8, 2, N'Help me now !!!', N'167211fa-e328-42cf-be47-9329940cf07d.jpg', NULL, NULL, NULL, CAST(N'2022-11-12T16:16:11.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (10, 7, N'Tổng hợp bài tập toán lớp 6 :', N'58f5da6d-df56-4443-a367-79ae104f0023.jpg', NULL, NULL, NULL, CAST(N'2022-11-18T20:53:11.970' AS DateTime), NULL, NULL, N'', 1)
INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (11, 1, N'Cuối cùng cũng có được haha', N'b40c050d-2980-4af1-a8c0-86e2318f32dc.jpg', N'1bd71c4e-b930-41ae-94fd-cfc5cc0d54c8.jpg', NULL, N'1f5979c1-b72a-4d29-9563-fbdfca1747ec.jpg', CAST(N'2022-11-26T20:50:38.837' AS DateTime), NULL, NULL, N'', 0)
INSERT [dbo].[Posts] ([id], [idUser], [contentPosts], [imagePosts1], [imagePosts2], [imagePosts3], [imagePosts4], [datePost], [countLike], [countComment], [status], [display]) VALUES (12, 1, N'test', N'1023c7fb-20d6-4f21-8eae-e2d8b88ede46.jfif', NULL, NULL, NULL, CAST(N'2022-12-03T16:34:12.197' AS DateTime), NULL, NULL, N'', 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (1, 1, N'1+1 = ?', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'2', NULL, NULL, NULL, NULL, 5, N'Chưa trả lời', 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (2, 1, N'1+2=?', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'3', NULL, NULL, NULL, NULL, 5, N'Chưa trả lời', 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (3, 2, N'1+1 = ?', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'2', NULL, NULL, NULL, NULL, 2, N'Chưa trả lời', 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (4, 2, N'1+2=?', NULL, NULL, NULL, NULL, N'1', N'2', N'3', N'4', N'3', NULL, NULL, NULL, NULL, 2, N'Chưa trả lời', 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (5, 2, N'Hình bên dưới là hình gì?', N'hinhchop.png', NULL, NULL, NULL, N'Hình nón', N'Hình trụ', N'Hình tròn', N'Hình chóp', N'Hình chóp', NULL, NULL, NULL, NULL, 2, NULL, 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (10, 2, N'11+4=?', NULL, NULL, NULL, NULL, N'10', N'17', N'18', N'15', N'15', NULL, NULL, NULL, NULL, 2, N'Hoàn tất', 1)
INSERT [dbo].[Question] ([id], [idTest], [question], [imageQuestion1], [imageQuestion2], [imageQuestion3], [imageQuestion4], [answer1], [answer2], [answer3], [answer4], [correctAnswer], [imageAnswer1], [imageAnswer2], [imageAnswer3], [imageAnswer4], [score], [status], [display]) VALUES (11, 2, N'Công thức tính diện tích hình chữ nhật', NULL, NULL, NULL, NULL, N'S = ( a + b) x 2', N'S = ( a - b ) x 2', N'S = a x b', N'S = a x b x 2', N'S = a x b', NULL, NULL, NULL, NULL, 2, N'Hoàn tất', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([id], [idTest], [idUser], [score], [dateAdd], [display]) VALUES (9, 1, 1, 5, CAST(N'2022-12-05T10:31:27.123' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (1, 1, N'Toán 6', N'2d7d8d54-5ae9-4854-8c7a-7c197a38a295.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (2, 1, N'Vật Lý 6', N'vat-ly.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (3, 1, N'Hóa 6', N'hoa-hoc.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (4, 1, N'Anh 6', N'tieng-anh.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (5, 3, N'Toán 7', N'toan-hoc.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (6, 1, N'Sinh học 6', N'sinh-hoc.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (7, 1, N'Ngữ văn 6', N'ngu-van.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (8, 1, N'Tin-hoc', N'tin-hoc.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (9, 1, N'Lịch sử 6', N'9759d404-d810-4c76-8f59-dbb335e42232.png', 1)
INSERT [dbo].[Subjects] ([id], [idClass], [subjectName], [imageSubjects], [display]) VALUES (11, 4, N'Toán 8', N'de39bcf4-7802-405c-b12b-eb37c5643d07.png', 1)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (1, 1, N'Kiểm tra 15 phút', 15, CAST(N'2022-11-12' AS Date), N'Chưa hoàn thành', 1)
INSERT [dbo].[Test] ([id], [idSubjects], [nameTest], [timeTest], [dateUpload], [status], [display]) VALUES (2, 1, N'Kiểm tra 1 tiết', 45, CAST(N'2022-11-12' AS Date), N'Chưa hoàn thành', 1)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeAccount] ON 

INSERT [dbo].[TypeAccount] ([id], [typeName], [display]) VALUES (1, N'Admin', 1)
INSERT [dbo].[TypeAccount] ([id], [typeName], [display]) VALUES (2, N'Teacher', 1)
INSERT [dbo].[TypeAccount] ([id], [typeName], [display]) VALUES (3, N'Student', 1)
SET IDENTITY_INSERT [dbo].[TypeAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (1, 5, N'Giới thiệu', N'Giới thiệu toán 7', N'toan.mp4', CAST(N'2022-11-12T00:00:00.000' AS DateTime), NULL, NULL, N'Chưa xem', 1)
INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (2, 1, N'Giới thiệu', N'Giới thiệu cơ bản về toán 6', N'toan.mp4', CAST(N'2022-11-11T00:00:00.000' AS DateTime), 0, 0, N'Chưa xem', 1)
INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (3, 1, N'Văn Bảo', N'Hoàng hôn quá đẹp!', N'video-bao.mp4', CAST(N'2022-11-12T00:00:00.000' AS DateTime), NULL, NULL, N'Chưa xem', 0)
INSERT [dbo].[Video] ([id], [idSubjects], [nameVideo], [describe], [linkVideo], [dateUpload], [countLike], [countComment], [status], [display]) VALUES (10, 1, N'Test Create', N'Test', N'HoangHonBao.mp4', CAST(N'2022-11-16T21:32:37.000' AS DateTime), NULL, NULL, N'Chưa xem', 1)
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_TypeAccount] FOREIGN KEY([idType])
REFERENCES [dbo].[TypeAccount] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_TypeAccount]
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_Subjects]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([idUser])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Posts] FOREIGN KEY([idPosts])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Posts]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Subjects]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Chapter] FOREIGN KEY([idChapter])
REFERENCES [dbo].[Chapter] ([id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Chapter]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Account] FOREIGN KEY([idUser])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Account]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Test] FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Test]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Account] FOREIGN KEY([idUser])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Account]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Test] FOREIGN KEY([idTest])
REFERENCES [dbo].[Test] ([id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Test]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Classs] FOREIGN KEY([idClass])
REFERENCES [dbo].[Classs] ([id])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Classs]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Subjects]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Subjects] FOREIGN KEY([idSubjects])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Subjects]
GO
USE [master]
GO
ALTER DATABASE [StudyWeb] SET  READ_WRITE 
GO
