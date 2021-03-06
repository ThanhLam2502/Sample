USE [PM-FresherDB]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/1/2020 2:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cmt] [ntext] NULL,
	[UserID] [int] NULL,
	[TaskID] [int] NULL,
	[ParentID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListTask]    Script Date: 12/1/2020 2:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProjectID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ListTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListTodo]    Script Date: 12/1/2020 2:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListTodo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TaskID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ListTodo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 12/1/2020 2:08:24 PM ******/
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
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_User]    Script Date: 12/1/2020 2:08:24 PM ******/
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
/****** Object:  Table [dbo].[TaskProject]    Script Date: 12/1/2020 2:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[AttachFiles] [text] NULL,
	[Status] [int] NULL,
	[ListTaskID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Todo]    Script Date: 12/1/2020 2:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Todo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsComplete] [bit] NULL,
	[ListTodoID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Todo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/1/2020 2:08:24 PM ******/
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
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (11, N'cmt01', 1, 1, NULL, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (12, N'cmt02', 1, 1, NULL, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (15, N'cmt03', 2, 1, NULL, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2011, N'RepCmt01', 3, 1, 11, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2012, N'Rep02Cmt01', 5, 1, 11, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2013, N'<p>cmt04</p>', 10, 1, NULL, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2014, N'<p>RepCmt04_01</p>', 10, 1, 2013, NULL)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2031, N'<p>Add cmt </p>', 10, 1010, NULL, 1)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2032, N'<p>Add cmt 2</p>', 10, 1010, NULL, 0)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2033, N'<p>Add cmt 3</p>', 10, 1010, NULL, 0)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2039, N'<p>dascxzc</p>', 10, 1010, 2031, 1)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2040, N'<p>dsaczx</p>', 10, 1010, 2032, 0)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2041, N'<p>dasczxc</p>', 10, 1010, 2033, 0)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2042, N'<p>Add add</p>', 10, 1010, NULL, 1)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2043, N'<p>Add add 02</p>', 10, 1010, 2042, 0)
INSERT [dbo].[Comment] ([ID], [Cmt], [UserID], [TaskID], [ParentID], [IsDeleted]) VALUES (2044, N'<p>Add 03</p>', 10, 1010, 2042, 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[ListTask] ON 

INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (2, N'Vujs', 7, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (3, N'Doinga', 7, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (4, N'Flutter', 8, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (5, N'Examplaaaaaa', 7, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (1002, N'Flutter', 7, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (2040, N'Add Liass', 8, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (3002, N'dsada', 2022, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (3003, N'dsadwaczc', 2022, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (3004, N'dasdasd', 4044, NULL)
INSERT [dbo].[ListTask] ([ID], [Name], [ProjectID], [IsDeleted]) VALUES (3005, N'AdddAdd', 8, NULL)
SET IDENTITY_INSERT [dbo].[ListTask] OFF
SET IDENTITY_INSERT [dbo].[ListTodo] ON 

INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1, N'LTodo1', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2, N'LTodo2', 1, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (3, N'LTodo3', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (4, N'LTodo4', 2, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (5, N'LTodo5', 2, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (8, N'Ltodo6', 2, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (16, N'LTodo4', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (17, N'To doo', 2013, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (18, N'sadadwdqw', 2014, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (19, N'sadasd', 2014, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (27, N'Enter todo', 2015, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (29, N'Add to do', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (30, N'Okey Todo', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1002, N'Addd', 2023, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1003, N'dsadaw', 2023, NULL)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1004, N'sdwadxs', 2023, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1005, N'dsadsaw', 2023, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1006, N'Addd', 3013, 0)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1007, N'Add tooo dooo', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1008, N'Add Add', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1009, N'Addd', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (1010, N'Addddd', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2005, N'Add', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2006, N'add', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2007, N'addd', 1010, 0)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2008, N'Adđ', 1010, 0)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2009, N'Tu duu', 1, 1)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2010, N'Adđ', 1, 0)
INSERT [dbo].[ListTodo] ([ID], [Name], [TaskID], [IsDeleted]) VALUES (2011, N'adascsac', 1, 1)
SET IDENTITY_INSERT [dbo].[ListTodo] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo], [IsDeleted]) VALUES (7, N'Project Bb', CAST(N'2020-11-12T00:00:00.0000000' AS DateTime2), NULL, 0, 2, NULL)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo], [IsDeleted]) VALUES (8, N'Project U', CAST(N'2020-11-12T00:00:00.0000000' AS DateTime2), NULL, 0, 3, NULL)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo], [IsDeleted]) VALUES (2022, N'OOO', CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 0, 6, 1)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo], [IsDeleted]) VALUES (4044, N'Wtf', CAST(N'2020-11-23T15:07:46.0000000' AS DateTime2), NULL, 0, 7, 1)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo], [IsDeleted]) VALUES (4045, N'Clgt', CAST(N'2020-11-23T15:07:51.0000000' AS DateTime2), NULL, 0, 6, NULL)
INSERT [dbo].[Project] ([ID], [Name], [StartDate], [EndDate], [Status], [AssignTo], [IsDeleted]) VALUES (5012, N'Add New P', CAST(N'2020-11-27T11:12:52.0000000' AS DateTime2), NULL, 0, 5, NULL)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[Task_User] ON 

INSERT [dbo].[Task_User] ([ID], [UserID], [TaskID]) VALUES (1, 1, 1)
INSERT [dbo].[Task_User] ([ID], [UserID], [TaskID]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[Task_User] OFF
SET IDENTITY_INSERT [dbo].[TaskProject] ON 

INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1, N'Task 1', N'<p>dasacaczx</p><p>dsada<strong>dsadaddsacascdas</strong></p><p><strong>dasczxc</strong></p>', NULL, 1, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2, N'Task 2', N'<p>This is Task 2</p>', NULL, 0, 2, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (3, N'Task ', N'', NULL, 1, 3, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (4, N'Task 4', N'', NULL, 2, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1002, N'Test Task', N'<p><strong>Đây llaf task test</strong></p><ol><li><strong><em>Kì lạ chưa</em></strong></li><li><strong><em>He he</em></strong></li><li><strong style="font-family: Impact;"><em>sadasd</em></strong></li></ol>', NULL, 1, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1003, N'tét', N'<p>This is Tet</p>', NULL, 0, 3, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1004, N'Tessttt', N'<p>Testststststs</p>', NULL, 1, 3, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1005, N'dsasda', N'<p>sdasdsadasd</p>', NULL, 0, 3, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1006, N'Not a1aaaa', N'<p>Task leu leu</p>', NULL, 3, 2, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1007, N'xadasdasd', N'<p>aaaa</p>', NULL, 3, 2, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1008, N'AAA', N'<p>sadc.</p><p>dsadad</p>', NULL, 3, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (1010, N'Task  Leu leu', N'<p>Chinh la task</p>', NULL, 2, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2002, N'Tasad', N'<p>aa</p>', NULL, 0, 3, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2003, N'Ta da', N'<p>Bat ngo chua</p>', NULL, 0, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2004, N'La ta da', N'<p>dadad</p>', NULL, 0, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2005, N'La Ta da', N'<p>Da da da</p>', NULL, 0, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2006, N'Ki Ki', N'<p>asd</p>', NULL, 0, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2007, N'Lollll', N'<p>sad</p>', NULL, 0, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2008, N'Lai noi khong duoc nua di', N'<p>Phai duoc chu</p>', NULL, 0, 2, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2009, N'Lai noi khong duoc nua di', N'<p>Phai duoc chu</p>', NULL, 0, 2, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2010, N'Baka oni chan', N'<p>nico nico nicochan</p>', NULL, 0, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2011, N'WTF', N'<p>a</p>', NULL, 0, 3, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2012, N'OniChan', N'<p>NIco Nico</p>', NULL, 0, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2013, N'Add TThu chua', N'<p>Sao lai chay</p>', NULL, 0, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2014, N'Tassstasttt', N'<p>sdadasdasc</p>', NULL, 0, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2015, N'!Sao nhieu the nay', N'<p>sadas</p>', NULL, 0, 5, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2016, N'ABC', N'<p>asadascascz</p>', NULL, 0, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2017, N'Aasdasd', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2018, N'Ec ec ec', N'<p>dsada</p>', NULL, 3, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2019, N'Ba bich di truoc', N'<p>aaaa</p>', NULL, 3, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2020, N'Add choi choi', N'<p>dsada</p>', NULL, 2, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2021, N'Ad!', N'<p>dawdadaw</p>', NULL, 1, 2040, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2022, N'xlxlxlxl', N'<p>dadsacawdc</p>', NULL, 3, 4, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (2023, N'dasdsa', N'<p>dasdasd</p>', NULL, 1, 2040, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (3013, N'Baka Baka', N'<p>Onichan</p>', NULL, 3, 2040, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (3014, N'Tesstt', N'<p>dsadad</p>', NULL, 0, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (3015, N'Addd', N'<p>saacaxz</p>', NULL, 3, 2040, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (3016, N'Addd Addd', NULL, NULL, 0, 2, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (4013, N'Asax', N'<p>asc</p>', NULL, 0, 1002, NULL)
INSERT [dbo].[TaskProject] ([ID], [Name], [Description], [AttachFiles], [Status], [ListTaskID], [IsDeleted]) VALUES (4014, N'Du in', N'<p>saczxcsa</p>', NULL, 1, 3, NULL)
SET IDENTITY_INSERT [dbo].[TaskProject] OFF
SET IDENTITY_INSERT [dbo].[Todo] ON 

INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1, N'Tù đú', 1, 1, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2, N'Todo02', 1, 1, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (5, N'Todo04', 1, 5, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (8, N'Todo06', 1, 4, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (26, N'Thu coi', 1, 4, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (28, N'A du ghe', 0, 2, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (30, N'Chat choi nguoi doi day, duoc', 0, 2, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (39, N'Add Todo', 0, 3, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (40, N'Add Adđ', 1, 1, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (42, N'Todo 4 1', 1, 16, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (43, N'Todo 4 2', 1, 16, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (44, N'Todo 4 3', 0, 16, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (45, N'Todo 4 4', 0, 16, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (46, N'Todo 4 5', 1, 16, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (48, N'Ưtfff', 1, 17, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (49, N'sdadaw', 0, 17, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (50, N'âdsdadw', 0, 17, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (51, N'dsadad', 0, 19, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (52, N'dsaw', 0, 19, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (53, N'scaw', 0, 19, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (54, N'E todo', 0, 27, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (55, N'B todo', 1, 27, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1002, N'dasda', 0, 1002, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1003, N'sadawad', 0, 1003, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1004, N'dawdawda', 0, 1004, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1005, N'dawdasc', 0, 1004, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1006, N'dascdac', 0, 1004, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1007, N'dsada', 0, 1003, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1008, N'dsada', 0, 1003, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1009, N'dsadwdaw', 0, 1005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1010, N'đawq', 0, 1005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1011, N'dczx', 0, 1005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1012, N'dâc', 1, 1005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (1013, N'ưcdazs', 1, 1005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2002, N'sacac', 0, 2005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2003, N'sacqw', 0, 2005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2004, N'cawcxc z', 0, 2005, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2011, N'Add 1', 1, 2007, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2020, N'Addd', 1, 1009, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2021, N'Addd', 1, 1009, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2022, N'Addd', 0, 1009, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2035, N'Adđ', 0, 2008, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2036, N'ádsaczc', 1, 2008, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (2037, N'dac zưczxcz', 1, 2008, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (3002, N'Add add', 0, 2, NULL)
INSERT [dbo].[Todo] ([ID], [Name], [IsComplete], [ListTodoID], [IsDeleted]) VALUES (3003, N'addd 1', 1, 2010, NULL)
SET IDENTITY_INSERT [dbo].[Todo] OFF
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (1, N'Nguyen A', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (2, N'Tran B', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (3, N'Van C', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (4, N'Tran D', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (5, N'Ho A', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (6, N'Le F', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (7, N'Ly G', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (8, N'Truong H', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (9, N'Nhiep I', N'/assets/images/images.jpg')
INSERT [dbo].[User] ([ID], [Name], [Img]) VALUES (10, N'TL', N'/assets/images/img.jpg')
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ListTask] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ListTodo] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TaskProject] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Todo] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Comment] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Comment]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_ProjectTask] FOREIGN KEY([TaskID])
REFERENCES [dbo].[TaskProject] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_ProjectTask]
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
ALTER TABLE [dbo].[ListTodo]  WITH CHECK ADD  CONSTRAINT [FK_ListTodo_ProjectTask] FOREIGN KEY([TaskID])
REFERENCES [dbo].[TaskProject] ([ID])
GO
ALTER TABLE [dbo].[ListTodo] CHECK CONSTRAINT [FK_ListTodo_ProjectTask]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_User] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_User]
GO
ALTER TABLE [dbo].[Task_User]  WITH CHECK ADD  CONSTRAINT [FK_TaskUser_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[TaskProject] ([ID])
GO
ALTER TABLE [dbo].[Task_User] CHECK CONSTRAINT [FK_TaskUser_Task]
GO
ALTER TABLE [dbo].[Task_User]  WITH CHECK ADD  CONSTRAINT [FK_TaskUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Task_User] CHECK CONSTRAINT [FK_TaskUser_User]
GO
ALTER TABLE [dbo].[TaskProject]  WITH CHECK ADD  CONSTRAINT [FK_TaskP_ListTask] FOREIGN KEY([ListTaskID])
REFERENCES [dbo].[ListTask] ([ID])
GO
ALTER TABLE [dbo].[TaskProject] CHECK CONSTRAINT [FK_TaskP_ListTask]
GO
ALTER TABLE [dbo].[Todo]  WITH CHECK ADD  CONSTRAINT [FK_Todo_ListTodo] FOREIGN KEY([ListTodoID])
REFERENCES [dbo].[ListTodo] ([ID])
GO
ALTER TABLE [dbo].[Todo] CHECK CONSTRAINT [FK_Todo_ListTodo]
GO
