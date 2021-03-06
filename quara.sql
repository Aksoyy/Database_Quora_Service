/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [quara]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Answer_Id] [numeric](18, 0) NOT NULL,
	[Question_Id] [numeric](18, 0) NOT NULL,
	[User_login_Id] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
	[Sort_Number] [numeric](18, 0) NULL,
	[Creation_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[Answer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [numeric](18, 0) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Bookmark] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İndividual]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İndividual](
	[İndividual_id] [numeric](18, 0) NOT NULL,
	[Name] [varchar](50) NULL,
	[Last_name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Nationality_type_cd] [varchar](50) NULL,
	[Creation_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_İndividual] PRIMARY KEY CLUSTERED 
(
	[İndividual_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Language_Id] [numeric](18, 0) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Language_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_State_Type]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_State_Type](
	[Login_state_type_cd] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Login_State_Type] PRIMARY KEY CLUSTERED 
(
	[Login_state_type_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Question_Id] [numeric](18, 0) NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Language_Id] [numeric](18, 0) NOT NULL,
	[User_login_Id] [numeric](18, 0) NOT NULL,
	[Category_Id] [numeric](18, 0) NOT NULL,
	[Creation_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Question_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_credential]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_credential](
	[User_credential_id] [numeric](18, 0) NOT NULL,
	[User_credential_type_cd] [varchar](50) NULL,
	[User_credential_value] [varchar](50) NULL,
	[User_login_id] [numeric](18, 0) NULL,
	[İndividual_id] [numeric](18, 0) NULL,
	[creation_date] [datetime] NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_User_credential] PRIMARY KEY CLUSTERED 
(
	[User_credential_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_credential_type]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_credential_type](
	[User_credential_type_cd] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Descripton] [varchar](50) NULL,
	[Creation_date] [datetime] NULL,
	[Update_date] [datetime] NULL,
 CONSTRAINT [PK_User_credential_type] PRIMARY KEY CLUSTERED 
