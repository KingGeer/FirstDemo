
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[ProductSortId] [int] NULL,
	[ProductPics] [nvarchar](4000) NULL,
	[Keyword] [nvarchar](1000) NULL,
	[MeteDesc] [nvarchar](2000) NULL,
	[Xinghao] [nvarchar](500) NULL,
	[Guige] [nvarchar](500) NULL,
	[Jiage] [float] NULL,
	[PayUrl] [nvarchar](500) NULL,
	[YuLanCount] [int] NULL,
	[ProductContent] [ntext] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductSortId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品图片(多图以,分割)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductPics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键词' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Keyword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'MeteDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Xinghao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Guige'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Jiage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'PayUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'YuLanCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
/****** Object:  Table [dbo].[Ad]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ad_Title] [nvarchar](500) NULL,
	[Ad_Content] [ntext] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_Ad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ad', @level2type=N'COLUMN',@level2name=N'Ad_Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ad', @level2type=N'COLUMN',@level2name=N'Ad_Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跟新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ad', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [nvarchar](500) NULL,
	[AdminPwd] [nvarchar](500) NULL,
	[AdminRealName] [nvarchar](500) NULL,
	[AdminSex] [nvarchar](50) NULL,
	[AdminSortID] [int] NULL,
	[AdminPowerValues] [ntext] NULL,
	[AdminRemark] [ntext] NULL,
	[OrderNum] [int] NULL,
	[UpTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐号ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐号密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminRealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminSex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐号类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminSortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminPowerValues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'AdminRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跟新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT [dbo].[Admin] ([id], [AdminID], [AdminPwd], [AdminRealName], [AdminSex], [AdminSortID], [AdminPowerValues], [AdminRemark], [OrderNum], [UpTime], [LastLoginTime]) VALUES (1, N'admin', N'21232F297A57A5A743894A0E4A801FC3', N'admin', N'男', 1, N'all', N'admin', 0, CAST(0x00009EA700B31C63 AS DateTime), CAST(0x00009EA700B33CD9 AS DateTime))
INSERT [dbo].[Admin] ([id], [AdminID], [AdminPwd], [AdminRealName], [AdminSex], [AdminSortID], [AdminPowerValues], [AdminRemark], [OrderNum], [UpTime], [LastLoginTime]) VALUES (2, N'user', N'670B14728AD9902AECBA32E22FA4F6BD', N'user', N'男', 2, N'', N'user', 0, CAST(0x00009EA700B32F97 AS DateTime), CAST(0x00009EA700B34839 AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  Table [dbo].[InforSort]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InforSort](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InforSortName] [nvarchar](500) NULL,
	[TopInforSortId] [int] NULL,
	[OrderNum] [int] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_InforSort] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'常用资讯类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InforSort', @level2type=N'COLUMN',@level2name=N'InforSortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级产品类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InforSort', @level2type=N'COLUMN',@level2name=N'TopInforSortId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InforSort', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
/****** Object:  Table [dbo].[AdminSort]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminSort](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdminSortName] [nvarchar](500) NULL,
	[AdminSortPowerValues] [ntext] NULL,
	[OrderNum] [int] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_AdminSort] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdminSort', @level2type=N'COLUMN',@level2name=N'AdminSortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户类型权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdminSort', @level2type=N'COLUMN',@level2name=N'AdminSortPowerValues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdminSort', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdminSort', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
SET IDENTITY_INSERT [dbo].[AdminSort] ON
INSERT [dbo].[AdminSort] ([id], [AdminSortName], [AdminSortPowerValues], [OrderNum], [UpTime]) VALUES (1, N'管理员', N'/cmsproduct/|/cmssite/|/cmstopicsinfor/|/cmsadminsort/|/cmsad/|/cmsadmin/|/cmsinforsort/|/cmsproductsort/|/cmsinfor/', 0, CAST(0x00009EA700B2F6AB AS DateTime))
INSERT [dbo].[AdminSort] ([id], [AdminSortName], [AdminSortPowerValues], [OrderNum], [UpTime]) VALUES (2, N'操作员', N'/cmsproduct/|/cmstopicsinfor/|/cmsad/|/cmsinforsort/|/cmsproductsort/|/cmsinfor/', 0, CAST(0x00009EA700B31282 AS DateTime))
SET IDENTITY_INSERT [dbo].[AdminSort] OFF
/****** Object:  Table [dbo].[Infor]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Title_Bold] [bit] NULL,
	[Title_Color] [nvarchar](50) NULL,
	[SortID] [int] NULL,
	[Keyword] [nvarchar](1000) NULL,
	[MeteDesc] [nvarchar](2000) NULL,
	[FromSource] [nvarchar](500) NULL,
	[Author] [nvarchar](500) NULL,
	[WebLink] [nvarchar](500) NULL,
	[IsRecommendation] [bit] NULL,
	[IsTop] [bit] NULL,
	[Description] [ntext] NULL,
	[Star] [int] NULL,
	[Hits] [int] NULL,
	[OrderNum] [int] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_Infor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题是否为粗体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Title_Bold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Title_Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键词' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Keyword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'MeteDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'FromSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网络连接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'WebLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'IsRecommendation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'IsTop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Star'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Infor', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
/****** Object:  Table [dbo].[TopicsInfor]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicsInfor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TopicsName] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[Title_Bold] [bit] NULL,
	[Title_Color] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[Hits] [int] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_TopicsInfor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专题名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'TopicsName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题是否为粗体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'Title_Bold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'Title_Color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TopicsInfor', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
/****** Object:  Table [dbo].[ProductSort]    Script Date: 03/15/2011 10:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSort](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductSortName] [nvarchar](500) NULL,
	[TopProductSortId] [int] NULL,
	[OrderNum] [int] NULL,
	[UpTime] [datetime] NULL,
 CONSTRAINT [PK_ProductSort] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSort', @level2type=N'COLUMN',@level2name=N'ProductSortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级产品类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSort', @level2type=N'COLUMN',@level2name=N'TopProductSortId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSort', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSort', @level2type=N'COLUMN',@level2name=N'UpTime'
GO
/****** Object:  Default [DF_Infor_Hits]    Script Date: 03/15/2011 10:53:25 ******/
ALTER TABLE [dbo].[Infor] ADD  CONSTRAINT [DF_Infor_Hits]  DEFAULT ((0)) FOR [Hits]
GO
/****** Object:  Default [DF_Infor_OrderNum]    Script Date: 03/15/2011 10:53:25 ******/
ALTER TABLE [dbo].[Infor] ADD  CONSTRAINT [DF_Infor_OrderNum]  DEFAULT ((0)) FOR [OrderNum]
GO
/****** Object:  Default [DF_TopicsInfor_Hits]    Script Date: 03/15/2011 10:53:25 ******/
ALTER TABLE [dbo].[TopicsInfor] ADD  CONSTRAINT [DF_TopicsInfor_Hits]  DEFAULT ((0)) FOR [Hits]
GO
