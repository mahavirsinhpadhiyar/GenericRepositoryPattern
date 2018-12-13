USE [SpotLight]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 12-13-2018 14:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyName] [varchar](200) NULL,
	[CompanyAddressLine] [varchar](200) NULL,
	[CompanyCity] [varchar](100) NULL,
	[CompanyProvinceId] [int] NULL,
	[CompanyPostalCode] [varchar](10) NULL,
	[CompanyPhone] [varchar](20) NULL,
	[CompanyEmail] [varchar](200) NULL,
	[SpendingAmountBalance] [money] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Companies_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyKPITransaction]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyKPITransaction](
	[Id] [uniqueidentifier] NOT NULL,
	[TransDate] [date] NULL,
	[KPIID] [uniqueidentifier] NULL,
	[PerformanceNumber] [decimal](16, 2) NULL,
 CONSTRAINT [PK_DailyKPITransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentEmployee]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentEmployee](
	[Id] [uniqueidentifier] NOT NULL,
	[DepartmentId] [uniqueidentifier] NULL,
	[EmployeeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DepartmentPeople] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [uniqueidentifier] NOT NULL,
	[DivisionId] [uniqueidentifier] NULL,
	[Department] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Departments_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Divisions](
	[Id] [uniqueidentifier] NOT NULL,
	[Division] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Divisions_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [uniqueidentifier] NOT NULL,
	[EmployeeFirstName] [varchar](100) NULL,
	[EmployeeMiddleInitial] [nvarchar](100) NULL,
	[EmployeeLastName] [varchar](100) NULL,
	[EmployeeEmail] [varchar](200) NULL,
	[PeopleJobTitleId] [uniqueidentifier] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Peoples_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[Id] [uniqueidentifier] NOT NULL,
	[JobTitle] [varchar](150) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_JobTitles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPIs]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIs](
	[Id] [uniqueidentifier] NOT NULL,
	[StrategicObjectiveId] [uniqueidentifier] NULL,
	[KPI] [varchar](200) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_KPIs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [uniqueidentifier] NOT NULL,
	[LanguageFullName] [varchar](50) NULL,
	[LanguageCultureName] [varchar](50) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerformanceIndicator]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerformanceIndicator](
	[Id] [uniqueidentifier] NOT NULL,
	[TeamId] [uniqueidentifier] NULL,
	[KPIId] [uniqueidentifier] NULL,
	[Target] [numeric](18, 4) NULL,
	[FrequencyId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PerformanceIndiocator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerformanceInitiative]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerformanceInitiative](
	[Id] [uniqueidentifier] NOT NULL,
	[DeptId] [uniqueidentifier] NULL,
	[PerformanceInitiativeName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Segments_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrategicObjectives]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrategicObjectives](
	[Id] [uniqueidentifier] NOT NULL,
	[PerformanceInitiativeId] [uniqueidentifier] NULL,
	[StrategicObjectives] [varchar](200) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_StrategicObjectives_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TargetFrequency]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TargetFrequency](
	[Id] [uniqueidentifier] NOT NULL,
	[TargetFrequency] [varchar](100) NULL,
 CONSTRAINT [PK_TargetFrequency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Targets]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Targets](
	[Id] [uniqueidentifier] NOT NULL,
	[TeamId] [uniqueidentifier] NULL,
	[KPIID] [uniqueidentifier] NULL,
	[Target] [decimal](16, 2) NULL,
	[UOMId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Targets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamManagement]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamManagement](
	[Id] [uniqueidentifier] NOT NULL,
	[TeamName] [nvarchar](250) NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TeamManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[Id] [uniqueidentifier] NOT NULL,
	[TeamId] [uniqueidentifier] NULL,
	[EmployeeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [uniqueidentifier] NOT NULL,
	[DepartmentId] [uniqueidentifier] NULL,
	[TeamName] [varchar](200) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UOMs]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UOMs](
	[Id] [uniqueidentifier] NOT NULL,
	[UOM] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UOMs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Role] [varchar](100) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NULL,
	[UserName] [varchar](200) NULL,
	[UserFirstName] [varchar](100) NULL,
	[UserLastName] [varchar](100) NULL,
	[UserEmail] [varchar](200) NULL,
	[LanguageId] [uniqueidentifier] NULL,
	[RoleId] [uniqueidentifier] NULL,
	[Password] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'a794d899-2984-4dc2-8182-000ee066dd88', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'b371d84d-3a6c-468c-89a0-08292812bef4')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'e28dcb08-dab1-4f77-999c-00d8b0413a88', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'01c7887c-93c6-43b1-b9c4-01e93f3e9b7f', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'98d0adc6-aca4-4a77-af7b-bbd0d7cd688f')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'49da39e6-563b-43c5-93ce-01f12e9f0236', N'e482b742-e050-4310-95b8-632d836d739c', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5371c0ec-7e1b-42a1-a2a8-0840552cd0fd', N'f9660acf-baee-4da6-adee-810271f5a444', N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'edbda5de-8b6f-406f-a96e-0ab71e9522d5', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'98d0adc6-aca4-4a77-af7b-bbd0d7cd688f')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'a8b6a53d-5e0c-4043-b4e9-0b5678284efe', N'7a8748af-fb6d-40ec-b7dc-60b86838c4ea', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'08c19fc4-e40a-4086-b29f-0bbffb96ecf5', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'9114fe6e-8673-46ec-9355-0d60ef74e437', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'74f7e1c2-a467-40bd-a025-0e3731ac5641', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'eff51669-74b1-4c8d-ba88-11db630b337c', N'f9660acf-baee-4da6-adee-810271f5a444', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c55c714a-d94d-4e57-9c25-1216bf8e2ab5', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'abaacbd5-0db4-46d8-9a74-1ab3581ae454')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'db3203ca-f7cd-4de6-b336-1370ecfc85b7', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'abaacbd5-0db4-46d8-9a74-1ab3581ae454')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'14032693-4a6a-4c51-ac4b-18e402130b57', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'ee26a06b-a004-4db6-8f60-6a89d697b50a')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'eec5dc34-510a-4c30-b222-1a00000ae6af', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'6ce43854-c09d-4d2a-bcaf-1b7d20b54506', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'19d93f1c-ac2b-4946-97e4-39b535849797')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'878587e6-c81e-4304-9c04-1c5e6df6ea4e', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'd065043c-49f8-4f35-b780-212194507141', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'db72d159-e1ac-47df-afc5-21721b4e28f8', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'15d25274-4937-47de-bd7d-916fbd753f04')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'30333b81-1ee9-41fd-bfcc-22a2bb350ff4', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'89487a49-f41a-4f25-b778-2315eee2f743', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'4ccc3eca-89a4-49de-bbfa-234d658c7613', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'19d93f1c-ac2b-4946-97e4-39b535849797')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'08e456e6-ab59-4b32-8df3-257cc40ed9c9', N'35d66cc1-1a09-4de2-bf12-ef4cdace4671', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1eb4ec50-1ab2-4373-8c76-2831186ab82a', N'f9660acf-baee-4da6-adee-810271f5a444', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'003d34e3-1c6a-4ec5-a3d9-2a65d81cb41a', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'8012e74b-df62-46e7-92a5-2da6723fde2d', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'18108790-ef37-40aa-b95c-f5cd76d9d6a1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'056182a2-7af3-4eae-9f5b-3064db930c59', N'f9660acf-baee-4da6-adee-810271f5a444', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'edefa473-35c1-4282-9539-309615c739f2', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'3b8eb464-57db-4c74-9ed7-30a86519fbdf', N'a82a8046-773b-4c06-9a24-36330f04297e', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1e58d104-39c6-4fca-b706-30d63c201c8d', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'ca7e6e74-c70c-4a58-8538-f3627d2e17f2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'fc1a321b-3f35-4846-95c7-324d9f4b4535', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'15d25274-4937-47de-bd7d-916fbd753f04')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'8072ad80-0d2e-4c5b-b7a1-338d69ae15d2', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5378d718-1abb-42be-917b-33a9ceb836ca', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c00645c1-87c3-4ea9-b067-34705115d554', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'40917e3f-eda7-4df5-adaa-34c19cec782b', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'428ba634-4afc-47b8-8364-50cbf9ec8c13')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c80abd00-3d3d-4f59-a402-377b7404ba3c', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'32420dc3-5055-4a90-9424-3790c6a79455', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'ee26a06b-a004-4db6-8f60-6a89d697b50a')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'12aba2e1-7d73-4a90-a59b-38103d3e7d5f', N'f9660acf-baee-4da6-adee-810271f5a444', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'95b6c9d4-073e-4be6-b331-38f75a6277cf', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'18108790-ef37-40aa-b95c-f5cd76d9d6a1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'8fb95598-d985-4427-8efd-39349956f819', N'f9660acf-baee-4da6-adee-810271f5a444', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'26c84de2-0183-489e-831e-3abc788c3127', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'32d0bc05-ba3e-4418-8f8c-3b7258330052', N'f9660acf-baee-4da6-adee-810271f5a444', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5ab112e7-9cf1-4b7a-bf2b-3c00676902c3', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'7a45fe57-bd10-4f76-b4e6-3d786d44bca7', N'35d66cc1-1a09-4de2-bf12-ef4cdace4671', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5520514d-4305-432f-a10d-3ec3841a3e80', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c2e35dde-9158-492e-9d91-3ee0730ab24c', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'428ba634-4afc-47b8-8364-50cbf9ec8c13')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'4774c4f9-f77c-4988-bffb-4017eedc5b18', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'51a5bd9d-53d7-4c59-b413-4038a0aacbef', N'f9660acf-baee-4da6-adee-810271f5a444', N'6e66a606-2000-43ad-b60e-c720ae6e1ff8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'617661b5-26fb-4951-a01d-41a8d1b52eba', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'016f36c1-fce0-4854-9b15-420f40ec9ced', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'15d25274-4937-47de-bd7d-916fbd753f04')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'ab20f93b-d30d-4bb5-bdd2-47fc7bf733fc', N'f9660acf-baee-4da6-adee-810271f5a444', N'd7f31c95-33b5-4f65-b0c9-4f6fd4789321')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'058b9722-dd9c-4ce5-8036-480869018820', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5128bd59-6b87-499d-8758-48ae684ededf', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'854ce3b1-2c9b-4f49-93e5-4f553768b245', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1f40e56c-5fe6-4c5e-941b-4f58984be7ef', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'ca7e6e74-c70c-4a58-8538-f3627d2e17f2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'872a376f-2326-4326-ae48-506b80caca32', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'428ba634-4afc-47b8-8364-50cbf9ec8c13')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'161f2282-74b2-4ada-bde1-51026076f76d', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'ee26a06b-a004-4db6-8f60-6a89d697b50a')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'509d2a02-b243-46a5-a7f6-51070b2e3e39', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'9e58b76a-9430-4bb4-9825-5234eb0c5c83', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'947d9010-50f8-44a4-bf08-54ccb5b5bcee', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'63298148-ebd8-4db7-9f94-54e344ddca57', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'123d07d5-6ebd-4447-ad27-57aef2cd0567', N'f9660acf-baee-4da6-adee-810271f5a444', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'66f247fe-0ca0-4c68-b480-57bb106e9209', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'15d25274-4937-47de-bd7d-916fbd753f04')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0e34e38f-d8cf-4cfd-9b4b-5964d4508465', N'f9660acf-baee-4da6-adee-810271f5a444', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'a2179ca3-f56e-4164-8276-597eb723e6c0', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c0b15e26-cdc2-49ae-b5ed-5a27c55ac196', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'e83e3dfb-2e50-4147-adf0-5ac78b44f955', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5bbe13e0-d3e1-4e21-a324-5b7e61c89b71', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'9c5df7ee-520e-4650-b87b-5c717bd6c9d1', N'f9660acf-baee-4da6-adee-810271f5a444', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'64946d82-7dfc-4478-8573-5d415f55bfad', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f2fa9b62-267b-43ca-8425-5d564abb0464', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'e3d937f0-c02a-4f9c-b321-3055d9930c60')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'bc6f73b3-c240-454c-bcb0-5d685c4f2357', N'20facffa-c1aa-429a-b3a9-bf3114b2fa86', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5555e781-88be-4020-8d18-5efc6db20268', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1d4386b6-32a9-4e8c-9713-5f26a66779bd', N'f9660acf-baee-4da6-adee-810271f5a444', N'428ba634-4afc-47b8-8364-50cbf9ec8c13')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0adc5311-4825-4130-a4da-5f9f86764898', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'b264a927-3fa6-48d1-9447-61fe6136ffd7', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'2a516879-470b-4d91-8220-626ec200acac', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'11e138de-bed4-462b-8aea-63baea3cbc0f', N'f9660acf-baee-4da6-adee-810271f5a444', N'6efbd5be-3859-408a-853a-b415525b45d2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'df15fb9b-d1bd-4e7a-8b5a-64197feed97b', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5b3c68bd-2eea-404f-9f86-660c945c8e02', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'd7f31c95-33b5-4f65-b0c9-4f6fd4789321')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'b28c6a8e-4169-4064-a799-6614c5bba9ea', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'6efbd5be-3859-408a-853a-b415525b45d2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'66716495-529d-49f5-a218-6699be6d653d', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'db8c18cc-050b-499a-8986-6731fde123ad', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'19d93f1c-ac2b-4946-97e4-39b535849797')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f8c4f22d-0372-4553-b252-684364a28530', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'874096cb-b21c-4493-8158-6b4fe8e4c2bd', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'b371d84d-3a6c-468c-89a0-08292812bef4')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'7c0f1316-ffb6-4dba-bcd0-6c2166f878bf', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'33f4e612-6344-40df-b156-6ce264fff70e', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'abaacbd5-0db4-46d8-9a74-1ab3581ae454')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f978ef3e-3b09-4114-9ae5-6d2035af3c5b', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'd7e6ab01-544b-4c6a-a5cb-70addf1c1c4f', N'f9660acf-baee-4da6-adee-810271f5a444', N'15d25274-4937-47de-bd7d-916fbd753f04')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0fa4880c-b88f-4de6-8722-733a18f1e6cd', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'458f7e7b-1268-4d53-aa6e-7a1967a96996', N'f9660acf-baee-4da6-adee-810271f5a444', N'ee26a06b-a004-4db6-8f60-6a89d697b50a')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'86dc7d50-f4ea-4dd6-81eb-7b00b16c7c11', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'ee26a06b-a004-4db6-8f60-6a89d697b50a')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'09ff0772-1866-45bd-926f-7b9dcaf606d1', N'f9660acf-baee-4da6-adee-810271f5a444', N'b371d84d-3a6c-468c-89a0-08292812bef4')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'ca3aaef6-abf6-49f9-8bfc-7bbd2be2dd8f', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'19d93f1c-ac2b-4946-97e4-39b535849797')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5c445518-ddb4-4557-8c7e-7c6d0516f3a1', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605', N'b371d84d-3a6c-468c-89a0-08292812bef4')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'6c14b5c1-5b01-4783-92b2-8092faff9dae', N'f9660acf-baee-4da6-adee-810271f5a444', N'98d0adc6-aca4-4a77-af7b-bbd0d7cd688f')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f0e57c51-6113-4b36-9cfd-814bdaa066a7', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'2d2a6330-ceb9-4ca6-a5bd-85ba8fb4272a', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'6e66a606-2000-43ad-b60e-c720ae6e1ff8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'24c98458-08b3-4c85-b75f-8847683e5530', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'e3d937f0-c02a-4f9c-b321-3055d9930c60')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'b679c1e4-6eaa-49f3-b00e-8f151411b9c4', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'422ed7c2-7200-4436-809a-919c9399958d', N'f9660acf-baee-4da6-adee-810271f5a444', N'18108790-ef37-40aa-b95c-f5cd76d9d6a1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0222c134-963b-4ba7-98ad-926c86f1f1f1', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5c95e201-50d9-46ef-9ee6-934c0c247909', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'81fc07f8-a72e-4a6a-ac91-93ac67964f80', N'f9660acf-baee-4da6-adee-810271f5a444', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'2d120994-1f74-4c92-9d4d-9409851deeb3', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'573a9120-d4ea-4b97-9a53-954b13c7b9b1', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'af027245-6f0c-4340-aac2-9823f405fe87', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'89b84efc-75de-4a8d-92aa-9869f9248705', N'9206499a-54a7-48eb-9851-e172f9193861', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'ac433f4a-eeac-4ebd-a429-9ae399483f7a', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'6e66a606-2000-43ad-b60e-c720ae6e1ff8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'91bde857-cbdd-431f-ba1c-9dc1706c2f2e', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'63a39ac9-f6c1-421e-a24a-9e2a355ba12f', N'35d66cc1-1a09-4de2-bf12-ef4cdace4671', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'580f3932-1e50-4439-b66f-9f7c2c26ba1c', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'de68ca6d-22a2-4160-8126-a00e7dae3894', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'b371d84d-3a6c-468c-89a0-08292812bef4')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'377ae27f-b035-403f-942b-a0e221d52b1f', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'6efbd5be-3859-408a-853a-b415525b45d2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'ec71083c-9081-4c57-b190-a57150a1fc45', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'874880ab-f438-47b5-835e-a76567f15509', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'afd6dac4-2a16-4e02-941d-ae3dd322a30d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'862f1b5c-44de-4892-9a91-a7f8e20e90d6', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'ef71e7bb-8658-4dbb-a1cd-2b2aa881c6eb')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'8da6aeac-d982-49b1-8775-aa73349985e8', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'46172a0e-281d-4f4f-8f86-ab67f6bea582', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'afd6dac4-2a16-4e02-941d-ae3dd322a30d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'cb0ca628-219f-4f23-8f63-aba7fa0e562d', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'15d25274-4937-47de-bd7d-916fbd753f04')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'87b1ac24-4bd2-4c99-8d9d-adcf615e4d0a', N'5db9b1f2-eaef-492c-9672-2404049441ff', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'932e55c6-f1f6-42e8-b05d-add035e4c60c', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'b371d84d-3a6c-468c-89a0-08292812bef4')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'49c53081-2e3d-4e9a-a5a8-aef1823558aa', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'b138589d-f41e-4523-8703-af64432ccca8', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'abaacbd5-0db4-46d8-9a74-1ab3581ae454')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f50e97b7-6c1d-4839-97e9-b4eac566af87', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'4b6eb0e5-b5fa-4734-afbc-b6e676d8917b', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'ef71e7bb-8658-4dbb-a1cd-2b2aa881c6eb')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5e3eb106-5f86-450d-b49d-b87d37cca08a', N'9206499a-54a7-48eb-9851-e172f9193861', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'39da82c6-3641-4072-9861-ba2cb115160b', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'52a5a448-e9f4-4797-9f32-bbe6f781d5df', N'f9660acf-baee-4da6-adee-810271f5a444', N'ef71e7bb-8658-4dbb-a1cd-2b2aa881c6eb')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1a4559ea-2bd0-4c94-a517-bcc5ea45fd61', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'6e66a606-2000-43ad-b60e-c720ae6e1ff8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1a914a85-83f3-4fe5-9c11-bcf3bdadbcc7', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'ef71e7bb-8658-4dbb-a1cd-2b2aa881c6eb')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'731e1d90-c577-4b09-bd34-bdddb65d4366', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'eb3143ca-d264-4e4e-86c0-be8e3e7c380e', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'4e84fbec-4ea0-4ecb-be0a-beb931441338', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'd7f31c95-33b5-4f65-b0c9-4f6fd4789321')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'b6f1a9f3-e5dc-4901-b5ca-c092c43889fa', N'f9660acf-baee-4da6-adee-810271f5a444', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'4e662767-ddb5-43ce-91cc-c23d9f049938', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'd7f31c95-33b5-4f65-b0c9-4f6fd4789321')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'9b702a0b-1e8c-41f7-b47b-c5c2ce2c4d49', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'441d3e85-1a71-402f-a4da-c8940e27373b', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'afd6dac4-2a16-4e02-941d-ae3dd322a30d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'baf04ac8-468d-4e74-88ae-ca7b98a70b54', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'6efbd5be-3859-408a-853a-b415525b45d2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0095f32b-7d43-41af-80ab-cb249222b745', N'f9660acf-baee-4da6-adee-810271f5a444', N'abaacbd5-0db4-46d8-9a74-1ab3581ae454')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'66f5778d-a388-4ef7-8f45-cc188747c55d', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605', N'428ba634-4afc-47b8-8364-50cbf9ec8c13')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'22caaeff-f864-41a2-b248-cc53014a04a2', N'9206499a-54a7-48eb-9851-e172f9193861', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'd6bd93be-fc57-4515-88db-cd2099adf58e', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'98d0adc6-aca4-4a77-af7b-bbd0d7cd688f')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'9a326d0b-a662-4032-bfc3-cf073470aa36', N'5db9b1f2-eaef-492c-9672-2404049441ff', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c18c0d79-0903-4dda-bddb-cfd96e3264bc', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'dfb2d302-8f75-4301-bb73-d0ab48ef6449', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'428ba634-4afc-47b8-8364-50cbf9ec8c13')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'2de60e01-8857-4fdb-b466-d455167c5afe', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'a46e98dc-7aa6-456c-9023-d487c85227d4', N'7a8748af-fb6d-40ec-b7dc-60b86838c4ea', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'fea78a08-1589-4c66-a435-d54b070ed48c', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'18108790-ef37-40aa-b95c-f5cd76d9d6a1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'03f66373-c7e1-4fb3-b2c0-d5bf858322a6', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f7942422-f9c4-45a6-ab04-d5d3fe0e3bf7', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'73d29fb6-4e99-4f2a-947b-d66511421c06', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'b811a2cb-7575-450e-b6ff-d69480cfdae6', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f52a20d1-dd7d-4170-9189-d6d971f7625b', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f27e16be-312b-4191-8e06-d6e52fe87156', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'ef71e7bb-8658-4dbb-a1cd-2b2aa881c6eb')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'c9373232-2834-45ed-8036-d8feaac6a709', N'f9660acf-baee-4da6-adee-810271f5a444', N'afd6dac4-2a16-4e02-941d-ae3dd322a30d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0519c5a4-f25c-4660-8af7-de53ef639ead', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'98381505-ec82-427e-8a33-ded1dea22154', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'ca7e6e74-c70c-4a58-8538-f3627d2e17f2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5dded18b-c576-4ef5-8c41-deff6c6c9780', N'f9660acf-baee-4da6-adee-810271f5a444', N'19d93f1c-ac2b-4946-97e4-39b535849797')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'e298cf05-134e-4978-95d5-df48a4654efb', N'f9660acf-baee-4da6-adee-810271f5a444', N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'00b02a58-a80b-47ad-82a5-dfbed242c080', N'f9660acf-baee-4da6-adee-810271f5a444', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'a26be3b0-17d2-46c2-aa3b-e0ea1114492d', N'060bf115-fce7-4743-aae2-40a40279c0f7', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'1bb4ff0f-bb5d-4076-ad73-e3eddcca973a', N'f9660acf-baee-4da6-adee-810271f5a444', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'9c2a6212-5e51-4284-afd0-e4b352aab63c', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'98d0adc6-aca4-4a77-af7b-bbd0d7cd688f')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'5c8db36d-a856-4a59-a684-e637f4eea9b4', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'73062cbd-0f5c-4c0a-ab3c-e6a13b27d659', N'e482b742-e050-4310-95b8-632d836d739c', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f13864a9-7489-4f55-aa5e-e72b2ef81e1f', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'ddd83f75-89ae-49d3-9d05-e89c7646f4b8', N'9206499a-54a7-48eb-9851-e172f9193861', N'890228ef-3a07-47ec-a6c9-c13e480ec260')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'f84b51ea-cfe8-44de-b956-e932cbe46e29', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'ca7e6e74-c70c-4a58-8538-f3627d2e17f2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'13eb5800-8d04-4d8b-b598-ec335b7b4db1', N'f9660acf-baee-4da6-adee-810271f5a444', N'ca7e6e74-c70c-4a58-8538-f3627d2e17f2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'e32ed953-8c81-4ee6-962f-ed85ce7b67d1', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'd7f31c95-33b5-4f65-b0c9-4f6fd4789321')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'0315c5aa-5f08-40dd-952b-f34de1a9edcd', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'3ea16e81-b500-4ce2-944c-f377d99c1981', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'7eab9992-fc4d-4f46-9c80-f478c76ee9a9', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'fec3e8cf-c7d5-4e64-881c-f50ff1648e2f', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'6e66a606-2000-43ad-b60e-c720ae6e1ff8')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'34b99703-5881-4689-b9b8-f56998295a10', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'ee26a06b-a004-4db6-8f60-6a89d697b50a')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'6f6113ea-e7fa-464c-822a-f62f697ff423', N'7e3baf07-b6ed-4c48-b792-cd82b6151827', N'afd6dac4-2a16-4e02-941d-ae3dd322a30d')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'44f096c4-2880-4990-89ca-f633647e5104', N'20facffa-c1aa-429a-b3a9-bf3114b2fa86', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'fcee11e9-cb6a-4e02-be52-f72d0a5b339f', N'f9660acf-baee-4da6-adee-810271f5a444', N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'dec7972e-0d56-4403-b509-f88fedec2b0e', N'21ea44b4-336c-486e-9584-d86b902fa3cf', N'6efbd5be-3859-408a-853a-b415525b45d2')
