USE [master]
GO
/****** Object:  Database [FSA_Phase_1]    Script Date: 2/20/2024 3:13:16 PM ******/
CREATE DATABASE [FSA_Phase_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FSA_Phase_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FSA_Phase_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FSA_Phase_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FSA_Phase_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FSA_Phase_1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FSA_Phase_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FSA_Phase_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FSA_Phase_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FSA_Phase_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FSA_Phase_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FSA_Phase_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FSA_Phase_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FSA_Phase_1] SET  MULTI_USER 
GO
ALTER DATABASE [FSA_Phase_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FSA_Phase_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FSA_Phase_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FSA_Phase_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FSA_Phase_1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FSA_Phase_1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FSA_Phase_1] SET QUERY_STORE = OFF
GO
USE [FSA_Phase_1]
GO
USE [FSA_Phase_1]
GO
/****** Object:  Sequence [dbo].[user_permission_seq]    Script Date: 2/20/2024 3:13:16 PM ******/
CREATE SEQUENCE [dbo].[user_permission_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 50
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [FSA_Phase_1]
GO
/****** Object:  Sequence [dbo].[users_seq]    Script Date: 2/20/2024 3:13:16 PM ******/
CREATE SEQUENCE [dbo].[users_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 50
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[class]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[class_code] [varchar](255) NOT NULL,
	[approve] [varchar](255) NULL,
	[attendee] [varchar](255) NULL,
	[attendee_accepted] [int] NULL,
	[attendee_actual] [int] NULL,
	[attendee_planned] [int] NULL,
	[class_name] [varchar](255) NOT NULL,
	[created_by] [varchar](255) NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[deactivated] [bit] NOT NULL,
	[duration] [varchar](255) NOT NULL,
	[end_date] [datetime2](6) NOT NULL,
	[fsu] [varchar](255) NULL,
	[location] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime2](6) NULL,
	[review] [varchar](255) NULL,
	[start_date] [datetime2](6) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[time_from] [time](7) NULL,
	[time_to] [time](7) NULL,
	[training_program_code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_learning_day]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_learning_day](
	[id] [int] NOT NULL,
	[date] [int] NOT NULL,
	[enroll_date] [datetime2](6) NOT NULL,
	[month] [int] NOT NULL,
	[time_from] [time](7) NOT NULL,
	[time_to] [time](7) NOT NULL,
	[year] [int] NOT NULL,
	[class_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_user]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_user](
	[user_type] [varchar](255) NOT NULL,
	[class_id] [varchar](255) NOT NULL,
	[users_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC,
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[standard_output]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[standard_output](
	[output_code] [varchar](10) NOT NULL,
	[output_description] [varchar](max) NULL,
	[output_name] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[output_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[syllabus]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[syllabus](
	[topic_code] [varchar](255) NOT NULL,
	[assignment] [varchar](255) NULL,
	[assignment_lab] [varchar](255) NULL,
	[concept_lecture] [varchar](255) NULL,
	[course_objective] [varchar](5000) NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[deleted] [bit] NOT NULL,
	[number_of_day] [int] NULL,
	[exam] [varchar](255) NULL,
	[final_practice] [varchar](255) NULL,
	[final_theory] [varchar](255) NULL,
	[final] [varchar](255) NULL,
	[gpa] [varchar](255) NULL,
	[guide_review] [varchar](255) NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime2](6) NULL,
	[priority] [varchar](255) NOT NULL,
	[publish_status] [varchar](255) NOT NULL,
	[quiz] [varchar](255) NULL,
	[technical_group] [varchar](2048) NOT NULL,
	[test_quiz] [varchar](255) NULL,
	[topic_name] [varchar](255) NOT NULL,
	[topic_outline] [varchar](255) NULL,
	[training_audience] [int] NOT NULL,
	[training_principles] [varchar](max) NULL,
	[version] [varchar](255) NOT NULL,
	[user_syllabus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[syllabus_objective]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[syllabus_objective](
	[output_code] [varchar](10) NOT NULL,
	[topic_code] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[output_code] ASC,
	[topic_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[token]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[token](
	[id] [int] NOT NULL,
	[expired] [bit] NOT NULL,
	[revoked] [bit] NOT NULL,
	[token] [varchar](255) NULL,
	[token_type] [varchar](255) NULL,
	[userid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_content]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_content](
	[content_code] [int] NOT NULL,
	[topic_code] [varchar](255) NOT NULL,
	[unit_code] [int] NOT NULL,
	[content_name] [varchar](255) NULL,
	[delivery_type] [varchar](255) NOT NULL,
	[duration] [int] NOT NULL,
	[note] [varchar](255) NULL,
	[training_format] [bit] NOT NULL,
	[standard_output] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[content_code] ASC,
	[topic_code] ASC,
	[unit_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_material]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_material](
	[id] [int] NOT NULL,
	[material] [varchar](255) NOT NULL,
	[source] [varchar](max) NOT NULL,
	[content_code] [int] NOT NULL,
	[topic_code] [varchar](255) NOT NULL,
	[unit_code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_program_syllabuses]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_program_syllabuses](
	[topic_code] [varchar](255) NOT NULL,
	[deleted] [bit] NULL,
	[training_programs_code] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_code] ASC,
	[training_programs_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_programs]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_programs](
	[training_program_code] [int] IDENTITY(1,1) NOT NULL,
	[created_by] [varchar](255) NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[duration] [int] NOT NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime2](6) NULL,
	[name] [varchar](255) NOT NULL,
	[start_date] [datetime2](6) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[training_program_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_unit]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_unit](
	[topic_code] [varchar](255) NOT NULL,
	[unit_code] [int] NOT NULL,
	[day_number] [int] NOT NULL,
	[unit_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_code] ASC,
	[unit_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_permission]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_permission](
	[permission_id] [int] NOT NULL,
	[learning_material] [varchar](255) NULL,
	[role] [varchar](255) NOT NULL,
	[syllabus] [varchar](255) NULL,
	[training_program] [varchar](255) NULL,
	[user_class] [varchar](255) NULL,
	[user_management] [varchar](255) NULL,
 CONSTRAINT [PK__user_per__E5331AFAE3914F99] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_syllabus]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_syllabus](
	[id] [int] NOT NULL,
	[user_type] [varchar](255) NULL,
	[class_code] [varchar](255) NOT NULL,
	[topic_code] [varchar](255) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/20/2024 3:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[created_by] [varchar](255) NULL,
	[created_date] [datetime2](6) NULL,
	[dob] [datetime2](6) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[gender] [varchar](255) NOT NULL,
	[modified_by] [varchar](255) NULL,
	[modified_date] [datetime2](6) NULL,
	[name] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[is_active] [bit] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK__users__B9BE370F12AF3BFF] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[user_permission] ([permission_id], [learning_material], [role], [syllabus], [training_program], [user_class], [user_management]) VALUES (1, N'LEARNING_CREATE,LEARNING_VIEW,LEARNING_MODIFY,LEARNING_IMPORT', N'SUPER_ADMIN', N'SYLLABUS_CREATE,SYLLABUS_VIEW,SYLLABUS_MODIFY,SYLLABUS_IMPORT', N'TRAINING_CREATE,TRAINING_VIEW,TRAINING_MODIFY,TRAINING_IMPORT', N'CLASS_CREATE,CLASS_VIEW,CLASS_MODIFY,CLASS_IMPORT', N'USER_CREATE,USER_VIEW,USER_MODIFY,USER_IMPORT')
INSERT [dbo].[user_permission] ([permission_id], [learning_material], [role], [syllabus], [training_program], [user_class], [user_management]) VALUES (2, N'LEARNING_VIEW', N'TRAINER', N'SYLLABUS_CREATE,SYLLABUS_VIEW,SYLLABUS_MODIFY', N'TRAINING_VIEW', N'CLASS_VIEW', N'USER_VIEW')
INSERT [dbo].[user_permission] ([permission_id], [learning_material], [role], [syllabus], [training_program], [user_class], [user_management]) VALUES (3, N'LEARNING_CREATE,LEARNING_VIEW,LEARNING_MODIFY,LEARNING_IMPORT', N'CLASS_ADMIN', N'SYLLABUS_CREATE,SYLLABUS_VIEW,SYLLABUS_MODIFY,SYLLABUS_IMPORT', N'TRAINING_CREATE,TRAINING_VIEW,TRAINING_MODIFY,TRAINING_IMPORT', N'CLASS_CREATE,CLASS_VIEW,CLASS_MODIFY,CLASS_IMPORT', N'USER_VIEW')
GO
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (1, NULL, NULL, CAST(N'2003-07-10T00:00:00.0000000' AS DateTime2), N'minhnhat@gmail.com', N'Male', NULL, NULL, N'Nhat', N'abc123', N'123345678', 1, 1)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (3, N'Minh Nhat', CAST(N'2024-02-05T20:00:19.9180000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'cau@gmail.com', N'Female', N'Minh Nhat', CAST(N'2024-02-06T19:51:00.3170000' AS DateTime2), N'Hai Dang', N'123', N'123456789', 1, 2)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (4, N'Minh', CAST(N'2024-01-02T00:00:00.0000000' AS DateTime2), CAST(N'2003-01-02T00:00:00.0000000' AS DateTime2), N'dang@gmail.com', N'Male', NULL, NULL, N'Dang', N'123', N'123123123', 1, 3)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (5, N'Minh Nhat', CAST(N'2024-02-01T16:01:17.4520000' AS DateTime2), CAST(N'2024-02-01T23:00:00.0000000' AS DateTime2), N'tuan@gmail.com', N'Male', N'Minh Nhat', CAST(N'2024-02-01T16:01:17.4520000' AS DateTime2), N'Van Tuan', N'123', N'123456789', 1, 1)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (6, NULL, NULL, CAST(N'2003-07-10T00:00:00.0000000' AS DateTime2), N'toan@gmail.com', N'Female', NULL, NULL, N'Van', N'123', N'123123123', 1, 2)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (52, N'Minh Nhat', CAST(N'2024-02-05T20:11:35.6210000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'aaa@gmail.com', N'Male', N'Minh Nhat', CAST(N'2024-02-20T10:49:29.6700000' AS DateTime2), N'Em xinh', N'abcacb', N'123456789', 1, 3)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (102, N'Minh Nhat', CAST(N'2024-02-14T08:52:43.5910000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'tysonminhnhat.dev@gmail.com', N'Female', N'Minh Nhat', CAST(N'2024-02-14T08:52:43.5910000' AS DateTime2), N'Hai Dang', N'123', N'123456789', 1, 3)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (152, N'Minh Nhat', CAST(N'2024-02-14T09:06:07.6470000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'trungphuong2018@gmail.com', N'Female', N'Minh Nhat', CAST(N'2024-02-14T09:06:07.6470000' AS DateTime2), N'Trung Phuong', N'123', N'123456789', 1, 2)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (153, N'Minh Nhat', CAST(N'2024-02-14T09:07:42.1540000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'phuongtrung2018@gmail.com', N'Female', N'Minh Nhat', CAST(N'2024-02-14T09:07:42.1540000' AS DateTime2), N'Trung Phuong inh dep', N'123', N'123456789', 1, 1)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (202, N'Minh Nhat', CAST(N'2024-02-14T09:32:20.4890000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'pencachon2017@gmail.com', N'Male', N'Minh Nhat', CAST(N'2024-02-14T09:32:20.4890000' AS DateTime2), N'Minh Phúc', N'123', N'123456789', 1, NULL)
INSERT [dbo].[users] ([user_id], [created_by], [created_date], [dob], [email], [gender], [modified_by], [modified_date], [name], [password], [phone], [is_active], [role]) VALUES (252, N'Minh Nhat', CAST(N'2024-02-20T08:04:08.9060000' AS DateTime2), CAST(N'2024-03-01T23:00:00.0000000' AS DateTime2), N'nguentuan144@gmail.com', N'Male', N'Minh Nhat', CAST(N'2024-02-20T08:04:08.9060000' AS DateTime2), N'Van8 Tuan', N'123', N'123456789', 1, 2)
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FKaglcve2gb34jef34k3mkpd3u9] FOREIGN KEY([training_program_code])
REFERENCES [dbo].[training_programs] ([training_program_code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FKaglcve2gb34jef34k3mkpd3u9]
GO
ALTER TABLE [dbo].[class_learning_day]  WITH CHECK ADD  CONSTRAINT [FK4exfilpuk31n123s6wbt0yx7k] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([class_code])
GO
ALTER TABLE [dbo].[class_learning_day] CHECK CONSTRAINT [FK4exfilpuk31n123s6wbt0yx7k]
GO
ALTER TABLE [dbo].[class_user]  WITH CHECK ADD  CONSTRAINT [FKer473nqd99av2dhycnkm22n0j] FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[class_user] CHECK CONSTRAINT [FKer473nqd99av2dhycnkm22n0j]
GO
ALTER TABLE [dbo].[class_user]  WITH CHECK ADD  CONSTRAINT [FKmxw4wosuc6cmjt76so5c7hmto] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([class_code])
GO
ALTER TABLE [dbo].[class_user] CHECK CONSTRAINT [FKmxw4wosuc6cmjt76so5c7hmto]
GO
ALTER TABLE [dbo].[syllabus]  WITH CHECK ADD  CONSTRAINT [FKopo51dxkncfb8eerwygw9i6m2] FOREIGN KEY([user_syllabus])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[syllabus] CHECK CONSTRAINT [FKopo51dxkncfb8eerwygw9i6m2]
GO
ALTER TABLE [dbo].[syllabus_objective]  WITH CHECK ADD  CONSTRAINT [FK34rq0xn8ikjvm6s1cx909vx5j] FOREIGN KEY([output_code])
REFERENCES [dbo].[standard_output] ([output_code])
GO
ALTER TABLE [dbo].[syllabus_objective] CHECK CONSTRAINT [FK34rq0xn8ikjvm6s1cx909vx5j]
GO
ALTER TABLE [dbo].[syllabus_objective]  WITH CHECK ADD  CONSTRAINT [FK7qx7c1i98eg1gev2k0wq38abg] FOREIGN KEY([topic_code])
REFERENCES [dbo].[syllabus] ([topic_code])
GO
ALTER TABLE [dbo].[syllabus_objective] CHECK CONSTRAINT [FK7qx7c1i98eg1gev2k0wq38abg]
GO
ALTER TABLE [dbo].[token]  WITH CHECK ADD  CONSTRAINT [FKt38b0ovh80bxfch0tigpeki39] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[token] CHECK CONSTRAINT [FKt38b0ovh80bxfch0tigpeki39]
GO
ALTER TABLE [dbo].[training_content]  WITH CHECK ADD  CONSTRAINT [FK64slf20s3uwpioih8k3ovney4] FOREIGN KEY([topic_code], [unit_code])
REFERENCES [dbo].[training_unit] ([topic_code], [unit_code])
GO
ALTER TABLE [dbo].[training_content] CHECK CONSTRAINT [FK64slf20s3uwpioih8k3ovney4]
GO
ALTER TABLE [dbo].[training_content]  WITH CHECK ADD  CONSTRAINT [FKo9c27ric658vkgrbkn3j2qljv] FOREIGN KEY([standard_output])
REFERENCES [dbo].[standard_output] ([output_code])
GO
ALTER TABLE [dbo].[training_content] CHECK CONSTRAINT [FKo9c27ric658vkgrbkn3j2qljv]
GO
ALTER TABLE [dbo].[training_material]  WITH CHECK ADD  CONSTRAINT [FKtc7y3qvysjvkmkf876ths1kni] FOREIGN KEY([content_code], [topic_code], [unit_code])
REFERENCES [dbo].[training_content] ([content_code], [topic_code], [unit_code])
GO
ALTER TABLE [dbo].[training_material] CHECK CONSTRAINT [FKtc7y3qvysjvkmkf876ths1kni]
GO
ALTER TABLE [dbo].[training_program_syllabuses]  WITH CHECK ADD  CONSTRAINT [FKeewyxlpaufghwymow9ruk79q9] FOREIGN KEY([topic_code])
REFERENCES [dbo].[syllabus] ([topic_code])
GO
ALTER TABLE [dbo].[training_program_syllabuses] CHECK CONSTRAINT [FKeewyxlpaufghwymow9ruk79q9]
GO
ALTER TABLE [dbo].[training_program_syllabuses]  WITH CHECK ADD  CONSTRAINT [FKs3xhqbdvndb9l1wquu4mg2v8] FOREIGN KEY([training_programs_code])
REFERENCES [dbo].[training_programs] ([training_program_code])
GO
ALTER TABLE [dbo].[training_program_syllabuses] CHECK CONSTRAINT [FKs3xhqbdvndb9l1wquu4mg2v8]
GO
ALTER TABLE [dbo].[training_programs]  WITH CHECK ADD  CONSTRAINT [FKoc648me5psmb66hjbgb9u32lj] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[training_programs] CHECK CONSTRAINT [FKoc648me5psmb66hjbgb9u32lj]
GO
ALTER TABLE [dbo].[training_unit]  WITH CHECK ADD  CONSTRAINT [FKt4px0lple6ogeyxoygtwpsweq] FOREIGN KEY([topic_code])
REFERENCES [dbo].[syllabus] ([topic_code])
GO
ALTER TABLE [dbo].[training_unit] CHECK CONSTRAINT [FKt4px0lple6ogeyxoygtwpsweq]
GO
ALTER TABLE [dbo].[user_syllabus]  WITH CHECK ADD  CONSTRAINT [FK1ss19ce98qhuechg2fy55ybv1] FOREIGN KEY([topic_code])
REFERENCES [dbo].[syllabus] ([topic_code])
GO
ALTER TABLE [dbo].[user_syllabus] CHECK CONSTRAINT [FK1ss19ce98qhuechg2fy55ybv1]
GO
ALTER TABLE [dbo].[user_syllabus]  WITH CHECK ADD  CONSTRAINT [FK2jv65y0w0hpsj6a6rd46wdu2j] FOREIGN KEY([class_code])
REFERENCES [dbo].[class] ([class_code])
GO
ALTER TABLE [dbo].[user_syllabus] CHECK CONSTRAINT [FK2jv65y0w0hpsj6a6rd46wdu2j]
GO
ALTER TABLE [dbo].[user_syllabus]  WITH CHECK ADD  CONSTRAINT [FKkec2s35ix1tl34brt3fos2ysv] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_syllabus] CHECK CONSTRAINT [FKkec2s35ix1tl34brt3fos2ysv]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK6sstlakbgljl1fb60o0vtpl0j] FOREIGN KEY([role])
REFERENCES [dbo].[user_permission] ([permission_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK6sstlakbgljl1fb60o0vtpl0j]
GO
ALTER TABLE [dbo].[token]  WITH CHECK ADD CHECK  (([token_type]='BEARER'))
GO
ALTER TABLE [dbo].[user_permission]  WITH CHECK ADD  CONSTRAINT [CK__user_permi__role__6477ECF3] CHECK  (([role]='SUPER_ADMIN' OR [role]='CLASS_ADMIN' OR [role]='TRAINER' OR [role]='USER'))
GO
ALTER TABLE [dbo].[user_permission] CHECK CONSTRAINT [CK__user_permi__role__6477ECF3]
GO
USE [master]
GO
ALTER DATABASE [FSA_Phase_1] SET  READ_WRITE 
GO