(
	[User_credential_type_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Login]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Login](
	[User_login_id] [numeric](18, 0) NOT NULL,
	[Login_state_type_cd] [varchar](50) NULL,
	[Creation_date] [datetime] NULL,
	[Update_date] [datetime] NULL,
 CONSTRAINT [PK_User_Login] PRIMARY KEY CLUSTERED 
(
	[User_login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Password]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Password](
	[User_Password_Id] [numeric](18, 0) NOT NULL,
	[User_Login_Id] [numeric](18, 0) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Creation_Date] [datetime] NULL,
	[Update_date] [datetime] NULL,
 CONSTRAINT [PK_User_Password] PRIMARY KEY CLUSTERED 
(
	[User_Password_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_session]    Script Date: 24.12.2017 22:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_session](
	[User_session_id] [numeric](18, 0) NOT NULL,
	[User_login_id] [numeric](18, 0) NULL,
	[Session_key] [varchar](50) NULL,
	[Creation_date] [datetime] NULL,
	[Update_date] [datetime] NULL,
	[logical_delete_key] [varchar](50) NULL,
 CONSTRAINT [PK_User_session] PRIMARY KEY CLUSTERED 
(
	[User_session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'2 veya 4 kişi ile oynanabilmektedir.', NULL, CAST(N'2017-12-15T00:00:00.000' AS DateTime), CAST(N'2017-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'2 kişi ile oynanabilmektedir.', NULL, CAST(N'2017-12-15T23:09:40.730' AS DateTime), CAST(N'2017-12-15T23:09:40.730' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'deneme', NULL, CAST(N'2017-12-19T22:18:09.523' AS DateTime), CAST(N'2017-12-19T22:18:09.523' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'deneme', NULL, CAST(N'2017-12-19T22:18:16.057' AS DateTime), CAST(N'2017-12-19T22:18:16.057' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'deneme2', NULL, CAST(N'2017-12-19T22:19:58.867' AS DateTime), CAST(N'2017-12-19T22:19:58.867' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'test', NULL, CAST(N'2017-12-19T22:24:27.053' AS DateTime), CAST(N'2017-12-19T22:24:27.053' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'hobaaa', NULL, CAST(N'2017-12-19T22:24:34.967' AS DateTime), CAST(N'2017-12-19T22:24:34.967' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'hobaaa2', NULL, CAST(N'2017-12-19T22:24:45.433' AS DateTime), CAST(N'2017-12-19T22:24:45.433' AS DateTime))
INSERT [dbo].[Answer] ([Answer_Id], [Question_Id], [User_login_Id], [Description], [Sort_Number], [Creation_Date], [Update_Date]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'Evet katılıyorum', NULL, CAST(N'2017-12-20T15:22:01.740' AS DateTime), CAST(N'2017-12-20T15:22:01.740' AS DateTime))
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(1 AS Numeric(18, 0)), N'Spor', N'Spor')
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(2 AS Numeric(18, 0)), N'Bilim', N'Bilim')
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(3 AS Numeric(18, 0)), N'Tarih', N'Tarih')
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(4 AS Numeric(18, 0)), N'Coğrafya', N'Coğrafya')
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(5 AS Numeric(18, 0)), N'Bilişim', N'Bilişim')
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(6 AS Numeric(18, 0)), N'Edebiyat', N'Edebiyat')
INSERT [dbo].[Category] ([Category_Id], [Name], [Description]) VALUES (CAST(7 AS Numeric(18, 0)), N'Matematik', N'Matematik')
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(1 AS Numeric(18, 0)), N'Cemil', NULL, N'Aksoy', N'TÜRKİYE', CAST(N'2017-11-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(2 AS Numeric(18, 0)), N'Hakan', N'', N'Aksoy', N'TÜRKİYE', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-12-17T00:03:47.013' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(3 AS Numeric(18, 0)), N'Eylül', N'', N'AKSOY', N'TÜRKİYE', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(4 AS Numeric(18, 0)), N'Bruno', N'Budak', N'', N'TÜRKİYE', CAST(N'2017-11-28T00:00:00.000' AS DateTime), CAST(N'2017-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(5 AS Numeric(18, 0)), N'Mustafa', N'Sayan', N'', N'TÜRKİYE', CAST(N'2017-11-30T00:00:00.000' AS DateTime), CAST(N'2017-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(6 AS Numeric(18, 0)), N'Şevki', N'Oruç', N'', N'TÜRKİYE', CAST(N'2017-12-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(7 AS Numeric(18, 0)), N'Cagri', N'Yonca', N'', N'TÜRKİYE', CAST(N'2017-12-07T00:00:00.000' AS DateTime), CAST(N'2017-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(8 AS Numeric(18, 0)), N'Duru Nisa', N'Yetişir', N'', N'TÜRKİYE', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(9 AS Numeric(18, 0)), N'Batuhan', N'Ekici', N'', N'TÜRKİYE', CAST(N'2017-12-11T00:00:00.000' AS DateTime), CAST(N'2017-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(10 AS Numeric(18, 0)), N'Halit', N'Eren', N'', N'TÜRKİYE', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(12 AS Numeric(18, 0)), N'Burcu', N'', N'Aksoy', N'Türkiye', CAST(N'2017-12-16T00:20:39.340' AS DateTime), CAST(N'2017-12-16T00:20:39.340' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(13 AS Numeric(18, 0)), N'Nihal', N'', N'Yetişir', N'Türkiye', CAST(N'2017-12-16T00:27:08.947' AS DateTime), CAST(N'2017-12-16T00:27:08.947' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(14 AS Numeric(18, 0)), N'Hasan', N'', N'Yılmaz', N'Türkiye', CAST(N'2017-12-16T23:04:32.843' AS DateTime), CAST(N'2017-12-16T23:04:32.843' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(15 AS Numeric(18, 0)), N'Mahsun', N'', N'Yatkı', N'Türkiye', CAST(N'2017-12-16T23:44:28.857' AS DateTime), CAST(N'2017-12-16T23:44:28.857' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(16 AS Numeric(18, 0)), N'Kerem', N'', N'Oruc', N'Türkiye', CAST(N'2017-12-16T23:50:57.237' AS DateTime), CAST(N'2017-12-16T23:50:57.237' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(17 AS Numeric(18, 0)), N'Mehmet', N'Alperen', N'Çubuk', N'Türkiye', CAST(N'2017-12-19T22:42:00.997' AS DateTime), CAST(N'2017-12-19T22:42:00.997' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(18 AS Numeric(18, 0)), N'Ümit', N'', N'Şahan', N'Rusya', CAST(N'2017-12-19T22:58:02.280' AS DateTime), CAST(N'2017-12-19T23:05:11.390' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(19 AS Numeric(18, 0)), N'Fatih', N'', N'Güngör', N'Türkiye', CAST(N'2017-12-20T15:20:02.103' AS DateTime), CAST(N'2017-12-20T15:20:02.103' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(20 AS Numeric(18, 0)), N'Ali', N'', N'Kemal', N'Türkiye', CAST(N'2017-12-20T15:46:05.440' AS DateTime), CAST(N'2017-12-20T15:46:05.440' AS DateTime))
INSERT [dbo].[İndividual] ([İndividual_id], [Name], [Last_name], [Surname], [Nationality_type_cd], [Creation_Date], [Update_Date]) VALUES (CAST(21 AS Numeric(18, 0)), N'Admin', N'', N'admin2', N'Türkiye', CAST(N'2017-12-24T21:29:45.983' AS DateTime), CAST(N'2017-12-24T21:29:45.983' AS DateTime))
INSERT [dbo].[Language] ([Language_Id], [Name], [Description]) VALUES (CAST(1 AS Numeric(18, 0)), N'English', N'EN')
INSERT [dbo].[Language] ([Language_Id], [Name], [Description]) VALUES (CAST(2 AS Numeric(18, 0)), N'Türkçe', N'TR')
INSERT [dbo].[Login_State_Type] ([Login_state_type_cd], [Name], [Description]) VALUES (N'AKTIF', N'AKTIF', N'AKTIF')
INSERT [dbo].[Login_State_Type] ([Login_state_type_cd], [Name], [Description]) VALUES (N'PASIF', N'PASIF', N'PASIF')
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(1 AS Numeric(18, 0)), N'Konu', N'Genel bilgi', CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(2 AS Numeric(18, 0)), N'Masa tenisi', N'Masa tenisi kaç kişi ile oynanabilmektedir?', CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(3 AS Numeric(18, 0)), N'test1', N'cevap1', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-12-17T21:48:41.227' AS DateTime), CAST(N'2017-12-17T21:48:41.227' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(4 AS Numeric(18, 0)), N'test2', N'cevap2', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-12-17T21:48:51.253' AS DateTime), CAST(N'2017-12-17T21:48:51.253' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(5 AS Numeric(18, 0)), N'test3', N'cevap3', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-12-17T21:49:01.877' AS DateTime), CAST(N'2017-12-17T21:49:01.877' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(6 AS Numeric(18, 0)), N'test4', N'cevap4', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-12-17T21:49:13.247' AS DateTime), CAST(N'2017-12-17T21:49:13.247' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(7 AS Numeric(18, 0)), N'test5', N'cevap5', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-12-17T21:49:27.673' AS DateTime), CAST(N'2017-12-17T21:49:27.673' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(8 AS Numeric(18, 0)), N'test6', N'cevap6', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-12-17T21:50:01.983' AS DateTime), CAST(N'2017-12-17T21:50:01.983' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(9 AS Numeric(18, 0)), N'Programlama', N'Programlama nedir?', CAST(2 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(N'2017-12-20T15:21:21.117' AS DateTime), CAST(N'2017-12-20T15:21:21.117' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(10 AS Numeric(18, 0)), N'Logaritma', N'Logaritma 1 kaçtır?', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(N'2017-12-20T23:44:22.523' AS DateTime), CAST(N'2017-12-20T23:44:22.523' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(11 AS Numeric(18, 0)), N'Türev', N'e2 nin türevi nedir?', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(N'2017-12-20T23:45:59.207' AS DateTime), CAST(N'2017-12-20T23:45:59.207' AS DateTime))
INSERT [dbo].[Question] ([Question_Id], [Title], [Description], [Language_Id], [User_login_Id], [Category_Id], [Creation_Date], [Update_Date]) VALUES (CAST(12 AS Numeric(18, 0)), N'Dünya', N'Dünya kaç kıtadan oluşmaktadır?', CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2017-12-20T23:49:23.543' AS DateTime), CAST(N'2017-12-20T23:49:23.543' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(1 AS Numeric(18, 0)), N'MAIL', N'cemil.aksoyy@gmail.com', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2017-11-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(2 AS Numeric(18, 0)), N'MAIL', N'hkn.aksoyy@gmail.com', CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(3 AS Numeric(18, 0)), N'MAIL', N'eylul@gmail.com', CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(4 AS Numeric(18, 0)), N'MAIL', N'onur@gmail.com', CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(5 AS Numeric(18, 0)), N'MAIL', N'mustafa1907@gmail.com', CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(N'2017-11-30T00:00:00.000' AS DateTime), CAST(N'2017-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(6 AS Numeric(18, 0)), N'MAIL', N'sevki_oruc@gmail.com', CAST(6 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(N'2017-12-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(7 AS Numeric(18, 0)), N'MAIL', N'cagri_yonca@gmail.com', CAST(7 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(N'2017-12-07T00:00:00.000' AS DateTime), CAST(N'2017-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(8 AS Numeric(18, 0)), N'MAIL', N'duru_nisa@gmail.com', CAST(8 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(9 AS Numeric(18, 0)), N'MAIL', N'batu@gmail.com', CAST(9 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(N'2017-12-11T00:00:00.000' AS DateTime), CAST(N'2017-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(10 AS Numeric(18, 0)), N'MAIL', N'halit_eren@gmail.com', CAST(10 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(12 AS Numeric(18, 0)), N'MAIL', N'burcu@gmail.com', CAST(12 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(N'2017-12-16T00:20:39.400' AS DateTime), CAST(N'2017-12-16T00:20:39.400' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(13 AS Numeric(18, 0)), N'MAIL', N'nihal@gmail.com', CAST(13 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(N'2017-12-16T00:27:09.030' AS DateTime), CAST(N'2017-12-16T00:27:09.030' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(14 AS Numeric(18, 0)), N'MAIL', N'hasan@gmail.com', CAST(14 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(N'2017-12-16T23:04:32.897' AS DateTime), CAST(N'2017-12-16T23:04:32.897' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(15 AS Numeric(18, 0)), N'MAIL', N'mahsun@gmail.com', CAST(15 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(N'2017-12-16T23:44:29.030' AS DateTime), CAST(N'2017-12-16T23:44:29.030' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(16 AS Numeric(18, 0)), N'MAIL', N'kerem_oruc@gmail.com', CAST(16 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(N'2017-12-16T23:50:57.287' AS DateTime), CAST(N'2017-12-16T23:50:57.287' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(17 AS Numeric(18, 0)), N'MAIL', N'alperen@gmail.com', CAST(17 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(N'2017-12-19T22:42:01.200' AS DateTime), CAST(N'2017-12-19T22:42:01.200' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(18 AS Numeric(18, 0)), N'MAIL', N'umit@gmail.com', CAST(18 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(N'2017-12-19T22:58:02.410' AS DateTime), CAST(N'2017-12-19T22:58:02.410' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(19 AS Numeric(18, 0)), N'MAIL', N'fatih@gmail.com', CAST(19 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), CAST(N'2017-12-20T15:20:02.167' AS DateTime), CAST(N'2017-12-20T15:20:02.167' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(20 AS Numeric(18, 0)), N'MAIL', N'Ali@gmail.com', CAST(20 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(N'2017-12-20T15:46:05.523' AS DateTime), CAST(N'2017-12-20T15:46:05.523' AS DateTime))
INSERT [dbo].[User_credential] ([User_credential_id], [User_credential_type_cd], [User_credential_value], [User_login_id], [İndividual_id], [creation_date], [update_date]) VALUES (CAST(21 AS Numeric(18, 0)), N'MAIL', N'admin@gmail.com', CAST(21 AS Numeric(18, 0)), CAST(21 AS Numeric(18, 0)), CAST(N'2017-12-24T21:29:46.107' AS DateTime), CAST(N'2017-12-24T21:29:46.107' AS DateTime))
INSERT [dbo].[User_credential_type] ([User_credential_type_cd], [Name], [Descripton], [Creation_date], [Update_date]) VALUES (N'MAIL', N'mail', N'email', CAST(N'2017-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_credential_type] ([User_credential_type_cd], [Name], [Descripton], [Creation_date], [Update_date]) VALUES (N'TELNO', N'TELNO', N'cepno', CAST(N'2017-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(1 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(2 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(3 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(4 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-11-28T00:00:00.000' AS DateTime), CAST(N'2017-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(5 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-11-30T00:00:00.000' AS DateTime), CAST(N'2017-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(6 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(7 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-07T00:00:00.000' AS DateTime), CAST(N'2017-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(8 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(9 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-11T00:00:00.000' AS DateTime), CAST(N'2017-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(10 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(11 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-16T00:20:12.063' AS DateTime), CAST(N'2017-12-16T00:20:12.063' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(12 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-16T00:20:39.363' AS DateTime), CAST(N'2017-12-16T00:20:39.363' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(13 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-16T00:27:08.983' AS DateTime), CAST(N'2017-12-16T00:27:08.983' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(14 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-16T23:04:32.863' AS DateTime), CAST(N'2017-12-16T23:04:32.863' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(15 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-16T23:44:28.913' AS DateTime), CAST(N'2017-12-16T23:44:28.913' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(16 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-16T23:50:57.253' AS DateTime), CAST(N'2017-12-16T23:50:57.253' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(17 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-19T22:42:01.057' AS DateTime), CAST(N'2017-12-19T22:42:01.057' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(18 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-19T22:58:02.360' AS DateTime), CAST(N'2017-12-19T22:58:02.360' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(19 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-20T15:20:02.130' AS DateTime), CAST(N'2017-12-20T15:20:02.130' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(20 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-20T15:46:05.463' AS DateTime), CAST(N'2017-12-20T15:46:05.463' AS DateTime))
INSERT [dbo].[User_Login] ([User_login_id], [Login_state_type_cd], [Creation_date], [Update_date]) VALUES (CAST(21 AS Numeric(18, 0)), N'AKTIF', CAST(N'2017-12-24T21:29:46.027' AS DateTime), CAST(N'2017-12-24T21:29:46.027' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'12345', CAST(N'2017-11-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'159357', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-12-17T00:04:06.583' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'Eylul123', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'onur', CAST(N'2017-11-28T00:00:00.000' AS DateTime), CAST(N'2017-12-20T15:53:14.520' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'1907', CAST(N'2017-11-30T00:00:00.000' AS DateTime), CAST(N'2017-12-20T15:38:54.780' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'19033', CAST(N'2017-12-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'cagri123', CAST(N'2017-12-07T00:00:00.000' AS DateTime), CAST(N'2017-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'Duru123', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), N'123456789', CAST(N'2017-12-11T00:00:00.000' AS DateTime), CAST(N'2017-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'123', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), N'12345', CAST(N'2017-12-16T00:20:39.383' AS DateTime), CAST(N'2017-12-16T00:20:39.383' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N'Nihal', CAST(N'2017-12-16T00:27:09.013' AS DateTime), CAST(N'2017-12-16T00:27:09.013' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), N'147', CAST(N'2017-12-16T23:04:32.880' AS DateTime), CAST(N'2017-12-16T23:04:32.880' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), N'258', CAST(N'2017-12-16T23:44:29.013' AS DateTime), CAST(N'2017-12-16T23:44:29.013' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), N'369', CAST(N'2017-12-16T23:50:57.273' AS DateTime), CAST(N'2017-12-16T23:50:57.273' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), N'456', CAST(N'2017-12-19T22:42:01.177' AS DateTime), CAST(N'2017-12-19T22:42:01.177' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), N'0123456', CAST(N'2017-12-19T22:58:02.383' AS DateTime), CAST(N'2017-12-19T22:58:02.383' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'123', CAST(N'2017-12-20T15:20:02.147' AS DateTime), CAST(N'2017-12-20T15:20:02.147' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'ali', CAST(N'2017-12-20T15:46:05.513' AS DateTime), CAST(N'2017-12-20T15:46:05.513' AS DateTime))
INSERT [dbo].[User_Password] ([User_Password_Id], [User_Login_Id], [Password], [Creation_Date], [Update_date]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(21 AS Numeric(18, 0)), N'123', CAST(N'2017-12-24T21:29:46.093' AS DateTime), CAST(N'2017-12-24T21:33:54.503' AS DateTime))
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'a8d6c831-a747-400a-9cab-dec9df6bac7d', CAST(N'2017-11-25T00:00:00.000' AS DateTime), CAST(N'2017-11-25T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'39a9c9af-7218-4df8-a656-e7136a2989e9', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'2')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'4d1a5d63-7724-47f9-8b6a-acfbee7d15cd', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'3')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'72c11c5c-fe06-4adc-8911-cc39e26d204e', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'4')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'4728954e-c6a0-48ec-8a07-3a3ed8a9954f', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'17fbdc0e-276a-4433-8872-b022790f232a', CAST(N'2017-11-26T00:00:00.000' AS DateTime), CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'6')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'3d0cabd4-e4ed-444f-ba0a-4d08eb2bcf28', CAST(N'2017-11-28T00:00:00.000' AS DateTime), CAST(N'2017-11-28T00:00:00.000' AS DateTime), N'7')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'3da05c87-3e7a-48db-a770-e3a6888646ac', CAST(N'2017-11-30T00:00:00.000' AS DateTime), CAST(N'2017-11-30T00:00:00.000' AS DateTime), N'8')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'4fa75d87-af70-4688-913e-a77b12e4202f', CAST(N'2017-12-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'9')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'b587e4a7-dc1e-48c7-9adc-5ecca931d6c9', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'10')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'b8f31f52-e669-4edb-be0f-4c97289ffc96', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'11')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'130cf8bd-1f57-44dd-8c92-1b8036cca2fb', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'12')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'f79115c8-fd33-4fa5-af6d-ac9101fa7d2e', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'13')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'03d1cf21-800c-4ed1-8810-62d408cb7e3a', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'14')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'df8357ee-2e2b-4f0f-957d-241134c9a674', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'15')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1f2cfaed-d52c-4a22-882e-58aa5a2a4115', CAST(N'2017-12-03T00:00:00.000' AS DateTime), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'16')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'036c4008-7f9a-446d-be20-241be49de396', CAST(N'2017-12-07T00:00:00.000' AS DateTime), CAST(N'2017-12-07T00:00:00.000' AS DateTime), N'17')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'7555fd27-aa0e-4cc1-940a-7c39bb90fd4c', CAST(N'2017-12-07T00:00:00.000' AS DateTime), CAST(N'2017-12-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'4dee6ef4-52c3-4445-b4cc-c35fa7cf186d', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime), N'19')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'311dbc26-dcb0-430d-acc4-3c8da4a88ff8', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime), N'20')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'3446194a-1b98-47bf-99f3-379c8b83116b', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime), N'21')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'1b01dc5e-1f45-4896-960d-d973a9b9ab35', CAST(N'2017-12-08T00:00:00.000' AS DateTime), CAST(N'2017-12-08T00:00:00.000' AS DateTime), N'22')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'83602713-a3ab-43c4-a43d-c88920ce1fea', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'23')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'd48f43e3-3475-4ef4-b45b-d4b8e6bb41ef', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'24')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'4bfe812a4d4f4424a050a06939fbe028', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'25')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'6DE6B555D45A4123B9E17CD804A721DF', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'26')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'3B4CB4287CB94A738D620F49B41B5B6F', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'27')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'311C868FF69E44C8BE4332E5FD10B3C7', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'28')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'D127188B51B24F89BB450CE82C0C60CC', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'29')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(30 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'0D38516A8D664A4A8A11AC204B778963', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'30')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(31 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'B3097436421340A88FD90AB08AE5C472', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'31')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(32 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'BB32028C05BB4D17A3D23315D601BA58', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'32')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(33 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'BD677BD183674A44ACFF7DC811D9E79C', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'33')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(34 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'343E98DB09014E86AC2C78875CF71355', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'34')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(35 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'27ADDAB863994FD4AD1D3F5E3E04BADF', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'35')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(36 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'D9BD92BB2D7E4A57BEA3284601495144', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'36')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(37 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'1866518486804867B44843009F07972E', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'37')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(38 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'3D1D19B88C1549039CE19B13F89014B6', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'38')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(39 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'93FD145120334C3C962726F33CE8A6CD', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'39')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(40 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'5764079F1A0D411F81F1011AC47A11E8', CAST(N'2017-12-10T00:00:00.000' AS DateTime), CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'40')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(41 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'5BDDA3AEF58A4BFBA270C1A81423A811', CAST(N'2017-12-11T00:00:00.000' AS DateTime), CAST(N'2017-12-11T00:00:00.000' AS DateTime), N'41')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(42 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'6D7E33EF95DA4A62A48A134063562571', CAST(N'2017-12-11T00:00:00.000' AS DateTime), CAST(N'2017-12-11T00:00:00.000' AS DateTime), N'42')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(43 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'70D6D683F0BD48A69218FC368D2CE65B', CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'43')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(44 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'C83614649CF94145BE5738D2E4BC532F', CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'44')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(45 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'1C1CBAC3AAF14FC8ACD6A5B91037C0D6', CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'45')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(46 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'DDFDD9A2A9A8453789943D1D9491F51F', CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'46')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(47 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'67208D51A0324AAC9BD7B6CBDC6060C8', CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'47')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(48 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'61B1187BC3914BDAB367D4815149226A', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'48')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(49 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'946CAA4D039B458098AE2912B0EB0749', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'49')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(50 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'465EC7E9A73F48EFA724E081C6C1E344', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'50')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(51 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'184E436FA19749AB899AAF0EEECF69D8', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'51')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(52 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'036B76600C26411BA66283DE2A735035', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'52')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(53 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'9CB6025981D54EBF8C4A8ADCFA00A52E', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'53')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(54 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'8C800AEC7EE2441586558B11EB617DC7', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'54')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(55 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'CFF2033F0B7C41279A1E07A3E84ACCE9', CAST(N'2017-12-13T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), N'55')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(56 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'5039E977F8B44210859E88CE1CF92879', CAST(N'2017-12-15T00:00:00.000' AS DateTime), CAST(N'2017-12-15T00:00:00.000' AS DateTime), N'56')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(57 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'09B4E487EDC7417BA695CCAF4756788A', CAST(N'2017-12-15T00:00:00.000' AS DateTime), CAST(N'2017-12-15T00:00:00.000' AS DateTime), N'57')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(58 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'13CEBCF6D8344D90A3BD611E8973F78E', CAST(N'2017-12-15T23:35:26.290' AS DateTime), CAST(N'2017-12-15T23:35:26.290' AS DateTime), N'58')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(59 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'1CEFC95A5F4C4C5C855A6421CEB00288', CAST(N'2017-12-15T23:35:57.573' AS DateTime), CAST(N'2017-12-15T23:35:57.573' AS DateTime), N'59')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(60 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'4554F9D976314A8485BFF8E085B971D9', CAST(N'2017-12-16T00:00:14.947' AS DateTime), CAST(N'2017-12-16T00:00:14.947' AS DateTime), N'60')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(61 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'9BC456BE6DDB4D82B2D0BB04EAD37136', CAST(N'2017-12-16T00:27:38.163' AS DateTime), CAST(N'2017-12-16T00:27:38.163' AS DateTime), N'61')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(62 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'6D02E2BC92B44BA886BEC798D56F4985', CAST(N'2017-12-16T23:51:05.773' AS DateTime), CAST(N'2017-12-16T23:51:05.773' AS DateTime), N'62')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(63 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'02F3E0EE12D149A8A6CE63E287E6086C', CAST(N'2017-12-16T23:54:57.150' AS DateTime), CAST(N'2017-12-16T23:54:57.150' AS DateTime), N'63')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(64 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'508604F4F06A41F78A2A57DAEE604195', CAST(N'2017-12-16T23:59:18.170' AS DateTime), CAST(N'2017-12-16T23:59:18.170' AS DateTime), N'64')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(65 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'709B7665BFA547C78097ED3F4CBC95D8', CAST(N'2017-12-17T00:00:47.640' AS DateTime), CAST(N'2017-12-17T00:00:47.640' AS DateTime), N'65')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(66 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'C3ADA6C634CE4CE494A8DD4CFE56892B', CAST(N'2017-12-17T00:02:00.150' AS DateTime), CAST(N'2017-12-17T00:02:00.150' AS DateTime), N'66')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(67 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'FBCAF4A0A4F44E779E92FB54736FE8EC', CAST(N'2017-12-17T00:06:05.697' AS DateTime), CAST(N'2017-12-17T00:06:05.697' AS DateTime), N'67')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(68 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'FBBBFE3C012F4480BA99916A062CFD5B', CAST(N'2017-12-17T20:50:31.863' AS DateTime), CAST(N'2017-12-17T20:50:31.863' AS DateTime), N'68')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(69 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'796424DC496B43F08777597514721734', CAST(N'2017-12-17T20:53:05.163' AS DateTime), CAST(N'2017-12-17T20:53:05.163' AS DateTime), N'69')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(70 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'46BFFFBEAB1F4E6AB83A2CD2D470B56A', CAST(N'2017-12-17T20:54:25.723' AS DateTime), CAST(N'2017-12-17T20:54:25.723' AS DateTime), N'70')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(71 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'3583F322EF9445F6AA89D198F58D5A49', CAST(N'2017-12-17T20:54:58.673' AS DateTime), CAST(N'2017-12-17T20:54:58.673' AS DateTime), N'71')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(72 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'ABFA190C50ED40F1AA84B388E7165004', CAST(N'2017-12-17T20:59:14.763' AS DateTime), CAST(N'2017-12-17T20:59:14.763' AS DateTime), N'72')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(73 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'083CE665CEC54F7B8C20E6AEC32A1914', CAST(N'2017-12-17T21:10:25.113' AS DateTime), CAST(N'2017-12-17T21:10:25.113' AS DateTime), N'73')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(74 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'2AD233FD895C4C85A854D485970D886C', CAST(N'2017-12-17T21:12:07.543' AS DateTime), CAST(N'2017-12-17T21:12:07.543' AS DateTime), N'74')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(75 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'E76489B7C2B84828B5243E51ED0B1B5C', CAST(N'2017-12-17T21:13:10.270' AS DateTime), CAST(N'2017-12-17T21:13:10.270' AS DateTime), N'75')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(76 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'CF729918F14B443C854E073F4E9E2483', CAST(N'2017-12-17T21:13:38.743' AS DateTime), CAST(N'2017-12-17T21:13:38.743' AS DateTime), N'76')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(77 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'E057E2546CB949FC9FA9B12F6AD916B8', CAST(N'2017-12-17T21:14:18.007' AS DateTime), CAST(N'2017-12-17T21:14:18.007' AS DateTime), N'77')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(78 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'3EC7DC57EA2E4DE98417EB8128A4FF18', CAST(N'2017-12-17T21:16:26.590' AS DateTime), CAST(N'2017-12-17T21:16:26.590' AS DateTime), N'78')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(79 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'4C4E187E03924154A372782E5DA52A75', CAST(N'2017-12-17T21:18:18.260' AS DateTime), CAST(N'2017-12-17T21:18:18.260' AS DateTime), N'79')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(80 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'B35CCE0599C942C68B0B6F5610A8D8B5', CAST(N'2017-12-17T21:25:41.963' AS DateTime), CAST(N'2017-12-17T21:25:41.963' AS DateTime), N'80')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(81 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'5614AC40200E442893E8025F98EE8754', CAST(N'2017-12-17T21:38:18.193' AS DateTime), CAST(N'2017-12-17T21:38:18.193' AS DateTime), N'81')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(82 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'F53342CF0D704FFE97E0A87546EC9876', CAST(N'2017-12-17T21:39:12.600' AS DateTime), CAST(N'2017-12-17T21:39:12.600' AS DateTime), N'82')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(83 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'494CB6B60D0140A2B149ECF89E358271', CAST(N'2017-12-17T21:46:47.890' AS DateTime), CAST(N'2017-12-17T21:46:47.890' AS DateTime), N'83')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(84 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'F6229A09B5964BA6BE0717C1C23B8B90', CAST(N'2017-12-17T21:48:15.683' AS DateTime), CAST(N'2017-12-17T21:48:15.683' AS DateTime), N'84')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(85 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'6750BC99B20540AF96564023EA92D134', CAST(N'2017-12-17T21:50:47.177' AS DateTime), CAST(N'2017-12-17T21:50:47.177' AS DateTime), N'85')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(86 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'37008B033E7B446194C3C2BEB939E328', CAST(N'2017-12-17T21:54:50.507' AS DateTime), CAST(N'2017-12-17T21:54:50.507' AS DateTime), N'86')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(87 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'4DC7445443F5470582A15D81FF4A4C5F', CAST(N'2017-12-17T21:57:17.173' AS DateTime), CAST(N'2017-12-17T21:57:17.173' AS DateTime), N'87')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(88 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'B232B12F78BB4CBD9A28EB5F60C7BE27', CAST(N'2017-12-17T22:03:14.460' AS DateTime), CAST(N'2017-12-17T22:03:14.460' AS DateTime), N'88')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(89 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'25A9C5E1980E4FBE9E5E58BC4D6236A3', CAST(N'2017-12-17T22:31:44.463' AS DateTime), CAST(N'2017-12-17T22:31:44.463' AS DateTime), N'89')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(90 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'0C4ECEDDCF224627BA820C97BD90130D', CAST(N'2017-12-17T22:32:50.163' AS DateTime), CAST(N'2017-12-17T22:32:50.163' AS DateTime), N'90')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(91 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1326FA80FFE74A21985AC76C613A62DD', CAST(N'2017-12-17T22:35:01.297' AS DateTime), CAST(N'2017-12-17T22:35:01.297' AS DateTime), N'91')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(92 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'DD45C2FEAC894585B63AE8B84C6F3AC2', CAST(N'2017-12-17T23:09:48.867' AS DateTime), CAST(N'2017-12-17T23:09:48.867' AS DateTime), N'92')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(93 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'B8E6F4065E90469A98E16E0F68DF6293', CAST(N'2017-12-17T23:24:10.850' AS DateTime), CAST(N'2017-12-17T23:24:10.850' AS DateTime), N'93')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(94 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'D299BA40C80B465C9464E848E32D59A0', CAST(N'2017-12-17T23:27:23.137' AS DateTime), CAST(N'2017-12-17T23:27:23.137' AS DateTime), N'94')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(95 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'35A9B0F0232F41A3A57970D97FF45D64', CAST(N'2017-12-18T00:24:44.763' AS DateTime), CAST(N'2017-12-18T00:24:44.763' AS DateTime), N'95')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(96 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'A3B18243EA0B48F586599951B978CE63', CAST(N'2017-12-18T00:26:24.703' AS DateTime), CAST(N'2017-12-18T00:26:24.703' AS DateTime), N'96')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(97 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'93963DFC951E4A39A40A5E3B840ED9C6', CAST(N'2017-12-18T00:29:00.103' AS DateTime), CAST(N'2017-12-18T00:29:00.103' AS DateTime), N'97')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(98 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'59DA2BF7FE974B8D844A8206C4034DC9', CAST(N'2017-12-18T21:21:57.983' AS DateTime), CAST(N'2017-12-18T21:21:57.983' AS DateTime), N'98')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(99 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'86DEE16CD3FC44E8B9B2133CE35D3809', CAST(N'2017-12-18T21:22:52.017' AS DateTime), CAST(N'2017-12-18T21:22:52.017' AS DateTime), N'99')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(100 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'06E7B4C498EA4FEC86EC6DEEBE05D5DA', CAST(N'2017-12-18T21:23:02.530' AS DateTime), CAST(N'2017-12-18T21:23:02.530' AS DateTime), N'100')
GO
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(101 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'6E040FDB2CEE47BE912FFC758F1E9A1B', CAST(N'2017-12-18T23:16:49.857' AS DateTime), CAST(N'2017-12-18T23:16:49.857' AS DateTime), N'101')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(102 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'464F9CD0F7C74CAC93FBAD4D3B7B763A', CAST(N'2017-12-18T23:58:10.950' AS DateTime), CAST(N'2017-12-18T23:58:10.950' AS DateTime), N'102')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(103 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'6DCDEA2A31654811B3761F3904D2325E', CAST(N'2017-12-19T00:02:26.477' AS DateTime), CAST(N'2017-12-19T00:02:26.477' AS DateTime), N'103')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(104 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'FF97DEBCCE2241CDB682F4059FE4F2DD', CAST(N'2017-12-19T00:04:48.597' AS DateTime), CAST(N'2017-12-19T00:04:48.597' AS DateTime), N'104')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(105 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'D6A840BE5F924074992D5A183FE0AB8C', CAST(N'2017-12-19T00:13:09.960' AS DateTime), CAST(N'2017-12-19T00:13:09.960' AS DateTime), N'105')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(106 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'DD144AE49C164AFAA224EE002D5898B4', CAST(N'2017-12-19T20:58:36.087' AS DateTime), CAST(N'2017-12-19T20:58:36.087' AS DateTime), N'106')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(107 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'D42A28152BA44A44BA0DCC8E7B74F0CD', CAST(N'2017-12-19T21:03:41.410' AS DateTime), CAST(N'2017-12-19T21:03:41.410' AS DateTime), N'107')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(108 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'D21461083B9E486FB08E5ED6074E8D6A', CAST(N'2017-12-19T21:16:26.153' AS DateTime), CAST(N'2017-12-19T21:16:26.153' AS DateTime), NULL)
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(109 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1D6003C9B25040C487A38E6346E473CF', CAST(N'2017-12-19T21:19:48.047' AS DateTime), CAST(N'2017-12-19T21:19:48.047' AS DateTime), N'109')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(110 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'565D3DD6E2A34169836314F5E6DD78D6', CAST(N'2017-12-19T21:20:28.430' AS DateTime), CAST(N'2017-12-19T21:20:28.430' AS DateTime), N'110')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(111 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'028A884E640A4DEDA2A0EF08AF450977', CAST(N'2017-12-19T21:28:23.863' AS DateTime), CAST(N'2017-12-19T21:28:23.863' AS DateTime), N'111')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(112 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'571B319EB26144A7A4E03C158B5BAEA3', CAST(N'2017-12-19T21:49:40.873' AS DateTime), CAST(N'2017-12-19T21:49:40.873' AS DateTime), N'112')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(113 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'10D6466475354E259A44D2DA8499761F', CAST(N'2017-12-19T21:50:49.123' AS DateTime), CAST(N'2017-12-19T21:50:49.123' AS DateTime), N'113')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(114 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'EC9D9BC3552B4D989A6EF3EE2011D12E', CAST(N'2017-12-19T21:57:28.107' AS DateTime), CAST(N'2017-12-19T21:57:28.107' AS DateTime), N'114')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(115 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'07A58A68650A48F2ADC97B1838900C74', CAST(N'2017-12-19T22:04:43.210' AS DateTime), CAST(N'2017-12-19T22:04:43.210' AS DateTime), N'115')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(116 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'538FFF85A8FB4F14925798D91492FB07', CAST(N'2017-12-19T22:09:16.123' AS DateTime), CAST(N'2017-12-19T22:09:16.123' AS DateTime), N'116')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(117 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'0003190408B44538BF3B7C5234412FF2', CAST(N'2017-12-19T22:10:00.717' AS DateTime), CAST(N'2017-12-19T22:10:00.717' AS DateTime), N'117')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(118 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'5BB644E608C9486EBF71432FA5503575', CAST(N'2017-12-19T22:10:28.087' AS DateTime), CAST(N'2017-12-19T22:10:28.087' AS DateTime), N'118')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(119 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'E4AECF730D2F4468AD8BF5C989F4A3F1', CAST(N'2017-12-19T22:10:57.387' AS DateTime), CAST(N'2017-12-19T22:10:57.387' AS DateTime), N'119')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(120 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'3350C7EBB345430FB16CA69CB8076550', CAST(N'2017-12-19T22:11:19.510' AS DateTime), CAST(N'2017-12-19T22:11:19.510' AS DateTime), N'120')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(121 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'9B43550EF6E44107A60E43B7FD6759D7', CAST(N'2017-12-19T22:11:38.807' AS DateTime), CAST(N'2017-12-19T22:11:38.807' AS DateTime), N'121')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(122 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'BD04A49146C84BAF8AE3BD1EA9A985AE', CAST(N'2017-12-19T22:12:54.220' AS DateTime), CAST(N'2017-12-19T22:12:54.220' AS DateTime), N'122')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(123 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'EBB70EFBD1884EC2AFC7F023F9A6C81D', CAST(N'2017-12-19T22:17:57.363' AS DateTime), CAST(N'2017-12-19T22:17:57.363' AS DateTime), N'123')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(124 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'700434F2DEC0412E93DFC53ACE613DF4', CAST(N'2017-12-19T22:24:02.080' AS DateTime), CAST(N'2017-12-19T22:24:02.080' AS DateTime), N'124')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(125 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'F6BE583DEB8147F1995EB5A295446444', CAST(N'2017-12-19T22:30:47.403' AS DateTime), CAST(N'2017-12-19T22:30:47.403' AS DateTime), N'125')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(126 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), N'DE3ED004639142F08963A568B437DE82', CAST(N'2017-12-19T23:04:04.600' AS DateTime), CAST(N'2017-12-19T23:04:04.600' AS DateTime), N'126')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(127 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'0CB5E70388214A9D85862DD3D69FD98B', CAST(N'2017-12-20T15:20:10.993' AS DateTime), CAST(N'2017-12-20T15:20:10.993' AS DateTime), N'127')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(128 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'4721108D11EC4AE2BA134D53ACE31758', CAST(N'2017-12-20T15:20:27.520' AS DateTime), CAST(N'2017-12-20T15:20:27.520' AS DateTime), N'128')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(129 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'12564E6FA3934D5C96757EB598F80267', CAST(N'2017-12-20T15:24:42.093' AS DateTime), CAST(N'2017-12-20T15:24:42.093' AS DateTime), N'129')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(130 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'F446F881CF0A4B8D94BEFDCB2C11D207', CAST(N'2017-12-20T15:29:28.970' AS DateTime), CAST(N'2017-12-20T15:29:28.970' AS DateTime), N'130')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(131 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'3120D96AE0764CD3978B0A2FDD52DD30', CAST(N'2017-12-20T15:31:15.137' AS DateTime), CAST(N'2017-12-20T15:31:15.137' AS DateTime), N'131')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(132 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'636AB9A4CA72483C8CA4E5D8CDBED820', CAST(N'2017-12-20T15:33:03.440' AS DateTime), CAST(N'2017-12-20T15:33:03.440' AS DateTime), N'132')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(133 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1DABD9461259489C98D4A14832B87909', CAST(N'2017-12-20T15:34:01.317' AS DateTime), CAST(N'2017-12-20T15:34:01.317' AS DateTime), N'133')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(134 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'95411E1C01144E528BB488446F44BDC2', CAST(N'2017-12-20T15:34:40.703' AS DateTime), CAST(N'2017-12-20T15:34:40.703' AS DateTime), N'134')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(135 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1F3570C493E54E778A65754622ECCA6C', CAST(N'2017-12-20T15:35:18.310' AS DateTime), CAST(N'2017-12-20T15:35:18.310' AS DateTime), N'135')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(136 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'47B5F017D06C4B3D8420FD0AF493AEA5', CAST(N'2017-12-20T15:37:29.347' AS DateTime), CAST(N'2017-12-20T15:37:29.347' AS DateTime), N'136')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(137 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'9436602A8EB44B07AAB7FBAE442E0947', CAST(N'2017-12-20T15:49:28.397' AS DateTime), CAST(N'2017-12-20T15:49:28.397' AS DateTime), N'137')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(138 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'3BAC7199D3494874A5CD9EE467D072D4', CAST(N'2017-12-20T15:52:44.757' AS DateTime), CAST(N'2017-12-20T15:52:44.757' AS DateTime), N'138')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(139 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'7E9F1B3F154346DF909D44D4B1051036', CAST(N'2017-12-20T23:43:29.247' AS DateTime), CAST(N'2017-12-20T23:43:29.247' AS DateTime), N'139')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(140 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'C1EA06C6840745AAA88158ECF3BF375F', CAST(N'2017-12-20T23:45:23.687' AS DateTime), CAST(N'2017-12-20T23:45:23.687' AS DateTime), N'140')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(141 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1FA4527E04E54EF3B5B427AC9EBDC8C2', CAST(N'2017-12-20T23:46:47.040' AS DateTime), CAST(N'2017-12-20T23:46:47.040' AS DateTime), N'141')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(142 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'50B54486455E4F1683ED497799C531C6', CAST(N'2017-12-20T23:48:53.863' AS DateTime), CAST(N'2017-12-20T23:48:53.863' AS DateTime), N'142')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(143 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'B39975868D21414A85378FC75E49D503', CAST(N'2017-12-24T21:28:49.770' AS DateTime), CAST(N'2017-12-24T21:28:49.770' AS DateTime), N'143')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(144 AS Numeric(18, 0)), CAST(21 AS Numeric(18, 0)), N'531E6090C86F4442BD8A5E9A51DCA599', CAST(N'2017-12-24T21:29:56.700' AS DateTime), CAST(N'2017-12-24T21:29:56.700' AS DateTime), N'144')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(145 AS Numeric(18, 0)), CAST(21 AS Numeric(18, 0)), N'5A7579609E85429EB5C7B739FE1547C4', CAST(N'2017-12-24T21:33:42.167' AS DateTime), CAST(N'2017-12-24T21:33:42.167' AS DateTime), N'145')
INSERT [dbo].[User_session] ([User_session_id], [User_login_id], [Session_key], [Creation_date], [Update_date], [logical_delete_key]) VALUES (CAST(146 AS Numeric(18, 0)), CAST(21 AS Numeric(18, 0)), N'A61BBD49105542949D61F4546800C2AB', CAST(N'2017-12-24T21:34:07.977' AS DateTime), CAST(N'2017-12-24T21:34:07.977' AS DateTime), N'146')
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Login_Id] FOREIGN KEY([User_login_Id])
REFERENCES [dbo].[User_Login] ([User_login_id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Login_Id]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_QuestionId] FOREIGN KEY([Question_Id])
REFERENCES [dbo].[Question] ([Question_Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_QuestionId]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Category1] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Category1]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Language] FOREIGN KEY([Language_Id])
REFERENCES [dbo].[Language] ([Language_Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Language]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Login] FOREIGN KEY([User_login_Id])
REFERENCES [dbo].[User_Login] ([User_login_id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Login]
GO
ALTER TABLE [dbo].[User_credential]  WITH CHECK ADD  CONSTRAINT [FK_User_credential_İndividual1] FOREIGN KEY([İndividual_id])
REFERENCES [dbo].[İndividual] ([İndividual_id])
GO
ALTER TABLE [dbo].[User_credential] CHECK CONSTRAINT [FK_User_credential_İndividual1]
GO
ALTER TABLE [dbo].[User_credential]  WITH CHECK ADD  CONSTRAINT [FK_User_credential_User_credential_type] FOREIGN KEY([User_credential_type_cd])
REFERENCES [dbo].[User_credential_type] ([User_credential_type_cd])
GO
ALTER TABLE [dbo].[User_credential] CHECK CONSTRAINT [FK_User_credential_User_credential_type]
GO
ALTER TABLE [dbo].[User_credential]  WITH CHECK ADD  CONSTRAINT [FK_User_credential_User_login_ID] FOREIGN KEY([User_login_id])
REFERENCES [dbo].[User_Login] ([User_login_id])
GO
ALTER TABLE [dbo].[User_credential] CHECK CONSTRAINT [FK_User_credential_User_login_ID]
GO
ALTER TABLE [dbo].[User_Login]  WITH CHECK ADD  CONSTRAINT [FK_User_Login_01] FOREIGN KEY([Login_state_type_cd])
REFERENCES [dbo].[Login_State_Type] ([Login_state_type_cd])
GO
ALTER TABLE [dbo].[User_Login] CHECK CONSTRAINT [FK_User_Login_01]
GO
ALTER TABLE [dbo].[User_Password]  WITH CHECK ADD  CONSTRAINT [FK_User_Password_User_01] FOREIGN KEY([User_Login_Id])
REFERENCES [dbo].[User_Login] ([User_login_id])
GO
ALTER TABLE [dbo].[User_Password] CHECK CONSTRAINT [FK_User_Password_User_01]
GO
ALTER TABLE [dbo].[User_session]  WITH CHECK ADD  CONSTRAINT [FK_User_session_User_01] FOREIGN KEY([User_login_id])
REFERENCES [dbo].[User_Login] ([User_login_id])
GO
ALTER TABLE [dbo].[User_session] CHECK CONSTRAINT [FK_User_session_User_01]
GO
