USE [master]
GO
/****** Object:  Database [DATJ]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE DATABASE [DATJ]
USE [DATJ]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory](
	[accessory_id] [bigint] IDENTITY(1,1) NOT NULL,
	[karat] [int] NOT NULL,
	[material_weight] [real] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[accessory_type_id] [bigint] NOT NULL,
	[shape_id] [bigint] NOT NULL,
 CONSTRAINT [PK_accessory] PRIMARY KEY CLUSTERED 
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory_image]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory_image](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[accessory_id] [bigint] NOT NULL,
 CONSTRAINT [PK_accessory_image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory_type]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory_type](
	[accessory_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[processing_price] [float] NOT NULL,
 CONSTRAINT [PK_accessory_type] PRIMARY KEY CLUSTERED 
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NOT NULL,
	[rank_id] [bigint] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[birthday] [datetime2](7) NOT NULL,
	[gender] [nvarchar](max) NOT NULL,
	[reward_point] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[blog_id] [bigint] IDENTITY(1,1) NOT NULL,
	[author_id] [bigint] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diamond]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diamond](
	[diamond_id] [bigint] IDENTITY(1,1) NOT NULL,
	[lab] [nvarchar](max) NOT NULL,
	[certificate_number] [bigint] NOT NULL,
	[certificate_url] [nvarchar](max) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[carat] [real] NOT NULL,
	[cut] [nvarchar](max) NOT NULL,
	[color] [nvarchar](max) NOT NULL,
	[clarity] [nvarchar](max) NOT NULL,
	[polish] [nvarchar](max) NOT NULL,
	[symmetry] [nvarchar](max) NOT NULL,
	[fluorescence] [nvarchar](max) NOT NULL,
	[availability] [bit] NOT NULL,
	[shape_id] [bigint] NOT NULL,
 CONSTRAINT [PK_diamond] PRIMARY KEY CLUSTERED 
(
	[diamond_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diamond_price_list]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diamond_price_list](
	[diamond_price_list_id] [bigint] IDENTITY(1,1) NOT NULL,
	[eff_time] [datetime2](7) NOT NULL,
	[min_carat_eff] [real] NOT NULL,
	[max_carat_eff] [real] NOT NULL,
	[color] [nvarchar](max) NOT NULL,
	[clarity] [nvarchar](max) NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_diamond_price_list] PRIMARY KEY CLUSTERED 
(
	[diamond_price_list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feedback_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NOT NULL,
	[accessory_id] [bigint] NOT NULL,
	[score] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_price_list]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_price_list](
	[material_price_list_id] [bigint] IDENTITY(1,1) NOT NULL,
	[karat] [int] NOT NULL,
	[eff_time] [datetime2](7) NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_material_price_list] PRIMARY KEY CLUSTERED 
(
	[material_price_list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[total_price] [float] NOT NULL,
	[total_discount_percent] [real] NOT NULL,
	[contact_status] [nvarchar](max) NOT NULL,
	[confirm_status] [nvarchar](max) NOT NULL,
	[delivery_status] [nvarchar](max) NOT NULL,
	[order_status] [nvarchar](max) NOT NULL,
	[shipping_address] [nvarchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[sale_staff_id] [bigint] NOT NULL,
	[delivery_staff_id] [bigint] NOT NULL,
	[promotion_id] [bigint] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [real] NULL,
	[item_price] [float] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[diamond_id] [bigint] NOT NULL,
	[accessory_id] [bigint] NOT NULL,
	[warranty_card_id] [bigint] NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[price_rate]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[price_rate](
	[price_rate_id] [bigint] IDENTITY(1,1) NOT NULL,
	[account_id] [bigint] NOT NULL,
	[percent] [real] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_price_rate] PRIMARY KEY CLUSTERED 
(
	[price_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[promotion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[discount_percent] [real] NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_promotion] PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rank]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rank](
	[rank_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rank_name] [nvarchar](max) NOT NULL,
	[discount] [real] NOT NULL,
	[reward_point] [int] NOT NULL,
 CONSTRAINT [PK_rank] PRIMARY KEY CLUSTERED 
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shape]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shape](
	[shape_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_shape] PRIMARY KEY CLUSTERED 
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[transaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NOT NULL,
	[payment_method] [nvarchar](max) NOT NULL,
	[transaction_status] [nvarchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranty_card]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty_card](
	[warranty_card_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_detail_id] [bigint] NOT NULL,
	[start_time] [datetime2](7) NOT NULL,
	[end_time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_warranty_card] PRIMARY KEY CLUSTERED 
(
	[warranty_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranty_request]    Script Date: 5/24/2024 6:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty_request](
	[warranty_request_id] [bigint] IDENTITY(1,1) NOT NULL,
	[warranty_staff_id] [bigint] NOT NULL,
	[warranty_card_id] [bigint] NOT NULL,
	[receive_time] [datetime2](7) NOT NULL,
	[return_time] [datetime2](7) NOT NULL,
	[warranty_status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_warranty_request] PRIMARY KEY CLUSTERED 
(
	[warranty_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240523065217_init', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[accessory] ON 

INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (1, 24, 17.6376266, N'Classic Round Diamond Four Prong Stud Earrings (F/G SI+)', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (2, 24, 57.01051, N'Toi et Moi Round Front Back Earring', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (3, 18, 27.25815, N'Round Diamond Halo Earrings', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (4, 24, 31.2132549, N'Classic Princess Brilliant Cut Diamond Martini Stud Earrings (F/G VS+)', 1, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (5, 18, 37.0390167, N'Princess Diamond Halo Earrings', 1, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (6, 18, 58.7920876, N'Toi et Moi Halo Emeralds Front Back Earring', 1, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (7, 24, 53.4473534, N'Toi et Moi Round and Emerald Front Back Earrings', 1, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (8, 18, 12.1147337, N'Oval Created Sapphire and Lab Diamond Classic Solitaire Under-Halo Earrings', 1, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (9, 24, 30.21557, N'Classic Oval Diamond Stud Earrings (F/G VS+)', 1, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (10, 18, 62.3552437, N'Toi et Moi Halo Round and Teardrop Front Back Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (11, 24, 84.98129, N'Elegance Pear Drop Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (12, 24, 36.8786736, N'Pear Diamond Halo Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (13, 24, 160.876541, N'Pear, Round and Heart Matching Earring', 1, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (14, 24, 73.0447159, N'Halo Oval and Heart Front Back Earring', 1, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (15, 24, 37.05683, N'Kite Set Round Lab Created Diamond Solitaire Pendant', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (16, 18, 10.68947, N'Kite Chamfered Bezel Set Solitaire Necklace', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (17, 18, 16.390522, N'Round Created Ruby and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (18, 18, 9.08605, N'Round Created Sapphire and Lab Diamond Classic Solitaire Pendant With Studded Bale', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (19, 24, 14.608943, N'Halo Cushion Lab Created Diamond Necklace', 2, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (20, 18, 24.05131, N'Classic Cushion Bezel Necklace', 2, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (21, 18, 24.05131, N'Classic Heart Bezel Necklace', 2, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (22, 24, 17.9939423, N'Oval Sapphire and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (23, 24, 16.390522, N'Pear Created Ruby and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (24, 18, 24.05131, N'Pear Bezel Drop Necklace', 2, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (25, 18, 24.05131, N'Emerald Bezel Drop Necklace', 2, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (26, 18, 71.4413, N'Round with Trailing Round and Marquise Tennis Bracelet', 4, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (27, 18, 96.561554, N'Round Station Tennis Bracelet', 4, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (28, 18, 112.595757, N'Bezeled Princess Station with Emeralds Tennis Bracelet', 4, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (29, 18, 164.4397, N'Half-Bezeled Emerald East-West Tennis Bracelet', 4, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (30, 24, 97.2741852, N'Half Pave Bezel Bangle', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (31, 18, 83.1997147, N'Oval with Trailing Round and Emeralds Tennis Bracelet', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (32, 18, 128.808121, N'Graduating Oval Tennis Bracelet', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (33, 24, 79.9928741, N'Half Pave Heart Bangle', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (34, 24, 104.934967, N'Multi Heart Bezel Bangle', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (35, 24, 98.34313, N'Bezeled Heart Station Tennis Bracelet', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (36, 18, 130.767853, N'Graduating Pear Tennis Bracelet', 4, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (37, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (38, 18, 57.3668251, N'The Fulton Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (39, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (40, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (41, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (42, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (43, 24, 66.09656, N'The Roosevelt Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (44, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (45, 18, 85.51576, N'The Carnegie Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (46, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (47, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (48, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (49, 18, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (50, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (51, 24, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (52, 24, 67.69998, N'The Sutton Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (53, 24, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (54, 24, 65.20577, N'The Varick Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (55, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (56, 24, 57.3668251, N'The Fulton Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (57, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (58, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (59, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (60, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (61, 24, 66.09656, N'The Roosevelt Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (62, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (63, 18, 85.51576, N'The Carnegie Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (64, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (65, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (66, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (67, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (68, 18, 65.20577, N'The Varick Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (69, 24, 25.2984142, N'Trio Cluster Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (70, 18, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (71, 18, 36.7005157, N'The Fifth Avenue Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (72, 18, 84.4468155, N'The Balthazar Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (73, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (74, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (75, 18, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (76, 24, 27.4363079, N'Aura Hidden Accent Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (77, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (78, 18, 37.5913048, N'Split Shank French Halo Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (79, 18, 26.3673611, N'Petite French Set Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (80, 24, 23.3386784, N'Vintage Hidden Halo Classic Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (81, 18, 22.26973, N'Heirloom Milgrain Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (82, 18, 33.84999, N'Infinity Winding Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (83, 18, 23.16052, N'Fine Line Marquise Three Stone Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (84, 18, 29.217886, N'Four Points Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (85, 24, 19.9536781, N'Vintage Art Deco Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (86, 24, 23.8731518, N'Tapered Halo Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (87, 18, 23.3386784, N'Cluster Side Stone Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (88, 24, 22.6260471, N'Cathedral Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (89, 24, 18.3502579, N'Vintage Knife Edge Side Stone Kite Set Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (90, 18, 21.7352562, N'Pave Diamond Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (91, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (92, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (93, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (94, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (95, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (96, 18, 29.0397282, N'The Frick Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (97, 18, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (98, 18, 33.3155174, N'Opulent Classic Pear Trio Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (99, 24, 26.3673611, N'Pave Halo Engagement Ring', 3, 4)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (100, 24, 39.3728828, N'Contemporary Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (101, 24, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (102, 18, 31.1776218, N'Twisted Shank Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (103, 24, 40.9763031, N'The Gansevoort Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (104, 24, 39.3728828, N'Fancy Cut Side Stone with Bridge Accent Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (105, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (106, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (107, 24, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (108, 24, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (109, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (110, 24, 57.3668251, N'The Fulton Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (111, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (112, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (113, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (114, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (115, 18, 66.09656, N'The Roosevelt Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (116, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (117, 24, 85.51576, N'The Carnegie Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (118, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (119, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (120, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (121, 24, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (122, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (123, 24, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (124, 24, 67.69998, N'The Sutton Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (125, 24, 65.20577, N'The Varick Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (126, 18, 25.2984142, N'Trio Cluster Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (127, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (128, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (129, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (130, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (131, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (132, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (133, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (134, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (135, 18, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (136, 24, 67.69998, N'The Sutton Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (137, 24, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (138, 24, 25.2984142, N'Trio Cluster Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (139, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (140, 24, 18.8847313, N'Vintage Celtic Engraved Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (141, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (142, 18, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (143, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (144, 18, 35.63157, N'Channel Set Princess Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (145, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (146, 18, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (147, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (148, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (149, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (150, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (151, 24, 35.63157, N'Channel Set Princess Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (152, 18, 21.022625, N'Classic Hidden Halo Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (153, 18, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (154, 18, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (155, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (156, 18, 34.5626221, N'Royal Twist Hidden Halo Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (157, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (158, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (159, 18, 43.826828, N'Braided Twist Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (160, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (161, 24, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (162, 18, 30.46499, N'French Set Diamond Basket Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (163, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (164, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (165, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (166, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (167, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (168, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (169, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (170, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (171, 24, 25.2984142, N'Trio Cluster Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (172, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (173, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (174, 18, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (175, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (176, 24, 25.1202564, N'Elegant Channel Set Baguette Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (177, 24, 35.45341, N'Elegance Trillion Three Stone Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (178, 24, 33.4936752, N'Glamorous Fancy Side Stone Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (179, 24, 21.022625, N'Classic Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (180, 24, 39.3728828, N'Contemporary Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (181, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (182, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (183, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (184, 18, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (185, 18, 53.80367, N'The Central Park Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (186, 24, 54.5163, N'Scalloped Pear Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (187, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (188, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (189, 18, 19.77552, N'6 Claw Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (190, 18, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (191, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (192, 24, 44.0049858, N'Knife Edge Scalloped Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (193, 18, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (194, 18, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (195, 24, 42.2234077, N'Three Row Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (196, 24, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (197, 18, 31.3557816, N'Triangular Three Stone Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (198, 18, 25.8328876, N'Vintage Hidden Halo Chevron Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (199, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 10)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (200, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (201, 24, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (202, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (203, 24, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (204, 24, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (205, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (206, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (207, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (208, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (209, 18, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (210, 18, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (211, 24, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (212, 24, 42.2234077, N'Three Row Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (213, 24, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (214, 18, 31.3557816, N'Triangular Three Stone Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (215, 18, 29.0397282, N'Elegance Side-Stone with Hidden Halo Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (216, 24, 38.12578, N'Pave Scalloped Hidden Halo Engagement Ring', 3, 10)
SET IDENTITY_INSERT [dbo].[accessory] OFF
GO
SET IDENTITY_INSERT [dbo].[accessory_image] ON 

INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (1, N'//www.withclarity.com/cdn/shop/files/1550361LGD0.5CTY_12d2d0d5-d75f-42e1-957e-6552fc1bfabe_400x.jpg?v=1700567733', 1)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (2, N'//www.withclarity.com/cdn/shop/products/EF1551947-YELLOW-FRONTVIEW_400x.jpg?v=1704698205', 2)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (3, N'//www.withclarity.com/cdn/shop/products/EF1551947-YELLOW-SIDEVIEW_400x.jpg?v=1704698205', 2)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (4, N'//www.withclarity.com/cdn/shop/products/1551555CZEFWI_Yellow1CT3D_400x.jpg?v=1698310751', 3)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (5, N'//www.withclarity.com/cdn/shop/files/EF1500816-0.5ctY_400x.jpg?v=1698658028', 4)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (6, N'//www.withclarity.com/cdn/shop/products/1551540-Y-FRONT_400x.jpg?v=1698238129', 5)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (7, N'//www.withclarity.com/cdn/shop/products/EF1551940-EMRALD-YELLOW-FRONTVIEW_400x.jpg?v=1704698156', 6)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (8, N'//www.withclarity.com/cdn/shop/products/EF1551940-EMRALD-YELLOW-SIDEVIEW_400x.jpg?v=1704698156', 6)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (9, N'//www.withclarity.com/cdn/shop/products/EF1551946-YELLOW-FRONTVIEW_400x.jpg?v=1704351649', 7)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (10, N'//www.withclarity.com/cdn/shop/products/EF1551946-YELLOW-SIDEVIEW_400x.jpg?v=1704351649', 7)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (11, N'//www.withclarity.com/cdn/shop/products/EF1575252LGD-YELLOW-FRONTVIEW_CR.BlueSapp_400x.jpg?v=1705642332', 8)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (12, N'//www.withclarity.com/cdn/shop/files/EF1500795LGD1ctY_400x.jpg?v=1704263033', 9)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (13, N'//www.withclarity.com/cdn/shop/products/EF1551944-YELLOW-FRONTVIEW_400x.jpg?v=1704351602', 10)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (14, N'//www.withclarity.com/cdn/shop/products/EF1551944-YELLOW-SIDEVIEW_400x.jpg?v=1704351602', 10)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (15, N'//www.withclarity.com/cdn/shop/products/EF1551779-YELLOW-FRONTVIEW_400x.jpg?v=1695981941', 11)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (16, N'//www.withclarity.com/cdn/shop/products/EF1551779-YELLOW-SIDEVIEW_400x.jpg?v=1695981941', 11)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (17, N'//www.withclarity.com/cdn/shop/products/1551552-Y-FRONT_400x.jpg?v=1698305212', 12)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (18, N'//www.withclarity.com/cdn/shop/products/EF1551889-YELLOW-FRONTVIEW_400x.jpg?v=1710927796', 13)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (19, N'//www.withclarity.com/cdn/shop/products/EF1551889-YELLOW-SIDEVIEW_400x.jpg?v=1710927796', 13)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (20, N'//www.withclarity.com/cdn/shop/files/EF1551941-YELLOW-FRONTVIEW_7a505159-e062-4ba7-b51d-1adada4a5460_400x.jpg?v=1707304427', 14)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (21, N'//www.withclarity.com/cdn/shop/files/nk1551470_4_400x.jpg?v=1698655887', 15)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (22, N'//www.withclarity.com/cdn/shop/files/1551471_Y_.50_400x.jpg?v=1698655370', 16)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (23, N'//www.withclarity.com/cdn/shop/products/PF1575416LGD-YELLOW-FRONTVIEW_CR.Ruby_400x.jpg?v=1705642202', 17)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (24, N'//www.withclarity.com/cdn/shop/products/PF1575153LGD-YELLOW-FRONTVIEW_CR.BlueSapp_400x.jpg?v=1705642096', 18)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (25, N'//www.withclarity.com/cdn/shop/files/1550342NLNLWI_Yellow_0.75CT_400x.jpg?v=1698405508', 19)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (26, N'//www.withclarity.com/cdn/shop/files/NF1552141-YELLOW-FRONTVIEW_400x.jpg?v=1714035511', 20)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (27, N'//www.withclarity.com/cdn/shop/files/NF1552141-YELLOW-SIDEVIEW_400x.jpg?v=1714035511', 20)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (28, N'//www.withclarity.com/cdn/shop/files/NF1552142-YELLOW-FRONTVIEW_400x.jpg?v=1714035702', 21)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (29, N'//www.withclarity.com/cdn/shop/files/NF1552142-YELLOW-SIDEVIEW_400x.jpg?v=1714035702', 21)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (30, N'//www.withclarity.com/cdn/shop/files/PF1575422LGD14KYBS1_400x.jpg?v=1695885233', 22)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (31, N'//www.withclarity.com/cdn/shop/products/PF1575425LGD-YELLOW-FRONTVIEW_CR.Ruby_400x.jpg?v=1705642157', 23)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (32, N'//www.withclarity.com/cdn/shop/files/PF1552138-YELLOW-FRONTVIEW_400x.jpg?v=1714036532', 24)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (33, N'//www.withclarity.com/cdn/shop/files/PF1552138-YELLOW-SIDEVIEW_400x.jpg?v=1714036532', 24)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (34, N'//www.withclarity.com/cdn/shop/files/PF1552140-YELLOW-FRONTVIEW_400x.jpg?v=1714036385', 25)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (35, N'//www.withclarity.com/cdn/shop/files/PF1552140-YELLOW-SIDEVIEW_400x.jpg?v=1714036385', 25)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (36, N'//www.withclarity.com/cdn/shop/files/BF1590013-Y-V1-R1_400x.png?v=1716457845', 26)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (37, N'//www.withclarity.com/cdn/shop/files/BF1590007-Y-V1-R1_400x.png?v=1716457494', 27)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (38, N'//www.withclarity.com/cdn/shop/files/BF1590032-Y-V1-R1_400x.png?v=1716381598', 28)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (39, N'//www.withclarity.com/cdn/shop/files/BF1590004-Y-V1-R1_400x.png?v=1716457162', 29)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (40, N'//www.withclarity.com/cdn/shop/files/BN1552146-YELLOW-FRONTVIEW_150daad8-72cf-4cbf-81f5-4269599e2d7a_400x.jpg?v=1713423679', 30)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (41, N'//www.withclarity.com/cdn/shop/files/BF1590017-Y-V1-R1_400x.png?v=1716455376', 31)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (42, N'//www.withclarity.com/cdn/shop/files/BF1590028-Y-V1-R1_400x.png?v=1716456331', 32)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (43, N'//www.withclarity.com/cdn/shop/files/BN1552155-YELLOW-FRONTVIEW_400x.jpg?v=1713423614', 33)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (44, N'//www.withclarity.com/cdn/shop/files/BN1552155-YELLOW-SIDEVIEW_400x.jpg?v=1713423614', 33)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (45, N'//www.withclarity.com/cdn/shop/files/BN1552156-YELLOW-FRONTVIEW_400x.jpg?v=1713423749', 34)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (46, N'//www.withclarity.com/cdn/shop/files/BN1552156-YELLOW-SIDEVIEW_400x.jpg?v=1713423749', 34)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (47, N'//www.withclarity.com/cdn/shop/files/BF1590014-Y-V1-R1_400x.png?v=1716457981', 35)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (48, N'//www.withclarity.com/cdn/shop/files/BF1590011-Y-V1-R1_400x.png?v=1716381030', 36)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (49, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-frontview_800x.jpg?v=1684020011', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (50, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-sideview_800x.jpg?v=1684020011', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (51, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-profileview_800x.jpg?v=1684020011', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (52, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (53, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (54, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (55, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644794', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (56, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644794', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (57, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644794', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (58, N'https://www.withclarity.com/cdn/shop/products/RB1501791-ROUND-YELLOW-FRONTVIEW_100ca641-2d69-4cf3-a151-d62044d7db9f_800x.jpg?v=1688387747', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (59, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-ROUND-FRONTVIEW_800x.jpg?v=1701056784', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (60, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-ROUND-SIDEVIEW_800x.jpg?v=1701056784', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (61, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-ROUND-PROFILEVIEW_800x.jpg?v=1701056784', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (62, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-frontview_800x.jpg?v=1684023223', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (63, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-sideview_800x.jpg?v=1684023223', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (64, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-profileview_800x.jpg?v=1684023223', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (65, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (66, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (67, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (68, N'https://www.withclarity.com/cdn/shop/files/RB1501088-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_408769b9-103e-4e64-b1db-95222bff95b4_800x.jpg?v=1702874407', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (69, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (70, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (71, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (72, N'https://www.withclarity.com/cdn/shop/files/RB1500082-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_800x.jpg?v=1702640869', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (73, N'https://www.withclarity.com/cdn/shop/files/RB1500082-ROUND-US7.0-2.50CT-YELLOW-SIDEVIEW_800x.jpg?v=1702640869', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (74, N'https://www.withclarity.com/cdn/shop/files/RB1500082-ROUND-US7.0-2.50CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702640869', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (75, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872821', 47)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (76, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872821', 47)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (77, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872821', 47)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (78, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-round-yellow-frontview_eca75500-55fe-48a4-a1bd-3b5cb5789fda_800x.jpg?v=1684010489', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (79, N'https://www.withclarity.com/cdn/shop/products/RB1501699-ROUND-YELLOW-FRONTVIEW_a40a74a1-bfd1-4530-b0c5-0925953f5647_800x.jpg?v=1690201533', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (80, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-frontview_800x.jpg?v=1684024555', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (81, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-sideview_800x.jpg?v=1684024555', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (82, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-profileview_800x.jpg?v=1684024555', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (83, N'https://www.withclarity.com/cdn/shop/products/RB1502007-ROUND-YELLOW-FRONTVIEW_52a52033-b87e-47b7-91d6-b4e2a1faf99b_800x.jpg?v=1690889930', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (84, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-frontview_800x.jpg?v=1684488384', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (85, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-sideview_800x.jpg?v=1684488384', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (86, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-profileview_800x.jpg?v=1684488384', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (87, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (88, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (89, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (90, N'https://www.withclarity.com/cdn/shop/products/RB1501867-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1686128195', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (91, N'https://www.withclarity.com/cdn/shop/products/RB1501867-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1686128195', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (92, N'https://www.withclarity.com/cdn/shop/products/RB1501867-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1686128195', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (93, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-frontview_800x.jpg?v=1684020012', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (94, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-sideview_800x.jpg?v=1684020012', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (95, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-profileview_800x.jpg?v=1684020012', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (96, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (97, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (98, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (99, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-emerald-yellow-frontview_e167b778-d365-453b-b347-64355b1117d6_800x.jpg?v=1684027802', 57)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (100, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (101, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (102, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (103, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-emerald-yellow-frontview_800x.jpg?v=1701056784', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (104, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-emerald-yellow-sideview_800x.jpg?v=1701056784', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (105, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-emerald-yellow-profileview_800x.jpg?v=1701056784', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (106, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-frontview_800x.jpg?v=1684023223', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (107, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-sideview_800x.jpg?v=1684023223', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (108, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-profileview_800x.jpg?v=1684023223', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (109, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (110, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (111, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (112, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-frontview_800x.jpg?v=1684015837', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (113, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-sideview_800x.jpg?v=1684015837', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (114, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-profileview_800x.jpg?v=1684015837', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (115, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (116, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (117, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (118, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-emerald-yellow-frontview_7b548c8b-b2f8-4b58-9d00-4ecee66cb6a5_800x.jpg?v=1702640869', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (119, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-frontview_800x.jpg?v=1684000196', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (120, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-sideview_800x.jpg?v=1684000196', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (121, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-profileview_800x.jpg?v=1684000196', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (122, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-emerald-yellow-frontview_5ea56f03-28f0-436c-a24b-3d2beaf7d9b5_800x.jpg?v=1684010489', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (123, N'https://www.withclarity.com/cdn/shop/products/RB1502007-EMERALD-YELLOW-FRONTVIEW_6d80b92d-5329-4306-ae40-78937aeaf173_800x.jpg?v=1690889930', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (124, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686128196', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (125, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686128196', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (126, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686128196', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (127, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-frontview_800x.jpg?v=1684015552', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (128, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-sideview_800x.jpg?v=1684015552', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (129, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-profileview_800x.jpg?v=1684015552', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (130, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-frontview_800x.jpg?v=1684007718', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (131, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-sideview_800x.jpg?v=1684007718', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (132, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-profileview_800x.jpg?v=1684007718', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (133, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114790', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (134, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114790', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (135, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114790', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (136, N'https://www.withclarity.com/cdn/shop/products/RB1501900-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688123163', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (137, N'https://www.withclarity.com/cdn/shop/products/RB1501900-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688123163', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (138, N'https://www.withclarity.com/cdn/shop/products/RB1501900-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688123163', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (139, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-heart-yellow-frontview_30e0e9ba-1456-41af-91cf-559bc1549c53_800x.jpg?v=1684027802', 73)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (140, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-heart-yellow-frontview_03dde7d9-b016-486c-84a0-680f2173e703_800x.jpg?v=1702640869', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (141, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-frontview_800x.jpg?v=1684024555', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (142, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-sideview_800x.jpg?v=1684024555', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (143, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-profileview_800x.jpg?v=1684024555', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (144, N'https://www.withclarity.com/cdn/shop/products/enrrb1501086-heart-yellow-frontview_6b79560a-8c96-4c61-ab6b-9caf792a4412_800x.jpg?v=1684008857', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (145, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (146, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (147, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (148, N'https://www.withclarity.com/cdn/shop/products/ens4125-heart-yellow-frontview_410ef4c4-f86b-4201-a1c0-a0972d07e4ce_800x.jpg?v=1683999062', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (149, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-frontview_800x.jpg?v=1698665519', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (150, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-sideview_800x.jpg?v=1698665519', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (151, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-profileview_800x.jpg?v=1698665519', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (152, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-frontview_800x.jpg?v=1684001733', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (153, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-sideview_800x.jpg?v=1684001733', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (154, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-profileview_800x.jpg?v=1684001733', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (155, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-frontview_800x.jpg?v=1684002653', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (156, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-sideview_800x.jpg?v=1684002653', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (157, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-profileview_800x.jpg?v=1684002653', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (158, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-FRONTVIEW_800x.jpg?v=1691757231', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (159, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-SIDEVIEW_800x.jpg?v=1691757231', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (160, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-PROFILEVIEW_800x.jpg?v=1691757231', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (161, N'https://www.withclarity.com/cdn/shop/products/enrrb1500601-heart-yellow-frontview_ecab8ea2-d503-4c50-81b2-7bf223e10cac_800x.jpg?v=1684002886', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (162, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-frontview_800x.jpg?v=1684007214', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (163, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-sideview_800x.jpg?v=1684007214', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (164, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-profileview_800x.jpg?v=1684007214', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (165, N'https://www.withclarity.com/cdn/shop/products/enrrb1500108-heart-yellow-frontview_d4c12616-0278-4878-b69d-e04986f63d11_800x.jpg?v=1684002171', 85)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (166, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-frontview_800x.jpg?v=1684024398', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (167, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-sideview_800x.jpg?v=1684024398', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (168, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-profileview_800x.jpg?v=1684024398', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (169, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-frontview_800x.jpg?v=1684025003', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (170, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-sideview_800x.jpg?v=1684025003', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (171, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-profileview_800x.jpg?v=1684025003', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (172, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-frontview_800x.jpg?v=1684025822', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (173, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-sideview_800x.jpg?v=1684025822', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (174, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-profileview_800x.jpg?v=1684025822', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (175, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-frontview_800x.jpg?v=1684003323', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (176, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-sideview_800x.jpg?v=1684003323', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (177, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-profileview_800x.jpg?v=1684003323', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (178, N'https://www.withclarity.com/cdn/shop/products/enrrb1500536-heart-yellow-frontview_800x.jpg?v=1684024632', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (179, N'https://www.withclarity.com/cdn/shop/products/enrrb1500536-heart-yellow-sideview_800x.jpg?v=1684024632', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (180, N'https://www.withclarity.com/cdn/shop/products/enrrb1500536-heart-yellow-profileview_800x.jpg?v=1684024632', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (181, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (182, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (183, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (184, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-pear-yellow-frontview_ea9a4e87-9dab-4595-8ac7-0807a29c843a_800x.jpg?v=1702640869', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (185, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-frontview_800x.jpg?v=1684000196', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (186, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-sideview_800x.jpg?v=1684000196', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (187, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-profileview_800x.jpg?v=1684000196', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (188, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-pear-yellow-frontview_23ee3e3a-ac6f-4225-b11e-153cd88b2e9e_800x.jpg?v=1684010489', 94)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (189, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-frontview_800x.jpg?v=1684003696', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (190, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-sideview_800x.jpg?v=1684003696', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (191, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-profileview_800x.jpg?v=1684003696', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (192, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-FRONTVIEW_800x.jpg?v=1688104427', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (193, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-SIDEVIEW_800x.jpg?v=1688104427', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (194, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-PROFILEVIEW_800x.jpg?v=1688104427', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (195, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-frontview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (196, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-sideview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (197, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-profileview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (198, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1709114842', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (199, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1709114842', 98)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (200, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1709114842', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (201, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-frontview_800x.jpg?v=1684026208', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (202, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-sideview_800x.jpg?v=1684026208', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (203, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-profileview_800x.jpg?v=1684026208', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (204, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-pear-yellow-frontview_7f786c4f-a395-46a0-96f6-3a34589afe38_800x.jpg?v=1684008700', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (205, N'https://www.withclarity.com/cdn/shop/products/ens3012-pear-yellow-frontview_800x.jpg?v=1684008019', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (206, N'https://www.withclarity.com/cdn/shop/products/ens3012-pear-yellow-sideview_800x.jpg?v=1684008019', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (207, N'https://www.withclarity.com/cdn/shop/products/ens3012-pear-yellow-profileview_800x.jpg?v=1684008019', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (208, N'https://www.withclarity.com/cdn/shop/products/enrrb1500981-pear-yellow-frontview_800x.jpg?v=1684006077', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (209, N'https://www.withclarity.com/cdn/shop/products/enrrb1500981-pear-yellow-sideview_800x.jpg?v=1684006077', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (210, N'https://www.withclarity.com/cdn/shop/products/enrrb1500981-pear-yellow-profileview_800x.jpg?v=1684006077', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (211, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1689842083', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (212, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1689842083', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (213, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1689842083', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (214, N'https://www.withclarity.com/cdn/shop/products/RB1501786-PEAR-YELLOW-FRONTVIEW_3131d2d5-30c6-4f01-be08-8b69083d4bf1_800x.jpg?v=1696575616', 104)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (215, N'https://www.withclarity.com/cdn/shop/products/ens1100-pear-yellow-frontview_b7aa7c89-76ab-4680-97a2-ffaa20027a53_800x.jpg?v=1698729076', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (216, N'https://www.withclarity.com/cdn/shop/products/RB1501247-pear-yellow-frontview_2e2198f7-a5d8-496c-b763-d048cffdca45_800x.jpg?v=1684030447', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (217, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1707916887', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (218, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1707916887', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (219, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1707916887', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (220, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (221, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (222, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (223, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-frontview_800x.jpg?v=1684020012', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (224, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-sideview_800x.jpg?v=1684020012', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (225, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-profileview_800x.jpg?v=1684020012', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (226, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (227, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (228, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (229, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644755', 111)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (230, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644755', 111)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (231, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644755', 111)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (232, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (233, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (234, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (235, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-OVAL-FRONTVIEW_800x.jpg?v=1701056784', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (236, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-OVAL-SIDEVIEW_800x.jpg?v=1701056784', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (237, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-OVAL-PROFILEVIEW_800x.jpg?v=1701056784', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (238, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-frontview_800x.jpg?v=1684023223', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (239, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-sideview_800x.jpg?v=1684023223', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (240, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-profileview_800x.jpg?v=1684023223', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (241, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (242, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (243, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (244, N'https://www.withclarity.com/cdn/shop/files/RB1501088-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_e376c0fd-ed17-4b49-910f-6d742857e39a_800x.jpg?v=1702874875', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (245, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (246, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (247, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (248, N'https://www.withclarity.com/cdn/shop/files/RB1500082OVALUS7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702640869', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (249, N'https://www.withclarity.com/cdn/shop/files/RB1500082OVALUS7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702640869', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (250, N'https://www.withclarity.com/cdn/shop/files/RB1500082OVALUS7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702640869', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (251, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872863', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (252, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872863', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (253, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872863', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (254, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-oval-yellow-frontview_77d87f4f-70fb-4775-bf42-144c07e2c29c_800x.jpg?v=1684010489', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (255, N'https://www.withclarity.com/cdn/shop/products/RB1501699-OVAL-YELLOW-FRONTVIEW_9f4f007a-b539-4b64-a21e-f2b237e16886_800x.jpg?v=1690201533', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (256, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-frontview_800x.jpg?v=1684024555', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (257, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-sideview_800x.jpg?v=1684024555', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (258, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-profileview_800x.jpg?v=1684024555', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (259, N'https://www.withclarity.com/cdn/shop/products/RB1502007-OVAL-YELLOW-FRONTVIEW_32e9dc9c-bac6-418d-ae7c-d2429a42488e_800x.jpg?v=1690889930', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (260, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-frontview_800x.jpg?v=1684488384', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (261, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-sideview_800x.jpg?v=1684488384', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (262, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-profileview_800x.jpg?v=1684488384', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (263, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1686128195', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (264, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1686128195', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (265, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1686128195', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (266, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-frontview_800x.jpg?v=1684015552', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (267, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-sideview_800x.jpg?v=1684015552', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (268, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-profileview_800x.jpg?v=1684015552', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (269, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-frontview_800x.jpg?v=1684020012', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (270, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-sideview_800x.jpg?v=1684020012', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (271, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-profileview_800x.jpg?v=1684020012', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (272, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-cushion-yellow-frontview_ee1d3e94-8e47-434a-835c-8a461d87adae_800x.jpg?v=1684027802', 128)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (273, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-CUSHION-FRONTVIEW_800x.jpg?v=1701056784', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (274, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-CUSHION-SIDEVIEW_800x.jpg?v=1701056784', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (275, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-CUSHION-PROFILEVIEW_800x.jpg?v=1701056784', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (276, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-frontview_800x.jpg?v=1684023223', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (277, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-sideview_800x.jpg?v=1684023223', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (278, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-profileview_800x.jpg?v=1684023223', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (279, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-frontview_800x.jpg?v=1684015836', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (280, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-sideview_800x.jpg?v=1684015836', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (281, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-profileview_800x.jpg?v=1684015836', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (282, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-cushion-yellow-frontview_3f0054c9-ad5a-49de-8a8c-c118894f6642_800x.jpg?v=1702640869', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (283, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-frontview_800x.jpg?v=1684000196', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (284, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-sideview_800x.jpg?v=1684000196', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (285, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-profileview_800x.jpg?v=1684000196', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (286, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-cushion-yellow-frontview_3cfcadbb-4fcc-462a-b259-7cdf2fc7a039_800x.jpg?v=1684010489', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (287, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-frontview_800x.jpg?v=1684024555', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (288, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-sideview_800x.jpg?v=1684024555', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (289, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-profileview_800x.jpg?v=1684024555', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (290, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-frontview_800x.jpg?v=1684488384', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (291, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-sideview_800x.jpg?v=1684488384', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (292, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-profileview_800x.jpg?v=1684488384', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (293, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (294, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (295, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (296, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-frontview_800x.jpg?v=1684015552', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (297, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-sideview_800x.jpg?v=1684015552', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (298, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-profileview_800x.jpg?v=1684015552', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (299, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-frontview_800x.jpg?v=1684007718', 139)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (300, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-sideview_800x.jpg?v=1684007718', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (301, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-profileview_800x.jpg?v=1684007718', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (302, N'https://www.withclarity.com/cdn/shop/products/enrrb1500156-cushion-yellow-frontview_1838365b-5bff-45fe-9680-698ecf2f8564_800x.jpg?v=1684001976', 140)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (303, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-frontview_800x.jpg?v=1684003696', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (304, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-sideview_800x.jpg?v=1684003696', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (305, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-profileview_800x.jpg?v=1684003696', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (306, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-frontview_800x.jpg?v=1684022961', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (307, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-sideview_800x.jpg?v=1684022961', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (308, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-profileview_800x.jpg?v=1684022961', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (309, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-frontview_800x.jpg?v=1696413352', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (310, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-sideview_800x.jpg?v=1696413352', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (311, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-profileview_800x.jpg?v=1696413352', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (312, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-frontview_800x.jpg?v=1684733093', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (313, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-sideview_800x.jpg?v=1684733093', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (314, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-profileview_800x.jpg?v=1684733093', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (315, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-princess-yellow-frontview_6b125954-37d4-4406-b944-41340b3d4b1f_800x.jpg?v=1684027801', 145)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (316, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-princess-yellow-frontview_800x.jpg?v=1701056784', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (317, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-princess-yellow-sideview_800x.jpg?v=1701056784', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (318, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-princess-yellow-profileview_800x.jpg?v=1701056784', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (319, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-princess-yellow-frontview_ac5363f9-9151-4bd6-b876-145cd17ef5e3_800x.jpg?v=1702640869', 147)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (320, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-frontview_800x.jpg?v=1684007718', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (321, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-sideview_800x.jpg?v=1684007718', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (322, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-profileview_800x.jpg?v=1684007718', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (323, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-frontview_800x.jpg?v=1684003696', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (324, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-sideview_800x.jpg?v=1684003696', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (325, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-profileview_800x.jpg?v=1684003696', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (326, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-frontview_800x.jpg?v=1696413352', 150)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (327, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-sideview_800x.jpg?v=1696413352', 150)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (328, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-profileview_800x.jpg?v=1696413352', 150)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (329, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-frontview_800x.jpg?v=1684733093', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (330, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-sideview_800x.jpg?v=1684733093', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (331, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-profileview_800x.jpg?v=1684733093', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (332, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-frontview_800x.jpg?v=1684013310', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (333, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-sideview_800x.jpg?v=1684013310', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (334, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-profileview_800x.jpg?v=1684013310', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (335, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1692938717', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (336, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1692938717', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (337, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1692938717', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (338, N'https://www.withclarity.com/cdn/shop/products/ens3012-princess-yellow-frontview_800x.jpg?v=1684008019', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (339, N'https://www.withclarity.com/cdn/shop/products/ens3012-princess-yellow-sideview_800x.jpg?v=1684008019', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (340, N'https://www.withclarity.com/cdn/shop/products/ens3012-princess-yellow-profileview_800x.jpg?v=1684008019', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (341, N'https://www.withclarity.com/cdn/shop/products/ens1100-princess-yellow-frontview_7146b479-24a9-4d42-9da2-d4568665b547_800x.jpg?v=1698729076', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (342, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1709114738', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (343, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1709114738', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (344, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1709114738', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (345, N'https://www.withclarity.com/cdn/shop/products/RB1501247-princess-yellow-frontview_e67b1a5a-cb68-4935-96a1-3ed81f153672_800x.jpg?v=1684030447', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (346, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-frontview_800x.jpg?v=1707916887', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (347, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-sideview_800x.jpg?v=1707916887', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (348, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-profileview_800x.jpg?v=1707916887', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (349, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-frontview_800x.jpg?v=1684025123', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (350, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-sideview_800x.jpg?v=1684025123', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (351, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-profileview_800x.jpg?v=1684025123', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (352, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-frontview_800x.jpg?v=1702642290', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (353, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-sideview_800x.jpg?v=1702642290', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (354, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-profileview_800x.jpg?v=1702642290', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (355, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-frontview_800x.jpg?v=1698668120', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (356, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-sideview_800x.jpg?v=1698668120', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (357, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-profileview_800x.jpg?v=1698668120', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (358, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-frontview_800x.jpg?v=1684007073', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (359, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-sideview_800x.jpg?v=1684007073', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (360, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-profileview_800x.jpg?v=1684007073', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (361, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-frontview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (362, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-sideview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (363, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-profileview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (364, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-radiant-yellow-frontview_f563a058-ce34-4c01-a199-3d42007e886b_800x.jpg?v=1684027801', 164)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (365, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-radiant-yellow-frontview_800x.jpg?v=1701056784', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (366, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-radiant-yellow-sideview_800x.jpg?v=1701056784', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (367, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-radiant-yellow-profileview_800x.jpg?v=1701056784', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (368, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-frontview_800x.jpg?v=1684023223', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (369, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-sideview_800x.jpg?v=1684023223', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (370, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-profileview_800x.jpg?v=1684023223', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (371, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-frontview_800x.jpg?v=1684015836', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (372, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-sideview_800x.jpg?v=1684015836', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (373, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-profileview_800x.jpg?v=1684015836', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (374, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-radiant-yellow-frontview_8e35c4e4-d5d7-4acb-8f92-930bc4f8d0f0_800x.jpg?v=1702640869', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (375, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-frontview_800x.jpg?v=1684000196', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (376, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-sideview_800x.jpg?v=1684000196', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (377, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-profileview_800x.jpg?v=1684000196', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (378, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-radiant-yellow-frontview_e4d9c7a2-918f-4afc-a387-643002608407_800x.jpg?v=1684010489', 170)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (379, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-frontview_800x.jpg?v=1684015552', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (380, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-sideview_800x.jpg?v=1684015552', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (381, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-profileview_800x.jpg?v=1684015552', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (382, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-frontview_800x.jpg?v=1684007718', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (383, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-sideview_800x.jpg?v=1684007718', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (384, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-profileview_800x.jpg?v=1684007718', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (385, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-frontview_800x.jpg?v=1684003696', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (386, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-sideview_800x.jpg?v=1684003696', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (387, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-profileview_800x.jpg?v=1684003696', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (388, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-frontview_800x.jpg?v=1684022961', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (389, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-sideview_800x.jpg?v=1684022961', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (390, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-profileview_800x.jpg?v=1684022961', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (391, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-frontview_800x.jpg?v=1696413352', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (392, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-sideview_800x.jpg?v=1696413352', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (393, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-profileview_800x.jpg?v=1696413352', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (394, N'https://www.withclarity.com/cdn/shop/products/enrrb1501081-radiant-yellow-frontview_800x.jpg?v=1684015465', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (395, N'https://www.withclarity.com/cdn/shop/products/enrrb1501081-radiant-yellow-sideview_800x.jpg?v=1684015465', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (396, N'https://www.withclarity.com/cdn/shop/products/enrrb1501081-radiant-yellow-profileview_800x.jpg?v=1684015465', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (397, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1693895169', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (398, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1693895169', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (399, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1693895169', 177)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (400, N'https://www.withclarity.com/cdn/shop/products/enrrb1501017-radiant-yellow-frontview_087c1284-fd4a-4f49-be10-ecfceb3803af_800x.jpg?v=1684019047', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (401, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-radiant-yellow-frontview_800x.jpg?v=1684013310', 179)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (402, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-radiant-yellow-sideview_800x.jpg?v=1684013310', 179)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (403, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-radiant-yellow-profileview_800x.jpg?v=1684013310', 179)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (404, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-radiant-yellow-frontview_00558550-6d87-4d37-9678-da8ab6aac790_800x.jpg?v=1684008700', 180)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (405, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1692791491', 181)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (406, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1692791491', 181)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (407, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1692791491', 181)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (408, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-frontview_800x.jpg?v=1684000196', 182)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (409, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-sideview_800x.jpg?v=1684000196', 182)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (410, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-profileview_800x.jpg?v=1684000196', 182)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (411, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-frontview_800x.jpg?v=1684003697', 183)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (412, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-sideview_800x.jpg?v=1684003697', 183)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (413, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-profileview_800x.jpg?v=1684003697', 183)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (414, N'https://www.withclarity.com/cdn/shop/products/ens3012-marquise-yellow-frontview_800x.jpg?v=1684008019', 184)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (415, N'https://www.withclarity.com/cdn/shop/products/ens3012-marquise-yellow-sideview_800x.jpg?v=1684008019', 184)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (416, N'https://www.withclarity.com/cdn/shop/products/ens3012-marquise-yellow-profileview_800x.jpg?v=1684008019', 184)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (417, N'https://www.withclarity.com/cdn/shop/products/RB1501850-marquise-yellow-frontview_35afbad7-fcd7-4c02-808f-ee793e1d64f6_800x.jpg?v=1687261230', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (418, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1697026088', 186)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (419, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1697026088', 186)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (420, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1697026088', 186)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (421, N'https://www.withclarity.com/cdn/shop/products/ens1100-marquise-yellow-frontview_10e93f6f-c2ed-465f-adf7-d8cead1258ac_800x.jpg?v=1698729076', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (422, N'https://www.withclarity.com/cdn/shop/products/RB1501247-marquise-yellow-frontview_eaaa5399-6888-4609-bd0d-00ece005c640_800x.jpg?v=1684030448', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (423, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-frontview_800x.jpg?v=1684010573', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (424, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-sideview_800x.jpg?v=1684010573', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (425, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-profileview_800x.jpg?v=1684010573', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (426, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (427, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (428, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (429, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (430, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (431, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (432, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1696929172', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (433, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1696929172', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (434, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1696929172', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (435, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-frontview_800x.jpg?v=1684001288', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (436, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-sideview_800x.jpg?v=1684001288', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (437, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-profileview_800x.jpg?v=1684001288', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (438, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-frontview_800x.jpg?v=1684030757', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (439, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-sideview_800x.jpg?v=1684030757', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (440, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-profileview_800x.jpg?v=1684030757', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (441, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-frontview_800x.jpg?v=1684008173', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (442, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-sideview_800x.jpg?v=1684008173', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (443, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-profileview_800x.jpg?v=1684008173', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (444, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-frontview_800x.jpg?v=1684026564', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (445, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-sideview_800x.jpg?v=1684026564', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (446, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-profileview_800x.jpg?v=1684026564', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (447, N'https://www.withclarity.com/cdn/shop/products/ens3112-marquise-yellow-frontview_800x.jpg?v=1684006453', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (448, N'https://www.withclarity.com/cdn/shop/products/ens3112-marquise-yellow-sideview_800x.jpg?v=1684006453', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (449, N'https://www.withclarity.com/cdn/shop/products/ens3112-marquise-yellow-profileview_800x.jpg?v=1684006453', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (450, N'https://www.withclarity.com/cdn/shop/products/enrrb1500085-marquise-yellow-frontview_0ec67e38-becf-4e84-a3f8-ae1bba832ed7_800x.jpg?v=1692937356', 198)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (451, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1692791491', 199)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (452, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1692791491', 199)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (453, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1692791491', 199)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (454, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-frontview_800x.jpg?v=1684000196', 200)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (455, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-sideview_800x.jpg?v=1684000196', 200)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (456, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-profileview_800x.jpg?v=1684000196', 200)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (457, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1711944346', 201)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (458, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1711944346', 201)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (459, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1711944346', 201)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (460, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-frontview_800x.jpg?v=1684003696', 202)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (461, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-sideview_800x.jpg?v=1684003696', 202)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (462, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-profileview_800x.jpg?v=1684003696', 202)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (463, N'https://www.withclarity.com/cdn/shop/products/RB1502003-EMERALD-YELLOW-FRONTVIEW_5766cd79-97a6-4d6f-a7cc-6f2b5bbbaf96_800x.jpg?v=1692938715', 203)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (464, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-frontview_800x.jpg?v=1684008019', 204)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (465, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-sideview_800x.jpg?v=1684008019', 204)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (466, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-profileview_800x.jpg?v=1684008019', 204)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (467, N'https://www.withclarity.com/cdn/shop/products/ens1100-asscher-yellow-frontview_c205c21d-26c7-4946-98c2-4009dc4e26c5_800x.jpg?v=1698729076', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (468, N'https://www.withclarity.com/cdn/shop/products/RB1501247-asscher-yellow-frontview_0fe18450-84e3-4fdd-a921-ca8a44a57044_800x.jpg?v=1684030447', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (469, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-frontview_800x.jpg?v=1707916887', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (470, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-sideview_800x.jpg?v=1707916887', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (471, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-profileview_800x.jpg?v=1707916887', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (472, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (473, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (474, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (475, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-frontview_800x.jpg?v=1698668120', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (476, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-sideview_800x.jpg?v=1698668120', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (477, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-profileview_800x.jpg?v=1698668120', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (478, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-frontview_800x.jpg?v=1684001288', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (479, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-sideview_800x.jpg?v=1684001288', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (480, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-profileview_800x.jpg?v=1684001288', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (481, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-frontview_800x.jpg?v=1684030756', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (482, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-sideview_800x.jpg?v=1684030756', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (483, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-profileview_800x.jpg?v=1684030756', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (484, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-frontview_800x.jpg?v=1684008173', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (485, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-sideview_800x.jpg?v=1684008173', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (486, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-profileview_800x.jpg?v=1684008173', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (487, N'https://www.withclarity.com/cdn/shop/products/ens4139-asscher-yellow-frontview_ae9f1dcf-8b60-4f63-85af-a9acc9df928d_800x.jpg?v=1684026564', 213)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (488, N'https://www.withclarity.com/cdn/shop/products/ens3112-asscher-yellow-frontview_800x.jpg?v=1684006453', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (489, N'https://www.withclarity.com/cdn/shop/products/ens3112-asscher-yellow-sideview_800x.jpg?v=1684006453', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (490, N'https://www.withclarity.com/cdn/shop/products/ens3112-asscher-yellow-profileview_800x.jpg?v=1684006453', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (491, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (492, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (493, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (494, N'https://www.withclarity.com/cdn/shop/products/RB1502102-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1707200019', 216)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (495, N'https://www.withclarity.com/cdn/shop/products/RB1502102-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1707200019', 216)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (496, N'https://www.withclarity.com/cdn/shop/products/RB1502102-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1707200019', 216)
SET IDENTITY_INSERT [dbo].[accessory_image] OFF
GO
SET IDENTITY_INSERT [dbo].[accessory_type] ON 

INSERT [dbo].[accessory_type] ([accessory_type_id], [name], [processing_price]) VALUES (1, N'Earrings', 200)
INSERT [dbo].[accessory_type] ([accessory_type_id], [name], [processing_price]) VALUES (2, N'Necklaces', 400)
INSERT [dbo].[accessory_type] ([accessory_type_id], [name], [processing_price]) VALUES (3, N'Rings', 150)
INSERT [dbo].[accessory_type] ([accessory_type_id], [name], [processing_price]) VALUES (4, N'Bracelets', 300)
SET IDENTITY_INSERT [dbo].[accessory_type] OFF
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([account_id], [role_id], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (1, 1, 1, N'ToiLaCustomer', N'customer@gmail.com', N'12345', N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'', 0, CAST(N'2024-05-23T19:51:27.6338380' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role_id], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (2, 2, 2, N'ToiLaSaleStaff', N'sale_staff@gmail.com', N'12345', N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'', 0, CAST(N'2024-05-23T19:51:27.6340482' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role_id], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (3, 3, 3, N'ToiLaDeliverystaff', N'delivery_staff@gmail.com', N'12345', N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'', 0, CAST(N'2024-05-23T19:51:27.6340488' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role_id], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (4, 4, 4, N'ToiLaWarrantyStaff', N'warranty_staff@gmail.com', N'12345', N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'', 0, CAST(N'2024-05-23T19:51:27.6340490' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role_id], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (5, 5, 5, N'ToiLaManager', N'manager@gmail.com', N'12345', N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'', 0, CAST(N'2024-05-23T19:51:27.6340493' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role_id], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (6, 6, 6, N'ToiLaAdministrator', N'administrator@gmail.com', N'12345', N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'', 0, CAST(N'2024-05-23T19:51:27.6340501' AS DateTime2))
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond] ON 

INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (1, N'IGI', 615380399, N'https://www.igi.org/verify-your-report/?r=615380399', N'https://v360.diamonds/c/39478e1f-efea-402c-ba96-2e68e31a0c54?m=i&a=615380399', 3.03, N'Ideal', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (2, N'IGI', 618491447, N'https://www.igi.org/verify-your-report/?r=618491447', N'https://v360.diamonds/c/39478e1f-efea-402c-ba96-2e68e31a0c54?m=i&a=618491447', 3.02, N'Ideal', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (3, N'IGI', 620489774, N'https://www.igi.org/verify-your-report/?r=620489774', N'https://v360.diamonds/u/c6fbb446-1c93-4cae-8a71-98a07a09e1d5?m=i', 3.01, N'Excellent', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (4, N'IGI', 620455816, N'https://www.igi.org/verify-your-report/?r=620455816', N'https://v360.diamonds/u/ca54b4c1-f094-414b-be67-f08e74e9f429?m=d', 3.08, N'Ideal', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (5, N'IGI', 632444095, N'https://www.igi.org/verify-your-report/?r=632444095', N'https://video.diamondasset.in:8080/imagesM/632444095.jpg', 5.26, N'Ideal', N'E', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (6, N'IGI', 632444014, N'https://www.igi.org/verify-your-report/?r=632444014', N'https://video.diamondasset.in:8080/imagesM/632444014.jpg', 5.11, N'Excellent', N'E', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (7, N'IGI', 632443228, N'https://www.igi.org/verify-your-report/?r=632443228', N'https://video.diamondasset.in:8080/imagesM/632443228.jpg', 5.04, N'Ideal', N'E', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (8, N'IGI', 631455159, N'https://www.igi.org/verify-your-report/?r=631455159', N'https://video.diamondasset.in:8080/imagesM/631455159.jpg', 5.05, N'Ideal', N'E', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (9, N'IGI', 632416490, N'https://www.igi.org/verify-your-report/?r=632416490', N'https://video.diamondasset.in:8080/imagesM/632416490.jpg', 5.15, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (10, N'IGI', 629474789, N'https://www.igi.org/verify-your-report/?r=629474789', N'https://video.diamondasset.in:8080/imagesM/629474789.jpg', 5.14, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (11, N'IGI', 613384247, N'https://www.igi.org/verify-your-report/?r=613384247', N'https://video.diamondasset.in:8080/imagesM/613384247.jpg', 5.3, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (12, N'IGI', 627411000, N'https://www.igi.org/verify-your-report/?r=627411000', N'https://video.diamondasset.in:8080/imagesM/627411000.jpg', 5.14, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (13, N'IGI', 630453028, N'https://www.igi.org/verify-your-report/?r=630453028', N'https://video.diamondasset.in:8080/imagesM/630453028.jpg', 5.83, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (14, N'IGI', 625497418, N'https://www.igi.org/verify-your-report/?r=625497418', N'https://video.diamondasset.in:8080/imagesM/625497418.jpg', 5.71, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (15, N'IGI', 625472818, N'https://www.igi.org/verify-your-report/?r=625472818', N'https://video.diamondasset.in:8080/imagesM/625472818.jpg', 5.3, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (16, N'IGI', 618469422, N'https://www.igi.org/verify-your-report/?r=618469422', N'https://video.diamondasset.in:8080/imagesM/618469422.jpg', 5.26, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (17, N'IGI', 618482889, N'https://www.igi.org/verify-your-report/?r=618482889', N'https://video.diamondasset.in:8080/imagesM/618482889.jpg', 5.18, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (18, N'IGI', 624444493, N'https://www.igi.org/verify-your-report/?r=624444493', N'https://video.diamondasset.in:8080/imagesM/624444493.jpg', 5.53, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (19, N'IGI', 626415993, N'https://www.igi.org/verify-your-report/?r=626415993', N'https://video.diamondasset.in:8080/imagesM/626415993.jpg', 5.36, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (20, N'IGI', 626402561, N'https://www.igi.org/verify-your-report/?r=626402561', N'https://video.diamondasset.in:8080/imagesM/626402561.jpg', 5.7, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (21, N'IGI', 614303223, N'https://www.igi.org/verify-your-report/?r=614303223', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e94cc0b9-b45a-4b48-8daf-cca267f64d83.jpg', 0.54, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (22, N'IGI', 618466200, N'https://www.igi.org/verify-your-report/?r=618466200', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e8f12212-9e81-4b63-88be-e66c0ce4d704.jpg', 0.54, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (23, N'IGI', 629421232, N'https://www.igi.org/verify-your-report/?r=629421232', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e12f9cac-ddb0-4300-a35b-dc2a45b604a3.jpg', 0.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (24, N'IGI', 627442214, N'https://www.igi.org/verify-your-report/?r=627442214', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/05a57a0d-cfad-4abf-8009-d8564b58eaaf.jpg', 0.61, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (25, N'IGI', 632469076, N'https://www.igi.org/verify-your-report/?r=632469076', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/109eaa64-465d-4a3e-bb63-e2fcf4c59bcd.jpg', 0.66, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (26, N'IGI', 634472017, N'https://www.igi.org/verify-your-report/?r=634472017', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5950c8d1-ee6e-46f9-ac32-6b6fc1227d12.jpg', 0.71, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (27, N'IGI', 623438859, N'https://www.igi.org/verify-your-report/?r=623438859', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/025661ff-f10e-4b32-94af-3e77f07fcbdf.jpg', 0.74, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (28, N'IGI', 618466201, N'https://www.igi.org/verify-your-report/?r=618466201', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ff400ba8-7145-450d-9999-fad7581f04c5.jpg', 0.74, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (29, N'IGI', 627489949, N'https://www.igi.org/verify-your-report/?r=627489949', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV405-136A', 0.74, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (30, N'IGI', 623438861, N'https://www.igi.org/verify-your-report/?r=623438861', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/fb4abdae-32c5-4071-905e-f194037c03ca.jpg', 0.75, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (31, N'IGI', 627489932, N'https://www.igi.org/verify-your-report/?r=627489932', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV399-97D', 0.75, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (32, N'IGI', 627489931, N'https://www.igi.org/verify-your-report/?r=627489931', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Emerald_7ec0c3fc-cb0c-4bf3-b968-a50eafde37b1.jpg?v=1702020830', 0.77, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (33, N'IGI', 627489685, N'https://www.igi.org/verify-your-report/?r=627489685', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Emerald_7ec0c3fc-cb0c-4bf3-b968-a50eafde37b1.jpg?v=1702020830', 0.81, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (34, N'IGI', 621480441, N'https://www.igi.org/verify-your-report/?r=621480441', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/324aec43-72c3-4ff4-9e99-5ca3f820a2bf.jpg', 0.82, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (35, N'IGI', 627489683, N'https://www.igi.org/verify-your-report/?r=627489683', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Emerald_7ec0c3fc-cb0c-4bf3-b968-a50eafde37b1.jpg?v=1702020830', 0.82, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (36, N'IGI', 627489961, N'https://www.igi.org/verify-your-report/?r=627489961', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Emerald_7ec0c3fc-cb0c-4bf3-b968-a50eafde37b1.jpg?v=1702020830', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (37, N'IGI', 622479456, N'https://www.igi.org/verify-your-report/?r=622479456', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b147b79d-56d5-4220-b0f3-930e4aff657e.jpg', 0.97, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (38, N'IGI', 626496155, N'https://www.igi.org/verify-your-report/?r=626496155', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/29141da2-3300-4dae-a943-cd3041193214.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (39, N'IGI', 620461086, N'https://www.igi.org/verify-your-report/?r=620461086', N'https://v360.in/V360Images.aspx?cid=vd&d=620461086', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (40, N'IGI', 622460382, N'https://www.igi.org/verify-your-report/?r=622460382', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/65eb3bf7-061a-415d-a92a-bd489bff2f40.jpg', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (41, N'GIA', 6462277426, N'https://www.gia.edu/report-check?reportno=6462277426', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R42574/still.jpg', 5.3, N'Excellent', N'D', N'FL', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (42, N'IGI', 595398135, N'https://www.igi.org/verify-your-report/?r=595398135', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/de03746b-b839-45f0-befc-d5e4683aabe8.jpg', 0.91, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (43, N'IGI', 595398136, N'https://www.igi.org/verify-your-report/?r=595398136', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/953aabfc-9d1f-4050-a446-6881bbab914b.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (44, N'IGI', 625435620, N'https://www.igi.org/verify-your-report/?r=625435620', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/868d7ad3-4e05-4ba9-a76b-0742759e7dcc.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (45, N'IGI', 625435622, N'https://www.igi.org/verify-your-report/?r=625435622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/dbae6690-9d8f-4123-809c-bf8111bc1222.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (46, N'IGI', 617416027, N'https://www.igi.org/verify-your-report/?r=617416027', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f2ca1563-2fab-45f1-b280-a68b75ee8cb5.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (47, N'IGI', 561296521, N'https://www.igi.org/verify-your-report/?r=561296521', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwMTIzMTAxMC1SQS0yMDItMDQvZ2VtMzYwLTE5MDEyMzEwMTAtUkEtMjAyLTA0Lmh0bWwtZg==/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (48, N'IGI', 589394516, N'https://www.igi.org/verify-your-report/?r=589394516', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwODIzMTEyNy1SQS00MjEtMzg0L2dlbTM2MC0xOTA4MjMxMTI3LVJBLTQyMS0zODQuaHRtbC1m/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (49, N'IGI', 598356702, N'https://www.igi.org/verify-your-report/?r=598356702', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598356702', 1, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (50, N'IGI', 598394159, N'https://www.igi.org/verify-your-report/?r=598394159', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598394159', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (51, N'IGI', 591351839, N'https://www.igi.org/verify-your-report/?r=591351839', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV331-70A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (52, N'IGI', 625427812, N'https://www.igi.org/verify-your-report/?r=625427812', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP30-636', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (53, N'IGI', 633428104, N'https://www.igi.org/verify-your-report/?r=633428104', N'https://www.diamond360.co.in/imaged/B23289/still.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (54, N'IGI', 627428471, N'https://www.igi.org/verify-your-report/?r=627428471', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Heart.jpg?v=1702020829', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (55, N'IGI', 625435623, N'https://www.igi.org/verify-your-report/?r=625435623', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7a4fca2d-3a7e-4c4c-b86b-77e65367fb1c.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (56, N'IGI', 624413790, N'https://www.igi.org/verify-your-report/?r=624413790', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30d8d43f-7a76-40c2-8b31-47036e9b67e6.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (57, N'IGI', 600388680, N'https://www.igi.org/verify-your-report/?r=600388680', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c2315f95-69c0-4499-b3ec-347d1db64e29.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (58, N'IGI', 596349277, N'https://www.igi.org/verify-your-report/?r=596349277', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-737A', 1.01, N'Good', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (59, N'IGI', 620421919, N'https://www.igi.org/verify-your-report/?r=620421919', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421919', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (60, N'IGI', 598393883, N'https://www.igi.org/verify-your-report/?r=598393883', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598393883', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (61, N'IGI', 630443643, N'https://www.igi.org/verify-your-report/?r=630443643', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cf0aa29-53f0-4604-baf0-7df49cee7a13.jpg', 0.51, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (62, N'IGI', 633406367, N'https://www.igi.org/verify-your-report/?r=633406367', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/da460375-79a8-4b92-b5fc-a4bd78fa6032.jpg', 0.54, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (63, N'IGI', 633406366, N'https://www.igi.org/verify-your-report/?r=633406366', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1a82c9a7-545e-4e0b-89c7-efa670aeff7f.jpg', 0.62, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (64, N'IGI', 621444766, N'https://www.igi.org/verify-your-report/?r=621444766', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444766', 0.72, N'Excellent', N'D', N'IF', N'Good', N'Very Good', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (65, N'IGI', 574354378, N'https://www.igi.org/verify-your-report/?r=574354378', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0375269c-23e7-44c5-8863-1c20f2492db3.jpg', 0.93, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (66, N'IGI', 618402115, N'https://www.igi.org/verify-your-report/?r=618402115', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618402115', 0.94, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (67, N'IGI', 582363275, N'https://www.igi.org/verify-your-report/?r=582363275', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccf1b020-b774-42b2-8fe1-fdb4dba04598.jpg', 0.95, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (68, N'IGI', 595398132, N'https://www.igi.org/verify-your-report/?r=595398132', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7b728fdc-839e-4dcd-9ca1-71141ad7fb39.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (69, N'IGI', 584389215, N'https://www.igi.org/verify-your-report/?r=584389215', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a5cd8cf0-4fe1-4a5e-83fa-81c0de8410c5.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (70, N'IGI', 591311622, N'https://www.igi.org/verify-your-report/?r=591311622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a834f138-5249-44f3-a976-66f02ae39531.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (71, N'IGI', 574354529, N'https://www.igi.org/verify-your-report/?r=574354529', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3d660846-3d98-4da8-abc1-209aedb80a0c.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (72, N'IGI', 598340263, N'https://www.igi.org/verify-your-report/?r=598340263', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e167cfee-003b-4723-ad64-86fc7956a29a.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (73, N'IGI', 611379265, N'https://www.igi.org/verify-your-report/?r=611379265', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/bf531274-d326-4d66-b47a-9ab691b907f1.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (74, N'IGI', 622477843, N'https://www.igi.org/verify-your-report/?r=622477843', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccd4d5eb-53a6-449f-ae90-a91eca915ebf.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (75, N'IGI', 624432989, N'https://www.igi.org/verify-your-report/?r=624432989', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/83b83496-6dab-47e6-bcde-ed62cbfd35e0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (76, N'IGI', 620482463, N'https://www.igi.org/verify-your-report/?r=620482463', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a2f02605-e5e6-4dee-97be-db43f7ecafb3.jpg', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (77, N'IGI', 634473966, N'https://www.igi.org/verify-your-report/?r=634473966', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/d40bcacf-e951-45ef-b36a-c85b6a7a4f45.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (78, N'IGI', 616497765, N'https://www.igi.org/verify-your-report/?r=616497765', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=616497765', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (79, N'IGI', 627454156, N'https://www.igi.org/verify-your-report/?r=627454156', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV478-330A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (80, N'IGI', 627454164, N'https://www.igi.org/verify-your-report/?r=627454164', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP37-212', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (81, N'IGI', 618408894, N'https://www.igi.org/verify-your-report/?r=618408894', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5f245848-e0b9-4c74-9f22-377683daaad2.jpg', 0.52, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (82, N'IGI', 634473523, N'https://www.igi.org/verify-your-report/?r=634473523', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b2c0cfa9-fe3d-4ad8-9f12-072048b1b4c7.jpg', 0.53, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (83, N'IGI', 625411690, N'https://www.igi.org/verify-your-report/?r=625411690', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/55c37418-523a-40c7-ba49-f0fa81c98bdd.jpg', 0.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (84, N'IGI', 634473608, N'https://www.igi.org/verify-your-report/?r=634473608', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5989d831-d34b-47fa-baec-7a5abb77167f.jpg', 0.56, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (85, N'IGI', 631412469, N'https://www.igi.org/verify-your-report/?r=631412469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2f4774c8-97c8-423f-80ff-b26d98c579c3.jpg', 0.61, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (86, N'IGI', 618400995, N'https://www.igi.org/verify-your-report/?r=618400995', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618400995', 0.7, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (87, N'IGI', 621444880, N'https://www.igi.org/verify-your-report/?r=621444880', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444880', 0.7, N'Excellent', N'D', N'IF', N'Very Good', N'Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (88, N'IGI', 621484034, N'https://www.igi.org/verify-your-report/?r=621484034', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484034', 0.7, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (89, N'IGI', 622462748, N'https://www.igi.org/verify-your-report/?r=622462748', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462748', 0.7, N'Very Good', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (90, N'IGI', 621444976, N'https://www.igi.org/verify-your-report/?r=621444976', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444976', 0.71, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (91, N'IGI', 621484139, N'https://www.igi.org/verify-your-report/?r=621484139', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484139', 0.71, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (92, N'IGI', 621484869, N'https://www.igi.org/verify-your-report/?r=621484869', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484869', 0.71, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (93, N'IGI', 621444713, N'https://www.igi.org/verify-your-report/?r=621444713', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444713', 0.72, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (94, N'IGI', 621484090, N'https://www.igi.org/verify-your-report/?r=621484090', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484090', 0.72, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (95, N'IGI', 621484180, N'https://www.igi.org/verify-your-report/?r=621484180', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484180', 0.72, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (96, N'IGI', 622462722, N'https://www.igi.org/verify-your-report/?r=622462722', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462722', 0.72, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (97, N'IGI', 621484171, N'https://www.igi.org/verify-your-report/?r=621484171', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484171', 0.73, N'Excellent', N'D', N'IF', N'Very Good', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (98, N'IGI', 622462785, N'https://www.igi.org/verify-your-report/?r=622462785', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462785', 0.73, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (99, N'IGI', 627489857, N'https://www.igi.org/verify-your-report/?r=627489857', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV495-370A', 0.74, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (100, N'IGI', 621484905, N'https://www.igi.org/verify-your-report/?r=621484905', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484905', 0.74, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (101, N'IGI', 601322432, N'https://www.igi.org/verify-your-report/?r=601322432', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322432', 0.96, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (102, N'IGI', 624433053, N'https://www.igi.org/verify-your-report/?r=624433053', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3285c554-3234-464f-a18a-3a4743ce9856.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (103, N'IGI', 624433054, N'https://www.igi.org/verify-your-report/?r=624433054', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c93045cd-5eb2-4e52-8840-0ea37dc47419.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (104, N'IGI', 602301951, N'https://www.igi.org/verify-your-report/?r=602301951', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=602301951', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (105, N'IGI', 627400042, N'https://www.igi.org/verify-your-report/?r=627400042', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4d20b790-e258-4a07-9384-ad1758697380.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (106, N'IGI', 598394553, N'https://www.igi.org/verify-your-report/?r=598394553', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV339-466A', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (107, N'IGI', 620421921, N'https://www.igi.org/verify-your-report/?r=620421921', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421921', 1, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (108, N'IGI', 620421945, N'https://www.igi.org/verify-your-report/?r=620421945', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421945', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (109, N'IGI', 625445698, N'https://www.igi.org/verify-your-report/?r=625445698', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7e7462f4-c0ba-4fbe-ae1e-68746ce8a176.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (110, N'IGI', 601322007, N'https://www.igi.org/verify-your-report/?r=601322007', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322007', 1.01, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (111, N'IGI', 598394389, N'https://www.igi.org/verify-your-report/?r=598394389', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-44A', 1.02, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (112, N'IGI', 627400050, N'https://www.igi.org/verify-your-report/?r=627400050', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cbfbf09-866b-4e33-9392-8064090c54cc.jpg', 1.03, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (113, N'IGI', 601322542, N'https://www.igi.org/verify-your-report/?r=601322542', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322542', 1.03, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (114, N'IGI', 601322549, N'https://www.igi.org/verify-your-report/?r=601322549', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322549', 1.03, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (115, N'IGI', 625433469, N'https://www.igi.org/verify-your-report/?r=625433469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1cec1f62-c38e-4a83-a4f6-e87e0f32ff97.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (116, N'IGI', 591350749, N'https://www.igi.org/verify-your-report/?r=591350749', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV333-591A', 1.05, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (117, N'IGI', 594334941, N'https://www.igi.org/verify-your-report/?r=594334941', N'https://ssdweb.co/ssdweb/hd/imaged/924440118/still.jpg', 1.22, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (118, N'IGI', 631412485, N'https://www.igi.org/verify-your-report/?r=631412485', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8073a583-98c5-49a9-9a13-6cb88a535880.jpg', 1.29, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (119, N'IGI', 626476954, N'https://www.igi.org/verify-your-report/?r=626476954', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30a6233d-a8c4-4c6b-bc04-810a25910eb7.jpg', 1.35, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (120, N'IGI', 627406174, N'https://www.igi.org/verify-your-report/?r=627406174', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9847be04-4fa7-42bf-bc81-454e1a682fa2.jpg', 1.42, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (121, N'IGI', 595395742, N'https://www.igi.org/verify-your-report/?r=595395742', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f791af4a-d867-4ace-8786-ccbfa16d86cf.jpg', 0.52, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (122, N'IGI', 618401132, N'https://www.igi.org/verify-your-report/?r=618401132', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV372-168A', 0.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (123, N'IGI', 631409041, N'https://www.igi.org/verify-your-report/?r=631409041', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/27dc257d-5e7c-418a-bfa3-7c5ead477326.jpg', 0.7, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (124, N'IGI', 629438666, N'https://www.igi.org/verify-your-report/?r=629438666', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/704069c9-1f27-4232-9004-51074182df32.jpg', 0.73, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (125, N'IGI', 610326888, N'https://www.igi.org/verify-your-report/?r=610326888', N'https://v360.in/V360Images.aspx?cid=vd&d=610326888', 0.76, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (126, N'IGI', 583399008, N'https://www.igi.org/verify-your-report/?r=583399008', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9019604a-9146-4513-9f7f-6f2766a773ce.jpg', 0.77, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (127, N'IGI', 633465409, N'https://www.igi.org/verify-your-report/?r=633465409', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4020039e-46b4-4060-ad91-04dae562cffb.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (128, N'IGI', 613380447, N'https://www.igi.org/verify-your-report/?r=613380447', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ef835aee-a500-4fab-992b-02e7981f9a50.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (129, N'IGI', 567358132, N'https://www.igi.org/verify-your-report/?r=567358132', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTUwMzIzMDYyMC1BLTE5MC00MzcvZ2VtMzYwLTE1MDMyMzA2MjAtQS0xOTAtNDM3Lmh0bWwtZg==/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (130, N'IGI', 593304340, N'https://www.igi.org/verify-your-report/?r=593304340', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV305-236A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (131, N'IGI', 541250376, N'https://www.igi.org/verify-your-report/?r=541250376', N'https://v360.in/V360Images.aspx?cid=vd&d=GG221-263A', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (132, N'IGI', 555264994, N'https://www.igi.org/verify-your-report/?r=555264994', N'https://v360.in/V360Images.aspx?cid=vd&d=DM393-12A', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (133, N'IGI', 591350887, N'https://www.igi.org/verify-your-report/?r=591350887', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-113A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (134, N'IGI', 591345717, N'https://www.igi.org/verify-your-report/?r=591345717', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-523A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (135, N'IGI', 593304404, N'https://www.igi.org/verify-your-report/?r=593304404', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-781A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (136, N'IGI', 593304407, N'https://www.igi.org/verify-your-report/?r=593304407', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-188A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (137, N'IGI', 593305216, N'https://www.igi.org/verify-your-report/?r=593305216', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV343-1054A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (138, N'IGI', 593305868, N'https://www.igi.org/verify-your-report/?r=593305868', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV343-685A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (139, N'IGI', 596348279, N'https://www.igi.org/verify-your-report/?r=596348279', N'https://v360.in/V360Images.aspx?cid=vd&d=596348279', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (140, N'IGI', 620463463, N'https://www.igi.org/verify-your-report/?r=620463463', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV380-580A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (141, N'IGI', 628415289, N'https://www.igi.org/verify-your-report/?r=628415289', N'https://v360.in/V360Images.aspx?cid=vd&d=CD121-422A', 0.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (142, N'IGI', 627456359, N'https://www.igi.org/verify-your-report/?r=627456359', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9912c9ae-f8b9-4d3a-8cc3-73cf90d37ff7.jpg', 0.76, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (143, N'IGI', 623422664, N'https://www.igi.org/verify-your-report/?r=623422664', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ecd2f196-07ae-470a-b810-3f68159dda2e.jpg', 0.78, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (144, N'IGI', 627489235, N'https://www.igi.org/verify-your-report/?r=627489235', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP12-320', 0.78, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (145, N'IGI', 627409078, N'https://www.igi.org/verify-your-report/?r=627409078', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/557fb28a-0d02-4447-8817-16f83426d538.jpg', 0.79, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (146, N'IGI', 615345308, N'https://www.igi.org/verify-your-report/?r=615345308', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0852a50e-ad5e-49e2-8fe8-cd94ecc8b48a.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (147, N'IGI', 634473609, N'https://www.igi.org/verify-your-report/?r=634473609', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3c752434-9889-484c-a4f7-7f3f4b65b503.jpg', 0.93, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (148, N'IGI', 633465410, N'https://www.igi.org/verify-your-report/?r=633465410', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/267bfcc6-92a4-4034-9b6d-ad2ad02f7e38.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (149, N'IGI', 621413518, N'https://www.igi.org/verify-your-report/?r=621413518', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/473453e5-beb6-48e1-8ad4-1b0b784ed0e0.jpg', 0.93, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (150, N'IGI', 625421772, N'https://www.igi.org/verify-your-report/?r=625421772', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-31470/still.jpg', 0.96, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (151, N'IGI', 623414023, N'https://www.igi.org/verify-your-report/?r=623414023', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/809b5bc8-6d68-4779-bcee-eb922e98f6ca.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (152, N'IGI', 631429217, N'https://www.igi.org/verify-your-report/?r=631429217', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2a33555a-bd0d-4140-bf11-87b5f141b42d.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (153, N'IGI', 633430832, N'https://www.igi.org/verify-your-report/?r=633430832', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c8165605-d252-4f87-9b8f-5890fabc5547.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (154, N'IGI', 628462549, N'https://www.igi.org/verify-your-report/?r=628462549', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2be2110f-84b6-49c9-b468-7629913e841b.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (155, N'IGI', 623466846, N'https://www.igi.org/verify-your-report/?r=623466846', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=623466846', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (156, N'IGI', 623466847, N'https://www.igi.org/verify-your-report/?r=623466847', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=623466847', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (157, N'IGI', 583303556, N'https://www.igi.org/verify-your-report/?r=583303556', N'https://v360.in/V360Images.aspx?cid=vd&d=KG234-196A', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (158, N'IGI', 625452557, N'https://www.igi.org/verify-your-report/?r=625452557', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b6e1efb9-e556-46cb-b918-3b85624b4a5a.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (159, N'IGI', 589397742, N'https://www.igi.org/verify-your-report/?r=589397742', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwODIzMDczMi1SQS00MjgtNDEyL2dlbTM2MC0xOTA4MjMwNzMyLVJBLTQyOC00MTIuaHRtbC1m/0.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (160, N'IGI', 617439159, N'https://www.igi.org/verify-your-report/?r=617439159', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a59a7757-3c47-4588-bdff-7436ded52e5a.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (161, N'IGI', 517286121, N'https://www.igi.org/verify-your-report/?r=517286121', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1f92e504-cc21-4b06-9a72-098cb7ca0cd7.jpg', 1.01, N'Excellent', N'D', N'I1', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (162, N'IGI', 627423146, N'https://www.igi.org/verify-your-report/?r=627423146', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4e161da9-e0d9-4aa5-b5cc-b852fc57e1b2.jpg', 0.81, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (163, N'IGI', 634491844, N'https://www.igi.org/verify-your-report/?r=634491844', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8e561015-edb5-4031-9e24-f6074e397b26.jpg', 0.83, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (164, N'IGI', 630456355, N'https://www.igi.org/verify-your-report/?r=630456355', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a8ceabb5-6a13-4262-9dba-af04e49af1ce.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (165, N'IGI', 629405992, N'https://www.igi.org/verify-your-report/?r=629405992', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8cc95c6d-3f95-48df-85ff-7895c017bec9.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (166, N'IGI', 604397084, N'https://www.igi.org/verify-your-report/?r=604397084', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119558/still.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (167, N'IGI', 620452326, N'https://www.igi.org/verify-your-report/?r=620452326', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10103B/still.jpg', 1, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (168, N'IGI', 627425727, N'https://www.igi.org/verify-your-report/?r=627425727', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f6709477-2ed7-4a1e-b9e0-cc890cca5f57.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (169, N'IGI', 629468829, N'https://www.igi.org/verify-your-report/?r=629468829', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e35aebf3-4350-4908-a561-b6bb7002c034.jpg', 1.01, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (170, N'IGI', 602378981, N'https://www.igi.org/verify-your-report/?r=602378981', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/434588de-36f6-4e41-a1e3-5b49eda91e31.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (171, N'IGI', 608395118, N'https://www.igi.org/verify-your-report/?r=608395118', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/97992d84-9676-4ef5-a08a-5021d8a012de.jpg', 1.02, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (172, N'IGI', 606361854, N'https://www.igi.org/verify-your-report/?r=606361854', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=606361854', 1.03, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (173, N'IGI', 627461450, N'https://www.igi.org/verify-your-report/?r=627461450', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5c507110-ef52-474b-8316-d5886dd86e2b.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (174, N'IGI', 630456361, N'https://www.igi.org/verify-your-report/?r=630456361', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c130f50e-b044-44ff-8d09-26a2353054ec.jpg', 1.05, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (175, N'IGI', 625439413, N'https://www.igi.org/verify-your-report/?r=625439413', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10210AI/still.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (176, N'IGI', 626497769, N'https://www.igi.org/verify-your-report/?r=626497769', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a93df6f6-c191-42ee-b07c-c9a99bb79a90.jpg', 1.06, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (177, N'IGI', 615345211, N'https://www.igi.org/verify-your-report/?r=615345211', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R969174/still.jpg', 1.08, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (178, N'IGI', 605360228, N'https://www.igi.org/verify-your-report/?r=605360228', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119570/still.jpg', 1.09, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (179, N'IGI', 619443059, N'https://www.igi.org/verify-your-report/?r=619443059', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10103A/still.jpg', 1.12, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (180, N'IGI', 627415767, N'https://www.igi.org/verify-your-report/?r=627415767', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/928d41ab-c455-4351-94d0-a6aef59963f1.jpg', 1.52, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (181, N'IGI', 620421817, N'https://www.igi.org/verify-your-report/?r=620421817', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421817', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (182, N'IGI', 620421818, N'https://www.igi.org/verify-your-report/?r=620421818', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421818', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (183, N'IGI', 620421874, N'https://www.igi.org/verify-your-report/?r=620421874', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421874', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (184, N'IGI', 620421902, N'https://www.igi.org/verify-your-report/?r=620421902', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421902', 1.01, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (185, N'IGI', 593305677, N'https://www.igi.org/verify-your-report/?r=593305677', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV341-571A', 1.03, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (186, N'IGI', 632499573, N'https://www.igi.org/verify-your-report/?r=632499573', N'https://www.diamond360.co.in/imaged/B23068/still.jpg', 1.09, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (187, N'IGI', 631442496, N'https://www.igi.org/verify-your-report/?r=631442496', N'https://www.diamond360.co.in/imaged/B22764/still.jpg', 1.1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (188, N'IGI', 618401877, N'https://www.igi.org/verify-your-report/?r=618401877', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618401877', 1.12, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (189, N'IGI', 628469637, N'https://www.igi.org/verify-your-report/?r=628469637', N'https://v360.in/V360Images.aspx?cid=vd&d=HPHT101-252', 1.44, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (190, N'IGI', 620421829, N'https://www.igi.org/verify-your-report/?r=620421829', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421829', 1.5, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (191, N'IGI', 620421838, N'https://www.igi.org/verify-your-report/?r=620421838', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421838', 1.54, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (192, N'IGI', 583304021, N'https://www.igi.org/verify-your-report/?r=583304021', N'https://v360.in/V360Images.aspx?cid=vd&d=KG250-390A', 1.65, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (193, N'IGI', 617488495, N'https://www.igi.org/verify-your-report/?r=617488495', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/asscher.jpg?v=1702020829', 1.78, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (194, N'IGI', 589393420, N'https://www.igi.org/verify-your-report/?r=589393420', N'https://view.gem360.in/gem360/1708210958-GM259-124A/thumb.jpg', 1.01, N'Good', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (195, N'IGI', 620422007, N'https://www.igi.org/verify-your-report/?r=620422007', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620422007', 1.03, N'Excellent', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (196, N'IGI', 517289274, N'https://www.igi.org/verify-your-report/?r=517289274', N'https://v360.in/V360Images.aspx?cid=vd&d=KG10-326A', 1.5, N'Very Good', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (197, N'IGI', 530292776, N'https://www.igi.org/verify-your-report/?r=530292776', N'https://v360.in/V360Images.aspx?cid=vd&d=OM134-40A', 1.51, N'Very Good', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (198, N'IGI', 532262643, N'https://www.igi.org/verify-your-report/?r=532262643', N'https://v360.in/V360Images.aspx?cid=vd&d=OM134-59A', 1.51, N'Excellent', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (199, N'IGI', 532262645, N'https://www.igi.org/verify-your-report/?r=532262645', N'https://v360.in/V360Images.aspx?cid=vd&d=OM159-270A', 1.51, N'Very Good', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (200, N'IGI', 620422040, N'https://www.igi.org/verify-your-report/?r=620422040', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620422040', 1.52, N'Good', N'D', N'SI1', N'Excellent', N'Excellent', N'None', 1, 10)
SET IDENTITY_INSERT [dbo].[diamond] OFF
GO
SET IDENTITY_INSERT [dbo].[rank] ON 

INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (1, N'Bronze', 0.025, 0)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (2, N'Silver', 0.05, 500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (3, N'Gold', 0.075, 1000)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (4, N'Platinum', 0.1, 1500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (5, N'Emerald', 0.125, 2000)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (6, N'Diamond', 0.15, 2500)
SET IDENTITY_INSERT [dbo].[rank] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Customer')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'SaleStaff')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'DeliveryStaff')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (4, N'WarrantyStaff')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (5, N'Manager')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (6, N'Administrator')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[shape] ON 

INSERT [dbo].[shape] ([shape_id], [name]) VALUES (1, N'Round')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (2, N'Emerald')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (3, N'Heart')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (4, N'Pear')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (5, N'Oval')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (6, N'Cushion')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (7, N'Princess')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (8, N'Radiant')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (9, N'Marquise')
INSERT [dbo].[shape] ([shape_id], [name]) VALUES (10, N'Asscher')
SET IDENTITY_INSERT [dbo].[shape] OFF
GO
/****** Object:  Index [IX_accessory_accessory_type_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_accessory_type_id] ON [dbo].[accessory]
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_shape_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_shape_id] ON [dbo].[accessory]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_image_accessory_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_image_accessory_id] ON [dbo].[accessory_image]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_rank_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_account_rank_id] ON [dbo].[account]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_role_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_account_role_id] ON [dbo].[account]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_blog_author_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_blog_author_id] ON [dbo].[blog]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_diamond_shape_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_diamond_shape_id] ON [dbo].[diamond]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_accessory_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_accessory_id] ON [dbo].[feedback]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_order_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_order_id] ON [dbo].[feedback]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_customer_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_customer_id] ON [dbo].[order]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_delivery_staff_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_delivery_staff_id] ON [dbo].[order]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_promotion_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_promotion_id] ON [dbo].[order]
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_sale_staff_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_sale_staff_id] ON [dbo].[order]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_accessory_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_accessory_id] ON [dbo].[order_detail]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_diamond_id] ON [dbo].[order_detail]
(
	[diamond_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_order_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_order_id] ON [dbo].[order_detail]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_warranty_card_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_order_detail_warranty_card_id] ON [dbo].[order_detail]
(
	[warranty_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_price_rate_account_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_price_rate_account_id] ON [dbo].[price_rate]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_transaction_order_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_transaction_order_id] ON [dbo].[transaction]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_warranty_card_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_warranty_card_id] ON [dbo].[warranty_request]
(
	[warranty_card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_warranty_staff_id]    Script Date: 5/24/2024 6:53:51 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_warranty_staff_id] ON [dbo].[warranty_request]
(
	[warranty_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accessory]  WITH CHECK ADD  CONSTRAINT [FK_accessory_accessory_type_accessory_type_id] FOREIGN KEY([accessory_type_id])
REFERENCES [dbo].[accessory_type] ([accessory_type_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory] CHECK CONSTRAINT [FK_accessory_accessory_type_accessory_type_id]
GO
ALTER TABLE [dbo].[accessory]  WITH CHECK ADD  CONSTRAINT [FK_accessory_shape_shape_id] FOREIGN KEY([shape_id])
REFERENCES [dbo].[shape] ([shape_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory] CHECK CONSTRAINT [FK_accessory_shape_shape_id]
GO
ALTER TABLE [dbo].[accessory_image]  WITH CHECK ADD  CONSTRAINT [FK_accessory_image_accessory_accessory_id] FOREIGN KEY([accessory_id])
REFERENCES [dbo].[accessory] ([accessory_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory_image] CHECK CONSTRAINT [FK_accessory_image_accessory_accessory_id]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_rank_rank_id] FOREIGN KEY([rank_id])
REFERENCES [dbo].[rank] ([rank_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_rank_rank_id]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_role_role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_role_role_id]
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD  CONSTRAINT [FK_blog_account_author_id] FOREIGN KEY([author_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[blog] CHECK CONSTRAINT [FK_blog_account_author_id]
GO
ALTER TABLE [dbo].[diamond]  WITH CHECK ADD  CONSTRAINT [FK_diamond_shape_shape_id] FOREIGN KEY([shape_id])
REFERENCES [dbo].[shape] ([shape_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[diamond] CHECK CONSTRAINT [FK_diamond_shape_shape_id]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_accessory_accessory_id] FOREIGN KEY([accessory_id])
REFERENCES [dbo].[accessory] ([accessory_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_accessory_accessory_id]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_order_order_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account_customer_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account_delivery_staff_id] FOREIGN KEY([delivery_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account_delivery_staff_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account_sale_staff_id] FOREIGN KEY([sale_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account_sale_staff_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_promotion_promotion_id] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotion] ([promotion_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_promotion_promotion_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_accessory_accessory_id] FOREIGN KEY([accessory_id])
REFERENCES [dbo].[accessory] ([accessory_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_accessory_accessory_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_diamond_diamond_id] FOREIGN KEY([diamond_id])
REFERENCES [dbo].[diamond] ([diamond_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_diamond_diamond_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order_order_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_warranty_card_warranty_card_id] FOREIGN KEY([warranty_card_id])
REFERENCES [dbo].[warranty_card] ([warranty_card_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_warranty_card_warranty_card_id]
GO
ALTER TABLE [dbo].[price_rate]  WITH CHECK ADD  CONSTRAINT [FK_price_rate_account_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[price_rate] CHECK CONSTRAINT [FK_price_rate_account_account_id]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_order_order_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_warranty_staff_id] FOREIGN KEY([warranty_staff_id])
REFERENCES [dbo].[account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_warranty_staff_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_warranty_card_warranty_card_id] FOREIGN KEY([warranty_card_id])
REFERENCES [dbo].[warranty_card] ([warranty_card_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_warranty_card_warranty_card_id]
GO
USE [master]
GO
ALTER DATABASE [DATJ] SET  READ_WRITE 
GO
