/****** Object:  Table [dbo].[Collectors]    Script Date: 10/16/2014 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collectors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateId] [int] NOT NULL,
	[Location] [nvarchar](500) NOT NULL,
	[Product] [nvarchar](100) NOT NULL,
	[UrlKey] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Collectors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Responses]    Script Date: 10/16/2014 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CollectorId] [int] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[FilledOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Responses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Templates]    Script Date: 10/16/2014 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Templates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
SET IDENTITY_INSERT [dbo].[Collectors] ON 

GO
INSERT [dbo].[Collectors] ([Id], [TemplateId], [Location], [Product], [UrlKey], [IsActive]) VALUES (3, 2, N'UK', N'Both Oct. 21', N'2778f223-bdda-4915-934b-ccc765434a10', 1)
GO
SET IDENTITY_INSERT [dbo].[Collectors] OFF
GO
SET IDENTITY_INSERT [dbo].[Templates] ON 

GO
INSERT [dbo].[Templates] ([Id], [Name], [Language]) VALUES (1, N'Survey1_en-us', N'en-us')
GO
INSERT [dbo].[Templates] ([Id], [Name], [Language]) VALUES (2, N'Survey3_en-us', N'en-us')
GO
SET IDENTITY_INSERT [dbo].[Templates] OFF
GO
ALTER TABLE [dbo].[Collectors]  WITH CHECK ADD  CONSTRAINT [FK_Collectors_Templates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Templates] ([Id])
GO
ALTER TABLE [dbo].[Collectors] CHECK CONSTRAINT [FK_Collectors_Templates]
GO
ALTER TABLE [dbo].[Responses]  WITH CHECK ADD  CONSTRAINT [FK_Responses_Collectors] FOREIGN KEY([CollectorId])
REFERENCES [dbo].[Collectors] ([Id])
GO
ALTER TABLE [dbo].[Responses] CHECK CONSTRAINT [FK_Responses_Collectors]
GO
