USE [crudtest]
GO
ALTER TABLE [dbo].[posts] DROP CONSTRAINT [FK_posts_users]
GO
ALTER TABLE [dbo].[posts] DROP CONSTRAINT [FK_posts_categories]
GO
ALTER TABLE [dbo].[post_tags] DROP CONSTRAINT [FK_post_tags_tags]
GO
ALTER TABLE [dbo].[post_tags] DROP CONSTRAINT [FK_post_tags_posts]
GO
ALTER TABLE [dbo].[comments] DROP CONSTRAINT [FK_comments_posts]
GO
ALTER TABLE [dbo].[barcodes] DROP CONSTRAINT [FK_barcodes_products]
GO
/****** Object:  View [dbo].[tag_usage]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP VIEW [dbo].[tag_usage]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[tags]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[products]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[posts]
GO
/****** Object:  Table [dbo].[post_tags]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[post_tags]
GO
/****** Object:  Table [dbo].[events]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[events]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[countries]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[comments]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[categories]
GO
/****** Object:  Table [dbo].[barcodes]    Script Date: 12/13/2017 6:48:04 AM ******/
DROP TABLE [dbo].[barcodes]
GO
/****** Object:  Table [dbo].[barcodes]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[barcodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[hex] [nvarchar](max) NOT NULL,
	[bin] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_barcodes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[icon] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[message] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[countries]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[shape] [geometry] NOT NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[events]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[datetime] [datetime2](0) NOT NULL,
	[visitors] [int] NOT NULL,
 CONSTRAINT [PK_events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post_tags]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[posts]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[properties] [xml] NOT NULL,
	[created_at] [datetime2](0) NOT NULL,
	[deleted_at] [datetime2](0) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tags]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[location] [geometry] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[tag_usage]    Script Date: 12/13/2017 6:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tag_usage]
AS
SELECT top 100 PERCENT name, COUNT(name) AS [count] FROM tags, post_tags WHERE tags.id = post_tags.tag_id GROUP BY name ORDER BY [count] DESC, name


GO
SET IDENTITY_INSERT [dbo].[barcodes] ON 

INSERT [dbo].[barcodes] ([id], [product_id], [hex], [bin]) VALUES (1, 1, N'00ff01', 0x00FF01)
SET IDENTITY_INSERT [dbo].[barcodes] OFF
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [icon]) VALUES (1, N'announcement', NULL)
INSERT [dbo].[categories] ([id], [name], [icon]) VALUES (2, N'article', NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [post_id], [message]) VALUES (1, 1, N'great')
INSERT [dbo].[comments] ([id], [post_id], [message]) VALUES (2, 1, N'fantastic')
INSERT [dbo].[comments] ([id], [post_id], [message]) VALUES (3, 2, N'thank you')
INSERT [dbo].[comments] ([id], [post_id], [message]) VALUES (4, 2, N'awesome')
SET IDENTITY_INSERT [dbo].[comments] OFF
SET IDENTITY_INSERT [dbo].[countries] ON 

INSERT [dbo].[countries] ([id], [name], [shape]) VALUES (1, N'Left', 0x000000000104050000000000000000003E4000000000000024400000000000004440000000000000444000000000000034400000000000004440000000000000244000000000000034400000000000003E40000000000000244001000000020000000001000000FFFFFFFF0000000003)
INSERT [dbo].[countries] ([id], [name], [shape]) VALUES (2, N'Right', 0x0000000001040500000000000000008051400000000000002440000000000000544000000000000044400000000000004E400000000000004440000000000000494000000000000034400000000000805140000000000000244001000000020000000001000000FFFFFFFF0000000003)
SET IDENTITY_INSERT [dbo].[countries] OFF
SET IDENTITY_INSERT [dbo].[events] ON 

INSERT [dbo].[events] ([id], [name], [datetime], [visitors]) VALUES (1, N'Launch', CAST(0x000DB700DB3A0B0000 AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[events] OFF
SET IDENTITY_INSERT [dbo].[post_tags] ON 

INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (1, 1, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (2, 1, 2)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (3, 2, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (4, 2, 2)
SET IDENTITY_INSERT [dbo].[post_tags] OFF
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([id], [user_id], [category_id], [content]) VALUES (1, 1, 1, N'blog started')
INSERT [dbo].[posts] ([id], [user_id], [category_id], [content]) VALUES (2, 1, 2, N'It works!')
SET IDENTITY_INSERT [dbo].[posts] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [price], [properties], [created_at], [deleted_at]) VALUES (1, N'Calculator', CAST(23.01 AS Decimal(10, 2)), N'<root type="object"><depth type="boolean">false</depth><model type="string">TRX-120</model><width type="number">100</width><height type="null" /></root>', CAST(0x004D0E003AF90A0000 AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[tags] ON 

INSERT [dbo].[tags] ([id], [name]) VALUES (1, N'funny')
INSERT [dbo].[tags] ([id], [name]) VALUES (2, N'important')
SET IDENTITY_INSERT [dbo].[tags] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [location]) VALUES (1, N'user1', N'pass1', NULL)
INSERT [dbo].[users] ([id], [username], [password], [location]) VALUES (2, N'user2', N'pass2', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[barcodes]  WITH CHECK ADD  CONSTRAINT [FK_barcodes_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[barcodes] CHECK CONSTRAINT [FK_barcodes_products]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_posts] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_posts]
GO
ALTER TABLE [dbo].[post_tags]  WITH CHECK ADD  CONSTRAINT [FK_post_tags_posts] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([id])
GO
ALTER TABLE [dbo].[post_tags] CHECK CONSTRAINT [FK_post_tags_posts]
GO
ALTER TABLE [dbo].[post_tags]  WITH CHECK ADD  CONSTRAINT [FK_post_tags_tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([id])
GO
ALTER TABLE [dbo].[post_tags] CHECK CONSTRAINT [FK_post_tags_tags]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_categories]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_users]
GO
