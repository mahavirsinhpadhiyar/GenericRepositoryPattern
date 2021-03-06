USE [StudentMaster]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12-18-2018 19:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12-18-2018 19:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 12-18-2018 19:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (1, N'Ahmedabad', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (2, N'Baroda', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (3, N'Rajkot', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (4, N'Mumbai', 2)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (5, N'Pune', 2)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (6, N'Nagpur', 2)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (7, N'Nashik', 2)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (8, N'Mapusa', 3)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (9, N'Ponda', 3)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (10, N'Burnie', 4)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (11, N'Launceston', 4)
GO
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (12, N'Greater Hobart', 4)
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'India')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'Australia')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'United Kingdom')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (4, N'Mexico')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (1, N'Gujarat', 1)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (2, N'Maharashtra', 1)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (3, N'Goa', 1)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (4, N'Tasmania', 2)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (5, N'Victoria', 2)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (6, N'Queensland', 2)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (7, N'England', 3)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (8, N'Scotland', 3)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (9, N'Campeche', 4)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (10, N'Durango', 4)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (11, N'Puebla', 4)
GO
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (12, N'', NULL)
GO
SET IDENTITY_INSERT [dbo].[State] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
