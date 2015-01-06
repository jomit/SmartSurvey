--------------- SCHEMA ------------------
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

CREATE TABLE [dbo].[Templates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

ALTER TABLE [dbo].[Collectors]  WITH CHECK ADD  CONSTRAINT [FK_Collectors_Templates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Templates] ([Id])
ALTER TABLE [dbo].[Collectors] CHECK CONSTRAINT [FK_Collectors_Templates]
ALTER TABLE [dbo].[Responses]  WITH CHECK ADD  CONSTRAINT [FK_Responses_Collectors] FOREIGN KEY([CollectorId])
REFERENCES [dbo].[Collectors] ([Id])
ALTER TABLE [dbo].[Responses] CHECK CONSTRAINT [FK_Responses_Collectors]

--------------- TEST DATA ------------------

SET IDENTITY_INSERT [dbo].[Templates] ON 
INSERT [dbo].[Templates] ([Id], [Name], [Language]) VALUES (1, N'Survey1_en-us', N'en-us')
INSERT [dbo].[Templates] ([Id], [Name], [Language]) VALUES (2, N'Survey2_en-us', N'en-us')
SET IDENTITY_INSERT [dbo].[Templates] OFF


SET IDENTITY_INSERT [dbo].[Collectors] ON 
INSERT [dbo].[Collectors] ([Id], [TemplateId], [Location], [Product], [UrlKey], [IsActive]) VALUES (1, 1, N'North America', N'Windows 2003', N'7ce60cba-0b3d-432f-9ff2-6d46b4742c87', 1)
INSERT [dbo].[Collectors] ([Id], [TemplateId], [Location], [Product], [UrlKey], [IsActive]) VALUES (2, 2, N'South America', N'SQL Server 2003', N'e034d03e-f2ac-4ed6-8db0-207db2a04dff', 1)
SET IDENTITY_INSERT [dbo].[Collectors] OFF