GO
INSERT [dbo].[DepartmentEmployee] ([Id], [DepartmentId], [EmployeeId]) VALUES (N'e461ec00-ed44-4c41-8670-fa63e2703585', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'18108790-ef37-40aa-b95c-f5cd76d9d6a1')
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'4fbd5b7e-7cf6-44ec-9076-082bf0b43f48', NULL, N'Department 4 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'fe88622a-e669-4dd8-b0b7-13a2fb57a605', NULL, N'.Net', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'5db9b1f2-eaef-492c-9672-2404049441ff', NULL, N'Department 1 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'a82a8046-773b-4c06-9a24-36330f04297e', NULL, N'Test 1', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'cffadf60-50b4-4c4f-82ba-408516c4338b', NULL, N'Department 2 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'060bf115-fce7-4743-aae2-40a40279c0f7', NULL, N'Ruby', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'7a8748af-fb6d-40ec-b7dc-60b86838c4ea', NULL, N'Department 6 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'e482b742-e050-4310-95b8-632d836d739c', NULL, N'Human Resource', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'0be84e84-e755-43f6-bd1a-66d589e81dfc', NULL, N'Test 2', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'359b4cce-e4dd-41dc-930e-775e1679ff48', NULL, N'Test 2', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'f9660acf-baee-4da6-adee-810271f5a444', NULL, N'Python', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'78e5aea2-abcd-417d-9539-837317e094ae', NULL, N'Department 3 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', NULL, N'PHP', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'4bd4587a-77e1-4bc5-9694-b8fd79253499', NULL, N'Java', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'f0169283-9875-46b6-8162-bdf210568409', NULL, N'Department 4 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'20facffa-c1aa-429a-b3a9-bf3114b2fa86', NULL, N'AXD Department update', 0)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'7e3baf07-b6ed-4c48-b792-cd82b6151827', NULL, N'Designing', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'aa5b68cc-6a2e-4591-953d-cfb016f20d16', NULL, N'Department 4 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'21ea44b4-336c-486e-9584-d86b902fa3cf', NULL, N'Testing', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'17c73a86-ec56-4949-9639-e10bca89c8de', NULL, N'Department 5 Test', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'9206499a-54a7-48eb-9851-e172f9193861', NULL, N'axd department test 1', 1)
GO
INSERT [dbo].[Departments] ([Id], [DivisionId], [Department], [IsActive]) VALUES (N'35d66cc1-1a09-4de2-bf12-ef4cdace4671', NULL, N'Android', 1)
GO
INSERT [dbo].[Divisions] ([Id], [Division], [IsActive]) VALUES (N'80d41cc2-864c-4e79-b3c9-afb2d01a2215', N'DivisionRepoTest4', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'b371d84d-3a6c-468c-89a0-08292812bef4', N'Salman', NULL, N'Khan', N'salmankhan@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'abaacbd5-0db4-46d8-9a74-1ab3581ae454', N'Krunal', NULL, N'Jhangavala', N'krunalg@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1', N'Krunal', NULL, N'Chawda', N'fh@g.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'3d066ac2-817a-4a33-b3e4-1e6903f92681', N'Deepika', NULL, N'Padukon', N'deepikapadukon@gmail.com', N'bf03b58f-a9d3-477d-85c3-7d39f76f442f', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'7b72a976-f12c-4040-9ac7-272d908173d0', N'Alpesh', NULL, N'Kalena', N'ks@gmail.com', N'bf03b58f-a9d3-477d-85c3-7d39f76f442f', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'ef71e7bb-8658-4dbb-a1cd-2b2aa881c6eb', N'Kshitij', N'Shah', N'Kalena', N'abbc@abc.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'e3d937f0-c02a-4f9c-b321-3055d9930c60', N'Mahavirsinh', NULL, N'Padhiyar', N'ggjg@g.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'19d93f1c-ac2b-4946-97e4-39b535849797', N'Pinal', NULL, N'Vaghela', N'pinalv@gmail.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'd7f31c95-33b5-4f65-b0c9-4f6fd4789321', N'Krupa', NULL, N'Chowksi', N'kc@g.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'428ba634-4afc-47b8-8364-50cbf9ec8c13', N'Serious', NULL, N'Black', N'seriousblack@hogwards.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'0ce4430c-f330-419e-a2a8-54fabd701e68', N'Harry', NULL, N'Potter', N'harrypotter@gmail.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'867dafda-f549-4bd1-9bbd-5c1673f223a8', N'Sonal', NULL, N'Patel', N'abc@g.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'a3ae8a67-3b7a-4f18-a332-65d146b586f1', N'Hardik', NULL, N'Patel', N'hardikpatel@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'ee26a06b-a004-4db6-8f60-6a89d697b50a', N'Newt', NULL, N'Schammander', N'newt@hogwards.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'2b63e0cc-002c-415c-93dd-7cab9a632aec', N'Harshal', NULL, N'Bhavsar', N'harshalbhavsar@gmail.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'ad965821-7be3-41fe-b764-8961e7ee3c8d', N'Vijay (Boby)', NULL, N'Deol', N'bobbydeol@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'15d25274-4937-47de-bd7d-916fbd753f04', N'Ranveer', NULL, N'Kapoor', N'ranveerk@gmail.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa', N'Aamir', NULL, N'Khan', N'amirkhan@gmail.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'c2fa4feb-3e27-4ac9-83e6-9dbfb32e3802', N'Rajnikant', NULL, N'Shah', N'test@gmail.com', N'bf03b58f-a9d3-477d-85c3-7d39f76f442f', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'a682c876-75d3-4d39-b20c-ad7994d0ba98', N'Albus', NULL, N'Dumbaldor', N'albusd@hogwards.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'afd6dac4-2a16-4e02-941d-ae3dd322a30d', N'Rakesh', NULL, N'Prajapati', N'info@industrialautomationrepair.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736', N'Rahul', NULL, N'Roy', N'dgdsg@g.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'6efbd5be-3859-408a-853a-b415525b45d2', N'Shah', NULL, N'Rukh Khan', N'sharukh@gmail.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'98d0adc6-aca4-4a77-af7b-bbd0d7cd688f', N'Lal', NULL, N'Bahadur Shashtri', N'lalb@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'890228ef-3a07-47ec-a6c9-c13e480ec260', N'Babul', NULL, N'Supriyo', N'bcd@g.com', N'bf03b58f-a9d3-477d-85c3-7d39f76f442f', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'6e66a606-2000-43ad-b60e-c720ae6e1ff8', N'Granzer', NULL, N'Harmaini', N'gh@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'8d9c4a22-ed85-4b0a-8aba-c817a28f1eb7', N'Testu', N'Newu', N'Employeeu', N'newemployeeu@gmail.com', N'bf03b58f-a9d3-477d-85c3-7d39f76f442f', 0)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'd0e39259-6ed0-4757-b612-e5edd5091a99', N'Alpesh', NULL, N'Thakor', N'a@g.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2', N'Rony', NULL, N'Roy', N'ronyr@gmail.com', N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'ca7e6e74-c70c-4a58-8538-f3627d2e17f2', N'Ranbeersingh', NULL, N'Bhavnani', N'ranbees@gmail.com', N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'18108790-ef37-40aa-b95c-f5cd76d9d6a1', N'Nutan', NULL, N'Navin', N'nutannavin@gmail.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[Employee] ([Id], [EmployeeFirstName], [EmployeeMiddleInitial], [EmployeeLastName], [EmployeeEmail], [PeopleJobTitleId], [IsActive]) VALUES (N'f8706180-af1e-468b-b2b5-fa3c620986a0', N'Ajay (Sunny)', NULL, N'Deol', N'sunnydeol@gmail.com', N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'6e8ba2cb-59f3-48b9-8166-2c5cd566aba4', N'Test1', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'3a60b9f5-921d-4a26-94ec-2efe3255bcc2', N'Director', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'e0511b7b-f6d0-45b4-bc75-79d4f75d4494', N'Manager', 0)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'bf03b58f-a9d3-477d-85c3-7d39f76f442f', N'AVP', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'a4c99f2d-bbcc-44ce-acc3-bcf59d5a0526', N'VP Test 1', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'667a7cf8-fcd6-439d-a3f8-be6efbc1c006', N'Senior Manager', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'9eeb0de5-e45b-4b39-a8ec-d2b674e25c82', N'Software Engineer / Developer', 1)
GO
INSERT [dbo].[JobTitles] ([Id], [JobTitle], [IsActive]) VALUES (N'ae1b5cb5-c234-4ef1-be96-df2e3830ac38', N'VP', 1)
GO
INSERT [dbo].[KPIs] ([Id], [StrategicObjectiveId], [KPI], [IsActive]) VALUES (N'29324023-2766-493c-a892-82bc123c33df', N'52d283d3-2208-48f4-b797-1d8cd7481102', N'ettwethh', 0)
GO
INSERT [dbo].[KPIs] ([Id], [StrategicObjectiveId], [KPI], [IsActive]) VALUES (N'450e85b8-ed14-4860-af5d-9d4e1c067084', N'c50bedc9-2050-40f1-9371-0a96d035fd9c', N'asdasd', 1)
GO
INSERT [dbo].[KPIs] ([Id], [StrategicObjectiveId], [KPI], [IsActive]) VALUES (N'd0d50900-5ae2-4228-80f7-e5c5c5cc440d', N'6c11b9bd-5914-4a42-9dee-e40991dd4cb3', N'ggdsgg', 1)
GO
INSERT [dbo].[Languages] ([Id], [LanguageFullName], [LanguageCultureName]) VALUES (N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'English', N'en')
GO
INSERT [dbo].[Languages] ([Id], [LanguageFullName], [LanguageCultureName]) VALUES (N'0be6742c-6f1b-4266-856f-c1cc66cd8e9b', N'French', N'fr')
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'ebdf5a3c-1305-4c86-9b63-0390039f9f72', N'bf582f57-d759-47f1-baf4-49ec89510cce', N'450e85b8-ed14-4860-af5d-9d4e1c067084', CAST(65.5600 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'62d949a0-2265-4389-8194-2452a8317f81', N'bf582f57-d759-47f1-baf4-49ec89510cce', N'd0d50900-5ae2-4228-80f7-e5c5c5cc440d', CAST(56.5600 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'7ac6ca6b-36d0-454d-94a1-349aadaecc64', N'd2ff207f-5f9c-43c6-8fdf-f421a92401d9', N'd0d50900-5ae2-4228-80f7-e5c5c5cc440d', CAST(13.1300 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'717e6bd5-b9d6-4bbf-8d80-4fec4a12e8b0', N'd2ff207f-5f9c-43c6-8fdf-f421a92401d9', N'd0d50900-5ae2-4228-80f7-e5c5c5cc440d', CAST(23.0000 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'f132da81-8907-4669-9b9f-6a5ed1008d55', N'0b2fcb27-9746-4d74-9830-6d4cecaafb86', N'450e85b8-ed14-4860-af5d-9d4e1c067084', CAST(13.1300 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'a19944bb-0aa3-430f-8263-99d428c3df0f', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'd0d50900-5ae2-4228-80f7-e5c5c5cc440d', CAST(45.5400 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'bb3c505b-f1db-4902-918d-d68ceb64c06a', N'48eeccac-d049-4533-8126-72057b21d51d', N'450e85b8-ed14-4860-af5d-9d4e1c067084', CAST(68.9800 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'dd303731-d2ee-4860-a3b9-e5f26086bc87', N'bf582f57-d759-47f1-baf4-49ec89510cce', N'450e85b8-ed14-4860-af5d-9d4e1c067084', CAST(78.8700 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'3129803a-cc51-45ad-9357-f0f8163e3443', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'd0d50900-5ae2-4228-80f7-e5c5c5cc440d', CAST(89.0000 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'beef6e27-6aeb-4cc8-9fbc-fa2c03a33fa2', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PerformanceIndicator] ([Id], [TeamId], [KPIId], [Target], [FrequencyId]) VALUES (N'692a5440-55af-4fba-94a8-fadf5fbdf558', N'bf582f57-d759-47f1-baf4-49ec89510cce', N'450e85b8-ed14-4860-af5d-9d4e1c067084', CAST(15.2300 AS Numeric(18, 4)), NULL)
GO
INSERT [dbo].[PerformanceInitiative] ([Id], [DeptId], [PerformanceInitiativeName], [IsActive]) VALUES (N'96650b91-cac3-410c-ade2-14c918d09b92', N'4bd4587a-77e1-4bc5-9694-b8fd79253499', N'Initiative de performance 2', 1)
GO
INSERT [dbo].[PerformanceInitiative] ([Id], [DeptId], [PerformanceInitiativeName], [IsActive]) VALUES (N'80d9daa6-ebe9-4319-981a-17e976d567b5', N'aa5b68cc-6a2e-4591-953d-cfb016f20d16', N'Initiative  de performance 4', 1)
GO
INSERT [dbo].[PerformanceInitiative] ([Id], [DeptId], [PerformanceInitiativeName], [IsActive]) VALUES (N'290af42d-9255-40ab-b00d-a3f5ee9473da', N'b70ebbd2-aa50-40fe-a6ba-b2761251973b', N'Initiative de performance 1', 1)
GO
INSERT [dbo].[PerformanceInitiative] ([Id], [DeptId], [PerformanceInitiativeName], [IsActive]) VALUES (N'5ec5ddf9-ce37-48fe-b531-bb0d08ab5778', N'e482b742-e050-4310-95b8-632d836d739c', N'Initiative de performance 3', 1)
GO
INSERT [dbo].[StrategicObjectives] ([Id], [PerformanceInitiativeId], [StrategicObjectives], [IsActive]) VALUES (N'c50bedc9-2050-40f1-9371-0a96d035fd9c', N'96650b91-cac3-410c-ade2-14c918d09b92', N'Objectif stratégique 2', 1)
GO
INSERT [dbo].[StrategicObjectives] ([Id], [PerformanceInitiativeId], [StrategicObjectives], [IsActive]) VALUES (N'52d283d3-2208-48f4-b797-1d8cd7481102', N'80d9daa6-ebe9-4319-981a-17e976d567b5', N'Objectif stratégique 1 update', 1)
GO
INSERT [dbo].[StrategicObjectives] ([Id], [PerformanceInitiativeId], [StrategicObjectives], [IsActive]) VALUES (N'6c11b9bd-5914-4a42-9dee-e40991dd4cb3', N'290af42d-9255-40ab-b00d-a3f5ee9473da', N'awerrdfh', 0)
GO
INSERT [dbo].[TargetFrequency] ([Id], [TargetFrequency]) VALUES (N'77a6ecd8-4b83-46e8-a57c-001c772c600b', N'Monthly')
GO
INSERT [dbo].[TargetFrequency] ([Id], [TargetFrequency]) VALUES (N'c5d3be2a-17c3-496b-9559-251d8ab5220d', N'Yearly')
GO
INSERT [dbo].[TargetFrequency] ([Id], [TargetFrequency]) VALUES (N'b57a7a62-d9b9-4c38-bada-99996d87508e', N'Quarterly')
GO
INSERT [dbo].[TeamManagement] ([Id], [TeamName], [DepartmentId]) VALUES (N'bf582f57-d759-47f1-baf4-49ec89510cce', N'Test Team 1', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605')
GO
INSERT [dbo].[TeamManagement] ([Id], [TeamName], [DepartmentId]) VALUES (N'39d0a0d0-362e-463e-a44d-6b1cf407845e', N'.Net Team 1 update', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605')
GO
INSERT [dbo].[TeamManagement] ([Id], [TeamName], [DepartmentId]) VALUES (N'0b2fcb27-9746-4d74-9830-6d4cecaafb86', N'Android Team 1', N'35d66cc1-1a09-4de2-bf12-ef4cdace4671')
GO
INSERT [dbo].[TeamManagement] ([Id], [TeamName], [DepartmentId]) VALUES (N'48eeccac-d049-4533-8126-72057b21d51d', N'Test 1', N'fe88622a-e669-4dd8-b0b7-13a2fb57a605')
GO
INSERT [dbo].[TeamManagement] ([Id], [TeamName], [DepartmentId]) VALUES (N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'Android Team 2', N'35d66cc1-1a09-4de2-bf12-ef4cdace4671')
GO
INSERT [dbo].[TeamManagement] ([Id], [TeamName], [DepartmentId]) VALUES (N'd2ff207f-5f9c-43c6-8fdf-f421a92401d9', N'Test 1 New Page', N'4bd4587a-77e1-4bc5-9694-b8fd79253499')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'3f3d9e36-5e3f-443b-9019-027691d50fcf', N'd2ff207f-5f9c-43c6-8fdf-f421a92401d9', N'a682c876-75d3-4d39-b20c-ad7994d0ba98')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'a34ad36f-571c-4396-a4eb-0395e36dbebd', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'afd6dac4-2a16-4e02-941d-ae3dd322a30d')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'c319a818-9b61-44c2-a20f-062a6845ba2c', N'd2ff207f-5f9c-43c6-8fdf-f421a92401d9', N'f8706180-af1e-468b-b2b5-fa3c620986a0')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'012c5283-7bc7-4636-ba8f-0f8b74e6425b', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'60f561dd-ee72-48f6-8d31-170b1dba27b2', N'0b2fcb27-9746-4d74-9830-6d4cecaafb86', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'3fa729eb-642c-4b19-bd39-1f40bd825574', N'39d0a0d0-362e-463e-a44d-6b1cf407845e', N'0ce4430c-f330-419e-a2a8-54fabd701e68')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'ff61dfb9-a7eb-4ac5-b207-33594e7b5e6c', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'ad965821-7be3-41fe-b764-8961e7ee3c8d')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'b403868d-ac3b-486a-bf6d-54fb28e6959a', N'39d0a0d0-362e-463e-a44d-6b1cf407845e', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'06da22d6-1b92-4197-b8e1-55cd8633dff5', N'48eeccac-d049-4533-8126-72057b21d51d', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'c805ed5b-54ec-45bd-8b8e-56d47638e100', N'0b2fcb27-9746-4d74-9830-6d4cecaafb86', N'd8eb8afd-f1a4-49f0-8a4c-b0b57afcc736')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'5847a5e9-7049-4b69-8256-5a6962eb4a2c', N'48eeccac-d049-4533-8126-72057b21d51d', N'7b72a976-f12c-4040-9ac7-272d908173d0')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'0d8a4688-3a39-4370-b03d-657577e896b5', N'39d0a0d0-362e-463e-a44d-6b1cf407845e', N'3d066ac2-817a-4a33-b3e4-1e6903f92681')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'1a80dcaa-3e3b-4594-a03e-7c9ae988c55c', N'0b2fcb27-9746-4d74-9830-6d4cecaafb86', N'fe0fbfe0-d297-4b03-8b4b-9826c7ade2fa')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'3539fa1e-c18c-4d15-be79-bd1e21161d5e', N'48eeccac-d049-4533-8126-72057b21d51d', N'a3ae8a67-3b7a-4f18-a332-65d146b586f1')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'c8b2c2f8-0f00-44b3-a8e9-c52a9ee93c57', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'867dafda-f549-4bd1-9bbd-5c1673f223a8')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'3a8c06ff-3888-4a77-8bd4-c904873874c4', N'0b2fcb27-9746-4d74-9830-6d4cecaafb86', N'd0e39259-6ed0-4757-b612-e5edd5091a99')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'4d582fef-cedf-4942-9b97-d0837af65a8e', N'39d0a0d0-362e-463e-a44d-6b1cf407845e', N'2b63e0cc-002c-415c-93dd-7cab9a632aec')
GO
INSERT [dbo].[TeamMembers] ([Id], [TeamId], [EmployeeId]) VALUES (N'55478bec-f36e-410f-b61a-fdececf6a4c9', N'b1671a3d-a7b8-4c84-a3fe-ad8b9ac4ca20', N'f8d66aa9-8317-42c2-8f43-e9b295d31cb2')
GO
INSERT [dbo].[UOMs] ([Id], [UOM], [IsActive]) VALUES (N'386d99a0-6ef8-4945-85bf-5ee20fa1b4eb', N'Per Day', 1)
GO
INSERT [dbo].[UOMs] ([Id], [UOM], [IsActive]) VALUES (N'34334943-3697-4c45-9519-85813e537c61', N'Quarterly', 1)
GO
INSERT [dbo].[UOMs] ([Id], [UOM], [IsActive]) VALUES (N'706b6039-fbef-4867-914f-d4d73ebc5fff', N'Yearly', 1)
GO
INSERT [dbo].[UOMs] ([Id], [UOM], [IsActive]) VALUES (N'ba0e51d5-ef34-462a-a053-e40df55f7979', N'Monthly', 1)
GO
INSERT [dbo].[UserRoles] ([Id], [Role]) VALUES (N'50510c18-cdd9-48b6-b6f9-2c8ac9a4823f', N'Admin Manager')
GO
INSERT [dbo].[UserRoles] ([Id], [Role]) VALUES (N'e9d5cc91-17e1-4937-8eaa-4f8cefa5ee6d', N'Super Administrator')
GO
INSERT [dbo].[UserRoles] ([Id], [Role]) VALUES (N'5e8d7479-2c07-4e4e-a67f-6049d10f25ee', N'User')
GO
INSERT [dbo].[UserRoles] ([Id], [Role]) VALUES (N'f95f556c-41f4-4f36-8f31-9693c665051d', N'Administrator')
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'9e1c71f6-4082-49fa-9fe2-1885584a6514', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1', N'admin', N'jkghj', N'hffdh', N'fh@g.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'e9d5cc91-17e1-4937-8eaa-4f8cefa5ee6d', N'REnppA4gR5FuaIGQlm5OhA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'afdb0d37-55b2-472d-836c-1b68125be915', NULL, N'alpesh', N'jkghj', N'hffdh', N'fh@g.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'50510c18-cdd9-48b6-b6f9-2c8ac9a4823f', N'QjlwPy7XKXDmOU6QjqmklA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'ab89aaf2-2a8e-48ba-b05a-2bb4a65b969b', N'7b72a976-f12c-4040-9ac7-272d908173d0', N'MAB', N'MB', N'A', N'Ma@gmail.com', N'0be6742c-6f1b-4266-856f-c1cc66cd8e9b', N'5e8d7479-2c07-4e4e-a67f-6049d10f25ee', N'QjlwPy7XKXDmOU6QjqmklA==', 0)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'68afe5a9-c43d-47e9-9eed-46ca429ee558', NULL, N'admin', N'jkghj', N'sdsd', N'test@gmail.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'e9d5cc91-17e1-4937-8eaa-4f8cefa5ee6d', N'REnppA4gR5FuaIGQlm5OhA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'7c3af18b-a248-4d28-9514-482b3cd62088', NULL, N'admin', N'Super', N'Admin', NULL, N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'5e8d7479-2c07-4e4e-a67f-6049d10f25ee', N'REnppA4gR5FuaIGQlm5OhA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'640c4fdb-96f5-4d78-80ac-7b3b3a99b1b8', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1', N'Alpesh', N'Alpesh', N'kalena', N'alpesh@g.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'5e8d7479-2c07-4e4e-a67f-6049d10f25ee', N'QjlwPy7XKXDmOU6QjqmklA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'a024717b-efef-44e2-9042-9138a0bd57d5', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1', N'Alpesh', N'Alpesh', N'kalena', N'alpesh@g.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'5e8d7479-2c07-4e4e-a67f-6049d10f25ee', N'QjlwPy7XKXDmOU6QjqmklA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'83747bce-d0f6-4f68-9cf5-a7821ded7957', N'c0e5bb71-99a4-4117-ab47-1bbaab228aa1', N'Alpesh', N'Alpesh', N'kalena', N'alpesh@g.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'5e8d7479-2c07-4e4e-a67f-6049d10f25ee', N'QjlwPy7XKXDmOU6QjqmklA==', 1)
GO
INSERT [dbo].[Users] ([Id], [EmployeeId], [UserName], [UserFirstName], [UserLastName], [UserEmail], [LanguageId], [RoleId], [Password], [IsActive]) VALUES (N'1812c4e4-8899-4f9a-8f22-bab16bee1252', N'7b72a976-f12c-4040-9ac7-272d908173d0', N'kshitij', N'kshitij', N'shah', N'ks@gmail.com', N'b2d70057-c749-49bc-ab8a-2a0e9f6e0875', N'50510c18-cdd9-48b6-b6f9-2c8ac9a4823f', N'QjlwPy7XKXDmOU6QjqmklA==', 1)
GO
ALTER TABLE [dbo].[DepartmentEmployee]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[DepartmentEmployee]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([PeopleJobTitleId])
REFERENCES [dbo].[JobTitles] ([Id])
GO
ALTER TABLE [dbo].[KPIs]  WITH CHECK ADD  CONSTRAINT [FK_KPIs_StrategicObjectives] FOREIGN KEY([StrategicObjectiveId])
REFERENCES [dbo].[StrategicObjectives] ([Id])
GO
ALTER TABLE [dbo].[KPIs] CHECK CONSTRAINT [FK_KPIs_StrategicObjectives]
GO
ALTER TABLE [dbo].[PerformanceIndicator]  WITH CHECK ADD FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[TargetFrequency] ([Id])
GO
ALTER TABLE [dbo].[PerformanceIndicator]  WITH CHECK ADD  CONSTRAINT [FK_PerformanceIndicator_KPIs] FOREIGN KEY([KPIId])
REFERENCES [dbo].[KPIs] ([Id])
GO
ALTER TABLE [dbo].[PerformanceIndicator] CHECK CONSTRAINT [FK_PerformanceIndicator_KPIs]
GO
ALTER TABLE [dbo].[PerformanceIndicator]  WITH CHECK ADD  CONSTRAINT [FK_PerformanceIndicator_TeamManagement] FOREIGN KEY([TeamId])
REFERENCES [dbo].[TeamManagement] ([Id])
GO
ALTER TABLE [dbo].[PerformanceIndicator] CHECK CONSTRAINT [FK_PerformanceIndicator_TeamManagement]
GO
ALTER TABLE [dbo].[PerformanceInitiative]  WITH CHECK ADD FOREIGN KEY([DeptId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[StrategicObjectives]  WITH CHECK ADD FOREIGN KEY([PerformanceInitiativeId])
REFERENCES [dbo].[PerformanceInitiative] ([Id])
GO
ALTER TABLE [dbo].[TeamManagement]  WITH CHECK ADD  CONSTRAINT [FK_TeamManagement_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[TeamManagement] CHECK CONSTRAINT [FK_TeamManagement_Departments]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[TeamManagement] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoles] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE[dbo].[ELMAH_GetErrorsXml]  
  
(  
    @Application NVARCHAR(60),  
    @PageIndex INT = 0,  
    @PageSize INT = 15,  
    @TotalCount INT OUTPUT  
  
)  
  
AS  
  
SET NOCOUNT ON  
  
DECLARE @FirstTimeUTC DATETIME  
DECLARE @FirstSequence INT  
DECLARE @StartRow INT  
DECLARE @StartRowIndex INT  
SELECT  
  
@TotalCount = COUNT(1)  
  
FROM  
  
    [ELMAH_Error]  
  
WHERE  
  
    [Application] = @Application  
SET @StartRowIndex = @PageIndex * @PageSize + 1  
IF @StartRowIndex <= @TotalCount  
  
BEGIN  
  
SET ROWCOUNT @StartRowIndex  
  
SELECT  
  
@FirstTimeUTC = [TimeUtc],  
  
    @FirstSequence = [Sequence]  
  
FROM  
  
    [ELMAH_Error]  
  
WHERE  
  
    [Application] = @Application  
  
ORDER BY  
  
    [TimeUtc] DESC,  
    [Sequence] DESC  
  
END  
  
ELSE  
  
BEGIN  
  
SET @PageSize = 0  
  
END  
  
SET ROWCOUNT @PageSize  
  
SELECT  
  
errorId = [ErrorId],  
  
    application = [Application],  
    host = [Host],  
    type = [Type],  
    source = [Source],  
    message = [Message],  
    [user] = [User],  
    statusCode = [StatusCode],  
    time = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'  
  
FROM  
  
    [ELMAH_Error] error  
  
WHERE  
  
    [Application] = @Application  
  
AND  
  
    [TimeUtc] <= @FirstTimeUTC  
  
AND  
  
    [Sequence] <= @FirstSequence  
  
ORDER BY  
  
    [TimeUtc] DESC,  
  
    [Sequence] DESC  
  
FOR  
  
XML AUTO
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE[dbo].[ELMAH_GetErrorXml]  
  
(  
  
    @Application NVARCHAR(60),  
    @ErrorId UNIQUEIDENTIFIER  
  
)  
  
AS  
  
SET NOCOUNT ON  
SELECT  
  
    [AllXml]  
FROM  
  
    [ELMAH_Error]  
WHERE  
  
    [ErrorId] = @ErrorId  
AND  
    [Application] = @Application  



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 12-13-2018 14:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE[dbo].[ELMAH_LogError]  
  
(  
  
    @ErrorId UNIQUEIDENTIFIER,    
    @Application NVARCHAR(60),    
    @Host NVARCHAR(30),    
    @Type NVARCHAR(100),  
    @Source NVARCHAR(60),    
    @Message NVARCHAR(500),  
    @User NVARCHAR(50),   
    @AllXml NTEXT,    
    @StatusCode INT,   
    @TimeUtc DATETIME  
  
)  
  
AS  
  
SET NOCOUNT ON  
  
INSERT  
  
INTO  
  
    [ELMAH_Error]
(  
  
    [ErrorId],   
    [Application],   
    [Host],  
    [Type],  
    [Source],  
    [Message],    
    [User],    
    [AllXml],    
    [StatusCode],    
    [TimeUtc]  
  
)  
  
VALUES  
  
    (  
  
    @ErrorId,  
    @Application,    
    @Host,    
    @Type,    
    @Source,   
    @Message,    
    @User,   
    @AllXml,   
    @StatusCode,   
    @TimeUtc  
  
)
GO
