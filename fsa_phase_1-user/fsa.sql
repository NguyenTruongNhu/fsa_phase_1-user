create database FSA_Phase_1

USE [FSA_Phase_1]
GO
/****** Object:  Table [dbo].[class]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_learning_day]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_user]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[standard_output]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[syllabus]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[syllabus_objective]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[token]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_content]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_material]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_program_syllabuses]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_programs]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_unit]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_permission]    Script Date: 1/30/2024 10:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_permission](
	[permission_id] [int] NOT NULL,
	[learning_material] [varbinary](255) NULL,
	[role] [varchar](255) NOT NULL,
	[syllabus] [varbinary](255) NOT NULL,
	[training_program] [varbinary](255) NOT NULL,
	[user_class] [varbinary](255) NOT NULL,
	[user_management] [varbinary](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_syllabus]    Script Date: 1/30/2024 10:00:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/30/2024 10:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[created_by] [varchar](255) NOT NULL,
	[created_date] [datetime2](6) NOT NULL,
	[dob] [datetime2](6) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[gender] [varchar](255) NOT NULL,
	[modified_by] [varchar](255) NOT NULL,
	[modified_date] [datetime2](6) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[user_permission]  WITH CHECK ADD CHECK  (([role]='SUPER_ADMIN' OR [role]='CLASS_ADMIN' OR [role]='TRAINER' OR [role]='USER'))
GO
