USE [PM-FresherDB]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/19/2020 6:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [ntext] NULL,
	[UserID] [int] NULL,
	[TaskID] [int] NULL,
	[ParentCommentID] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListTask]    Script Date: 11/19/2020 6:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_ListTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 11/19/2020 6:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Status] [int] NULL,
	[AssignTo] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTask]    Script Date: 11/19/2020 6:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[AttachFiles] [text] NULL,
	[Status] [int] NULL,
	[ListTaskID] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_User]    Script Date: 11/19/2020 6:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TaskID] [int] NULL,
 CONSTRAINT [PK_TaskUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/19/2020 6:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Img] [text] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ListTask] ON 

INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID]) VALUES (2, N'Vujs', 7)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID]) VALUES (3, N'Doing', 7)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID]) VALUES (4, N'Flutter', 8)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID]) VALUES (5, N'Xamarin', 7)
SET IDENTITY_INSERT [dbo].[ListTask] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo]) VALUES (7, N'Project B', CAST(N'2020-11-12T00:00:00.0000000' AS DateTime2), NULL, 0, 2)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo]) VALUES (8, N'Project U', CAST(N'2020-11-12T00:00:00.0000000' AS DateTime2), NULL, 0, 3)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo]) VALUES (2022, N'OOO', CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 0, 6)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo]) VALUES (2028, N'sad', CAST(N'2020-11-24T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-12T00:00:00.0000000' AS DateTime2), 0, 4)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo]) VALUES (3011, N'3031aaaa', CAST(N'2020-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-20T00:00:00.0000000' AS DateTime2), 0, 4)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectTask] ON 

INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1, N'Task 1', N'', NULL, 1, 5)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (2, N'Task 2', N'<p>This is Task 2</p>', NULL, 0, 2)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (3, N'Task 3', N'', NULL, 1, 3)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (4, N'Task 4', N'', NULL, 2, 4)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1002, N'Test Task', N'<p><strong>Đây llaf task test</strong></p><ol><li><strong><em>Kì lạ chưa</em></strong></li><li><strong><em>He he</em></strong></li><li><strong style="font-family: Impact;"><em>sadasd</em></strong></li></ol>', NULL, 1, 5)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1003, N'tét', N'<p>This is Tet</p>', NULL, 0, 3)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1004, N'Tessttt', N'<p>Testststststs</p>', NULL, 1, 3)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1005, N'dsasda', N'<p>sdasdsadasd</p>', NULL, 0, 5)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1006, N'Not a1aaaa', N'<p>Task leu leu</p>', NULL, 3, 2)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1007, N'xadasdasd', N'<p>aaaa</p>', NULL, 3, 2)
INSERT [dbo].[ProjectTask] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID]) VALUES (1008, N'AAA', N'<p>sadc.</p><p>dsadad</p>', NULL, 3, 5)
SET IDENTITY_INSERT [dbo].[ProjectTask] OFF
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (1, N'A', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (2, N'B', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (3, N'C', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (4, N'D', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (5, N'E', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (6, N'F', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (7, N'G', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (8, N'H', NULL)
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (9, N'I', NULL)
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_TaskUser] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task_User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_TaskUser]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[ListTask]  WITH CHECK ADD  CONSTRAINT [FK_ListTask_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[ListTask] CHECK CONSTRAINT [FK_ListTask_Project]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_User] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_User]
GO
ALTER TABLE [dbo].[ProjectTask]  WITH CHECK ADD  CONSTRAINT [FK_TaskP_ListTask] FOREIGN KEY([ListTaskID])
REFERENCES [dbo].[ListTask] ([ID])
GO
ALTER TABLE [dbo].[ProjectTask] CHECK CONSTRAINT [FK_TaskP_ListTask]
GO
ALTER TABLE [dbo].[Task_User]  WITH CHECK ADD  CONSTRAINT [FK_TaskUser_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[ProjectTask] ([ID])
GO
ALTER TABLE [dbo].[Task_User] CHECK CONSTRAINT [FK_TaskUser_Task]
GO
ALTER TABLE [dbo].[Task_User]  WITH CHECK ADD  CONSTRAINT [FK_TaskUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Task_User] CHECK CONSTRAINT [FK_TaskUser_User]
GO
