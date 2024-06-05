USE [master]
GO
/****** Object:  Database [DATJ]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE DATABASE [DATJ]
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DATJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DATJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATJ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DATJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DATJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATJ] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DATJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DATJ] SET  MULTI_USER 
GO
ALTER DATABASE [DATJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [DATJ]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[accessory]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[accessory_image]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[accessory_type]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[account]    Script Date: 6/4/2024 6:27:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[blog]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[diamond]    Script Date: 6/4/2024 6:27:07 AM ******/
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
	[color] [int] NOT NULL,
	[clarity] [int] NOT NULL,
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
/****** Object:  Table [dbo].[diamond_price]    Script Date: 6/4/2024 6:27:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diamond_price](
	[diamond_price_id] [bigint] IDENTITY(1,1) NOT NULL,
	[eff_time] [datetime2](7) NOT NULL,
	[min_carat_eff] [real] NOT NULL,
	[max_carat_eff] [real] NOT NULL,
	[color] [nvarchar](max) NOT NULL,
	[clarity] [nvarchar](max) NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_diamond_price] PRIMARY KEY CLUSTERED 
(
	[diamond_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[material_price]    Script Date: 6/4/2024 6:27:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_price](
	[material_price_id] [bigint] IDENTITY(1,1) NOT NULL,
	[karat] [int] NOT NULL,
	[eff_time] [datetime2](7) NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_material_price] PRIMARY KEY CLUSTERED 
(
	[material_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/4/2024 6:27:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[total_price] [float] NOT NULL,
	[total_discount_percent] [real] NOT NULL,
	[rank_id] [bigint] NOT NULL,
	[price_rate_id] [bigint] NOT NULL,
	[order_status] [nvarchar](max) NOT NULL,
	[shipping_address] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[order_detail]    Script Date: 6/4/2024 6:27:07 AM ******/
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
	[diamond_price_id] [bigint] NOT NULL,
	[material_price_id] [bigint] NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[price_rate]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[promotion]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[rank]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[shape]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 6/4/2024 6:27:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[transaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NOT NULL,
	[payment_method] [nvarchar](max) NOT NULL,
	[amount] [float] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warranty_card]    Script Date: 6/4/2024 6:27:07 AM ******/
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
/****** Object:  Table [dbo].[warranty_request]    Script Date: 6/4/2024 6:27:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty_request](
	[warranty_request_id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[sale_staff_id] [bigint] NOT NULL,
	[delivery_staff_id] [bigint] NOT NULL,
	[warranty_card_id] [bigint] NOT NULL,
	[receive_time] [datetime2](7) NOT NULL,
	[return_time] [datetime2](7) NOT NULL,
	[warranty_status] [nvarchar](max) NOT NULL,
	[shipping_address] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_warranty_request] PRIMARY KEY CLUSTERED 
(
	[warranty_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240603231443_init', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[accessory] ON 

INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (1, 18, 17.6376266, N'Classic Round Diamond Four Prong Stud Earrings (F/G SI+)', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (2, 24, 57.01051, N'Toi et Moi Round Front Back Earring', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (3, 24, 27.25815, N'Round Diamond Halo Earrings', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (4, 24, 31.2132549, N'Classic Princess Brilliant Cut Diamond Martini Stud Earrings (F/G VS+)', 1, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (5, 24, 37.0390167, N'Princess Diamond Halo Earrings', 1, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (6, 18, 58.7920876, N'Toi et Moi Halo Emeralds Front Back Earring', 1, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (7, 24, 53.4473534, N'Toi et Moi Round and Emerald Front Back Earrings', 1, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (8, 24, 12.1147337, N'Oval Created Sapphire and Lab Diamond Classic Solitaire Under-Halo Earrings', 1, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (9, 18, 30.21557, N'Classic Oval Diamond Stud Earrings (F/G VS+)', 1, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (10, 18, 62.3552437, N'Toi et Moi Halo Round and Teardrop Front Back Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (11, 18, 84.98129, N'Elegance Pear Drop Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (12, 24, 36.8786736, N'Pear Diamond Halo Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (13, 18, 160.876541, N'Pear, Round and Heart Matching Earring', 1, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (14, 18, 73.0447159, N'Halo Oval and Heart Front Back Earring', 1, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (15, 24, 37.05683, N'Kite Set Round Lab Created Diamond Solitaire Pendant', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (16, 24, 10.68947, N'Kite Chamfered Bezel Set Solitaire Necklace', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (17, 24, 16.390522, N'Round Created Ruby and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (18, 18, 9.08605, N'Round Created Sapphire and Lab Diamond Classic Solitaire Pendant With Studded Bale', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (19, 18, 14.608943, N'Halo Cushion Lab Created Diamond Necklace', 2, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (20, 18, 24.05131, N'Classic Cushion Bezel Necklace', 2, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (21, 18, 24.05131, N'Classic Heart Bezel Necklace', 2, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (22, 24, 17.9939423, N'Oval Sapphire and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (23, 24, 16.390522, N'Pear Created Ruby and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (24, 18, 24.05131, N'Pear Bezel Drop Necklace', 2, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (25, 18, 24.05131, N'Emerald Bezel Drop Necklace', 2, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (26, 18, 71.4413, N'Round with Trailing Round and Marquise Tennis Bracelet', 4, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (27, 24, 96.561554, N'Round Station Tennis Bracelet', 4, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (28, 24, 112.595757, N'Bezeled Princess Station with Emeralds Tennis Bracelet', 4, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (29, 18, 164.4397, N'Half-Bezeled Emerald East-West Tennis Bracelet', 4, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (30, 18, 97.2741852, N'Half Pave Bezel Bangle', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (31, 18, 83.1997147, N'Oval with Trailing Round and Emeralds Tennis Bracelet', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (32, 24, 128.808121, N'Graduating Oval Tennis Bracelet', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (33, 18, 79.9928741, N'Half Pave Heart Bangle', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (34, 24, 104.934967, N'Multi Heart Bezel Bangle', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (35, 24, 98.34313, N'Bezeled Heart Station Tennis Bracelet', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (36, 18, 130.767853, N'Graduating Pear Tennis Bracelet', 4, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (37, 18, 57.3668251, N'The Fulton Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (38, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (39, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (40, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (41, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (42, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (43, 24, 66.09656, N'The Roosevelt Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (44, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (45, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (46, 18, 85.51576, N'The Carnegie Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (47, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (48, 18, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (49, 24, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (50, 18, 67.69998, N'The Sutton Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (51, 18, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (52, 24, 29.0397282, N'The Frick Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (53, 18, 65.20577, N'The Varick Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (54, 18, 25.2984142, N'Trio Cluster Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (55, 24, 57.3668251, N'The Fulton Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (56, 18, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (57, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (58, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (59, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (60, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (61, 24, 66.09656, N'The Roosevelt Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (62, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (63, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (64, 24, 85.51576, N'The Carnegie Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (65, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (66, 18, 29.0397282, N'The Frick Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (67, 24, 65.20577, N'The Varick Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (68, 18, 25.2984142, N'Trio Cluster Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (69, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (70, 24, 25.2984142, N'Pave Halo and Shank Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (71, 24, 18.8847313, N'Vintage Celtic Engraved Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (72, 18, 36.7005157, N'The Fifth Avenue Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (73, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (74, 18, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (75, 18, 27.4363079, N'Aura Hidden Accent Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (76, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (77, 24, 37.5913048, N'Split Shank French Halo Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (78, 24, 26.3673611, N'Petite French Set Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (79, 24, 22.26973, N'Heirloom Milgrain Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (80, 18, 23.16052, N'Fine Line Marquise Three Stone Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (81, 24, 33.84999, N'Infinity Winding Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (82, 24, 19.9536781, N'Vintage Art Deco Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (83, 24, 29.217886, N'Four Points Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (84, 24, 23.8731518, N'Tapered Halo Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (85, 18, 23.3386784, N'Cluster Side Stone Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (86, 18, 9.798681, N'Tulip Basket Cathedral Classic Solitaire Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (87, 24, 24.76394, N'Glamour Ribbon Swirl Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (88, 18, 23.3386784, N'Vintage Hidden Halo Classic Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (89, 18, 22.6260471, N'Cathedral Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (90, 18, 18.3502579, N'Vintage Knife Edge Side Stone Kite Set Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (91, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (92, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (93, 24, 29.0397282, N'The Frick Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (94, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (95, 18, 25.2984142, N'Pave Halo and Shank Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (96, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (97, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (98, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (99, 18, 33.3155174, N'Opulent Classic Pear Trio Ring', 3, 4)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (100, 24, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (101, 18, 39.3728828, N'Contemporary Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (102, 18, 40.9763031, N'The Gansevoort Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (103, 18, 39.3728828, N'Fancy Cut Side Stone with Bridge Accent Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (104, 18, 26.3673611, N'Pave Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (105, 18, 24.585783, N'Diamond Pave Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (106, 18, 28.6834126, N'Princess Studded Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (107, 24, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (108, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (109, 24, 57.3668251, N'The Fulton Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (110, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (111, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (112, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (113, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (114, 24, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (115, 24, 66.09656, N'The Roosevelt Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (116, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (117, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (118, 24, 85.51576, N'The Carnegie Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (119, 18, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (120, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (121, 24, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (122, 24, 67.69998, N'The Sutton Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (123, 18, 29.0397282, N'The Frick Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (124, 18, 65.20577, N'The Varick Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (125, 18, 25.2984142, N'Trio Cluster Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (126, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (127, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (128, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (129, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (130, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (131, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (132, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (133, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (134, 18, 67.69998, N'The Sutton Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (135, 18, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (136, 18, 25.2984142, N'Trio Cluster Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (137, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (138, 18, 25.2984142, N'Pave Halo and Shank Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (139, 18, 18.8847313, N'Vintage Celtic Engraved Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (140, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (141, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (142, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (143, 24, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (144, 24, 35.63157, N'Channel Set Princess Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (145, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (146, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (147, 24, 25.2984142, N'Pave Halo and Shank Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (148, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (149, 18, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (150, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (151, 24, 35.63157, N'Channel Set Princess Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (152, 24, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (153, 18, 14.07447, N'Cathedral Twist Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (154, 24, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (155, 24, 24.585783, N'Diamond Pave Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (156, 24, 28.6834126, N'Princess Studded Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (157, 24, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (158, 24, 21.022625, N'Classic Hidden Halo Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (159, 24, 34.5626221, N'Royal Twist Hidden Halo Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (160, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (161, 24, 43.826828, N'Braided Twist Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (162, 24, 30.46499, N'French Set Diamond Basket Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (163, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (164, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (165, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (166, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (167, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (168, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (169, 24, 25.2984142, N'Trio Cluster Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (170, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (171, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (172, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (173, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (174, 18, 47.5681458, N'The Park Avenue Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (175, 24, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (176, 18, 35.45341, N'Elegance Trillion Three Stone Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (177, 24, 33.4936752, N'Glamorous Fancy Side Stone Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (178, 24, 16.9249954, N'Chevron Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (179, 24, 39.3728828, N'Contemporary Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (180, 18, 29.9305172, N'Glamorous Fancy Side Stones Cathedral Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (181, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (182, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (183, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (184, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (185, 18, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (186, 18, 53.80367, N'The Central Park Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (187, 18, 25.476572, N'Elegance Split Shank Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (188, 24, 24.585783, N'Diamond Pave Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (189, 24, 19.77552, N'6 Claw Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (190, 24, 28.6834126, N'Princess Studded Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (191, 24, 54.5163, N'Scalloped Pear Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (192, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (193, 18, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (194, 24, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (195, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (196, 18, 44.0049858, N'Knife Edge Scalloped Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (197, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (198, 18, 16.56868, N'Vintage Filigree Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (199, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 10)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (200, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (201, 18, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (202, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (203, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (204, 24, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (205, 24, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (206, 24, 24.585783, N'Diamond Pave Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (207, 18, 28.6834126, N'Princess Studded Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (208, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (209, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (210, 18, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (211, 18, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (212, 24, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (213, 24, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (214, 24, 42.2234077, N'Three Row Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (215, 18, 29.0397282, N'Elegance Side-Stone with Hidden Halo Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (216, 24, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 10)
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
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (49, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (50, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (51, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (52, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-frontview_800x.jpg?v=1684020011', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (53, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-sideview_800x.jpg?v=1684020011', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (54, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-profileview_800x.jpg?v=1684020011', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (55, N'https://www.withclarity.com/cdn/shop/products/RB1502007-ROUND-YELLOW-FRONTVIEW_52a52033-b87e-47b7-91d6-b4e2a1faf99b_800x.jpg?v=1690889930', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (56, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644794', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (57, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644794', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (58, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644794', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (59, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-frontview_800x.jpg?v=1684023223', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (60, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-sideview_800x.jpg?v=1684023223', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (61, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-profileview_800x.jpg?v=1684023223', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (62, N'https://www.withclarity.com/cdn/shop/products/RB1501791-ROUND-YELLOW-FRONTVIEW_100ca641-2d69-4cf3-a151-d62044d7db9f_800x.jpg?v=1688387747', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (63, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (64, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (65, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (66, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872821', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (67, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872821', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (68, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872821', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (69, N'https://www.withclarity.com/cdn/shop/files/RB1501088-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_408769b9-103e-4e64-b1db-95222bff95b4_800x.jpg?v=1702874407', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (70, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (71, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (72, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (73, N'https://www.withclarity.com/cdn/shop/products/ens1147-round-yellow-frontview_256b69ed-e5fd-4f4c-805b-ddc3e99b1113_800x.jpg?v=1684007718', 47)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (74, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-frontview_800x.jpg?v=1684024555', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (75, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-sideview_800x.jpg?v=1684024555', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (76, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-profileview_800x.jpg?v=1684024555', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (77, N'https://www.withclarity.com/cdn/shop/products/RB1501699-ROUND-YELLOW-FRONTVIEW_a40a74a1-bfd1-4530-b0c5-0925953f5647_800x.jpg?v=1690201533', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (78, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-frontview_800x.jpg?v=1684488384', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (79, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-sideview_800x.jpg?v=1684488384', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (80, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-profileview_800x.jpg?v=1684488384', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (81, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (82, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (83, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (84, N'https://www.withclarity.com/cdn/shop/products/RB1501933-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1686826294', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (85, N'https://www.withclarity.com/cdn/shop/products/RB1501933-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1686826294', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (86, N'https://www.withclarity.com/cdn/shop/products/RB1501933-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1686826294', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (87, N'https://www.withclarity.com/cdn/shop/products/RB1501867-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1686128195', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (88, N'https://www.withclarity.com/cdn/shop/products/RB1501867-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1686128195', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (89, N'https://www.withclarity.com/cdn/shop/products/RB1501867-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1686128195', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (90, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-round-yellow-frontview_800x.jpg?v=1684015552', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (91, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-round-yellow-sideview_800x.jpg?v=1684015552', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (92, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-round-yellow-profileview_800x.jpg?v=1684015552', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (93, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (94, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (95, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (96, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-frontview_800x.jpg?v=1684020012', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (97, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-sideview_800x.jpg?v=1684020012', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (98, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-profileview_800x.jpg?v=1684020012', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (99, N'https://www.withclarity.com/cdn/shop/products/RB1502007-EMERALD-YELLOW-FRONTVIEW_6d80b92d-5329-4306-ae40-78937aeaf173_800x.jpg?v=1690889930', 57)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (100, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-emerald-yellow-frontview_e167b778-d365-453b-b347-64355b1117d6_800x.jpg?v=1684027802', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (101, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-frontview_800x.jpg?v=1684023223', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (102, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-sideview_800x.jpg?v=1684023223', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (103, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-profileview_800x.jpg?v=1684023223', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (104, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (105, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (106, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (107, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (108, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (109, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (110, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-frontview_800x.jpg?v=1684000196', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (111, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-sideview_800x.jpg?v=1684000196', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (112, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-profileview_800x.jpg?v=1684000196', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (113, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-frontview_800x.jpg?v=1684015837', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (114, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-sideview_800x.jpg?v=1684015837', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (115, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-profileview_800x.jpg?v=1684015837', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (116, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (117, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (118, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (119, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-frontview_800x.jpg?v=1684007718', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (120, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-sideview_800x.jpg?v=1684007718', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (121, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-profileview_800x.jpg?v=1684007718', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (122, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686826295', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (123, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686826295', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (124, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686826295', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (125, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686128196', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (126, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686128196', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (127, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686128196', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (128, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-frontview_800x.jpg?v=1684015552', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (129, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-sideview_800x.jpg?v=1684015552', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (130, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-profileview_800x.jpg?v=1684015552', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (131, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-emerald-yellow-frontview_5ea56f03-28f0-436c-a24b-3d2beaf7d9b5_800x.jpg?v=1684010489', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (132, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-emerald-yellow-frontview_cd949f6d-8530-4f65-a9fe-0221e13a8dbb_800x.jpg?v=1684008617', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (133, N'https://www.withclarity.com/cdn/shop/files/RB1500156-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1693892735', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (134, N'https://www.withclarity.com/cdn/shop/files/RB1500156-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1693892735', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (135, N'https://www.withclarity.com/cdn/shop/files/RB1500156-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1693892735', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (136, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114790', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (137, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114790', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (138, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114790', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (139, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-heart-yellow-frontview_30e0e9ba-1456-41af-91cf-559bc1549c53_800x.jpg?v=1684027802', 73)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (140, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-frontview_800x.jpg?v=1684024555', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (141, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-sideview_800x.jpg?v=1684024555', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (142, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-profileview_800x.jpg?v=1684024555', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (143, N'https://www.withclarity.com/cdn/shop/products/enrrb1501086-heart-yellow-frontview_6b79560a-8c96-4c61-ab6b-9caf792a4412_800x.jpg?v=1684008857', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (144, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (145, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (146, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (147, N'https://www.withclarity.com/cdn/shop/products/ens4125-heart-yellow-frontview_410ef4c4-f86b-4201-a1c0-a0972d07e4ce_800x.jpg?v=1683999062', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (148, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-frontview_800x.jpg?v=1698665519', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (149, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-sideview_800x.jpg?v=1698665519', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (150, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-profileview_800x.jpg?v=1698665519', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (151, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-frontview_800x.jpg?v=1684002653', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (152, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-sideview_800x.jpg?v=1684002653', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (153, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-profileview_800x.jpg?v=1684002653', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (154, N'https://www.withclarity.com/cdn/shop/products/enrrb1500601-heart-yellow-frontview_ecab8ea2-d503-4c50-81b2-7bf223e10cac_800x.jpg?v=1684002886', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (155, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-FRONTVIEW_800x.jpg?v=1691757231', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (156, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-SIDEVIEW_800x.jpg?v=1691757231', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (157, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-PROFILEVIEW_800x.jpg?v=1691757231', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (158, N'https://www.withclarity.com/cdn/shop/products/enrrb1500108-heart-yellow-frontview_d4c12616-0278-4878-b69d-e04986f63d11_800x.jpg?v=1684002171', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (159, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-frontview_800x.jpg?v=1684007214', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (160, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-sideview_800x.jpg?v=1684007214', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (161, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-profileview_800x.jpg?v=1684007214', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (162, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-frontview_800x.jpg?v=1684024398', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (163, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-sideview_800x.jpg?v=1684024398', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (164, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-profileview_800x.jpg?v=1684024398', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (165, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-frontview_800x.jpg?v=1684025003', 85)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (166, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-sideview_800x.jpg?v=1684025003', 85)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (167, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-profileview_800x.jpg?v=1684025003', 85)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (168, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-frontview_800x.jpg?v=1696851926', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (169, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-sideview_800x.jpg?v=1696851926', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (170, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-profileview_800x.jpg?v=1696851926', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (171, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-heart-yellow-frontview_03dde7d9-b016-486c-84a0-680f2173e703_800x.jpg?v=1702640869', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (172, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-frontview_800x.jpg?v=1684001733', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (173, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-sideview_800x.jpg?v=1684001733', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (174, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-profileview_800x.jpg?v=1684001733', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (175, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-frontview_800x.jpg?v=1684025822', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (176, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-sideview_800x.jpg?v=1684025822', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (177, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-profileview_800x.jpg?v=1684025822', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (178, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-frontview_800x.jpg?v=1684003323', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (179, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-sideview_800x.jpg?v=1684003323', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (180, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-profileview_800x.jpg?v=1684003323', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (181, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (182, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (183, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (184, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-frontview_800x.jpg?v=1684000196', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (185, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-sideview_800x.jpg?v=1684000196', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (186, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-profileview_800x.jpg?v=1684000196', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (187, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-FRONTVIEW_800x.jpg?v=1688104427', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (188, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-SIDEVIEW_800x.jpg?v=1688104427', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (189, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-PROFILEVIEW_800x.jpg?v=1688104427', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (190, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-pear-yellow-frontview_23ee3e3a-ac6f-4225-b11e-153cd88b2e9e_800x.jpg?v=1684010489', 94)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (191, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-pear-yellow-frontview_38d63d6a-01fe-43b2-9c7d-9f333a4cbad0_800x.jpg?v=1684008617', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (192, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-frontview_800x.jpg?v=1684003696', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (193, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-sideview_800x.jpg?v=1684003696', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (194, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-profileview_800x.jpg?v=1684003696', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (195, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-frontview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (196, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-sideview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (197, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-profileview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (198, N'https://www.withclarity.com/cdn/shop/products/ens1100-pear-yellow-frontview_b7aa7c89-76ab-4680-97a2-ffaa20027a53_800x.jpg?v=1698729076', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (199, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1709114842', 99)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (200, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1709114842', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (201, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1709114842', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (202, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (203, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (204, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (205, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-pear-yellow-frontview_7f786c4f-a395-46a0-96f6-3a34589afe38_800x.jpg?v=1684008700', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (206, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1689842083', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (207, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1689842083', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (208, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1689842083', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (209, N'https://www.withclarity.com/cdn/shop/products/RB1501786-PEAR-YELLOW-FRONTVIEW_3131d2d5-30c6-4f01-be08-8b69083d4bf1_800x.jpg?v=1696575616', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (210, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-frontview_800x.jpg?v=1684026208', 104)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (211, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-sideview_800x.jpg?v=1684026208', 104)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (212, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-profileview_800x.jpg?v=1684026208', 104)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (213, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-frontview_800x.jpg?v=1684027472', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (214, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-sideview_800x.jpg?v=1684027472', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (215, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-profileview_800x.jpg?v=1684027472', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (216, N'https://www.withclarity.com/cdn/shop/products/ens3017-pear-yellow-frontview_800x.jpg?v=1684000060', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (217, N'https://www.withclarity.com/cdn/shop/products/ens3017-pear-yellow-sideview_800x.jpg?v=1684000060', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (218, N'https://www.withclarity.com/cdn/shop/products/ens3017-pear-yellow-profileview_800x.jpg?v=1684000060', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (219, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1707916887', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (220, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1707916887', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (221, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1707916887', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (222, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (223, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (224, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (225, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (226, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (227, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (228, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-frontview_800x.jpg?v=1684020012', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (229, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-sideview_800x.jpg?v=1684020012', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (230, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-profileview_800x.jpg?v=1684020012', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (231, N'https://www.withclarity.com/cdn/shop/products/RB1502007-OVAL-YELLOW-FRONTVIEW_32e9dc9c-bac6-418d-ae7c-d2429a42488e_800x.jpg?v=1690889930', 111)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (232, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644755', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (233, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644755', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (234, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644755', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (235, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-frontview_800x.jpg?v=1684023223', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (236, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-sideview_800x.jpg?v=1684023223', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (237, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-profileview_800x.jpg?v=1684023223', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (238, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (239, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (240, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (241, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (242, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (243, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (244, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872863', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (245, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872863', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (246, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872863', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (247, N'https://www.withclarity.com/cdn/shop/files/RB1501088-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_e376c0fd-ed17-4b49-910f-6d742857e39a_800x.jpg?v=1702874875', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (248, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (249, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (250, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (251, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-frontview_800x.jpg?v=1684007718', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (252, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-sideview_800x.jpg?v=1684007718', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (253, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-profileview_800x.jpg?v=1684007718', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (254, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-frontview_800x.jpg?v=1684024555', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (255, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-sideview_800x.jpg?v=1684024555', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (256, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-profileview_800x.jpg?v=1684024555', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (257, N'https://www.withclarity.com/cdn/shop/products/RB1501699-OVAL-YELLOW-FRONTVIEW_9f4f007a-b539-4b64-a21e-f2b237e16886_800x.jpg?v=1690201533', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (258, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-frontview_800x.jpg?v=1684488384', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (259, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-sideview_800x.jpg?v=1684488384', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (260, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-profileview_800x.jpg?v=1684488384', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (261, N'https://www.withclarity.com/cdn/shop/products/RB1501933-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1686826295', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (262, N'https://www.withclarity.com/cdn/shop/products/RB1501933-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1686826295', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (263, N'https://www.withclarity.com/cdn/shop/products/RB1501933-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1686826295', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (264, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1686128195', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (265, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1686128195', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (266, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1686128195', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (267, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-frontview_800x.jpg?v=1684015552', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (268, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-sideview_800x.jpg?v=1684015552', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (269, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-profileview_800x.jpg?v=1684015552', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (270, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-oval-yellow-frontview_77d87f4f-70fb-4775-bf42-144c07e2c29c_800x.jpg?v=1684010489', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (271, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-frontview_800x.jpg?v=1684020012', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (272, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-sideview_800x.jpg?v=1684020012', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (273, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-profileview_800x.jpg?v=1684020012', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (274, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-cushion-yellow-frontview_ee1d3e94-8e47-434a-835c-8a461d87adae_800x.jpg?v=1684027802', 128)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (275, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-frontview_800x.jpg?v=1684023223', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (276, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-sideview_800x.jpg?v=1684023223', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (277, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-profileview_800x.jpg?v=1684023223', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (278, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-frontview_800x.jpg?v=1684000196', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (279, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-sideview_800x.jpg?v=1684000196', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (280, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-profileview_800x.jpg?v=1684000196', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (281, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-frontview_800x.jpg?v=1684015836', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (282, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-sideview_800x.jpg?v=1684015836', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (283, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-profileview_800x.jpg?v=1684015836', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (284, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-frontview_800x.jpg?v=1684007718', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (285, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-sideview_800x.jpg?v=1684007718', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (286, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-profileview_800x.jpg?v=1684007718', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (287, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-frontview_800x.jpg?v=1684024555', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (288, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-sideview_800x.jpg?v=1684024555', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (289, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-profileview_800x.jpg?v=1684024555', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (290, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-frontview_800x.jpg?v=1684488384', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (291, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-sideview_800x.jpg?v=1684488384', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (292, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-profileview_800x.jpg?v=1684488384', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (293, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (294, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (295, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (296, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-frontview_800x.jpg?v=1684015552', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (297, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-sideview_800x.jpg?v=1684015552', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (298, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-profileview_800x.jpg?v=1684015552', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (299, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-cushion-yellow-frontview_3cfcadbb-4fcc-462a-b259-7cdf2fc7a039_800x.jpg?v=1684010489', 137)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (300, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-cushion-yellow-frontview_78393285-e6c2-4243-9906-d3b2e3b21d9b_800x.jpg?v=1684008617', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (301, N'https://www.withclarity.com/cdn/shop/products/enrrb1500156-cushion-yellow-frontview_1838365b-5bff-45fe-9680-698ecf2f8564_800x.jpg?v=1684001976', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (302, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-frontview_800x.jpg?v=1684003696', 140)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (303, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-sideview_800x.jpg?v=1684003696', 140)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (304, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-profileview_800x.jpg?v=1684003696', 140)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (305, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-frontview_800x.jpg?v=1696413352', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (306, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-sideview_800x.jpg?v=1696413352', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (307, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-profileview_800x.jpg?v=1696413352', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (308, N'https://www.withclarity.com/cdn/shop/products/ens1100-cushion-yellow-frontview_3566dac9-0b5b-4691-987a-8be80169891e_800x.jpg?v=1698729076', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (309, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-frontview_800x.jpg?v=1684022961', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (310, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-sideview_800x.jpg?v=1684022961', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (311, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-profileview_800x.jpg?v=1684022961', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (312, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-frontview_800x.jpg?v=1684733093', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (313, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-sideview_800x.jpg?v=1684733093', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (314, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-profileview_800x.jpg?v=1684733093', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (315, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-princess-yellow-frontview_6b125954-37d4-4406-b944-41340b3d4b1f_800x.jpg?v=1684027801', 145)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (316, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-frontview_800x.jpg?v=1684007718', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (317, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-sideview_800x.jpg?v=1684007718', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (318, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-profileview_800x.jpg?v=1684007718', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (319, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-princess-yellow-frontview_c525f101-32c6-4553-ace0-101488de829a_800x.jpg?v=1684008617', 147)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (320, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-frontview_800x.jpg?v=1684003696', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (321, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-sideview_800x.jpg?v=1684003696', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (322, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-profileview_800x.jpg?v=1684003696', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (323, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-frontview_800x.jpg?v=1696413352', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (324, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-sideview_800x.jpg?v=1696413352', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (325, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-profileview_800x.jpg?v=1696413352', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (326, N'https://www.withclarity.com/cdn/shop/products/ens1100-princess-yellow-frontview_7146b479-24a9-4d42-9da2-d4568665b547_800x.jpg?v=1698729076', 150)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (327, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-frontview_800x.jpg?v=1684733093', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (328, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-sideview_800x.jpg?v=1684733093', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (329, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-profileview_800x.jpg?v=1684733093', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (330, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1692938717', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (331, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1692938717', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (332, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1692938717', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (333, N'https://www.withclarity.com/cdn/shop/products/ens1156-princess-yellow-frontview_800x.jpg?v=1684004608', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (334, N'https://www.withclarity.com/cdn/shop/products/ens1156-princess-yellow-sideview_800x.jpg?v=1684004608', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (335, N'https://www.withclarity.com/cdn/shop/products/ens1156-princess-yellow-profileview_800x.jpg?v=1684004608', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (336, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-frontview_800x.jpg?v=1698668120', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (337, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-sideview_800x.jpg?v=1698668120', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (338, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-profileview_800x.jpg?v=1698668120', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (339, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-frontview_800x.jpg?v=1684027472', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (340, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-sideview_800x.jpg?v=1684027472', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (341, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-profileview_800x.jpg?v=1684027472', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (342, N'https://www.withclarity.com/cdn/shop/products/ens3017-princess-yellow-frontview_800x.jpg?v=1684000060', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (343, N'https://www.withclarity.com/cdn/shop/products/ens3017-princess-yellow-sideview_800x.jpg?v=1684000060', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (344, N'https://www.withclarity.com/cdn/shop/products/ens3017-princess-yellow-profileview_800x.jpg?v=1684000060', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (345, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-frontview_800x.jpg?v=1707916887', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (346, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-sideview_800x.jpg?v=1707916887', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (347, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-profileview_800x.jpg?v=1707916887', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (348, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-frontview_800x.jpg?v=1684013310', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (349, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-sideview_800x.jpg?v=1684013310', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (350, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-profileview_800x.jpg?v=1684013310', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (351, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1709114738', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (352, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1709114738', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (353, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1709114738', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (354, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-frontview_800x.jpg?v=1702642290', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (355, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-sideview_800x.jpg?v=1702642290', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (356, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-profileview_800x.jpg?v=1702642290', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (357, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-frontview_800x.jpg?v=1684025123', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (358, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-sideview_800x.jpg?v=1684025123', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (359, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-profileview_800x.jpg?v=1684025123', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (360, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-frontview_800x.jpg?v=1684007073', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (361, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-sideview_800x.jpg?v=1684007073', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (362, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-profileview_800x.jpg?v=1684007073', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (363, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-frontview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (364, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-sideview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (365, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-profileview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (366, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-radiant-yellow-frontview_f563a058-ce34-4c01-a199-3d42007e886b_800x.jpg?v=1684027801', 164)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (367, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-frontview_800x.jpg?v=1684023223', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (368, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-sideview_800x.jpg?v=1684023223', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (369, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-profileview_800x.jpg?v=1684023223', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (370, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-frontview_800x.jpg?v=1684000196', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (371, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-sideview_800x.jpg?v=1684000196', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (372, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-profileview_800x.jpg?v=1684000196', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (373, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-frontview_800x.jpg?v=1684015836', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (374, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-sideview_800x.jpg?v=1684015836', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (375, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-profileview_800x.jpg?v=1684015836', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (376, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-frontview_800x.jpg?v=1684007718', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (377, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-sideview_800x.jpg?v=1684007718', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (378, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-profileview_800x.jpg?v=1684007718', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (379, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-frontview_800x.jpg?v=1684015552', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (380, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-sideview_800x.jpg?v=1684015552', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (381, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-profileview_800x.jpg?v=1684015552', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (382, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-radiant-yellow-frontview_e4d9c7a2-918f-4afc-a387-643002608407_800x.jpg?v=1684010489', 170)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (383, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-frontview_800x.jpg?v=1684003696', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (384, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-sideview_800x.jpg?v=1684003696', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (385, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-profileview_800x.jpg?v=1684003696', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (386, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-frontview_800x.jpg?v=1696413352', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (387, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-sideview_800x.jpg?v=1696413352', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (388, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-profileview_800x.jpg?v=1696413352', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (389, N'https://www.withclarity.com/cdn/shop/products/ens1100-radiant-yellow-frontview_691ecc92-74ed-4786-bd88-34e59ed6f9a3_800x.jpg?v=1698729076', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (390, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1691477908', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (391, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1691477908', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (392, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1691477908', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (393, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-frontview_800x.jpg?v=1684022961', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (394, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-sideview_800x.jpg?v=1684022961', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (395, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-profileview_800x.jpg?v=1684022961', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (396, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1693895169', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (397, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1693895169', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (398, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1693895169', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (399, N'https://www.withclarity.com/cdn/shop/products/enrrb1501017-radiant-yellow-frontview_087c1284-fd4a-4f49-be10-ecfceb3803af_800x.jpg?v=1684019047', 177)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (400, N'https://www.withclarity.com/cdn/shop/files/RB1501204-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1688541083', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (401, N'https://www.withclarity.com/cdn/shop/files/RB1501204-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1688541083', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (402, N'https://www.withclarity.com/cdn/shop/files/RB1501204-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1688541083', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (403, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-radiant-yellow-frontview_00558550-6d87-4d37-9678-da8ab6aac790_800x.jpg?v=1684008700', 179)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (404, N'https://www.withclarity.com/cdn/shop/products/enrrb1501079-radiant-yellow-frontview_11e0b8db-0296-4b0e-a1b5-cdc7b4ec5bba_800x.jpg?v=1684012204', 180)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (405, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1692791491', 181)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (406, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1692791491', 181)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (407, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1692791491', 181)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (408, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-frontview_800x.jpg?v=1684000196', 182)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (409, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-sideview_800x.jpg?v=1684000196', 182)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (410, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-profileview_800x.jpg?v=1684000196', 182)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (411, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-frontview_800x.jpg?v=1684003697', 183)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (412, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-sideview_800x.jpg?v=1684003697', 183)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (413, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-profileview_800x.jpg?v=1684003697', 183)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (414, N'https://www.withclarity.com/cdn/shop/products/ens1100-marquise-yellow-frontview_10e93f6f-c2ed-465f-adf7-d8cead1258ac_800x.jpg?v=1698729076', 184)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (415, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (416, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (417, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (418, N'https://www.withclarity.com/cdn/shop/products/RB1501850-marquise-yellow-frontview_35afbad7-fcd7-4c02-808f-ee793e1d64f6_800x.jpg?v=1687261230', 186)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (419, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1689659699', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (420, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1689659699', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (421, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1689659699', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (422, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-frontview_800x.jpg?v=1684027473', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (423, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-sideview_800x.jpg?v=1684027473', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (424, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-profileview_800x.jpg?v=1684027473', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (425, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-frontview_800x.jpg?v=1684010573', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (426, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-sideview_800x.jpg?v=1684010573', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (427, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-profileview_800x.jpg?v=1684010573', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (428, N'https://www.withclarity.com/cdn/shop/products/ens3017-marquise-yellow-frontview_800x.jpg?v=1684000060', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (429, N'https://www.withclarity.com/cdn/shop/products/ens3017-marquise-yellow-sideview_800x.jpg?v=1684000060', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (430, N'https://www.withclarity.com/cdn/shop/products/ens3017-marquise-yellow-profileview_800x.jpg?v=1684000060', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (431, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1697026088', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (432, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1697026088', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (433, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1697026088', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (434, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (435, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (436, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (437, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-frontview_800x.jpg?v=1684030757', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (438, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-sideview_800x.jpg?v=1684030757', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (439, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-profileview_800x.jpg?v=1684030757', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (440, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-frontview_800x.jpg?v=1684001288', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (441, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-sideview_800x.jpg?v=1684001288', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (442, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-profileview_800x.jpg?v=1684001288', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (443, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-frontview_800x.jpg?v=1684026564', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (444, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-sideview_800x.jpg?v=1684026564', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (445, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-profileview_800x.jpg?v=1684026564', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (446, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1696929172', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (447, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1696929172', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (448, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1696929172', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (449, N'https://www.withclarity.com/cdn/shop/products/RB1501247-marquise-yellow-frontview_eaaa5399-6888-4609-bd0d-00ece005c640_800x.jpg?v=1684030448', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (450, N'https://www.withclarity.com/cdn/shop/products/enrrb1500132-marquise-yellow-frontview_800x.jpg?v=1684001895', 198)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (451, N'https://www.withclarity.com/cdn/shop/products/enrrb1500132-marquise-yellow-sideview_800x.jpg?v=1684001895', 198)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (452, N'https://www.withclarity.com/cdn/shop/products/enrrb1500132-marquise-yellow-profileview_800x.jpg?v=1684001895', 198)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (453, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1692791491', 199)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (454, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1692791491', 199)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (455, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1692791491', 199)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (456, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-frontview_800x.jpg?v=1684000196', 200)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (457, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-sideview_800x.jpg?v=1684000196', 200)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (458, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-profileview_800x.jpg?v=1684000196', 200)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (459, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1711944346', 201)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (460, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1711944346', 201)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (461, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1711944346', 201)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (462, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-frontview_800x.jpg?v=1684003696', 202)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (463, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-sideview_800x.jpg?v=1684003696', 202)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (464, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-profileview_800x.jpg?v=1684003696', 202)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (465, N'https://www.withclarity.com/cdn/shop/products/ens1100-asscher-yellow-frontview_c205c21d-26c7-4946-98c2-4009dc4e26c5_800x.jpg?v=1698729076', 203)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (466, N'https://www.withclarity.com/cdn/shop/products/RB1502003-EMERALD-YELLOW-FRONTVIEW_5766cd79-97a6-4d6f-a7cc-6f2b5bbbaf96_800x.jpg?v=1692938715', 204)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (467, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-frontview_800x.jpg?v=1698668120', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (468, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-sideview_800x.jpg?v=1698668120', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (469, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-profileview_800x.jpg?v=1698668120', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (470, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-frontview_800x.jpg?v=1684027472', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (471, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-sideview_800x.jpg?v=1684027472', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (472, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-profileview_800x.jpg?v=1684027472', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (473, N'https://www.withclarity.com/cdn/shop/products/ens3017-asscher-yellow-frontview_800x.jpg?v=1684000060', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (474, N'https://www.withclarity.com/cdn/shop/products/ens3017-asscher-yellow-sideview_800x.jpg?v=1684000060', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (475, N'https://www.withclarity.com/cdn/shop/products/ens3017-asscher-yellow-profileview_800x.jpg?v=1684000060', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (476, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-frontview_800x.jpg?v=1707916887', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (477, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-sideview_800x.jpg?v=1707916887', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (478, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-profileview_800x.jpg?v=1707916887', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (479, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (480, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (481, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (482, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-frontview_800x.jpg?v=1684030756', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (483, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-sideview_800x.jpg?v=1684030756', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (484, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-profileview_800x.jpg?v=1684030756', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (485, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-frontview_800x.jpg?v=1684001288', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (486, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-sideview_800x.jpg?v=1684001288', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (487, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-profileview_800x.jpg?v=1684001288', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (488, N'https://www.withclarity.com/cdn/shop/products/ens4139-asscher-yellow-frontview_ae9f1dcf-8b60-4f63-85af-a9acc9df928d_800x.jpg?v=1684026564', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (489, N'https://www.withclarity.com/cdn/shop/products/RB1501247-asscher-yellow-frontview_0fe18450-84e3-4fdd-a921-ca8a44a57044_800x.jpg?v=1684030447', 213)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (490, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-frontview_800x.jpg?v=1684008173', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (491, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-sideview_800x.jpg?v=1684008173', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (492, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-profileview_800x.jpg?v=1684008173', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (493, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (494, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (495, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (496, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-frontview_800x.jpg?v=1684008019', 216)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (497, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-sideview_800x.jpg?v=1684008019', 216)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (498, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-profileview_800x.jpg?v=1684008019', 216)
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

INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (1, N'Customer', 1, N'ToiLaCustomer', N'customer@gmail.com', N'VKL1ZF5Pnfhm//lviif/Vg==:sMWNwTE+N8frmDP/eS12xx5VSPMXs1K7+ZFYnEWoMFE=', N'0123456789', N'120 ABC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-06-04T06:16:07.6493142' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (2, N'SaleStaff', 2, N'ToiLaSaleStaff', N'sale_staff@gmail.com', N'4LFn18+IsI8BqNiWSm+BGg==:mruVMufvQvF3ZGrnTXjyG3tjgZZf7Jmfkg8Yqc9koU8=', N'0123456785', N'23 AC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-06-04T06:16:07.6498227' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (3, N'DeliveryStaff', 3, N'ToiLaDeliverystaff', N'delivery_staff@gmail.com', N'UFJSDhDoVfp46n6EWtjMAw==:q4GlKVBvl+ITB8C9/zvLKgsDF3iTh/UF0DpTbuy/Sjw=', N'0123456783', N'12 BC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-06-04T06:16:07.6498247' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (4, N'Manager', 5, N'ToiLaManager', N'manager@gmail.com', N'jueEUNq7chB59WWfxHxrZg==:xrRBXOlo4mMkBgTMoceQSXSdDL9FJiYhfPItIEA6Xus=', N'0123456789', N'13 AC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-06-04T06:16:07.6498251' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (5, N'Administrator', 6, N'ToiLaAdministrator', N'administrator@gmail.com', N'w2W8DImWkT1OYdShJ9nRlg==:56Dk9TIwtehIjb9V0ubYA878MqyCcpGILj8fvY24TEQ=', N'0123456789', N'213 BAC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-06-04T06:16:07.6498254' AS DateTime2))
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond] ON 

INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (1, N'IGI', 615380399, N'https://www.igi.org/verify-your-report/?r=615380399', N'https://video.diamondasset.in:8080/imagesM/632443228.jpg', 3.03, N'Ideal', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (2, N'IGI', 618491447, N'https://www.igi.org/verify-your-report/?r=618491447', N'https://video.diamondasset.in:8080/imagesM/631455159.jpg', 3.02, N'Ideal', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (3, N'IGI', 620489774, N'https://www.igi.org/verify-your-report/?r=620489774', N'https://video.diamondasset.in:8080/imagesM/632416490.jpg', 3.01, N'Excellent', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (4, N'IGI', 620455816, N'https://www.igi.org/verify-your-report/?r=620455816', N'https://magnifier.s3.us-west-1.amazonaws.com/5493332667.jpg', 3.08, N'Ideal', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (5, N'IGI', 631426226, N'https://www.igi.org/verify-your-report/?r=631426226', N'https://video.diamondasset.in:8080/imagesM/631426226.jpg', 5.51, N'Ideal', 15, 9, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (6, N'IGI', 632427706, N'https://www.igi.org/verify-your-report/?r=632427706', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Round_0b870701-a9aa-420d-8b43-031fc6eca7f2.jpg?v=1702020829', 5.05, N'Ideal', 15, 9, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (7, N'IGI', 632423081, N'https://www.igi.org/verify-your-report/?r=632423081', N'https://video.diamondasset.in:8080/imagesM/632423081.jpg', 5.45, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (8, N'IGI', 632423578, N'https://www.igi.org/verify-your-report/?r=632423578', N'https://video.diamondasset.in:8080/imagesM/632423578.jpg', 5.13, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (9, N'IGI', 632440830, N'https://www.igi.org/verify-your-report/?r=632440830', N'https://video.diamondasset.in:8080/imagesM/632440830.jpg', 5.25, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (10, N'IGI', 632416344, N'https://www.igi.org/verify-your-report/?r=632416344', N'https://video.diamondasset.in:8080/imagesM/632416344.jpg', 5.17, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (11, N'IGI', 632416288, N'https://www.igi.org/verify-your-report/?r=632416288', N'https://video.diamondasset.in:8080/imagesM/632416288.jpg', 5.76, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (12, N'IGI', 632416477, N'https://www.igi.org/verify-your-report/?r=632416477', N'https://video.diamondasset.in:8080/imagesM/632416477.jpg', 5.17, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (13, N'IGI', 631455311, N'https://www.igi.org/verify-your-report/?r=631455311', N'https://video.diamondasset.in:8080/imagesM/631455311.jpg', 5.36, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (14, N'IGI', 632422863, N'https://www.igi.org/verify-your-report/?r=632422863', N'https://video.diamondasset.in:8080/imagesM/632422863.jpg', 5.6, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (15, N'IGI', 620427330, N'https://www.igi.org/verify-your-report/?r=620427330', N'https://video.diamondasset.in:8080/imagesM/620427330.jpg', 7.04, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (16, N'IGI', 626495160, N'https://www.igi.org/verify-your-report/?r=626495160', N'https://video.diamondasset.in:8080/imagesM/626495160.jpg', 6.13, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (17, N'IGI', 625413392, N'https://www.igi.org/verify-your-report/?r=625413392', N'https://video.diamondasset.in:8080/imagesM/625413392.jpg', 6.25, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (18, N'IGI', 618438766, N'https://www.igi.org/verify-your-report/?r=618438766', N'https://video.diamondasset.in:8080/imagesM/618438766.jpg', 5.23, N'Excellent', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (19, N'IGI', 621408910, N'https://www.igi.org/verify-your-report/?r=621408910', N'https://video.diamondasset.in:8080/imagesM/621408910.jpg', 5.13, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (20, N'IGI', 632422795, N'https://www.igi.org/verify-your-report/?r=632422795', N'https://video.diamondasset.in:8080/imagesM/632422795.jpg', 5.11, N'Excellent', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (21, N'IGI', 618466200, N'https://www.igi.org/verify-your-report/?r=618466200', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e8f12212-9e81-4b63-88be-e66c0ce4d704.jpg', 0.54, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (22, N'IGI', 614303223, N'https://www.igi.org/verify-your-report/?r=614303223', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e94cc0b9-b45a-4b48-8daf-cca267f64d83.jpg', 0.54, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (23, N'IGI', 629421232, N'https://www.igi.org/verify-your-report/?r=629421232', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e12f9cac-ddb0-4300-a35b-dc2a45b604a3.jpg', 0.55, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (24, N'IGI', 627442214, N'https://www.igi.org/verify-your-report/?r=627442214', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/05a57a0d-cfad-4abf-8009-d8564b58eaaf.jpg', 0.61, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (25, N'IGI', 632469076, N'https://www.igi.org/verify-your-report/?r=632469076', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/109eaa64-465d-4a3e-bb63-e2fcf4c59bcd.jpg', 0.66, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (26, N'IGI', 623438859, N'https://www.igi.org/verify-your-report/?r=623438859', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/025661ff-f10e-4b32-94af-3e77f07fcbdf.jpg', 0.74, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (27, N'IGI', 618466201, N'https://www.igi.org/verify-your-report/?r=618466201', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ff400ba8-7145-450d-9999-fad7581f04c5.jpg', 0.74, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (28, N'IGI', 623438861, N'https://www.igi.org/verify-your-report/?r=623438861', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/fb4abdae-32c5-4071-905e-f194037c03ca.jpg', 0.75, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (29, N'IGI', 627489685, N'https://www.igi.org/verify-your-report/?r=627489685', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV408-216A', 0.81, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (30, N'IGI', 627489683, N'https://www.igi.org/verify-your-report/?r=627489683', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV406-412A', 0.82, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (31, N'IGI', 621480441, N'https://www.igi.org/verify-your-report/?r=621480441', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/324aec43-72c3-4ff4-9e99-5ca3f820a2bf.jpg', 0.82, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (32, N'IGI', 627489961, N'https://www.igi.org/verify-your-report/?r=627489961', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP82-244', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (33, N'IGI', 620461086, N'https://www.igi.org/verify-your-report/?r=620461086', N'https://v360.in/V360Images.aspx?cid=vd&d=620461086', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (34, N'IGI', 626496155, N'https://www.igi.org/verify-your-report/?r=626496155', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/29141da2-3300-4dae-a943-cd3041193214.jpg', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (35, N'IGI', 622479456, N'https://www.igi.org/verify-your-report/?r=622479456', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b147b79d-56d5-4220-b0f3-930e4aff657e.jpg', 0.97, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (36, N'IGI', 621483302, N'https://www.igi.org/verify-your-report/?r=621483302', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV354-655A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (37, N'IGI', 595302663, N'https://www.igi.org/verify-your-report/?r=595302663', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV327-472A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (38, N'IGI', 598303567, N'https://www.igi.org/verify-your-report/?r=598303567', N'https://v360.in/V360Images.aspx?cid=vd&d=KG316-491A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (39, N'IGI', 626479809, N'https://www.igi.org/verify-your-report/?r=626479809', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP12-420', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (40, N'IGI', 629468690, N'https://www.igi.org/verify-your-report/?r=629468690', N'https://s3.ap-south-1.amazonaws.com/diadna/viewer4/imaged/L16665/L16665_RI.jpg', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (41, N'GIA', 6462277426, N'https://www.gia.edu/report-check?reportno=6462277426', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R42574/still.jpg', 5.3, N'Excellent', 18, 11, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (42, N'IGI', 595398135, N'https://www.igi.org/verify-your-report/?r=595398135', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/de03746b-b839-45f0-befc-d5e4683aabe8.jpg', 0.91, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (43, N'IGI', 595398136, N'https://www.igi.org/verify-your-report/?r=595398136', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/953aabfc-9d1f-4050-a446-6881bbab914b.jpg', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (44, N'IGI', 591351839, N'https://www.igi.org/verify-your-report/?r=591351839', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV331-70A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (45, N'IGI', 598356702, N'https://www.igi.org/verify-your-report/?r=598356702', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598356702', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (46, N'IGI', 598394159, N'https://www.igi.org/verify-your-report/?r=598394159', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598394159', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (47, N'IGI', 625427812, N'https://www.igi.org/verify-your-report/?r=625427812', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP30-636', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (48, N'IGI', 633428104, N'https://www.igi.org/verify-your-report/?r=633428104', N'https://www.diamond360.co.in/imaged/B23289/still.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (49, N'IGI', 625435622, N'https://www.igi.org/verify-your-report/?r=625435622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/dbae6690-9d8f-4123-809c-bf8111bc1222.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (50, N'IGI', 625435620, N'https://www.igi.org/verify-your-report/?r=625435620', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/868d7ad3-4e05-4ba9-a76b-0742759e7dcc.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (51, N'IGI', 561296521, N'https://www.igi.org/verify-your-report/?r=561296521', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwMTIzMTAxMC1SQS0yMDItMDQvZ2VtMzYwLTE5MDEyMzEwMTAtUkEtMjAyLTA0Lmh0bWwtZg==/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (52, N'IGI', 589394516, N'https://www.igi.org/verify-your-report/?r=589394516', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwODIzMTEyNy1SQS00MjEtMzg0L2dlbTM2MC0xOTA4MjMxMTI3LVJBLTQyMS0zODQuaHRtbC1m/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (53, N'IGI', 591351503, N'https://www.igi.org/verify-your-report/?r=591351503', N'https://ds-360.jaykar.co.in/Ds360/DMV324-19A/Still.JPG', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (54, N'IGI', 598393883, N'https://www.igi.org/verify-your-report/?r=598393883', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598393883', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (55, N'IGI', 598393884, N'https://www.igi.org/verify-your-report/?r=598393884', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598393884', 1.01, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (56, N'IGI', 598394261, N'https://www.igi.org/verify-your-report/?r=598394261', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598394261', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (57, N'IGI', 620463130, N'https://www.igi.org/verify-your-report/?r=620463130', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV397-860A', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (58, N'IGI', 620421919, N'https://www.igi.org/verify-your-report/?r=620421919', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421919', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (59, N'IGI', 596349277, N'https://www.igi.org/verify-your-report/?r=596349277', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-737A', 1.01, N'Good', 18, 10, N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (60, N'IGI', 627428471, N'https://www.igi.org/verify-your-report/?r=627428471', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Heart.jpg?v=1702020829', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (61, N'IGI', 635411485, N'https://www.igi.org/verify-your-report/?r=635411485', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9fc38b7a-4183-424e-b903-268a84468ba8.jpg', 0.5, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (62, N'IGI', 630443643, N'https://www.igi.org/verify-your-report/?r=630443643', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cf0aa29-53f0-4604-baf0-7df49cee7a13.jpg', 0.51, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (63, N'IGI', 621444766, N'https://www.igi.org/verify-your-report/?r=621444766', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444766', 0.72, N'Excellent', 18, 10, N'Good', N'Very Good', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (64, N'IGI', 635412349, N'https://www.igi.org/verify-your-report/?r=635412349', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/6f6afd7d-efa0-4356-bd7a-cc3a80c8d974.jpg', 0.82, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (65, N'IGI', 635419335, N'https://www.igi.org/verify-your-report/?r=635419335', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30173e7f-71e0-427a-bfdb-516493d49ec3.jpg', 0.91, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (66, N'IGI', 574354378, N'https://www.igi.org/verify-your-report/?r=574354378', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0375269c-23e7-44c5-8863-1c20f2492db3.jpg', 0.93, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (67, N'IGI', 618402115, N'https://www.igi.org/verify-your-report/?r=618402115', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618402115', 0.94, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (68, N'IGI', 582363275, N'https://www.igi.org/verify-your-report/?r=582363275', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccf1b020-b774-42b2-8fe1-fdb4dba04598.jpg', 0.95, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (69, N'IGI', 595398132, N'https://www.igi.org/verify-your-report/?r=595398132', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7b728fdc-839e-4dcd-9ca1-71141ad7fb39.jpg', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (70, N'IGI', 584389215, N'https://www.igi.org/verify-your-report/?r=584389215', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a5cd8cf0-4fe1-4a5e-83fa-81c0de8410c5.jpg', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (71, N'IGI', 591311622, N'https://www.igi.org/verify-your-report/?r=591311622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a834f138-5249-44f3-a976-66f02ae39531.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (72, N'IGI', 574354529, N'https://www.igi.org/verify-your-report/?r=574354529', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3d660846-3d98-4da8-abc1-209aedb80a0c.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (73, N'IGI', 616497765, N'https://www.igi.org/verify-your-report/?r=616497765', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=616497765', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (74, N'IGI', 627454156, N'https://www.igi.org/verify-your-report/?r=627454156', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV478-330A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (75, N'IGI', 627454164, N'https://www.igi.org/verify-your-report/?r=627454164', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP37-212', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (76, N'IGI', 622477843, N'https://www.igi.org/verify-your-report/?r=622477843', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccd4d5eb-53a6-449f-ae90-a91eca915ebf.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (77, N'IGI', 624432989, N'https://www.igi.org/verify-your-report/?r=624432989', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/83b83496-6dab-47e6-bcde-ed62cbfd35e0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (78, N'IGI', 598340263, N'https://www.igi.org/verify-your-report/?r=598340263', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e167cfee-003b-4723-ad64-86fc7956a29a.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (79, N'IGI', 634473966, N'https://www.igi.org/verify-your-report/?r=634473966', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/d40bcacf-e951-45ef-b36a-c85b6a7a4f45.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (80, N'IGI', 620482463, N'https://www.igi.org/verify-your-report/?r=620482463', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a2f02605-e5e6-4dee-97be-db43f7ecafb3.jpg', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (81, N'IGI', 618408894, N'https://www.igi.org/verify-your-report/?r=618408894', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5f245848-e0b9-4c74-9f22-377683daaad2.jpg', 0.52, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (82, N'IGI', 634473523, N'https://www.igi.org/verify-your-report/?r=634473523', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b2c0cfa9-fe3d-4ad8-9f12-072048b1b4c7.jpg', 0.53, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (83, N'IGI', 634473608, N'https://www.igi.org/verify-your-report/?r=634473608', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5989d831-d34b-47fa-baec-7a5abb77167f.jpg', 0.56, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (84, N'IGI', 621444880, N'https://www.igi.org/verify-your-report/?r=621444880', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444880', 0.7, N'Excellent', 18, 10, N'Very Good', N'Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (85, N'IGI', 621484034, N'https://www.igi.org/verify-your-report/?r=621484034', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484034', 0.7, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (86, N'IGI', 622462748, N'https://www.igi.org/verify-your-report/?r=622462748', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462748', 0.7, N'Very Good', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (87, N'IGI', 618400995, N'https://www.igi.org/verify-your-report/?r=618400995', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618400995', 0.7, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (88, N'IGI', 621444976, N'https://www.igi.org/verify-your-report/?r=621444976', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444976', 0.71, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (89, N'IGI', 621484139, N'https://www.igi.org/verify-your-report/?r=621484139', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484139', 0.71, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (90, N'IGI', 621484869, N'https://www.igi.org/verify-your-report/?r=621484869', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484869', 0.71, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (91, N'IGI', 621444713, N'https://www.igi.org/verify-your-report/?r=621444713', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444713', 0.72, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (92, N'IGI', 621484090, N'https://www.igi.org/verify-your-report/?r=621484090', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484090', 0.72, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (93, N'IGI', 621484180, N'https://www.igi.org/verify-your-report/?r=621484180', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484180', 0.72, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (94, N'IGI', 622462722, N'https://www.igi.org/verify-your-report/?r=622462722', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462722', 0.72, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (95, N'IGI', 621484171, N'https://www.igi.org/verify-your-report/?r=621484171', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484171', 0.73, N'Excellent', 18, 10, N'Very Good', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (96, N'IGI', 622462785, N'https://www.igi.org/verify-your-report/?r=622462785', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462785', 0.73, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (97, N'IGI', 627489857, N'https://www.igi.org/verify-your-report/?r=627489857', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV495-370A', 0.74, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (98, N'IGI', 621484905, N'https://www.igi.org/verify-your-report/?r=621484905', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484905', 0.74, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (99, N'IGI', 621484005, N'https://www.igi.org/verify-your-report/?r=621484005', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484005', 0.75, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (100, N'IGI', 621484041, N'https://www.igi.org/verify-your-report/?r=621484041', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484041', 0.75, N'Very Good', 18, 10, N'Very Good', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (101, N'IGI', 601322432, N'https://www.igi.org/verify-your-report/?r=601322432', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322432', 0.96, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (102, N'IGI', 624433053, N'https://www.igi.org/verify-your-report/?r=624433053', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3285c554-3234-464f-a18a-3a4743ce9856.jpg', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (103, N'IGI', 602301951, N'https://www.igi.org/verify-your-report/?r=602301951', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=602301951', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (104, N'IGI', 624433054, N'https://www.igi.org/verify-your-report/?r=624433054', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c93045cd-5eb2-4e52-8840-0ea37dc47419.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (105, N'IGI', 620421921, N'https://www.igi.org/verify-your-report/?r=620421921', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421921', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (106, N'IGI', 620421945, N'https://www.igi.org/verify-your-report/?r=620421945', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421945', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (107, N'IGI', 598394553, N'https://www.igi.org/verify-your-report/?r=598394553', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV339-466A', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (108, N'IGI', 627400042, N'https://www.igi.org/verify-your-report/?r=627400042', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4d20b790-e258-4a07-9384-ad1758697380.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (109, N'IGI', 601322007, N'https://www.igi.org/verify-your-report/?r=601322007', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322007', 1.01, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (110, N'IGI', 625445698, N'https://www.igi.org/verify-your-report/?r=625445698', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7e7462f4-c0ba-4fbe-ae1e-68746ce8a176.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (111, N'IGI', 600397986, N'https://www.igi.org/verify-your-report/?r=600397986', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMTU3YWYxZDAtMmY3MC00MzkzLWI3YzItYjM4MTBlMTA1ODhlP209YyZjdXM9U01HLWY=/0.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (112, N'IGI', 598394389, N'https://www.igi.org/verify-your-report/?r=598394389', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-44A', 1.02, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (113, N'IGI', 602316890, N'https://www.igi.org/verify-your-report/?r=602316890', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMGY2ZGVmOWUtZTgwNy00YzliLWJmMmMtZGUwNmI0ODQ5ZDdmP209YyZjdXM9U01HLWY=/0.jpg', 1.02, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (114, N'IGI', 601322549, N'https://www.igi.org/verify-your-report/?r=601322549', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322549', 1.03, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (115, N'IGI', 601322542, N'https://www.igi.org/verify-your-report/?r=601322542', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322542', 1.03, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (116, N'IGI', 627400050, N'https://www.igi.org/verify-your-report/?r=627400050', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cbfbf09-866b-4e33-9392-8064090c54cc.jpg', 1.03, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (117, N'IGI', 625433469, N'https://www.igi.org/verify-your-report/?r=625433469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1cec1f62-c38e-4a83-a4f6-e87e0f32ff97.jpg', 1.04, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (118, N'IGI', 591350749, N'https://www.igi.org/verify-your-report/?r=591350749', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV333-591A', 1.05, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (119, N'IGI', 631412485, N'https://www.igi.org/verify-your-report/?r=631412485', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8073a583-98c5-49a9-9a13-6cb88a535880.jpg', 1.29, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (120, N'IGI', 626476954, N'https://www.igi.org/verify-your-report/?r=626476954', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30a6233d-a8c4-4c6b-bc04-810a25910eb7.jpg', 1.35, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (121, N'IGI', 618401132, N'https://www.igi.org/verify-your-report/?r=618401132', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV372-168A', 0.55, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (122, N'IGI', 631409041, N'https://www.igi.org/verify-your-report/?r=631409041', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/27dc257d-5e7c-418a-bfa3-7c5ead477326.jpg', 0.7, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (123, N'IGI', 629438666, N'https://www.igi.org/verify-your-report/?r=629438666', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/704069c9-1f27-4232-9004-51074182df32.jpg', 0.73, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (124, N'IGI', 610326888, N'https://www.igi.org/verify-your-report/?r=610326888', N'https://v360.in/V360Images.aspx?cid=vd&d=610326888', 0.76, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (125, N'IGI', 618409592, N'https://www.igi.org/verify-your-report/?r=618409592', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/947a4663-e77b-4b85-8d2f-8e95f6e988ab.jpg', 0.76, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (126, N'IGI', 583399008, N'https://www.igi.org/verify-your-report/?r=583399008', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9019604a-9146-4513-9f7f-6f2766a773ce.jpg', 0.77, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (127, N'IGI', 633465409, N'https://www.igi.org/verify-your-report/?r=633465409', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4020039e-46b4-4060-ad91-04dae562cffb.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (128, N'IGI', 593304340, N'https://www.igi.org/verify-your-report/?r=593304340', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV305-236A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (129, N'IGI', 541250376, N'https://www.igi.org/verify-your-report/?r=541250376', N'https://v360.in/V360Images.aspx?cid=vd&d=GG221-263A', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (130, N'IGI', 596348279, N'https://www.igi.org/verify-your-report/?r=596348279', N'https://v360.in/V360Images.aspx?cid=vd&d=596348279', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (131, N'IGI', 555264994, N'https://www.igi.org/verify-your-report/?r=555264994', N'https://v360.in/V360Images.aspx?cid=vd&d=DM393-12A', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (132, N'IGI', 620463254, N'https://www.igi.org/verify-your-report/?r=620463254', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620463254', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (133, N'IGI', 620421637, N'https://www.igi.org/verify-your-report/?r=620421637', N'https://v360.in/V360Images.aspx?cid=vd&d=620421637', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (134, N'IGI', 620421643, N'https://www.igi.org/verify-your-report/?r=620421643', N'https://v360.in/V360Images.aspx?cid=vd&d=620421643', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (135, N'IGI', 620421647, N'https://www.igi.org/verify-your-report/?r=620421647', N'https://v360.in/V360Images.aspx?cid=vd&d=620421647', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (136, N'IGI', 620463238, N'https://www.igi.org/verify-your-report/?r=620463238', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV407-486A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (137, N'IGI', 620463419, N'https://www.igi.org/verify-your-report/?r=620463419', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV343-899A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (138, N'IGI', 620463424, N'https://www.igi.org/verify-your-report/?r=620463424', N'https://v360.in/V360Images.aspx?cid=vd&d=KG459-70A', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (139, N'IGI', 591341341, N'https://www.igi.org/verify-your-report/?r=591341341', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV301-90A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (140, N'IGI', 591351333, N'https://www.igi.org/verify-your-report/?r=591351333', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-889A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (141, N'IGI', 628415289, N'https://www.igi.org/verify-your-report/?r=628415289', N'https://v360.in/V360Images.aspx?cid=vd&d=CD121-422A', 0.55, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (142, N'IGI', 627456359, N'https://www.igi.org/verify-your-report/?r=627456359', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9912c9ae-f8b9-4d3a-8cc3-73cf90d37ff7.jpg', 0.76, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (143, N'IGI', 627489235, N'https://www.igi.org/verify-your-report/?r=627489235', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP12-320', 0.78, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (144, N'IGI', 623422664, N'https://www.igi.org/verify-your-report/?r=623422664', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ecd2f196-07ae-470a-b810-3f68159dda2e.jpg', 0.78, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (145, N'IGI', 627409078, N'https://www.igi.org/verify-your-report/?r=627409078', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/557fb28a-0d02-4447-8817-16f83426d538.jpg', 0.79, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (146, N'IGI', 633465410, N'https://www.igi.org/verify-your-report/?r=633465410', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/267bfcc6-92a4-4034-9b6d-ad2ad02f7e38.jpg', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (147, N'IGI', 615345308, N'https://www.igi.org/verify-your-report/?r=615345308', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0852a50e-ad5e-49e2-8fe8-cd94ecc8b48a.jpg', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (148, N'IGI', 634473609, N'https://www.igi.org/verify-your-report/?r=634473609', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3c752434-9889-484c-a4f7-7f3f4b65b503.jpg', 0.93, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (149, N'IGI', 621413518, N'https://www.igi.org/verify-your-report/?r=621413518', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/473453e5-beb6-48e1-8ad4-1b0b784ed0e0.jpg', 0.93, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (150, N'IGI', 626430836, N'https://www.igi.org/verify-your-report/?r=626430836', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3ec7a5d3-471e-46e2-aa43-483e64b10a5b.jpg', 0.94, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (151, N'IGI', 625421772, N'https://www.igi.org/verify-your-report/?r=625421772', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-31470/still.jpg', 0.96, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (152, N'IGI', 623414023, N'https://www.igi.org/verify-your-report/?r=623414023', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/809b5bc8-6d68-4779-bcee-eb922e98f6ca.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (153, N'IGI', 631429217, N'https://www.igi.org/verify-your-report/?r=631429217', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2a33555a-bd0d-4140-bf11-87b5f141b42d.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (154, N'IGI', 583303556, N'https://www.igi.org/verify-your-report/?r=583303556', N'https://v360.in/V360Images.aspx?cid=vd&d=KG234-196A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (155, N'IGI', 623466846, N'https://www.igi.org/verify-your-report/?r=623466846', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=623466846', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (156, N'IGI', 623466847, N'https://www.igi.org/verify-your-report/?r=623466847', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=623466847', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (157, N'IGI', 633430832, N'https://www.igi.org/verify-your-report/?r=633430832', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c8165605-d252-4f87-9b8f-5890fabc5547.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (158, N'IGI', 628462549, N'https://www.igi.org/verify-your-report/?r=628462549', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2be2110f-84b6-49c9-b468-7629913e841b.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (159, N'IGI', 627471789, N'https://www.igi.org/verify-your-report/?r=627471789', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c2133b7f-48ff-4f51-b468-55eb6d1b1b11.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (160, N'IGI', 584360586, N'https://www.igi.org/verify-your-report/?r=584360586', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMGY5YTc5NDctZmU2OC00OTNlLTk4ZjItMDhjZDI3M2M5MzA1P209YyZjdXM9U01HLWY=/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (161, N'IGI', 517286121, N'https://www.igi.org/verify-your-report/?r=517286121', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1f92e504-cc21-4b06-9a72-098cb7ca0cd7.jpg', 1.01, N'Excellent', 18, 2, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (162, N'IGI', 627423146, N'https://www.igi.org/verify-your-report/?r=627423146', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4e161da9-e0d9-4aa5-b5cc-b852fc57e1b2.jpg', 0.81, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (163, N'IGI', 634491844, N'https://www.igi.org/verify-your-report/?r=634491844', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8e561015-edb5-4031-9e24-f6074e397b26.jpg', 0.83, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (164, N'IGI', 604397084, N'https://www.igi.org/verify-your-report/?r=604397084', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119558/still.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (165, N'IGI', 620452326, N'https://www.igi.org/verify-your-report/?r=620452326', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10103B/still.jpg', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (166, N'IGI', 630456355, N'https://www.igi.org/verify-your-report/?r=630456355', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a8ceabb5-6a13-4262-9dba-af04e49af1ce.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (167, N'IGI', 629405992, N'https://www.igi.org/verify-your-report/?r=629405992', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8cc95c6d-3f95-48df-85ff-7895c017bec9.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (168, N'IGI', 627425727, N'https://www.igi.org/verify-your-report/?r=627425727', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f6709477-2ed7-4a1e-b9e0-cc890cca5f57.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (169, N'IGI', 629468829, N'https://www.igi.org/verify-your-report/?r=629468829', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e35aebf3-4350-4908-a561-b6bb7002c034.jpg', 1.01, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (170, N'IGI', 602378981, N'https://www.igi.org/verify-your-report/?r=602378981', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/434588de-36f6-4e41-a1e3-5b49eda91e31.jpg', 1.02, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (171, N'IGI', 608395118, N'https://www.igi.org/verify-your-report/?r=608395118', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/97992d84-9676-4ef5-a08a-5021d8a012de.jpg', 1.02, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (172, N'IGI', 606361854, N'https://www.igi.org/verify-your-report/?r=606361854', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=606361854', 1.03, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (173, N'IGI', 627461450, N'https://www.igi.org/verify-your-report/?r=627461450', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5c507110-ef52-474b-8316-d5886dd86e2b.jpg', 1.04, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (174, N'IGI', 625439413, N'https://www.igi.org/verify-your-report/?r=625439413', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10210AI/still.jpg', 1.05, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (175, N'IGI', 630456361, N'https://www.igi.org/verify-your-report/?r=630456361', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c130f50e-b044-44ff-8d09-26a2353054ec.jpg', 1.05, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (176, N'IGI', 626497769, N'https://www.igi.org/verify-your-report/?r=626497769', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a93df6f6-c191-42ee-b07c-c9a99bb79a90.jpg', 1.06, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (177, N'IGI', 615345211, N'https://www.igi.org/verify-your-report/?r=615345211', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R969174/still.jpg', 1.08, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (178, N'IGI', 605360228, N'https://www.igi.org/verify-your-report/?r=605360228', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119570/still.jpg', 1.09, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (179, N'IGI', 634400531, N'https://www.igi.org/verify-your-report/?r=634400531', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0cc810b2-a510-4a16-b11a-71c32c5444df.jpg', 1.09, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (180, N'IGI', 625433232, N'https://www.igi.org/verify-your-report/?r=625433232', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cf0ab02-72ac-4bc8-a2d8-8173f3cf5a25.jpg', 1.11, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (181, N'IGI', 620421817, N'https://www.igi.org/verify-your-report/?r=620421817', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421817', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (182, N'IGI', 620421818, N'https://www.igi.org/verify-your-report/?r=620421818', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421818', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (183, N'IGI', 620421902, N'https://www.igi.org/verify-your-report/?r=620421902', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421902', 1.01, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (184, N'IGI', 620421874, N'https://www.igi.org/verify-your-report/?r=620421874', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421874', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (185, N'IGI', 593305677, N'https://www.igi.org/verify-your-report/?r=593305677', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV341-571A', 1.03, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (186, N'IGI', 632499573, N'https://www.igi.org/verify-your-report/?r=632499573', N'https://www.diamond360.co.in/imaged/B23068/still.jpg', 1.09, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (187, N'IGI', 631442496, N'https://www.igi.org/verify-your-report/?r=631442496', N'https://www.diamond360.co.in/imaged/B22764/still.jpg', 1.1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (188, N'IGI', 618401877, N'https://www.igi.org/verify-your-report/?r=618401877', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618401877', 1.12, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (189, N'IGI', 628469637, N'https://www.igi.org/verify-your-report/?r=628469637', N'https://v360.in/V360Images.aspx?cid=vd&d=HPHT101-252', 1.44, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (190, N'IGI', 620421829, N'https://www.igi.org/verify-your-report/?r=620421829', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421829', 1.5, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (191, N'IGI', 620421838, N'https://www.igi.org/verify-your-report/?r=620421838', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421838', 1.54, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (192, N'IGI', 583304021, N'https://www.igi.org/verify-your-report/?r=583304021', N'https://v360.in/V360Images.aspx?cid=vd&d=KG250-390A', 1.65, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (193, N'IGI', 617488495, N'https://www.igi.org/verify-your-report/?r=617488495', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/asscher.jpg?v=1702020829', 1.78, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (194, N'IGI', 589393420, N'https://www.igi.org/verify-your-report/?r=589393420', N'https://view.gem360.in/gem360/1708210958-GM259-124A/thumb.jpg', 1.01, N'Good', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (195, N'IGI', 620422007, N'https://www.igi.org/verify-your-report/?r=620422007', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620422007', 1.03, N'Excellent', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (196, N'IGI', 517289274, N'https://www.igi.org/verify-your-report/?r=517289274', N'https://v360.in/V360Images.aspx?cid=vd&d=KG10-326A', 1.5, N'Very Good', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (197, N'IGI', 530292776, N'https://www.igi.org/verify-your-report/?r=530292776', N'https://v360.in/V360Images.aspx?cid=vd&d=OM134-40A', 1.51, N'Very Good', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (198, N'IGI', 532262643, N'https://www.igi.org/verify-your-report/?r=532262643', N'https://v360.in/V360Images.aspx?cid=vd&d=OM134-59A', 1.51, N'Excellent', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (199, N'IGI', 532262645, N'https://www.igi.org/verify-your-report/?r=532262645', N'https://v360.in/V360Images.aspx?cid=vd&d=OM159-270A', 1.51, N'Very Good', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (200, N'IGI', 620422040, N'https://www.igi.org/verify-your-report/?r=620422040', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620422040', 1.52, N'Good', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
SET IDENTITY_INSERT [dbo].[diamond] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond_price] ON 

INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1, CAST(N'2024-06-04T06:17:24.0626143' AS DateTime2), 0, 0.3999, N'D', N'FL', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (2, CAST(N'2024-06-04T06:17:24.0787428' AS DateTime2), 0, 0.3999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (3, CAST(N'2024-06-04T06:17:24.0788312' AS DateTime2), 0, 0.3999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (4, CAST(N'2024-06-04T06:17:24.0788625' AS DateTime2), 0, 0.3999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (5, CAST(N'2024-06-04T06:17:24.0788866' AS DateTime2), 0, 0.3999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (6, CAST(N'2024-06-04T06:17:24.0789518' AS DateTime2), 0, 0.3999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (7, CAST(N'2024-06-04T06:17:24.0791255' AS DateTime2), 0, 0.3999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (8, CAST(N'2024-06-04T06:17:24.0791637' AS DateTime2), 0, 0.3999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (9, CAST(N'2024-06-04T06:17:24.0791848' AS DateTime2), 0, 0.3999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (10, CAST(N'2024-06-04T06:17:24.0792032' AS DateTime2), 0, 0.3999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (11, CAST(N'2024-06-04T06:17:24.0792541' AS DateTime2), 0, 0.3999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (12, CAST(N'2024-06-04T06:17:24.0792846' AS DateTime2), 0, 0.3999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (13, CAST(N'2024-06-04T06:17:24.0796393' AS DateTime2), 0, 0.3999, N'E', N'FL', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (14, CAST(N'2024-06-04T06:17:24.0796937' AS DateTime2), 0, 0.3999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (15, CAST(N'2024-06-04T06:17:24.0797096' AS DateTime2), 0, 0.3999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (16, CAST(N'2024-06-04T06:17:24.0797227' AS DateTime2), 0, 0.3999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (17, CAST(N'2024-06-04T06:17:24.0797441' AS DateTime2), 0, 0.3999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (18, CAST(N'2024-06-04T06:17:24.0797580' AS DateTime2), 0, 0.3999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (19, CAST(N'2024-06-04T06:17:24.0802140' AS DateTime2), 0, 0.3999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (20, CAST(N'2024-06-04T06:17:24.0803993' AS DateTime2), 0, 0.3999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (21, CAST(N'2024-06-04T06:17:24.0804494' AS DateTime2), 0, 0.3999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (22, CAST(N'2024-06-04T06:17:24.0804690' AS DateTime2), 0, 0.3999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (23, CAST(N'2024-06-04T06:17:24.0804880' AS DateTime2), 0, 0.3999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (24, CAST(N'2024-06-04T06:17:24.0805059' AS DateTime2), 0, 0.3999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (25, CAST(N'2024-06-04T06:17:24.0805295' AS DateTime2), 0, 0.3999, N'F', N'FL', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (26, CAST(N'2024-06-04T06:17:24.0805470' AS DateTime2), 0, 0.3999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (27, CAST(N'2024-06-04T06:17:24.0814829' AS DateTime2), 0, 0.3999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (28, CAST(N'2024-06-04T06:17:24.0815580' AS DateTime2), 0, 0.3999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (29, CAST(N'2024-06-04T06:17:24.0816172' AS DateTime2), 0, 0.3999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (30, CAST(N'2024-06-04T06:17:24.0817159' AS DateTime2), 0, 0.3999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (31, CAST(N'2024-06-04T06:17:24.0818152' AS DateTime2), 0, 0.3999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (32, CAST(N'2024-06-04T06:17:24.0818961' AS DateTime2), 0, 0.3999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (33, CAST(N'2024-06-04T06:17:24.0820033' AS DateTime2), 0, 0.3999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (34, CAST(N'2024-06-04T06:17:24.0820299' AS DateTime2), 0, 0.3999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (35, CAST(N'2024-06-04T06:17:24.0820529' AS DateTime2), 0, 0.3999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (36, CAST(N'2024-06-04T06:17:24.0821260' AS DateTime2), 0, 0.3999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (37, CAST(N'2024-06-04T06:17:24.0834774' AS DateTime2), 0, 0.3999, N'G', N'FL', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (38, CAST(N'2024-06-04T06:17:24.0837860' AS DateTime2), 0, 0.3999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (39, CAST(N'2024-06-04T06:17:24.0839074' AS DateTime2), 0, 0.3999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (40, CAST(N'2024-06-04T06:17:24.0839369' AS DateTime2), 0, 0.3999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (41, CAST(N'2024-06-04T06:17:24.0839620' AS DateTime2), 0, 0.3999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (42, CAST(N'2024-06-04T06:17:24.0839872' AS DateTime2), 0, 0.3999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (43, CAST(N'2024-06-04T06:17:24.0840044' AS DateTime2), 0, 0.3999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (44, CAST(N'2024-06-04T06:17:24.0840227' AS DateTime2), 0, 0.3999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (45, CAST(N'2024-06-04T06:17:24.0840494' AS DateTime2), 0, 0.3999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (46, CAST(N'2024-06-04T06:17:24.0840789' AS DateTime2), 0, 0.3999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (47, CAST(N'2024-06-04T06:17:24.0841099' AS DateTime2), 0, 0.3999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (48, CAST(N'2024-06-04T06:17:24.0841361' AS DateTime2), 0, 0.3999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (49, CAST(N'2024-06-04T06:17:24.0841649' AS DateTime2), 0, 0.3999, N'H', N'FL', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (50, CAST(N'2024-06-04T06:17:24.0841853' AS DateTime2), 0, 0.3999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (51, CAST(N'2024-06-04T06:17:24.0842009' AS DateTime2), 0, 0.3999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (52, CAST(N'2024-06-04T06:17:24.0842123' AS DateTime2), 0, 0.3999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (53, CAST(N'2024-06-04T06:17:24.0842229' AS DateTime2), 0, 0.3999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (54, CAST(N'2024-06-04T06:17:24.0842399' AS DateTime2), 0, 0.3999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (55, CAST(N'2024-06-04T06:17:24.0842558' AS DateTime2), 0, 0.3999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (56, CAST(N'2024-06-04T06:17:24.0842689' AS DateTime2), 0, 0.3999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (57, CAST(N'2024-06-04T06:17:24.0842827' AS DateTime2), 0, 0.3999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (58, CAST(N'2024-06-04T06:17:24.0842965' AS DateTime2), 0, 0.3999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (59, CAST(N'2024-06-04T06:17:24.0843097' AS DateTime2), 0, 0.3999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (60, CAST(N'2024-06-04T06:17:24.0843242' AS DateTime2), 0, 0.3999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (61, CAST(N'2024-06-04T06:17:24.0843403' AS DateTime2), 0, 0.3999, N'I', N'FL', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (62, CAST(N'2024-06-04T06:17:24.0843535' AS DateTime2), 0, 0.3999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (63, CAST(N'2024-06-04T06:17:24.0843671' AS DateTime2), 0, 0.3999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (64, CAST(N'2024-06-04T06:17:24.0843811' AS DateTime2), 0, 0.3999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (65, CAST(N'2024-06-04T06:17:24.0843961' AS DateTime2), 0, 0.3999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (66, CAST(N'2024-06-04T06:17:24.0844096' AS DateTime2), 0, 0.3999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (67, CAST(N'2024-06-04T06:17:24.0844219' AS DateTime2), 0, 0.3999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (68, CAST(N'2024-06-04T06:17:24.0844357' AS DateTime2), 0, 0.3999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (69, CAST(N'2024-06-04T06:17:24.0848270' AS DateTime2), 0, 0.3999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (70, CAST(N'2024-06-04T06:17:24.0851029' AS DateTime2), 0, 0.3999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (71, CAST(N'2024-06-04T06:17:24.0851471' AS DateTime2), 0, 0.3999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (72, CAST(N'2024-06-04T06:17:24.0851662' AS DateTime2), 0, 0.3999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (73, CAST(N'2024-06-04T06:17:24.0852406' AS DateTime2), 0, 0.3999, N'J', N'FL', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (74, CAST(N'2024-06-04T06:17:24.0853448' AS DateTime2), 0, 0.3999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (75, CAST(N'2024-06-04T06:17:24.0853788' AS DateTime2), 0, 0.3999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (76, CAST(N'2024-06-04T06:17:24.0853989' AS DateTime2), 0, 0.3999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (77, CAST(N'2024-06-04T06:17:24.0854152' AS DateTime2), 0, 0.3999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (78, CAST(N'2024-06-04T06:17:24.0854410' AS DateTime2), 0, 0.3999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (79, CAST(N'2024-06-04T06:17:24.0854674' AS DateTime2), 0, 0.3999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (80, CAST(N'2024-06-04T06:17:24.0854929' AS DateTime2), 0, 0.3999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (81, CAST(N'2024-06-04T06:17:24.0855176' AS DateTime2), 0, 0.3999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (82, CAST(N'2024-06-04T06:17:24.0855336' AS DateTime2), 0, 0.3999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (83, CAST(N'2024-06-04T06:17:24.0855489' AS DateTime2), 0, 0.3999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (84, CAST(N'2024-06-04T06:17:24.0855656' AS DateTime2), 0, 0.3999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (85, CAST(N'2024-06-04T06:17:24.0855898' AS DateTime2), 0, 0.3999, N'K', N'FL', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (86, CAST(N'2024-06-04T06:17:24.0856496' AS DateTime2), 0, 0.3999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (87, CAST(N'2024-06-04T06:17:24.0856697' AS DateTime2), 0, 0.3999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (88, CAST(N'2024-06-04T06:17:24.0856779' AS DateTime2), 0, 0.3999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (89, CAST(N'2024-06-04T06:17:24.0856851' AS DateTime2), 0, 0.3999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (90, CAST(N'2024-06-04T06:17:24.0856924' AS DateTime2), 0, 0.3999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (91, CAST(N'2024-06-04T06:17:24.0857750' AS DateTime2), 0, 0.3999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (92, CAST(N'2024-06-04T06:17:24.0858725' AS DateTime2), 0, 0.3999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (93, CAST(N'2024-06-04T06:17:24.0859136' AS DateTime2), 0, 0.3999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (94, CAST(N'2024-06-04T06:17:24.0860109' AS DateTime2), 0, 0.3999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (95, CAST(N'2024-06-04T06:17:24.0860326' AS DateTime2), 0, 0.3999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (96, CAST(N'2024-06-04T06:17:24.0860544' AS DateTime2), 0, 0.3999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (97, CAST(N'2024-06-04T06:17:24.0860677' AS DateTime2), 0, 0.3999, N'L', N'FL', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (98, CAST(N'2024-06-04T06:17:24.0860753' AS DateTime2), 0, 0.3999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (99, CAST(N'2024-06-04T06:17:24.0860822' AS DateTime2), 0, 0.3999, N'L', N'VVS1', 8)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (100, CAST(N'2024-06-04T06:17:24.0860903' AS DateTime2), 0, 0.3999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (101, CAST(N'2024-06-04T06:17:24.0860974' AS DateTime2), 0, 0.3999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (102, CAST(N'2024-06-04T06:17:24.0861044' AS DateTime2), 0, 0.3999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (103, CAST(N'2024-06-04T06:17:24.0861228' AS DateTime2), 0, 0.3999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (104, CAST(N'2024-06-04T06:17:24.0861471' AS DateTime2), 0, 0.3999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (105, CAST(N'2024-06-04T06:17:24.0861623' AS DateTime2), 0, 0.3999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (106, CAST(N'2024-06-04T06:17:24.0861863' AS DateTime2), 0, 0.3999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (107, CAST(N'2024-06-04T06:17:24.0861957' AS DateTime2), 0, 0.3999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (108, CAST(N'2024-06-04T06:17:24.0862028' AS DateTime2), 0, 0.3999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (109, CAST(N'2024-06-04T06:17:24.0862118' AS DateTime2), 0, 0.3999, N'M', N'FL', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (110, CAST(N'2024-06-04T06:17:24.0862189' AS DateTime2), 0, 0.3999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (111, CAST(N'2024-06-04T06:17:24.0862265' AS DateTime2), 0, 0.3999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (112, CAST(N'2024-06-04T06:17:24.0862334' AS DateTime2), 0, 0.3999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (113, CAST(N'2024-06-04T06:17:24.0862415' AS DateTime2), 0, 0.3999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (114, CAST(N'2024-06-04T06:17:24.0862484' AS DateTime2), 0, 0.3999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (115, CAST(N'2024-06-04T06:17:24.0862636' AS DateTime2), 0, 0.3999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (116, CAST(N'2024-06-04T06:17:24.0862724' AS DateTime2), 0, 0.3999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (117, CAST(N'2024-06-04T06:17:24.0862815' AS DateTime2), 0, 0.3999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (118, CAST(N'2024-06-04T06:17:24.0863078' AS DateTime2), 0, 0.3999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (119, CAST(N'2024-06-04T06:17:24.0863241' AS DateTime2), 0, 0.3999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (120, CAST(N'2024-06-04T06:17:24.0863366' AS DateTime2), 0, 0.3999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (121, CAST(N'2024-06-04T06:17:24.2269313' AS DateTime2), 0.4, 0.4999, N'D', N'FL', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (122, CAST(N'2024-06-04T06:17:24.2270481' AS DateTime2), 0.4, 0.4999, N'D', N'IF', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (123, CAST(N'2024-06-04T06:17:24.2270663' AS DateTime2), 0.4, 0.4999, N'D', N'VVS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (124, CAST(N'2024-06-04T06:17:24.2270789' AS DateTime2), 0.4, 0.4999, N'D', N'VVS2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (125, CAST(N'2024-06-04T06:17:24.2270904' AS DateTime2), 0.4, 0.4999, N'D', N'VS1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (126, CAST(N'2024-06-04T06:17:24.2271037' AS DateTime2), 0.4, 0.4999, N'D', N'VS2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (127, CAST(N'2024-06-04T06:17:24.2271147' AS DateTime2), 0.4, 0.4999, N'D', N'SI1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (128, CAST(N'2024-06-04T06:17:24.2271258' AS DateTime2), 0.4, 0.4999, N'D', N'SI2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (129, CAST(N'2024-06-04T06:17:24.2271364' AS DateTime2), 0.4, 0.4999, N'D', N'SI3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (130, CAST(N'2024-06-04T06:17:24.2271469' AS DateTime2), 0.4, 0.4999, N'D', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (131, CAST(N'2024-06-04T06:17:24.2271646' AS DateTime2), 0.4, 0.4999, N'D', N'I2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (132, CAST(N'2024-06-04T06:17:24.2271763' AS DateTime2), 0.4, 0.4999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (133, CAST(N'2024-06-04T06:17:24.2271921' AS DateTime2), 0.4, 0.4999, N'E', N'FL', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (134, CAST(N'2024-06-04T06:17:24.2272035' AS DateTime2), 0.4, 0.4999, N'E', N'IF', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (135, CAST(N'2024-06-04T06:17:24.2272144' AS DateTime2), 0.4, 0.4999, N'E', N'VVS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (136, CAST(N'2024-06-04T06:17:24.2272263' AS DateTime2), 0.4, 0.4999, N'E', N'VVS2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (137, CAST(N'2024-06-04T06:17:24.2272371' AS DateTime2), 0.4, 0.4999, N'E', N'VS1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (138, CAST(N'2024-06-04T06:17:24.2272480' AS DateTime2), 0.4, 0.4999, N'E', N'VS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (139, CAST(N'2024-06-04T06:17:24.2272592' AS DateTime2), 0.4, 0.4999, N'E', N'SI1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (140, CAST(N'2024-06-04T06:17:24.2272712' AS DateTime2), 0.4, 0.4999, N'E', N'SI2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (141, CAST(N'2024-06-04T06:17:24.2272820' AS DateTime2), 0.4, 0.4999, N'E', N'SI3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (142, CAST(N'2024-06-04T06:17:24.2272941' AS DateTime2), 0.4, 0.4999, N'E', N'I1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (143, CAST(N'2024-06-04T06:17:24.2273045' AS DateTime2), 0.4, 0.4999, N'E', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (144, CAST(N'2024-06-04T06:17:24.2273155' AS DateTime2), 0.4, 0.4999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (145, CAST(N'2024-06-04T06:17:24.2273286' AS DateTime2), 0.4, 0.4999, N'F', N'FL', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (146, CAST(N'2024-06-04T06:17:24.2273395' AS DateTime2), 0.4, 0.4999, N'F', N'IF', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (147, CAST(N'2024-06-04T06:17:24.2273516' AS DateTime2), 0.4, 0.4999, N'F', N'VVS1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (148, CAST(N'2024-06-04T06:17:24.2273631' AS DateTime2), 0.4, 0.4999, N'F', N'VVS2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (149, CAST(N'2024-06-04T06:17:24.2273735' AS DateTime2), 0.4, 0.4999, N'F', N'VS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (150, CAST(N'2024-06-04T06:17:24.2273848' AS DateTime2), 0.4, 0.4999, N'F', N'VS2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (151, CAST(N'2024-06-04T06:17:24.2273955' AS DateTime2), 0.4, 0.4999, N'F', N'SI1', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (152, CAST(N'2024-06-04T06:17:24.2274074' AS DateTime2), 0.4, 0.4999, N'F', N'SI2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (153, CAST(N'2024-06-04T06:17:24.2274181' AS DateTime2), 0.4, 0.4999, N'F', N'SI3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (154, CAST(N'2024-06-04T06:17:24.2274289' AS DateTime2), 0.4, 0.4999, N'F', N'I1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (155, CAST(N'2024-06-04T06:17:24.2274402' AS DateTime2), 0.4, 0.4999, N'F', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (156, CAST(N'2024-06-04T06:17:24.2274513' AS DateTime2), 0.4, 0.4999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (157, CAST(N'2024-06-04T06:17:24.2274651' AS DateTime2), 0.4, 0.4999, N'G', N'FL', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (158, CAST(N'2024-06-04T06:17:24.2274774' AS DateTime2), 0.4, 0.4999, N'G', N'IF', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (159, CAST(N'2024-06-04T06:17:24.2274894' AS DateTime2), 0.4, 0.4999, N'G', N'VVS1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (160, CAST(N'2024-06-04T06:17:24.2275004' AS DateTime2), 0.4, 0.4999, N'G', N'VVS2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (161, CAST(N'2024-06-04T06:17:24.2275110' AS DateTime2), 0.4, 0.4999, N'G', N'VS1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (162, CAST(N'2024-06-04T06:17:24.2275217' AS DateTime2), 0.4, 0.4999, N'G', N'VS2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (163, CAST(N'2024-06-04T06:17:24.2275341' AS DateTime2), 0.4, 0.4999, N'G', N'SI1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (164, CAST(N'2024-06-04T06:17:24.2275452' AS DateTime2), 0.4, 0.4999, N'G', N'SI2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (165, CAST(N'2024-06-04T06:17:24.2275560' AS DateTime2), 0.4, 0.4999, N'G', N'SI3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (166, CAST(N'2024-06-04T06:17:24.2275665' AS DateTime2), 0.4, 0.4999, N'G', N'I1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (167, CAST(N'2024-06-04T06:17:24.2275774' AS DateTime2), 0.4, 0.4999, N'G', N'I2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (168, CAST(N'2024-06-04T06:17:24.2276300' AS DateTime2), 0.4, 0.4999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (169, CAST(N'2024-06-04T06:17:24.2276460' AS DateTime2), 0.4, 0.4999, N'H', N'FL', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (170, CAST(N'2024-06-04T06:17:24.2276574' AS DateTime2), 0.4, 0.4999, N'H', N'IF', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (171, CAST(N'2024-06-04T06:17:24.2276680' AS DateTime2), 0.4, 0.4999, N'H', N'VVS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (172, CAST(N'2024-06-04T06:17:24.2276782' AS DateTime2), 0.4, 0.4999, N'H', N'VVS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (173, CAST(N'2024-06-04T06:17:24.2276901' AS DateTime2), 0.4, 0.4999, N'H', N'VS1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (174, CAST(N'2024-06-04T06:17:24.2277011' AS DateTime2), 0.4, 0.4999, N'H', N'VS2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (175, CAST(N'2024-06-04T06:17:24.2277107' AS DateTime2), 0.4, 0.4999, N'H', N'SI1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (176, CAST(N'2024-06-04T06:17:24.2277216' AS DateTime2), 0.4, 0.4999, N'H', N'SI2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (177, CAST(N'2024-06-04T06:17:24.2277326' AS DateTime2), 0.4, 0.4999, N'H', N'SI3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (178, CAST(N'2024-06-04T06:17:24.2277431' AS DateTime2), 0.4, 0.4999, N'H', N'I1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (179, CAST(N'2024-06-04T06:17:24.2277549' AS DateTime2), 0.4, 0.4999, N'H', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (180, CAST(N'2024-06-04T06:17:24.2277657' AS DateTime2), 0.4, 0.4999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (181, CAST(N'2024-06-04T06:17:24.2277785' AS DateTime2), 0.4, 0.4999, N'I', N'FL', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (182, CAST(N'2024-06-04T06:17:24.2277889' AS DateTime2), 0.4, 0.4999, N'I', N'IF', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (183, CAST(N'2024-06-04T06:17:24.2277984' AS DateTime2), 0.4, 0.4999, N'I', N'VVS1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (184, CAST(N'2024-06-04T06:17:24.2278093' AS DateTime2), 0.4, 0.4999, N'I', N'VVS2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (185, CAST(N'2024-06-04T06:17:24.2278195' AS DateTime2), 0.4, 0.4999, N'I', N'VS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (186, CAST(N'2024-06-04T06:17:24.2278303' AS DateTime2), 0.4, 0.4999, N'I', N'VS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (187, CAST(N'2024-06-04T06:17:24.2278406' AS DateTime2), 0.4, 0.4999, N'I', N'SI1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (188, CAST(N'2024-06-04T06:17:24.2278511' AS DateTime2), 0.4, 0.4999, N'I', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (189, CAST(N'2024-06-04T06:17:24.2278624' AS DateTime2), 0.4, 0.4999, N'I', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (190, CAST(N'2024-06-04T06:17:24.2278719' AS DateTime2), 0.4, 0.4999, N'I', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (191, CAST(N'2024-06-04T06:17:24.2278818' AS DateTime2), 0.4, 0.4999, N'I', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (192, CAST(N'2024-06-04T06:17:24.2278928' AS DateTime2), 0.4, 0.4999, N'I', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (193, CAST(N'2024-06-04T06:17:24.2279056' AS DateTime2), 0.4, 0.4999, N'J', N'FL', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (194, CAST(N'2024-06-04T06:17:24.2279161' AS DateTime2), 0.4, 0.4999, N'J', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (195, CAST(N'2024-06-04T06:17:24.2279269' AS DateTime2), 0.4, 0.4999, N'J', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (196, CAST(N'2024-06-04T06:17:24.2279377' AS DateTime2), 0.4, 0.4999, N'J', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (197, CAST(N'2024-06-04T06:17:24.2279495' AS DateTime2), 0.4, 0.4999, N'J', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (198, CAST(N'2024-06-04T06:17:24.2279763' AS DateTime2), 0.4, 0.4999, N'J', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (199, CAST(N'2024-06-04T06:17:24.2280041' AS DateTime2), 0.4, 0.4999, N'J', N'SI1', 12)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (200, CAST(N'2024-06-04T06:17:24.2280156' AS DateTime2), 0.4, 0.4999, N'J', N'SI2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (201, CAST(N'2024-06-04T06:17:24.2280263' AS DateTime2), 0.4, 0.4999, N'J', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (202, CAST(N'2024-06-04T06:17:24.2280366' AS DateTime2), 0.4, 0.4999, N'J', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (203, CAST(N'2024-06-04T06:17:24.2280469' AS DateTime2), 0.4, 0.4999, N'J', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (204, CAST(N'2024-06-04T06:17:24.2280584' AS DateTime2), 0.4, 0.4999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (205, CAST(N'2024-06-04T06:17:24.2280724' AS DateTime2), 0.4, 0.4999, N'K', N'FL', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (206, CAST(N'2024-06-04T06:17:24.2280954' AS DateTime2), 0.4, 0.4999, N'K', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (207, CAST(N'2024-06-04T06:17:24.2281172' AS DateTime2), 0.4, 0.4999, N'K', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (208, CAST(N'2024-06-04T06:17:24.2281288' AS DateTime2), 0.4, 0.4999, N'K', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (209, CAST(N'2024-06-04T06:17:24.2281415' AS DateTime2), 0.4, 0.4999, N'K', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (210, CAST(N'2024-06-04T06:17:24.2281525' AS DateTime2), 0.4, 0.4999, N'K', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (211, CAST(N'2024-06-04T06:17:24.2281631' AS DateTime2), 0.4, 0.4999, N'K', N'SI1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (212, CAST(N'2024-06-04T06:17:24.2281745' AS DateTime2), 0.4, 0.4999, N'K', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (213, CAST(N'2024-06-04T06:17:24.2281849' AS DateTime2), 0.4, 0.4999, N'K', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (214, CAST(N'2024-06-04T06:17:24.2281958' AS DateTime2), 0.4, 0.4999, N'K', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (215, CAST(N'2024-06-04T06:17:24.2282083' AS DateTime2), 0.4, 0.4999, N'K', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (216, CAST(N'2024-06-04T06:17:24.2282194' AS DateTime2), 0.4, 0.4999, N'K', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (217, CAST(N'2024-06-04T06:17:24.2282329' AS DateTime2), 0.4, 0.4999, N'L', N'FL', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (218, CAST(N'2024-06-04T06:17:24.2282447' AS DateTime2), 0.4, 0.4999, N'L', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (219, CAST(N'2024-06-04T06:17:24.2282563' AS DateTime2), 0.4, 0.4999, N'L', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (220, CAST(N'2024-06-04T06:17:24.2282686' AS DateTime2), 0.4, 0.4999, N'L', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (221, CAST(N'2024-06-04T06:17:24.2282795' AS DateTime2), 0.4, 0.4999, N'L', N'VS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (222, CAST(N'2024-06-04T06:17:24.2282905' AS DateTime2), 0.4, 0.4999, N'L', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (223, CAST(N'2024-06-04T06:17:24.2283016' AS DateTime2), 0.4, 0.4999, N'L', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (224, CAST(N'2024-06-04T06:17:24.2283125' AS DateTime2), 0.4, 0.4999, N'L', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (225, CAST(N'2024-06-04T06:17:24.2283239' AS DateTime2), 0.4, 0.4999, N'L', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (226, CAST(N'2024-06-04T06:17:24.2283348' AS DateTime2), 0.4, 0.4999, N'L', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (227, CAST(N'2024-06-04T06:17:24.2283465' AS DateTime2), 0.4, 0.4999, N'L', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (228, CAST(N'2024-06-04T06:17:24.2283570' AS DateTime2), 0.4, 0.4999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (229, CAST(N'2024-06-04T06:17:24.2283695' AS DateTime2), 0.4, 0.4999, N'M', N'FL', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (230, CAST(N'2024-06-04T06:17:24.2283819' AS DateTime2), 0.4, 0.4999, N'M', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (231, CAST(N'2024-06-04T06:17:24.2284123' AS DateTime2), 0.4, 0.4999, N'M', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (232, CAST(N'2024-06-04T06:17:24.2284754' AS DateTime2), 0.4, 0.4999, N'M', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (233, CAST(N'2024-06-04T06:17:24.2284969' AS DateTime2), 0.4, 0.4999, N'M', N'VS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (234, CAST(N'2024-06-04T06:17:24.2285106' AS DateTime2), 0.4, 0.4999, N'M', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (235, CAST(N'2024-06-04T06:17:24.2285273' AS DateTime2), 0.4, 0.4999, N'M', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (236, CAST(N'2024-06-04T06:17:24.2285507' AS DateTime2), 0.4, 0.4999, N'M', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (237, CAST(N'2024-06-04T06:17:24.2285623' AS DateTime2), 0.4, 0.4999, N'M', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (238, CAST(N'2024-06-04T06:17:24.2285754' AS DateTime2), 0.4, 0.4999, N'M', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (239, CAST(N'2024-06-04T06:17:24.2285863' AS DateTime2), 0.4, 0.4999, N'M', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (240, CAST(N'2024-06-04T06:17:24.2286037' AS DateTime2), 0.4, 0.4999, N'M', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (241, CAST(N'2024-06-04T06:17:24.3615016' AS DateTime2), 0.5, 0.6999, N'D', N'FL', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (242, CAST(N'2024-06-04T06:17:24.3615889' AS DateTime2), 0.5, 0.6999, N'D', N'IF', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (243, CAST(N'2024-06-04T06:17:24.3616127' AS DateTime2), 0.5, 0.6999, N'D', N'VVS1', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (244, CAST(N'2024-06-04T06:17:24.3616260' AS DateTime2), 0.5, 0.6999, N'D', N'VVS2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (245, CAST(N'2024-06-04T06:17:24.3616372' AS DateTime2), 0.5, 0.6999, N'D', N'VS1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (246, CAST(N'2024-06-04T06:17:24.3616481' AS DateTime2), 0.5, 0.6999, N'D', N'VS2', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (247, CAST(N'2024-06-04T06:17:24.3616592' AS DateTime2), 0.5, 0.6999, N'D', N'SI1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (248, CAST(N'2024-06-04T06:17:24.3618510' AS DateTime2), 0.5, 0.6999, N'D', N'SI2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (249, CAST(N'2024-06-04T06:17:24.3619047' AS DateTime2), 0.5, 0.6999, N'D', N'SI3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (250, CAST(N'2024-06-04T06:17:24.3619215' AS DateTime2), 0.5, 0.6999, N'D', N'I1', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (251, CAST(N'2024-06-04T06:17:24.3619347' AS DateTime2), 0.5, 0.6999, N'D', N'I2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (252, CAST(N'2024-06-04T06:17:24.3619484' AS DateTime2), 0.5, 0.6999, N'D', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (253, CAST(N'2024-06-04T06:17:24.3619713' AS DateTime2), 0.5, 0.6999, N'E', N'FL', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (254, CAST(N'2024-06-04T06:17:24.3620446' AS DateTime2), 0.5, 0.6999, N'E', N'IF', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (255, CAST(N'2024-06-04T06:17:24.3620690' AS DateTime2), 0.5, 0.6999, N'E', N'VVS1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (256, CAST(N'2024-06-04T06:17:24.3620834' AS DateTime2), 0.5, 0.6999, N'E', N'VVS2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (257, CAST(N'2024-06-04T06:17:24.3620972' AS DateTime2), 0.5, 0.6999, N'E', N'VS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (258, CAST(N'2024-06-04T06:17:24.3622880' AS DateTime2), 0.5, 0.6999, N'E', N'VS2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (259, CAST(N'2024-06-04T06:17:24.3623375' AS DateTime2), 0.5, 0.6999, N'E', N'SI1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (260, CAST(N'2024-06-04T06:17:24.3623554' AS DateTime2), 0.5, 0.6999, N'E', N'SI2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (261, CAST(N'2024-06-04T06:17:24.3623688' AS DateTime2), 0.5, 0.6999, N'E', N'SI3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (262, CAST(N'2024-06-04T06:17:24.3623815' AS DateTime2), 0.5, 0.6999, N'E', N'I1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (263, CAST(N'2024-06-04T06:17:24.3624024' AS DateTime2), 0.5, 0.6999, N'E', N'I2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (264, CAST(N'2024-06-04T06:17:24.3624169' AS DateTime2), 0.5, 0.6999, N'E', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (265, CAST(N'2024-06-04T06:17:24.3624350' AS DateTime2), 0.5, 0.6999, N'F', N'FL', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (266, CAST(N'2024-06-04T06:17:24.3624493' AS DateTime2), 0.5, 0.6999, N'F', N'IF', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (267, CAST(N'2024-06-04T06:17:24.3624630' AS DateTime2), 0.5, 0.6999, N'F', N'VVS1', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (268, CAST(N'2024-06-04T06:17:24.3624765' AS DateTime2), 0.5, 0.6999, N'F', N'VVS2', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (269, CAST(N'2024-06-04T06:17:24.3624923' AS DateTime2), 0.5, 0.6999, N'F', N'VS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (270, CAST(N'2024-06-04T06:17:24.3625439' AS DateTime2), 0.5, 0.6999, N'F', N'VS2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (271, CAST(N'2024-06-04T06:17:24.3625699' AS DateTime2), 0.5, 0.6999, N'F', N'SI1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (272, CAST(N'2024-06-04T06:17:24.3625848' AS DateTime2), 0.5, 0.6999, N'F', N'SI2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (273, CAST(N'2024-06-04T06:17:24.3625990' AS DateTime2), 0.5, 0.6999, N'F', N'SI3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (274, CAST(N'2024-06-04T06:17:24.3626144' AS DateTime2), 0.5, 0.6999, N'F', N'I1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (275, CAST(N'2024-06-04T06:17:24.3626278' AS DateTime2), 0.5, 0.6999, N'F', N'I2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (276, CAST(N'2024-06-04T06:17:24.3626409' AS DateTime2), 0.5, 0.6999, N'F', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (277, CAST(N'2024-06-04T06:17:24.3626577' AS DateTime2), 0.5, 0.6999, N'G', N'FL', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (278, CAST(N'2024-06-04T06:17:24.3626712' AS DateTime2), 0.5, 0.6999, N'G', N'IF', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (279, CAST(N'2024-06-04T06:17:24.3626935' AS DateTime2), 0.5, 0.6999, N'G', N'VVS1', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (280, CAST(N'2024-06-04T06:17:24.3627071' AS DateTime2), 0.5, 0.6999, N'G', N'VVS2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (281, CAST(N'2024-06-04T06:17:24.3627189' AS DateTime2), 0.5, 0.6999, N'G', N'VS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (282, CAST(N'2024-06-04T06:17:24.3627307' AS DateTime2), 0.5, 0.6999, N'G', N'VS2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (283, CAST(N'2024-06-04T06:17:24.3627439' AS DateTime2), 0.5, 0.6999, N'G', N'SI1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (284, CAST(N'2024-06-04T06:17:24.3627572' AS DateTime2), 0.5, 0.6999, N'G', N'SI2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (285, CAST(N'2024-06-04T06:17:24.3627722' AS DateTime2), 0.5, 0.6999, N'G', N'SI3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (286, CAST(N'2024-06-04T06:17:24.3627841' AS DateTime2), 0.5, 0.6999, N'G', N'I1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (287, CAST(N'2024-06-04T06:17:24.3627960' AS DateTime2), 0.5, 0.6999, N'G', N'I2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (288, CAST(N'2024-06-04T06:17:24.3628080' AS DateTime2), 0.5, 0.6999, N'G', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (289, CAST(N'2024-06-04T06:17:24.3628224' AS DateTime2), 0.5, 0.6999, N'H', N'FL', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (290, CAST(N'2024-06-04T06:17:24.3628348' AS DateTime2), 0.5, 0.6999, N'H', N'IF', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (291, CAST(N'2024-06-04T06:17:24.3628450' AS DateTime2), 0.5, 0.6999, N'H', N'VVS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (292, CAST(N'2024-06-04T06:17:24.3628555' AS DateTime2), 0.5, 0.6999, N'H', N'VVS2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (293, CAST(N'2024-06-04T06:17:24.3628658' AS DateTime2), 0.5, 0.6999, N'H', N'VS1', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (294, CAST(N'2024-06-04T06:17:24.3628770' AS DateTime2), 0.5, 0.6999, N'H', N'VS2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (295, CAST(N'2024-06-04T06:17:24.3628890' AS DateTime2), 0.5, 0.6999, N'H', N'SI1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (296, CAST(N'2024-06-04T06:17:24.3629003' AS DateTime2), 0.5, 0.6999, N'H', N'SI2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (297, CAST(N'2024-06-04T06:17:24.3629110' AS DateTime2), 0.5, 0.6999, N'H', N'SI3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (298, CAST(N'2024-06-04T06:17:24.3629222' AS DateTime2), 0.5, 0.6999, N'H', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (299, CAST(N'2024-06-04T06:17:24.3629363' AS DateTime2), 0.5, 0.6999, N'H', N'I2', 11)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (300, CAST(N'2024-06-04T06:17:24.3629502' AS DateTime2), 0.5, 0.6999, N'H', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (301, CAST(N'2024-06-04T06:17:24.3629675' AS DateTime2), 0.5, 0.6999, N'I', N'FL', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (302, CAST(N'2024-06-04T06:17:24.3629810' AS DateTime2), 0.5, 0.6999, N'I', N'IF', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (303, CAST(N'2024-06-04T06:17:24.3629935' AS DateTime2), 0.5, 0.6999, N'I', N'VVS1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (304, CAST(N'2024-06-04T06:17:24.3630062' AS DateTime2), 0.5, 0.6999, N'I', N'VVS2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (305, CAST(N'2024-06-04T06:17:24.3630189' AS DateTime2), 0.5, 0.6999, N'I', N'VS1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (306, CAST(N'2024-06-04T06:17:24.3630347' AS DateTime2), 0.5, 0.6999, N'I', N'VS2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (307, CAST(N'2024-06-04T06:17:24.3630462' AS DateTime2), 0.5, 0.6999, N'I', N'SI1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (308, CAST(N'2024-06-04T06:17:24.3630584' AS DateTime2), 0.5, 0.6999, N'I', N'SI2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (309, CAST(N'2024-06-04T06:17:24.3630696' AS DateTime2), 0.5, 0.6999, N'I', N'SI3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (310, CAST(N'2024-06-04T06:17:24.3630825' AS DateTime2), 0.5, 0.6999, N'I', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (311, CAST(N'2024-06-04T06:17:24.3630970' AS DateTime2), 0.5, 0.6999, N'I', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (312, CAST(N'2024-06-04T06:17:24.3631084' AS DateTime2), 0.5, 0.6999, N'I', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (313, CAST(N'2024-06-04T06:17:24.3631230' AS DateTime2), 0.5, 0.6999, N'J', N'FL', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (314, CAST(N'2024-06-04T06:17:24.3631352' AS DateTime2), 0.5, 0.6999, N'J', N'IF', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (315, CAST(N'2024-06-04T06:17:24.3631476' AS DateTime2), 0.5, 0.6999, N'J', N'VVS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (316, CAST(N'2024-06-04T06:17:24.3631604' AS DateTime2), 0.5, 0.6999, N'J', N'VVS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (317, CAST(N'2024-06-04T06:17:24.3631716' AS DateTime2), 0.5, 0.6999, N'J', N'VS1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (318, CAST(N'2024-06-04T06:17:24.3631851' AS DateTime2), 0.5, 0.6999, N'J', N'VS2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (319, CAST(N'2024-06-04T06:17:24.3632258' AS DateTime2), 0.5, 0.6999, N'J', N'SI1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (320, CAST(N'2024-06-04T06:17:24.3632827' AS DateTime2), 0.5, 0.6999, N'J', N'SI2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (321, CAST(N'2024-06-04T06:17:24.3633522' AS DateTime2), 0.5, 0.6999, N'J', N'SI3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (322, CAST(N'2024-06-04T06:17:24.3633715' AS DateTime2), 0.5, 0.6999, N'J', N'I1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (323, CAST(N'2024-06-04T06:17:24.3633919' AS DateTime2), 0.5, 0.6999, N'J', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (324, CAST(N'2024-06-04T06:17:24.3634107' AS DateTime2), 0.5, 0.6999, N'J', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (325, CAST(N'2024-06-04T06:17:24.3634514' AS DateTime2), 0.5, 0.6999, N'K', N'FL', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (326, CAST(N'2024-06-04T06:17:24.3635111' AS DateTime2), 0.5, 0.6999, N'K', N'IF', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (327, CAST(N'2024-06-04T06:17:24.3635549' AS DateTime2), 0.5, 0.6999, N'K', N'VVS1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (328, CAST(N'2024-06-04T06:17:24.3635723' AS DateTime2), 0.5, 0.6999, N'K', N'VVS2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (329, CAST(N'2024-06-04T06:17:24.3635896' AS DateTime2), 0.5, 0.6999, N'K', N'VS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (330, CAST(N'2024-06-04T06:17:24.3636131' AS DateTime2), 0.5, 0.6999, N'K', N'VS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (331, CAST(N'2024-06-04T06:17:24.3636467' AS DateTime2), 0.5, 0.6999, N'K', N'SI1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (332, CAST(N'2024-06-04T06:17:24.3636821' AS DateTime2), 0.5, 0.6999, N'K', N'SI2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (333, CAST(N'2024-06-04T06:17:24.3637104' AS DateTime2), 0.5, 0.6999, N'K', N'SI3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (334, CAST(N'2024-06-04T06:17:24.3637279' AS DateTime2), 0.5, 0.6999, N'K', N'I1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (335, CAST(N'2024-06-04T06:17:24.3637541' AS DateTime2), 0.5, 0.6999, N'K', N'I2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (336, CAST(N'2024-06-04T06:17:24.3637743' AS DateTime2), 0.5, 0.6999, N'K', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (337, CAST(N'2024-06-04T06:17:24.3638015' AS DateTime2), 0.5, 0.6999, N'L', N'FL', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (338, CAST(N'2024-06-04T06:17:24.3638580' AS DateTime2), 0.5, 0.6999, N'L', N'IF', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (339, CAST(N'2024-06-04T06:17:24.3639000' AS DateTime2), 0.5, 0.6999, N'L', N'VVS1', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (340, CAST(N'2024-06-04T06:17:24.3639262' AS DateTime2), 0.5, 0.6999, N'L', N'VVS2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (341, CAST(N'2024-06-04T06:17:24.3639449' AS DateTime2), 0.5, 0.6999, N'L', N'VS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (342, CAST(N'2024-06-04T06:17:24.3639857' AS DateTime2), 0.5, 0.6999, N'L', N'VS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (343, CAST(N'2024-06-04T06:17:24.3645967' AS DateTime2), 0.5, 0.6999, N'L', N'SI1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (344, CAST(N'2024-06-04T06:17:24.3647114' AS DateTime2), 0.5, 0.6999, N'L', N'SI2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (345, CAST(N'2024-06-04T06:17:24.3649507' AS DateTime2), 0.5, 0.6999, N'L', N'SI3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (346, CAST(N'2024-06-04T06:17:24.3650714' AS DateTime2), 0.5, 0.6999, N'L', N'I1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (347, CAST(N'2024-06-04T06:17:24.3651912' AS DateTime2), 0.5, 0.6999, N'L', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (348, CAST(N'2024-06-04T06:17:24.3652390' AS DateTime2), 0.5, 0.6999, N'L', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (349, CAST(N'2024-06-04T06:17:24.3652703' AS DateTime2), 0.5, 0.6999, N'M', N'FL', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (350, CAST(N'2024-06-04T06:17:24.3652858' AS DateTime2), 0.5, 0.6999, N'M', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (351, CAST(N'2024-06-04T06:17:24.3652980' AS DateTime2), 0.5, 0.6999, N'M', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (352, CAST(N'2024-06-04T06:17:24.3653211' AS DateTime2), 0.5, 0.6999, N'M', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (353, CAST(N'2024-06-04T06:17:24.3653425' AS DateTime2), 0.5, 0.6999, N'M', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (354, CAST(N'2024-06-04T06:17:24.3653688' AS DateTime2), 0.5, 0.6999, N'M', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (355, CAST(N'2024-06-04T06:17:24.3653851' AS DateTime2), 0.5, 0.6999, N'M', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (356, CAST(N'2024-06-04T06:17:24.3653974' AS DateTime2), 0.5, 0.6999, N'M', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (357, CAST(N'2024-06-04T06:17:24.3654096' AS DateTime2), 0.5, 0.6999, N'M', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (358, CAST(N'2024-06-04T06:17:24.3654229' AS DateTime2), 0.5, 0.6999, N'M', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (359, CAST(N'2024-06-04T06:17:24.3654339' AS DateTime2), 0.5, 0.6999, N'M', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (360, CAST(N'2024-06-04T06:17:24.3654514' AS DateTime2), 0.5, 0.6999, N'M', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (361, CAST(N'2024-06-04T06:17:24.4377701' AS DateTime2), 0.7, 0.8999, N'D', N'FL', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (362, CAST(N'2024-06-04T06:17:24.4378609' AS DateTime2), 0.7, 0.8999, N'D', N'IF', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (363, CAST(N'2024-06-04T06:17:24.4378843' AS DateTime2), 0.7, 0.8999, N'D', N'VVS1', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (364, CAST(N'2024-06-04T06:17:24.4378988' AS DateTime2), 0.7, 0.8999, N'D', N'VVS2', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (365, CAST(N'2024-06-04T06:17:24.4379163' AS DateTime2), 0.7, 0.8999, N'D', N'VS1', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (366, CAST(N'2024-06-04T06:17:24.4379274' AS DateTime2), 0.7, 0.8999, N'D', N'VS2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (367, CAST(N'2024-06-04T06:17:24.4379428' AS DateTime2), 0.7, 0.8999, N'D', N'SI1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (368, CAST(N'2024-06-04T06:17:24.4379565' AS DateTime2), 0.7, 0.8999, N'D', N'SI2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (369, CAST(N'2024-06-04T06:17:24.4379686' AS DateTime2), 0.7, 0.8999, N'D', N'SI3', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (370, CAST(N'2024-06-04T06:17:24.4379801' AS DateTime2), 0.7, 0.8999, N'D', N'I1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (371, CAST(N'2024-06-04T06:17:24.4379912' AS DateTime2), 0.7, 0.8999, N'D', N'I2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (372, CAST(N'2024-06-04T06:17:24.4380122' AS DateTime2), 0.7, 0.8999, N'D', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (373, CAST(N'2024-06-04T06:17:24.4380353' AS DateTime2), 0.7, 0.8999, N'E', N'FL', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (374, CAST(N'2024-06-04T06:17:24.4380510' AS DateTime2), 0.7, 0.8999, N'E', N'IF', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (375, CAST(N'2024-06-04T06:17:24.4380656' AS DateTime2), 0.7, 0.8999, N'E', N'VVS1', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (376, CAST(N'2024-06-04T06:17:24.4380802' AS DateTime2), 0.7, 0.8999, N'E', N'VVS2', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (377, CAST(N'2024-06-04T06:17:24.4380952' AS DateTime2), 0.7, 0.8999, N'E', N'VS1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (378, CAST(N'2024-06-04T06:17:24.4381132' AS DateTime2), 0.7, 0.8999, N'E', N'VS2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (379, CAST(N'2024-06-04T06:17:24.4381294' AS DateTime2), 0.7, 0.8999, N'E', N'SI1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (380, CAST(N'2024-06-04T06:17:24.4381408' AS DateTime2), 0.7, 0.8999, N'E', N'SI2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (381, CAST(N'2024-06-04T06:17:24.4381538' AS DateTime2), 0.7, 0.8999, N'E', N'SI3', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (382, CAST(N'2024-06-04T06:17:24.4381661' AS DateTime2), 0.7, 0.8999, N'E', N'I1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (383, CAST(N'2024-06-04T06:17:24.4381860' AS DateTime2), 0.7, 0.8999, N'E', N'I2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (384, CAST(N'2024-06-04T06:17:24.4382028' AS DateTime2), 0.7, 0.8999, N'E', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (385, CAST(N'2024-06-04T06:17:24.4382191' AS DateTime2), 0.7, 0.8999, N'F', N'FL', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (386, CAST(N'2024-06-04T06:17:24.4382345' AS DateTime2), 0.7, 0.8999, N'F', N'IF', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (387, CAST(N'2024-06-04T06:17:24.4382500' AS DateTime2), 0.7, 0.8999, N'F', N'VVS1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (388, CAST(N'2024-06-04T06:17:24.4382702' AS DateTime2), 0.7, 0.8999, N'F', N'VVS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (389, CAST(N'2024-06-04T06:17:24.4382828' AS DateTime2), 0.7, 0.8999, N'F', N'VS1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (390, CAST(N'2024-06-04T06:17:24.4382993' AS DateTime2), 0.7, 0.8999, N'F', N'VS2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (391, CAST(N'2024-06-04T06:17:24.4383170' AS DateTime2), 0.7, 0.8999, N'F', N'SI1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (392, CAST(N'2024-06-04T06:17:24.4383320' AS DateTime2), 0.7, 0.8999, N'F', N'SI2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (393, CAST(N'2024-06-04T06:17:24.4383465' AS DateTime2), 0.7, 0.8999, N'F', N'SI3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (394, CAST(N'2024-06-04T06:17:24.4383643' AS DateTime2), 0.7, 0.8999, N'F', N'I1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (395, CAST(N'2024-06-04T06:17:24.4383774' AS DateTime2), 0.7, 0.8999, N'F', N'I2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (396, CAST(N'2024-06-04T06:17:24.4383866' AS DateTime2), 0.7, 0.8999, N'F', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (397, CAST(N'2024-06-04T06:17:24.4383985' AS DateTime2), 0.7, 0.8999, N'G', N'FL', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (398, CAST(N'2024-06-04T06:17:24.4384080' AS DateTime2), 0.7, 0.8999, N'G', N'IF', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (399, CAST(N'2024-06-04T06:17:24.4384187' AS DateTime2), 0.7, 0.8999, N'G', N'VVS1', 49)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (400, CAST(N'2024-06-04T06:17:24.4384299' AS DateTime2), 0.7, 0.8999, N'G', N'VVS2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (401, CAST(N'2024-06-04T06:17:24.4384470' AS DateTime2), 0.7, 0.8999, N'G', N'VS1', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (402, CAST(N'2024-06-04T06:17:24.4384620' AS DateTime2), 0.7, 0.8999, N'G', N'VS2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (403, CAST(N'2024-06-04T06:17:24.4384755' AS DateTime2), 0.7, 0.8999, N'G', N'SI1', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (404, CAST(N'2024-06-04T06:17:24.4384918' AS DateTime2), 0.7, 0.8999, N'G', N'SI2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (405, CAST(N'2024-06-04T06:17:24.4385080' AS DateTime2), 0.7, 0.8999, N'G', N'SI3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (406, CAST(N'2024-06-04T06:17:24.4385310' AS DateTime2), 0.7, 0.8999, N'G', N'I1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (407, CAST(N'2024-06-04T06:17:24.4385495' AS DateTime2), 0.7, 0.8999, N'G', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (408, CAST(N'2024-06-04T06:17:24.4385670' AS DateTime2), 0.7, 0.8999, N'G', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (409, CAST(N'2024-06-04T06:17:24.4385923' AS DateTime2), 0.7, 0.8999, N'H', N'FL', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (410, CAST(N'2024-06-04T06:17:24.4386098' AS DateTime2), 0.7, 0.8999, N'H', N'IF', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (411, CAST(N'2024-06-04T06:17:24.4386257' AS DateTime2), 0.7, 0.8999, N'H', N'VVS1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (412, CAST(N'2024-06-04T06:17:24.4386436' AS DateTime2), 0.7, 0.8999, N'H', N'VVS2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (413, CAST(N'2024-06-04T06:17:24.4386589' AS DateTime2), 0.7, 0.8999, N'H', N'VS1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (414, CAST(N'2024-06-04T06:17:24.4386716' AS DateTime2), 0.7, 0.8999, N'H', N'VS2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (415, CAST(N'2024-06-04T06:17:24.4386862' AS DateTime2), 0.7, 0.8999, N'H', N'SI1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (416, CAST(N'2024-06-04T06:17:24.4387007' AS DateTime2), 0.7, 0.8999, N'H', N'SI2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (417, CAST(N'2024-06-04T06:17:24.4387156' AS DateTime2), 0.7, 0.8999, N'H', N'SI3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (418, CAST(N'2024-06-04T06:17:24.4399454' AS DateTime2), 0.7, 0.8999, N'H', N'I1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (419, CAST(N'2024-06-04T06:17:24.4400505' AS DateTime2), 0.7, 0.8999, N'H', N'I2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (420, CAST(N'2024-06-04T06:17:24.4400825' AS DateTime2), 0.7, 0.8999, N'H', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (421, CAST(N'2024-06-04T06:17:24.4401025' AS DateTime2), 0.7, 0.8999, N'I', N'FL', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (422, CAST(N'2024-06-04T06:17:24.4401198' AS DateTime2), 0.7, 0.8999, N'I', N'IF', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (423, CAST(N'2024-06-04T06:17:24.4401468' AS DateTime2), 0.7, 0.8999, N'I', N'VVS1', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (424, CAST(N'2024-06-04T06:17:24.4401676' AS DateTime2), 0.7, 0.8999, N'I', N'VVS2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (425, CAST(N'2024-06-04T06:17:24.4401895' AS DateTime2), 0.7, 0.8999, N'I', N'VS1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (426, CAST(N'2024-06-04T06:17:24.4402075' AS DateTime2), 0.7, 0.8999, N'I', N'VS2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (427, CAST(N'2024-06-04T06:17:24.4402217' AS DateTime2), 0.7, 0.8999, N'I', N'SI1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (428, CAST(N'2024-06-04T06:17:24.4402356' AS DateTime2), 0.7, 0.8999, N'I', N'SI2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (429, CAST(N'2024-06-04T06:17:24.4402527' AS DateTime2), 0.7, 0.8999, N'I', N'SI3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (430, CAST(N'2024-06-04T06:17:24.4402671' AS DateTime2), 0.7, 0.8999, N'I', N'I1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (431, CAST(N'2024-06-04T06:17:24.4402840' AS DateTime2), 0.7, 0.8999, N'I', N'I2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (432, CAST(N'2024-06-04T06:17:24.4403034' AS DateTime2), 0.7, 0.8999, N'I', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (433, CAST(N'2024-06-04T06:17:24.4403313' AS DateTime2), 0.7, 0.8999, N'J', N'FL', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (434, CAST(N'2024-06-04T06:17:24.4403515' AS DateTime2), 0.7, 0.8999, N'J', N'IF', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (435, CAST(N'2024-06-04T06:17:24.4403666' AS DateTime2), 0.7, 0.8999, N'J', N'VVS1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (436, CAST(N'2024-06-04T06:17:24.4403805' AS DateTime2), 0.7, 0.8999, N'J', N'VVS2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (437, CAST(N'2024-06-04T06:17:24.4403914' AS DateTime2), 0.7, 0.8999, N'J', N'VS1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (438, CAST(N'2024-06-04T06:17:24.4404020' AS DateTime2), 0.7, 0.8999, N'J', N'VS2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (439, CAST(N'2024-06-04T06:17:24.4404145' AS DateTime2), 0.7, 0.8999, N'J', N'SI1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (440, CAST(N'2024-06-04T06:17:24.4404272' AS DateTime2), 0.7, 0.8999, N'J', N'SI2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (441, CAST(N'2024-06-04T06:17:24.4404449' AS DateTime2), 0.7, 0.8999, N'J', N'SI3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (442, CAST(N'2024-06-04T06:17:24.4404605' AS DateTime2), 0.7, 0.8999, N'J', N'I1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (443, CAST(N'2024-06-04T06:17:24.4404736' AS DateTime2), 0.7, 0.8999, N'J', N'I2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (444, CAST(N'2024-06-04T06:17:24.4404912' AS DateTime2), 0.7, 0.8999, N'J', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (445, CAST(N'2024-06-04T06:17:24.4405085' AS DateTime2), 0.7, 0.8999, N'K', N'FL', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (446, CAST(N'2024-06-04T06:17:24.4405236' AS DateTime2), 0.7, 0.8999, N'K', N'IF', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (447, CAST(N'2024-06-04T06:17:24.4405353' AS DateTime2), 0.7, 0.8999, N'K', N'VVS1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (448, CAST(N'2024-06-04T06:17:24.4405463' AS DateTime2), 0.7, 0.8999, N'K', N'VVS2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (449, CAST(N'2024-06-04T06:17:24.4405615' AS DateTime2), 0.7, 0.8999, N'K', N'VS1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (450, CAST(N'2024-06-04T06:17:24.4405871' AS DateTime2), 0.7, 0.8999, N'K', N'VS2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (451, CAST(N'2024-06-04T06:17:24.4406038' AS DateTime2), 0.7, 0.8999, N'K', N'SI1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (452, CAST(N'2024-06-04T06:17:24.4406150' AS DateTime2), 0.7, 0.8999, N'K', N'SI2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (453, CAST(N'2024-06-04T06:17:24.4406461' AS DateTime2), 0.7, 0.8999, N'K', N'SI3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (454, CAST(N'2024-06-04T06:17:24.4406699' AS DateTime2), 0.7, 0.8999, N'K', N'I1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (455, CAST(N'2024-06-04T06:17:24.4406929' AS DateTime2), 0.7, 0.8999, N'K', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (456, CAST(N'2024-06-04T06:17:24.4407133' AS DateTime2), 0.7, 0.8999, N'K', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (457, CAST(N'2024-06-04T06:17:24.4407446' AS DateTime2), 0.7, 0.8999, N'L', N'FL', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (458, CAST(N'2024-06-04T06:17:24.4407660' AS DateTime2), 0.7, 0.8999, N'L', N'IF', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (459, CAST(N'2024-06-04T06:17:24.4407829' AS DateTime2), 0.7, 0.8999, N'L', N'VVS1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (460, CAST(N'2024-06-04T06:17:24.4408010' AS DateTime2), 0.7, 0.8999, N'L', N'VVS2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (461, CAST(N'2024-06-04T06:17:24.4408172' AS DateTime2), 0.7, 0.8999, N'L', N'VS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (462, CAST(N'2024-06-04T06:17:24.4408306' AS DateTime2), 0.7, 0.8999, N'L', N'VS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (463, CAST(N'2024-06-04T06:17:24.4408450' AS DateTime2), 0.7, 0.8999, N'L', N'SI1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (464, CAST(N'2024-06-04T06:17:24.4408556' AS DateTime2), 0.7, 0.8999, N'L', N'SI2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (465, CAST(N'2024-06-04T06:17:24.4408674' AS DateTime2), 0.7, 0.8999, N'L', N'SI3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (466, CAST(N'2024-06-04T06:17:24.4408785' AS DateTime2), 0.7, 0.8999, N'L', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (467, CAST(N'2024-06-04T06:17:24.4408937' AS DateTime2), 0.7, 0.8999, N'L', N'I2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (468, CAST(N'2024-06-04T06:17:24.4409055' AS DateTime2), 0.7, 0.8999, N'L', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (469, CAST(N'2024-06-04T06:17:24.4409198' AS DateTime2), 0.7, 0.8999, N'M', N'FL', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (470, CAST(N'2024-06-04T06:17:24.4409325' AS DateTime2), 0.7, 0.8999, N'M', N'IF', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (471, CAST(N'2024-06-04T06:17:24.4409454' AS DateTime2), 0.7, 0.8999, N'M', N'VVS1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (472, CAST(N'2024-06-04T06:17:24.4409574' AS DateTime2), 0.7, 0.8999, N'M', N'VVS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (473, CAST(N'2024-06-04T06:17:24.4409745' AS DateTime2), 0.7, 0.8999, N'M', N'VS1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (474, CAST(N'2024-06-04T06:17:24.4409859' AS DateTime2), 0.7, 0.8999, N'M', N'VS2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (475, CAST(N'2024-06-04T06:17:24.4409998' AS DateTime2), 0.7, 0.8999, N'M', N'SI1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (476, CAST(N'2024-06-04T06:17:24.4410123' AS DateTime2), 0.7, 0.8999, N'M', N'SI2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (477, CAST(N'2024-06-04T06:17:24.4410254' AS DateTime2), 0.7, 0.8999, N'M', N'SI3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (478, CAST(N'2024-06-04T06:17:24.4410361' AS DateTime2), 0.7, 0.8999, N'M', N'I1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (479, CAST(N'2024-06-04T06:17:24.4410476' AS DateTime2), 0.7, 0.8999, N'M', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (480, CAST(N'2024-06-04T06:17:24.4410581' AS DateTime2), 0.7, 0.8999, N'M', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (481, CAST(N'2024-06-04T06:17:24.5712521' AS DateTime2), 0.9, 0.9999, N'D', N'FL', 128)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (482, CAST(N'2024-06-04T06:17:24.5713410' AS DateTime2), 0.9, 0.9999, N'D', N'IF', 122)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (483, CAST(N'2024-06-04T06:17:24.5713645' AS DateTime2), 0.9, 0.9999, N'D', N'VVS1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (484, CAST(N'2024-06-04T06:17:24.5713778' AS DateTime2), 0.9, 0.9999, N'D', N'VVS2', 89)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (485, CAST(N'2024-06-04T06:17:24.5713993' AS DateTime2), 0.9, 0.9999, N'D', N'VS1', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (486, CAST(N'2024-06-04T06:17:24.5714237' AS DateTime2), 0.9, 0.9999, N'D', N'VS2', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (487, CAST(N'2024-06-04T06:17:24.5714374' AS DateTime2), 0.9, 0.9999, N'D', N'SI1', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (488, CAST(N'2024-06-04T06:17:24.5714494' AS DateTime2), 0.9, 0.9999, N'D', N'SI2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (489, CAST(N'2024-06-04T06:17:24.5714622' AS DateTime2), 0.9, 0.9999, N'D', N'SI3', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (490, CAST(N'2024-06-04T06:17:24.5714747' AS DateTime2), 0.9, 0.9999, N'D', N'I1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (491, CAST(N'2024-06-04T06:17:24.5714875' AS DateTime2), 0.9, 0.9999, N'D', N'I2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (492, CAST(N'2024-06-04T06:17:24.5715015' AS DateTime2), 0.9, 0.9999, N'D', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (493, CAST(N'2024-06-04T06:17:24.5715205' AS DateTime2), 0.9, 0.9999, N'E', N'FL', 113)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (494, CAST(N'2024-06-04T06:17:24.5715421' AS DateTime2), 0.9, 0.9999, N'E', N'IF', 109)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (495, CAST(N'2024-06-04T06:17:24.5715559' AS DateTime2), 0.9, 0.9999, N'E', N'VVS1', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (496, CAST(N'2024-06-04T06:17:24.5715680' AS DateTime2), 0.9, 0.9999, N'E', N'VVS2', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (497, CAST(N'2024-06-04T06:17:24.5715826' AS DateTime2), 0.9, 0.9999, N'E', N'VS1', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (498, CAST(N'2024-06-04T06:17:24.5715937' AS DateTime2), 0.9, 0.9999, N'E', N'VS2', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (499, CAST(N'2024-06-04T06:17:24.5716054' AS DateTime2), 0.9, 0.9999, N'E', N'SI1', 48)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (500, CAST(N'2024-06-04T06:17:24.5716172' AS DateTime2), 0.9, 0.9999, N'E', N'SI2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (501, CAST(N'2024-06-04T06:17:24.5716284' AS DateTime2), 0.9, 0.9999, N'E', N'SI3', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (502, CAST(N'2024-06-04T06:17:24.5716425' AS DateTime2), 0.9, 0.9999, N'E', N'I1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (503, CAST(N'2024-06-04T06:17:24.5716584' AS DateTime2), 0.9, 0.9999, N'E', N'I2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (504, CAST(N'2024-06-04T06:17:24.5716705' AS DateTime2), 0.9, 0.9999, N'E', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (505, CAST(N'2024-06-04T06:17:24.5716863' AS DateTime2), 0.9, 0.9999, N'F', N'FL', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (506, CAST(N'2024-06-04T06:17:24.5717005' AS DateTime2), 0.9, 0.9999, N'F', N'IF', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (507, CAST(N'2024-06-04T06:17:24.5717149' AS DateTime2), 0.9, 0.9999, N'F', N'VVS1', 91)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (508, CAST(N'2024-06-04T06:17:24.5717275' AS DateTime2), 0.9, 0.9999, N'F', N'VVS2', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (509, CAST(N'2024-06-04T06:17:24.5717388' AS DateTime2), 0.9, 0.9999, N'F', N'VS1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (510, CAST(N'2024-06-04T06:17:24.5717505' AS DateTime2), 0.9, 0.9999, N'F', N'VS2', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (511, CAST(N'2024-06-04T06:17:24.5717615' AS DateTime2), 0.9, 0.9999, N'F', N'SI1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (512, CAST(N'2024-06-04T06:17:24.5717724' AS DateTime2), 0.9, 0.9999, N'F', N'SI2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (513, CAST(N'2024-06-04T06:17:24.5717847' AS DateTime2), 0.9, 0.9999, N'F', N'SI3', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (514, CAST(N'2024-06-04T06:17:24.5717979' AS DateTime2), 0.9, 0.9999, N'F', N'I1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (515, CAST(N'2024-06-04T06:17:24.5718162' AS DateTime2), 0.9, 0.9999, N'F', N'I2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (516, CAST(N'2024-06-04T06:17:24.5718284' AS DateTime2), 0.9, 0.9999, N'F', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (517, CAST(N'2024-06-04T06:17:24.5718428' AS DateTime2), 0.9, 0.9999, N'G', N'FL', 94)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (518, CAST(N'2024-06-04T06:17:24.5718558' AS DateTime2), 0.9, 0.9999, N'G', N'IF', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (519, CAST(N'2024-06-04T06:17:24.5718681' AS DateTime2), 0.9, 0.9999, N'G', N'VVS1', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (520, CAST(N'2024-06-04T06:17:24.5718802' AS DateTime2), 0.9, 0.9999, N'G', N'VVS2', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (521, CAST(N'2024-06-04T06:17:24.5718935' AS DateTime2), 0.9, 0.9999, N'G', N'VS1', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (522, CAST(N'2024-06-04T06:17:24.5719050' AS DateTime2), 0.9, 0.9999, N'G', N'VS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (523, CAST(N'2024-06-04T06:17:24.5719185' AS DateTime2), 0.9, 0.9999, N'G', N'SI1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (524, CAST(N'2024-06-04T06:17:24.5719294' AS DateTime2), 0.9, 0.9999, N'G', N'SI2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (525, CAST(N'2024-06-04T06:17:24.5719396' AS DateTime2), 0.9, 0.9999, N'G', N'SI3', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (526, CAST(N'2024-06-04T06:17:24.5719500' AS DateTime2), 0.9, 0.9999, N'G', N'I1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (527, CAST(N'2024-06-04T06:17:24.5719625' AS DateTime2), 0.9, 0.9999, N'G', N'I2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (528, CAST(N'2024-06-04T06:17:24.5719756' AS DateTime2), 0.9, 0.9999, N'G', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (529, CAST(N'2024-06-04T06:17:24.5719932' AS DateTime2), 0.9, 0.9999, N'H', N'FL', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (530, CAST(N'2024-06-04T06:17:24.5720068' AS DateTime2), 0.9, 0.9999, N'H', N'IF', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (531, CAST(N'2024-06-04T06:17:24.5720202' AS DateTime2), 0.9, 0.9999, N'H', N'VVS1', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (532, CAST(N'2024-06-04T06:17:24.5720335' AS DateTime2), 0.9, 0.9999, N'H', N'VVS2', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (533, CAST(N'2024-06-04T06:17:24.5720459' AS DateTime2), 0.9, 0.9999, N'H', N'VS1', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (534, CAST(N'2024-06-04T06:17:24.5720598' AS DateTime2), 0.9, 0.9999, N'H', N'VS2', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (535, CAST(N'2024-06-04T06:17:24.5720730' AS DateTime2), 0.9, 0.9999, N'H', N'SI1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (536, CAST(N'2024-06-04T06:17:24.5720860' AS DateTime2), 0.9, 0.9999, N'H', N'SI2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (537, CAST(N'2024-06-04T06:17:24.5720978' AS DateTime2), 0.9, 0.9999, N'H', N'SI3', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (538, CAST(N'2024-06-04T06:17:24.5721094' AS DateTime2), 0.9, 0.9999, N'H', N'I1', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (539, CAST(N'2024-06-04T06:17:24.5721565' AS DateTime2), 0.9, 0.9999, N'H', N'I2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (540, CAST(N'2024-06-04T06:17:24.5721727' AS DateTime2), 0.9, 0.9999, N'H', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (541, CAST(N'2024-06-04T06:17:24.5721886' AS DateTime2), 0.9, 0.9999, N'I', N'FL', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (542, CAST(N'2024-06-04T06:17:24.5722014' AS DateTime2), 0.9, 0.9999, N'I', N'IF', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (543, CAST(N'2024-06-04T06:17:24.5722137' AS DateTime2), 0.9, 0.9999, N'I', N'VVS1', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (544, CAST(N'2024-06-04T06:17:24.5722261' AS DateTime2), 0.9, 0.9999, N'I', N'VVS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (545, CAST(N'2024-06-04T06:17:24.5722386' AS DateTime2), 0.9, 0.9999, N'I', N'VS1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (546, CAST(N'2024-06-04T06:17:24.5722505' AS DateTime2), 0.9, 0.9999, N'I', N'VS2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (547, CAST(N'2024-06-04T06:17:24.5722628' AS DateTime2), 0.9, 0.9999, N'I', N'SI1', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (548, CAST(N'2024-06-04T06:17:24.5722752' AS DateTime2), 0.9, 0.9999, N'I', N'SI2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (549, CAST(N'2024-06-04T06:17:24.5722880' AS DateTime2), 0.9, 0.9999, N'I', N'SI3', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (550, CAST(N'2024-06-04T06:17:24.5723025' AS DateTime2), 0.9, 0.9999, N'I', N'I1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (551, CAST(N'2024-06-04T06:17:24.5723150' AS DateTime2), 0.9, 0.9999, N'I', N'I2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (552, CAST(N'2024-06-04T06:17:24.5723268' AS DateTime2), 0.9, 0.9999, N'I', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (553, CAST(N'2024-06-04T06:17:24.5723410' AS DateTime2), 0.9, 0.9999, N'J', N'FL', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (554, CAST(N'2024-06-04T06:17:24.5723971' AS DateTime2), 0.9, 0.9999, N'J', N'IF', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (555, CAST(N'2024-06-04T06:17:24.5724475' AS DateTime2), 0.9, 0.9999, N'J', N'VVS1', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (556, CAST(N'2024-06-04T06:17:24.5724641' AS DateTime2), 0.9, 0.9999, N'J', N'VVS2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (557, CAST(N'2024-06-04T06:17:24.5724772' AS DateTime2), 0.9, 0.9999, N'J', N'VS1', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (558, CAST(N'2024-06-04T06:17:24.5724886' AS DateTime2), 0.9, 0.9999, N'J', N'VS2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (559, CAST(N'2024-06-04T06:17:24.5725000' AS DateTime2), 0.9, 0.9999, N'J', N'SI1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (560, CAST(N'2024-06-04T06:17:24.5725142' AS DateTime2), 0.9, 0.9999, N'J', N'SI2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (561, CAST(N'2024-06-04T06:17:24.5725273' AS DateTime2), 0.9, 0.9999, N'J', N'SI3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (562, CAST(N'2024-06-04T06:17:24.5725403' AS DateTime2), 0.9, 0.9999, N'J', N'I1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (563, CAST(N'2024-06-04T06:17:24.5725608' AS DateTime2), 0.9, 0.9999, N'J', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (564, CAST(N'2024-06-04T06:17:24.5725782' AS DateTime2), 0.9, 0.9999, N'J', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (565, CAST(N'2024-06-04T06:17:24.5725952' AS DateTime2), 0.9, 0.9999, N'K', N'FL', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (566, CAST(N'2024-06-04T06:17:24.5726135' AS DateTime2), 0.9, 0.9999, N'K', N'IF', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (567, CAST(N'2024-06-04T06:17:24.5726265' AS DateTime2), 0.9, 0.9999, N'K', N'VVS1', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (568, CAST(N'2024-06-04T06:17:24.5726394' AS DateTime2), 0.9, 0.9999, N'K', N'VVS2', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (569, CAST(N'2024-06-04T06:17:24.5726515' AS DateTime2), 0.9, 0.9999, N'K', N'VS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (570, CAST(N'2024-06-04T06:17:24.5726626' AS DateTime2), 0.9, 0.9999, N'K', N'VS2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (571, CAST(N'2024-06-04T06:17:24.5726750' AS DateTime2), 0.9, 0.9999, N'K', N'SI1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (572, CAST(N'2024-06-04T06:17:24.5726914' AS DateTime2), 0.9, 0.9999, N'K', N'SI2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (573, CAST(N'2024-06-04T06:17:24.5727084' AS DateTime2), 0.9, 0.9999, N'K', N'SI3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (574, CAST(N'2024-06-04T06:17:24.5727214' AS DateTime2), 0.9, 0.9999, N'K', N'I1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (575, CAST(N'2024-06-04T06:17:24.5727339' AS DateTime2), 0.9, 0.9999, N'K', N'I2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (576, CAST(N'2024-06-04T06:17:24.5727482' AS DateTime2), 0.9, 0.9999, N'K', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (577, CAST(N'2024-06-04T06:17:24.5727632' AS DateTime2), 0.9, 0.9999, N'L', N'FL', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (578, CAST(N'2024-06-04T06:17:24.5727749' AS DateTime2), 0.9, 0.9999, N'L', N'IF', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (579, CAST(N'2024-06-04T06:17:24.5727860' AS DateTime2), 0.9, 0.9999, N'L', N'VVS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (580, CAST(N'2024-06-04T06:17:24.5727980' AS DateTime2), 0.9, 0.9999, N'L', N'VVS2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (581, CAST(N'2024-06-04T06:17:24.5728106' AS DateTime2), 0.9, 0.9999, N'L', N'VS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (582, CAST(N'2024-06-04T06:17:24.5728220' AS DateTime2), 0.9, 0.9999, N'L', N'VS2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (583, CAST(N'2024-06-04T06:17:24.5728339' AS DateTime2), 0.9, 0.9999, N'L', N'SI1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (584, CAST(N'2024-06-04T06:17:24.5728464' AS DateTime2), 0.9, 0.9999, N'L', N'SI2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (585, CAST(N'2024-06-04T06:17:24.5728601' AS DateTime2), 0.9, 0.9999, N'L', N'SI3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (586, CAST(N'2024-06-04T06:17:24.5728727' AS DateTime2), 0.9, 0.9999, N'L', N'I1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (587, CAST(N'2024-06-04T06:17:24.5728868' AS DateTime2), 0.9, 0.9999, N'L', N'I2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (588, CAST(N'2024-06-04T06:17:24.5728997' AS DateTime2), 0.9, 0.9999, N'L', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (589, CAST(N'2024-06-04T06:17:24.5729150' AS DateTime2), 0.9, 0.9999, N'M', N'FL', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (590, CAST(N'2024-06-04T06:17:24.5729276' AS DateTime2), 0.9, 0.9999, N'M', N'IF', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (591, CAST(N'2024-06-04T06:17:24.5729397' AS DateTime2), 0.9, 0.9999, N'M', N'VVS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (592, CAST(N'2024-06-04T06:17:24.5729537' AS DateTime2), 0.9, 0.9999, N'M', N'VVS2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (593, CAST(N'2024-06-04T06:17:24.5729661' AS DateTime2), 0.9, 0.9999, N'M', N'VS1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (594, CAST(N'2024-06-04T06:17:24.5729784' AS DateTime2), 0.9, 0.9999, N'M', N'VS2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (595, CAST(N'2024-06-04T06:17:24.5729903' AS DateTime2), 0.9, 0.9999, N'M', N'SI1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (596, CAST(N'2024-06-04T06:17:24.5730024' AS DateTime2), 0.9, 0.9999, N'M', N'SI2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (597, CAST(N'2024-06-04T06:17:24.5730162' AS DateTime2), 0.9, 0.9999, N'M', N'SI3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (598, CAST(N'2024-06-04T06:17:24.5730291' AS DateTime2), 0.9, 0.9999, N'M', N'I1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (599, CAST(N'2024-06-04T06:17:24.5730416' AS DateTime2), 0.9, 0.9999, N'M', N'I2', 11)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (600, CAST(N'2024-06-04T06:17:24.5730533' AS DateTime2), 0.9, 0.9999, N'M', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (601, CAST(N'2024-06-04T06:17:24.6715711' AS DateTime2), 1, 1.4999, N'D', N'FL', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (602, CAST(N'2024-06-04T06:17:24.6716593' AS DateTime2), 1, 1.4999, N'D', N'IF', 194)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (603, CAST(N'2024-06-04T06:17:24.6716880' AS DateTime2), 1, 1.4999, N'D', N'VVS1', 147)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (604, CAST(N'2024-06-04T06:17:24.6717038' AS DateTime2), 1, 1.4999, N'D', N'VVS2', 124)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (605, CAST(N'2024-06-04T06:17:24.6717180' AS DateTime2), 1, 1.4999, N'D', N'VS1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (606, CAST(N'2024-06-04T06:17:24.6717350' AS DateTime2), 1, 1.4999, N'D', N'VS2', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (607, CAST(N'2024-06-04T06:17:24.6717487' AS DateTime2), 1, 1.4999, N'D', N'SI1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (608, CAST(N'2024-06-04T06:17:24.6717623' AS DateTime2), 1, 1.4999, N'D', N'SI2', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (609, CAST(N'2024-06-04T06:17:24.6717782' AS DateTime2), 1, 1.4999, N'D', N'SI3', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (610, CAST(N'2024-06-04T06:17:24.6717911' AS DateTime2), 1, 1.4999, N'D', N'I1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (611, CAST(N'2024-06-04T06:17:24.6718056' AS DateTime2), 1, 1.4999, N'D', N'I2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (612, CAST(N'2024-06-04T06:17:24.6718190' AS DateTime2), 1, 1.4999, N'D', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (613, CAST(N'2024-06-04T06:17:24.6718356' AS DateTime2), 1, 1.4999, N'E', N'FL', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (614, CAST(N'2024-06-04T06:17:24.6718494' AS DateTime2), 1, 1.4999, N'E', N'IF', 144)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (615, CAST(N'2024-06-04T06:17:24.6718627' AS DateTime2), 1, 1.4999, N'E', N'VVS1', 127)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (616, CAST(N'2024-06-04T06:17:24.6718770' AS DateTime2), 1, 1.4999, N'E', N'VVS2', 112)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (617, CAST(N'2024-06-04T06:17:24.6718890' AS DateTime2), 1, 1.4999, N'E', N'VS1', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (618, CAST(N'2024-06-04T06:17:24.6719017' AS DateTime2), 1, 1.4999, N'E', N'VS2', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (619, CAST(N'2024-06-04T06:17:24.6719142' AS DateTime2), 1, 1.4999, N'E', N'SI1', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (620, CAST(N'2024-06-04T06:17:24.6719270' AS DateTime2), 1, 1.4999, N'E', N'SI2', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (621, CAST(N'2024-06-04T06:17:24.6719413' AS DateTime2), 1, 1.4999, N'E', N'SI3', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (622, CAST(N'2024-06-04T06:17:24.6719552' AS DateTime2), 1, 1.4999, N'E', N'I1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (623, CAST(N'2024-06-04T06:17:24.6719683' AS DateTime2), 1, 1.4999, N'E', N'I2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (624, CAST(N'2024-06-04T06:17:24.6719817' AS DateTime2), 1, 1.4999, N'E', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (625, CAST(N'2024-06-04T06:17:24.6719987' AS DateTime2), 1, 1.4999, N'F', N'FL', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (626, CAST(N'2024-06-04T06:17:24.6720135' AS DateTime2), 1, 1.4999, N'F', N'IF', 126)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (627, CAST(N'2024-06-04T06:17:24.6720301' AS DateTime2), 1, 1.4999, N'F', N'VVS1', 114)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (628, CAST(N'2024-06-04T06:17:24.6720428' AS DateTime2), 1, 1.4999, N'F', N'VVS2', 103)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (629, CAST(N'2024-06-04T06:17:24.6720542' AS DateTime2), 1, 1.4999, N'F', N'VS1', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (630, CAST(N'2024-06-04T06:17:24.6720673' AS DateTime2), 1, 1.4999, N'F', N'VS2', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (631, CAST(N'2024-06-04T06:17:24.6720848' AS DateTime2), 1, 1.4999, N'F', N'SI1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (632, CAST(N'2024-06-04T06:17:24.6721021' AS DateTime2), 1, 1.4999, N'F', N'SI2', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (633, CAST(N'2024-06-04T06:17:24.6721261' AS DateTime2), 1, 1.4999, N'F', N'SI3', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (634, CAST(N'2024-06-04T06:17:24.6721440' AS DateTime2), 1, 1.4999, N'F', N'I1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (635, CAST(N'2024-06-04T06:17:24.6721567' AS DateTime2), 1, 1.4999, N'F', N'I2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (636, CAST(N'2024-06-04T06:17:24.6721718' AS DateTime2), 1, 1.4999, N'F', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (637, CAST(N'2024-06-04T06:17:24.6721947' AS DateTime2), 1, 1.4999, N'G', N'FL', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (638, CAST(N'2024-06-04T06:17:24.6722084' AS DateTime2), 1, 1.4999, N'G', N'IF', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (639, CAST(N'2024-06-04T06:17:24.6722231' AS DateTime2), 1, 1.4999, N'G', N'VVS1', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (640, CAST(N'2024-06-04T06:17:24.6722356' AS DateTime2), 1, 1.4999, N'G', N'VVS2', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (641, CAST(N'2024-06-04T06:17:24.6722489' AS DateTime2), 1, 1.4999, N'G', N'VS1', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (642, CAST(N'2024-06-04T06:17:24.6722628' AS DateTime2), 1, 1.4999, N'G', N'VS2', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (643, CAST(N'2024-06-04T06:17:24.6722839' AS DateTime2), 1, 1.4999, N'G', N'SI1', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (644, CAST(N'2024-06-04T06:17:24.6723029' AS DateTime2), 1, 1.4999, N'G', N'SI2', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (645, CAST(N'2024-06-04T06:17:24.6723156' AS DateTime2), 1, 1.4999, N'G', N'SI3', 40)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (646, CAST(N'2024-06-04T06:17:24.6723280' AS DateTime2), 1, 1.4999, N'G', N'I1', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (647, CAST(N'2024-06-04T06:17:24.6723474' AS DateTime2), 1, 1.4999, N'G', N'I2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (648, CAST(N'2024-06-04T06:17:24.6723728' AS DateTime2), 1, 1.4999, N'G', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (649, CAST(N'2024-06-04T06:17:24.6723913' AS DateTime2), 1, 1.4999, N'H', N'FL', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (650, CAST(N'2024-06-04T06:17:24.6724061' AS DateTime2), 1, 1.4999, N'H', N'IF', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (651, CAST(N'2024-06-04T06:17:24.6724195' AS DateTime2), 1, 1.4999, N'H', N'VVS1', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (652, CAST(N'2024-06-04T06:17:24.6724339' AS DateTime2), 1, 1.4999, N'H', N'VVS2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (653, CAST(N'2024-06-04T06:17:24.6724679' AS DateTime2), 1, 1.4999, N'H', N'VS1', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (654, CAST(N'2024-06-04T06:17:24.6724784' AS DateTime2), 1, 1.4999, N'H', N'VS2', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (655, CAST(N'2024-06-04T06:17:24.6724875' AS DateTime2), 1, 1.4999, N'H', N'SI1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (656, CAST(N'2024-06-04T06:17:24.6724991' AS DateTime2), 1, 1.4999, N'H', N'SI2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (657, CAST(N'2024-06-04T06:17:24.6725170' AS DateTime2), 1, 1.4999, N'H', N'SI3', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (658, CAST(N'2024-06-04T06:17:24.6725404' AS DateTime2), 1, 1.4999, N'H', N'I1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (659, CAST(N'2024-06-04T06:17:24.6725544' AS DateTime2), 1, 1.4999, N'H', N'I2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (660, CAST(N'2024-06-04T06:17:24.6725685' AS DateTime2), 1, 1.4999, N'H', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (661, CAST(N'2024-06-04T06:17:24.6725941' AS DateTime2), 1, 1.4999, N'I', N'FL', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (662, CAST(N'2024-06-04T06:17:24.6726162' AS DateTime2), 1, 1.4999, N'I', N'IF', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (663, CAST(N'2024-06-04T06:17:24.6726387' AS DateTime2), 1, 1.4999, N'I', N'VVS1', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (664, CAST(N'2024-06-04T06:17:24.6726566' AS DateTime2), 1, 1.4999, N'I', N'VVS2', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (665, CAST(N'2024-06-04T06:17:24.6726698' AS DateTime2), 1, 1.4999, N'I', N'VS1', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (666, CAST(N'2024-06-04T06:17:24.6726814' AS DateTime2), 1, 1.4999, N'I', N'VS2', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (667, CAST(N'2024-06-04T06:17:24.6726926' AS DateTime2), 1, 1.4999, N'I', N'SI1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (668, CAST(N'2024-06-04T06:17:24.6727056' AS DateTime2), 1, 1.4999, N'I', N'SI2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (669, CAST(N'2024-06-04T06:17:24.6727316' AS DateTime2), 1, 1.4999, N'I', N'SI3', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (670, CAST(N'2024-06-04T06:17:24.6727529' AS DateTime2), 1, 1.4999, N'I', N'I1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (671, CAST(N'2024-06-04T06:17:24.6727758' AS DateTime2), 1, 1.4999, N'I', N'I2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (672, CAST(N'2024-06-04T06:17:24.6740425' AS DateTime2), 1, 1.4999, N'I', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (673, CAST(N'2024-06-04T06:17:24.6741665' AS DateTime2), 1, 1.4999, N'J', N'FL', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (674, CAST(N'2024-06-04T06:17:24.6742072' AS DateTime2), 1, 1.4999, N'J', N'IF', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (675, CAST(N'2024-06-04T06:17:24.6742366' AS DateTime2), 1, 1.4999, N'J', N'VVS1', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (676, CAST(N'2024-06-04T06:17:24.6742564' AS DateTime2), 1, 1.4999, N'J', N'VVS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (677, CAST(N'2024-06-04T06:17:24.6742718' AS DateTime2), 1, 1.4999, N'J', N'VS1', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (678, CAST(N'2024-06-04T06:17:24.6742881' AS DateTime2), 1, 1.4999, N'J', N'VS2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (679, CAST(N'2024-06-04T06:17:24.6743045' AS DateTime2), 1, 1.4999, N'J', N'SI1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (680, CAST(N'2024-06-04T06:17:24.6743219' AS DateTime2), 1, 1.4999, N'J', N'SI2', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (681, CAST(N'2024-06-04T06:17:24.6743340' AS DateTime2), 1, 1.4999, N'J', N'SI3', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (682, CAST(N'2024-06-04T06:17:24.6743448' AS DateTime2), 1, 1.4999, N'J', N'I1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (683, CAST(N'2024-06-04T06:17:24.6743583' AS DateTime2), 1, 1.4999, N'J', N'I2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (684, CAST(N'2024-06-04T06:17:24.6743692' AS DateTime2), 1, 1.4999, N'J', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (685, CAST(N'2024-06-04T06:17:24.6743852' AS DateTime2), 1, 1.4999, N'K', N'FL', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (686, CAST(N'2024-06-04T06:17:24.6743965' AS DateTime2), 1, 1.4999, N'K', N'IF', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (687, CAST(N'2024-06-04T06:17:24.6744119' AS DateTime2), 1, 1.4999, N'K', N'VVS1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (688, CAST(N'2024-06-04T06:17:24.6744272' AS DateTime2), 1, 1.4999, N'K', N'VVS2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (689, CAST(N'2024-06-04T06:17:24.6744389' AS DateTime2), 1, 1.4999, N'K', N'VS1', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (690, CAST(N'2024-06-04T06:17:24.6744544' AS DateTime2), 1, 1.4999, N'K', N'VS2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (691, CAST(N'2024-06-04T06:17:24.6744696' AS DateTime2), 1, 1.4999, N'K', N'SI1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (692, CAST(N'2024-06-04T06:17:24.6744835' AS DateTime2), 1, 1.4999, N'K', N'SI2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (693, CAST(N'2024-06-04T06:17:24.6744944' AS DateTime2), 1, 1.4999, N'K', N'SI3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (694, CAST(N'2024-06-04T06:17:24.6745079' AS DateTime2), 1, 1.4999, N'K', N'I1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (695, CAST(N'2024-06-04T06:17:24.6745212' AS DateTime2), 1, 1.4999, N'K', N'I2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (696, CAST(N'2024-06-04T06:17:24.6745324' AS DateTime2), 1, 1.4999, N'K', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (697, CAST(N'2024-06-04T06:17:24.6745462' AS DateTime2), 1, 1.4999, N'L', N'FL', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (698, CAST(N'2024-06-04T06:17:24.6745629' AS DateTime2), 1, 1.4999, N'L', N'IF', 40)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (699, CAST(N'2024-06-04T06:17:24.6745790' AS DateTime2), 1, 1.4999, N'L', N'VVS1', 37)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (700, CAST(N'2024-06-04T06:17:24.6745900' AS DateTime2), 1, 1.4999, N'L', N'VVS2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (701, CAST(N'2024-06-04T06:17:24.6746036' AS DateTime2), 1, 1.4999, N'L', N'VS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (702, CAST(N'2024-06-04T06:17:24.6746476' AS DateTime2), 1, 1.4999, N'L', N'VS2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (703, CAST(N'2024-06-04T06:17:24.6746666' AS DateTime2), 1, 1.4999, N'L', N'SI1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (704, CAST(N'2024-06-04T06:17:24.6746787' AS DateTime2), 1, 1.4999, N'L', N'SI2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (705, CAST(N'2024-06-04T06:17:24.6746905' AS DateTime2), 1, 1.4999, N'L', N'SI3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (706, CAST(N'2024-06-04T06:17:24.6747044' AS DateTime2), 1, 1.4999, N'L', N'I1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (707, CAST(N'2024-06-04T06:17:24.6747245' AS DateTime2), 1, 1.4999, N'L', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (708, CAST(N'2024-06-04T06:17:24.6747444' AS DateTime2), 1, 1.4999, N'L', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (709, CAST(N'2024-06-04T06:17:24.6747681' AS DateTime2), 1, 1.4999, N'M', N'FL', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (710, CAST(N'2024-06-04T06:17:24.6747968' AS DateTime2), 1, 1.4999, N'M', N'IF', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (711, CAST(N'2024-06-04T06:17:24.6748176' AS DateTime2), 1, 1.4999, N'M', N'VVS1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (712, CAST(N'2024-06-04T06:17:24.6748302' AS DateTime2), 1, 1.4999, N'M', N'VVS2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (713, CAST(N'2024-06-04T06:17:24.6748422' AS DateTime2), 1, 1.4999, N'M', N'VS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (714, CAST(N'2024-06-04T06:17:24.6748529' AS DateTime2), 1, 1.4999, N'M', N'VS2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (715, CAST(N'2024-06-04T06:17:24.6748686' AS DateTime2), 1, 1.4999, N'M', N'SI1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (716, CAST(N'2024-06-04T06:17:24.6748814' AS DateTime2), 1, 1.4999, N'M', N'SI2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (717, CAST(N'2024-06-04T06:17:24.6748937' AS DateTime2), 1, 1.4999, N'M', N'SI3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (718, CAST(N'2024-06-04T06:17:24.6749048' AS DateTime2), 1, 1.4999, N'M', N'I1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (719, CAST(N'2024-06-04T06:17:24.6749178' AS DateTime2), 1, 1.4999, N'M', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (720, CAST(N'2024-06-04T06:17:24.6749334' AS DateTime2), 1, 1.4999, N'M', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (721, CAST(N'2024-06-04T06:17:24.7884937' AS DateTime2), 1.5, 1.9999, N'D', N'FL', 268)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (722, CAST(N'2024-06-04T06:17:24.7885833' AS DateTime2), 1.5, 1.9999, N'D', N'IF', 243)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (723, CAST(N'2024-06-04T06:17:24.7886039' AS DateTime2), 1.5, 1.9999, N'D', N'VVS1', 212)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (724, CAST(N'2024-06-04T06:17:24.7886221' AS DateTime2), 1.5, 1.9999, N'D', N'VVS2', 174)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (725, CAST(N'2024-06-04T06:17:24.7886343' AS DateTime2), 1.5, 1.9999, N'D', N'VS1', 146)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (726, CAST(N'2024-06-04T06:17:24.7886448' AS DateTime2), 1.5, 1.9999, N'D', N'VS2', 126)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (727, CAST(N'2024-06-04T06:17:24.7886555' AS DateTime2), 1.5, 1.9999, N'D', N'SI1', 101)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (728, CAST(N'2024-06-04T06:17:24.7886678' AS DateTime2), 1.5, 1.9999, N'D', N'SI2', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (729, CAST(N'2024-06-04T06:17:24.7886822' AS DateTime2), 1.5, 1.9999, N'D', N'SI3', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (730, CAST(N'2024-06-04T06:17:24.7886936' AS DateTime2), 1.5, 1.9999, N'D', N'I1', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (731, CAST(N'2024-06-04T06:17:24.7887044' AS DateTime2), 1.5, 1.9999, N'D', N'I2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (732, CAST(N'2024-06-04T06:17:24.7887149' AS DateTime2), 1.5, 1.9999, N'D', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (733, CAST(N'2024-06-04T06:17:24.7887283' AS DateTime2), 1.5, 1.9999, N'E', N'FL', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (734, CAST(N'2024-06-04T06:17:24.7887456' AS DateTime2), 1.5, 1.9999, N'E', N'IF', 209)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (735, CAST(N'2024-06-04T06:17:24.7887596' AS DateTime2), 1.5, 1.9999, N'E', N'VVS1', 193)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (736, CAST(N'2024-06-04T06:17:24.7887716' AS DateTime2), 1.5, 1.9999, N'E', N'VVS2', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (737, CAST(N'2024-06-04T06:17:24.7887832' AS DateTime2), 1.5, 1.9999, N'E', N'VS1', 133)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (738, CAST(N'2024-06-04T06:17:24.7887977' AS DateTime2), 1.5, 1.9999, N'E', N'VS2', 116)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (739, CAST(N'2024-06-04T06:17:24.7888082' AS DateTime2), 1.5, 1.9999, N'E', N'SI1', 94)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (740, CAST(N'2024-06-04T06:17:24.7888230' AS DateTime2), 1.5, 1.9999, N'E', N'SI2', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (741, CAST(N'2024-06-04T06:17:24.7888358' AS DateTime2), 1.5, 1.9999, N'E', N'SI3', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (742, CAST(N'2024-06-04T06:17:24.7888474' AS DateTime2), 1.5, 1.9999, N'E', N'I1', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (743, CAST(N'2024-06-04T06:17:24.7888588' AS DateTime2), 1.5, 1.9999, N'E', N'I2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (744, CAST(N'2024-06-04T06:17:24.7888699' AS DateTime2), 1.5, 1.9999, N'E', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (745, CAST(N'2024-06-04T06:17:24.7888850' AS DateTime2), 1.5, 1.9999, N'F', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (746, CAST(N'2024-06-04T06:17:24.7888997' AS DateTime2), 1.5, 1.9999, N'F', N'IF', 183)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (747, CAST(N'2024-06-04T06:17:24.7889125' AS DateTime2), 1.5, 1.9999, N'F', N'VVS1', 171)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (748, CAST(N'2024-06-04T06:17:24.7889279' AS DateTime2), 1.5, 1.9999, N'F', N'VVS2', 148)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (749, CAST(N'2024-06-04T06:17:24.7889389' AS DateTime2), 1.5, 1.9999, N'F', N'VS1', 122)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (750, CAST(N'2024-06-04T06:17:24.7889563' AS DateTime2), 1.5, 1.9999, N'F', N'VS2', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (751, CAST(N'2024-06-04T06:17:24.7889687' AS DateTime2), 1.5, 1.9999, N'F', N'SI1', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (752, CAST(N'2024-06-04T06:17:24.7889811' AS DateTime2), 1.5, 1.9999, N'F', N'SI2', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (753, CAST(N'2024-06-04T06:17:24.7889933' AS DateTime2), 1.5, 1.9999, N'F', N'SI3', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (754, CAST(N'2024-06-04T06:17:24.7890055' AS DateTime2), 1.5, 1.9999, N'F', N'I1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (755, CAST(N'2024-06-04T06:17:24.7890205' AS DateTime2), 1.5, 1.9999, N'F', N'I2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (756, CAST(N'2024-06-04T06:17:24.7890483' AS DateTime2), 1.5, 1.9999, N'F', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (757, CAST(N'2024-06-04T06:17:24.7890728' AS DateTime2), 1.5, 1.9999, N'G', N'FL', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (758, CAST(N'2024-06-04T06:17:24.7890907' AS DateTime2), 1.5, 1.9999, N'G', N'IF', 151)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (759, CAST(N'2024-06-04T06:17:24.7891070' AS DateTime2), 1.5, 1.9999, N'G', N'VVS1', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (760, CAST(N'2024-06-04T06:17:24.7891196' AS DateTime2), 1.5, 1.9999, N'G', N'VVS2', 126)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (761, CAST(N'2024-06-04T06:17:24.7891327' AS DateTime2), 1.5, 1.9999, N'G', N'VS1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (762, CAST(N'2024-06-04T06:17:24.7891459' AS DateTime2), 1.5, 1.9999, N'G', N'VS2', 97)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (763, CAST(N'2024-06-04T06:17:24.7891588' AS DateTime2), 1.5, 1.9999, N'G', N'SI1', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (764, CAST(N'2024-06-04T06:17:24.7891730' AS DateTime2), 1.5, 1.9999, N'G', N'SI2', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (765, CAST(N'2024-06-04T06:17:24.7891838' AS DateTime2), 1.5, 1.9999, N'G', N'SI3', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (766, CAST(N'2024-06-04T06:17:24.7891961' AS DateTime2), 1.5, 1.9999, N'G', N'I1', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (767, CAST(N'2024-06-04T06:17:24.7892131' AS DateTime2), 1.5, 1.9999, N'G', N'I2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (768, CAST(N'2024-06-04T06:17:24.7892256' AS DateTime2), 1.5, 1.9999, N'G', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (769, CAST(N'2024-06-04T06:17:24.7892534' AS DateTime2), 1.5, 1.9999, N'H', N'FL', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (770, CAST(N'2024-06-04T06:17:24.7892799' AS DateTime2), 1.5, 1.9999, N'H', N'IF', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (771, CAST(N'2024-06-04T06:17:24.7892999' AS DateTime2), 1.5, 1.9999, N'H', N'VVS1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (772, CAST(N'2024-06-04T06:17:24.7893136' AS DateTime2), 1.5, 1.9999, N'H', N'VVS2', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (773, CAST(N'2024-06-04T06:17:24.7893258' AS DateTime2), 1.5, 1.9999, N'H', N'VS1', 94)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (774, CAST(N'2024-06-04T06:17:24.7893392' AS DateTime2), 1.5, 1.9999, N'H', N'VS2', 85)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (775, CAST(N'2024-06-04T06:17:24.7893515' AS DateTime2), 1.5, 1.9999, N'H', N'SI1', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (776, CAST(N'2024-06-04T06:17:24.7893626' AS DateTime2), 1.5, 1.9999, N'H', N'SI2', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (777, CAST(N'2024-06-04T06:17:24.7893751' AS DateTime2), 1.5, 1.9999, N'H', N'SI3', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (778, CAST(N'2024-06-04T06:17:24.7893854' AS DateTime2), 1.5, 1.9999, N'H', N'I1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (779, CAST(N'2024-06-04T06:17:24.7894009' AS DateTime2), 1.5, 1.9999, N'H', N'I2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (780, CAST(N'2024-06-04T06:17:24.7894123' AS DateTime2), 1.5, 1.9999, N'H', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (781, CAST(N'2024-06-04T06:17:24.7894276' AS DateTime2), 1.5, 1.9999, N'I', N'FL', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (782, CAST(N'2024-06-04T06:17:24.7894414' AS DateTime2), 1.5, 1.9999, N'I', N'IF', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (783, CAST(N'2024-06-04T06:17:24.7894541' AS DateTime2), 1.5, 1.9999, N'I', N'VVS1', 96)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (784, CAST(N'2024-06-04T06:17:24.7894670' AS DateTime2), 1.5, 1.9999, N'I', N'VVS2', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (785, CAST(N'2024-06-04T06:17:24.7894786' AS DateTime2), 1.5, 1.9999, N'I', N'VS1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (786, CAST(N'2024-06-04T06:17:24.7894897' AS DateTime2), 1.5, 1.9999, N'I', N'VS2', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (787, CAST(N'2024-06-04T06:17:24.7895028' AS DateTime2), 1.5, 1.9999, N'I', N'SI1', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (788, CAST(N'2024-06-04T06:17:24.7895160' AS DateTime2), 1.5, 1.9999, N'I', N'SI2', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (789, CAST(N'2024-06-04T06:17:24.7895283' AS DateTime2), 1.5, 1.9999, N'I', N'SI3', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (790, CAST(N'2024-06-04T06:17:24.7895397' AS DateTime2), 1.5, 1.9999, N'I', N'I1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (791, CAST(N'2024-06-04T06:17:24.7895541' AS DateTime2), 1.5, 1.9999, N'I', N'I2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (792, CAST(N'2024-06-04T06:17:24.7895682' AS DateTime2), 1.5, 1.9999, N'I', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (793, CAST(N'2024-06-04T06:17:24.7895903' AS DateTime2), 1.5, 1.9999, N'J', N'FL', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (794, CAST(N'2024-06-04T06:17:24.7896033' AS DateTime2), 1.5, 1.9999, N'J', N'IF', 85)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (795, CAST(N'2024-06-04T06:17:24.7896216' AS DateTime2), 1.5, 1.9999, N'J', N'VVS1', 78)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (796, CAST(N'2024-06-04T06:17:24.7896558' AS DateTime2), 1.5, 1.9999, N'J', N'VVS2', 72)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (797, CAST(N'2024-06-04T06:17:24.7896757' AS DateTime2), 1.5, 1.9999, N'J', N'VS1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (798, CAST(N'2024-06-04T06:17:24.7896940' AS DateTime2), 1.5, 1.9999, N'J', N'VS2', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (799, CAST(N'2024-06-04T06:17:24.7897061' AS DateTime2), 1.5, 1.9999, N'J', N'SI1', 55)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (800, CAST(N'2024-06-04T06:17:24.7897167' AS DateTime2), 1.5, 1.9999, N'J', N'SI2', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (801, CAST(N'2024-06-04T06:17:24.7897290' AS DateTime2), 1.5, 1.9999, N'J', N'SI3', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (802, CAST(N'2024-06-04T06:17:24.7897402' AS DateTime2), 1.5, 1.9999, N'J', N'I1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (803, CAST(N'2024-06-04T06:17:24.7897531' AS DateTime2), 1.5, 1.9999, N'J', N'I2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (804, CAST(N'2024-06-04T06:17:24.7897644' AS DateTime2), 1.5, 1.9999, N'J', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (805, CAST(N'2024-06-04T06:17:24.7897786' AS DateTime2), 1.5, 1.9999, N'K', N'FL', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (806, CAST(N'2024-06-04T06:17:24.7897975' AS DateTime2), 1.5, 1.9999, N'K', N'IF', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (807, CAST(N'2024-06-04T06:17:24.7898163' AS DateTime2), 1.5, 1.9999, N'K', N'VVS1', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (808, CAST(N'2024-06-04T06:17:24.7898287' AS DateTime2), 1.5, 1.9999, N'K', N'VVS2', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (809, CAST(N'2024-06-04T06:17:24.7898417' AS DateTime2), 1.5, 1.9999, N'K', N'VS1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (810, CAST(N'2024-06-04T06:17:24.7898548' AS DateTime2), 1.5, 1.9999, N'K', N'VS2', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (811, CAST(N'2024-06-04T06:17:24.7898665' AS DateTime2), 1.5, 1.9999, N'K', N'SI1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (812, CAST(N'2024-06-04T06:17:24.7898776' AS DateTime2), 1.5, 1.9999, N'K', N'SI2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (813, CAST(N'2024-06-04T06:17:24.7898881' AS DateTime2), 1.5, 1.9999, N'K', N'SI3', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (814, CAST(N'2024-06-04T06:17:24.7898998' AS DateTime2), 1.5, 1.9999, N'K', N'I1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (815, CAST(N'2024-06-04T06:17:24.7899161' AS DateTime2), 1.5, 1.9999, N'K', N'I2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (816, CAST(N'2024-06-04T06:17:24.7899280' AS DateTime2), 1.5, 1.9999, N'K', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (817, CAST(N'2024-06-04T06:17:24.7899430' AS DateTime2), 1.5, 1.9999, N'L', N'FL', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (818, CAST(N'2024-06-04T06:17:24.7899558' AS DateTime2), 1.5, 1.9999, N'L', N'IF', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (819, CAST(N'2024-06-04T06:17:24.7899710' AS DateTime2), 1.5, 1.9999, N'L', N'VVS1', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (820, CAST(N'2024-06-04T06:17:24.7899871' AS DateTime2), 1.5, 1.9999, N'L', N'VVS2', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (821, CAST(N'2024-06-04T06:17:24.7899991' AS DateTime2), 1.5, 1.9999, N'L', N'VS1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (822, CAST(N'2024-06-04T06:17:24.7900143' AS DateTime2), 1.5, 1.9999, N'L', N'VS2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (823, CAST(N'2024-06-04T06:17:24.7900289' AS DateTime2), 1.5, 1.9999, N'L', N'SI1', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (824, CAST(N'2024-06-04T06:17:24.7900447' AS DateTime2), 1.5, 1.9999, N'L', N'SI2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (825, CAST(N'2024-06-04T06:17:24.7900578' AS DateTime2), 1.5, 1.9999, N'L', N'SI3', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (826, CAST(N'2024-06-04T06:17:24.7900721' AS DateTime2), 1.5, 1.9999, N'L', N'I1', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (827, CAST(N'2024-06-04T06:17:24.7900896' AS DateTime2), 1.5, 1.9999, N'L', N'I2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (828, CAST(N'2024-06-04T06:17:24.7901024' AS DateTime2), 1.5, 1.9999, N'L', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (829, CAST(N'2024-06-04T06:17:24.7901157' AS DateTime2), 1.5, 1.9999, N'M', N'FL', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (830, CAST(N'2024-06-04T06:17:24.7901328' AS DateTime2), 1.5, 1.9999, N'M', N'IF', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (831, CAST(N'2024-06-04T06:17:24.7901474' AS DateTime2), 1.5, 1.9999, N'M', N'VVS1', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (832, CAST(N'2024-06-04T06:17:24.7901613' AS DateTime2), 1.5, 1.9999, N'M', N'VVS2', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (833, CAST(N'2024-06-04T06:17:24.7901736' AS DateTime2), 1.5, 1.9999, N'M', N'VS1', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (834, CAST(N'2024-06-04T06:17:24.7901870' AS DateTime2), 1.5, 1.9999, N'M', N'VS2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (835, CAST(N'2024-06-04T06:17:24.7902033' AS DateTime2), 1.5, 1.9999, N'M', N'SI1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (836, CAST(N'2024-06-04T06:17:24.7902174' AS DateTime2), 1.5, 1.9999, N'M', N'SI2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (837, CAST(N'2024-06-04T06:17:24.7902295' AS DateTime2), 1.5, 1.9999, N'M', N'SI3', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (838, CAST(N'2024-06-04T06:17:24.7902538' AS DateTime2), 1.5, 1.9999, N'M', N'I1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (839, CAST(N'2024-06-04T06:17:24.7902774' AS DateTime2), 1.5, 1.9999, N'M', N'I2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (840, CAST(N'2024-06-04T06:17:24.7902963' AS DateTime2), 1.5, 1.9999, N'M', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (841, CAST(N'2024-06-04T06:17:25.4411740' AS DateTime2), 2, 2.9999, N'D', N'FL', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (842, CAST(N'2024-06-04T06:17:25.5378436' AS DateTime2), 2, 2.9999, N'D', N'IF', 390)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (843, CAST(N'2024-06-04T06:17:25.5379423' AS DateTime2), 2, 2.9999, N'D', N'VVS1', 320)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (844, CAST(N'2024-06-04T06:17:25.5379625' AS DateTime2), 2, 2.9999, N'D', N'VVS2', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (845, CAST(N'2024-06-04T06:17:25.5379750' AS DateTime2), 2, 2.9999, N'D', N'VS1', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (846, CAST(N'2024-06-04T06:17:25.5379866' AS DateTime2), 2, 2.9999, N'D', N'VS2', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (847, CAST(N'2024-06-04T06:17:25.5379976' AS DateTime2), 2, 2.9999, N'D', N'SI1', 147)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (848, CAST(N'2024-06-04T06:17:25.5380118' AS DateTime2), 2, 2.9999, N'D', N'SI2', 118)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (849, CAST(N'2024-06-04T06:17:25.5380264' AS DateTime2), 2, 2.9999, N'D', N'SI3', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (850, CAST(N'2024-06-04T06:17:25.5380372' AS DateTime2), 2, 2.9999, N'D', N'I1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (851, CAST(N'2024-06-04T06:17:25.5380481' AS DateTime2), 2, 2.9999, N'D', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (852, CAST(N'2024-06-04T06:17:25.5380584' AS DateTime2), 2, 2.9999, N'D', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (853, CAST(N'2024-06-04T06:17:25.5380720' AS DateTime2), 2, 2.9999, N'E', N'FL', 350)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (854, CAST(N'2024-06-04T06:17:25.5380845' AS DateTime2), 2, 2.9999, N'E', N'IF', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (855, CAST(N'2024-06-04T06:17:25.5380948' AS DateTime2), 2, 2.9999, N'E', N'VVS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (856, CAST(N'2024-06-04T06:17:25.5381055' AS DateTime2), 2, 2.9999, N'E', N'VVS2', 240)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (857, CAST(N'2024-06-04T06:17:25.5381160' AS DateTime2), 2, 2.9999, N'E', N'VS1', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (858, CAST(N'2024-06-04T06:17:25.5381271' AS DateTime2), 2, 2.9999, N'E', N'VS2', 175)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (859, CAST(N'2024-06-04T06:17:25.5381396' AS DateTime2), 2, 2.9999, N'E', N'SI1', 138)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (860, CAST(N'2024-06-04T06:17:25.5381545' AS DateTime2), 2, 2.9999, N'E', N'SI2', 109)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (861, CAST(N'2024-06-04T06:17:25.5381709' AS DateTime2), 2, 2.9999, N'E', N'SI3', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (862, CAST(N'2024-06-04T06:17:25.5381824' AS DateTime2), 2, 2.9999, N'E', N'I1', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (863, CAST(N'2024-06-04T06:17:25.5381969' AS DateTime2), 2, 2.9999, N'E', N'I2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (864, CAST(N'2024-06-04T06:17:25.5382086' AS DateTime2), 2, 2.9999, N'E', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (865, CAST(N'2024-06-04T06:17:25.5382229' AS DateTime2), 2, 2.9999, N'F', N'FL', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (866, CAST(N'2024-06-04T06:17:25.5382368' AS DateTime2), 2, 2.9999, N'F', N'IF', 265)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (867, CAST(N'2024-06-04T06:17:25.5382488' AS DateTime2), 2, 2.9999, N'F', N'VVS1', 245)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (868, CAST(N'2024-06-04T06:17:25.5382615' AS DateTime2), 2, 2.9999, N'F', N'VVS2', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (869, CAST(N'2024-06-04T06:17:25.5382765' AS DateTime2), 2, 2.9999, N'F', N'VS1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (870, CAST(N'2024-06-04T06:17:25.5382909' AS DateTime2), 2, 2.9999, N'F', N'VS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (871, CAST(N'2024-06-04T06:17:25.5383080' AS DateTime2), 2, 2.9999, N'F', N'SI1', 128)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (872, CAST(N'2024-06-04T06:17:25.5383211' AS DateTime2), 2, 2.9999, N'F', N'SI2', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (873, CAST(N'2024-06-04T06:17:25.5383338' AS DateTime2), 2, 2.9999, N'F', N'SI3', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (874, CAST(N'2024-06-04T06:17:25.5383455' AS DateTime2), 2, 2.9999, N'F', N'I1', 72)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (875, CAST(N'2024-06-04T06:17:25.5383622' AS DateTime2), 2, 2.9999, N'F', N'I2', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (876, CAST(N'2024-06-04T06:17:25.5383758' AS DateTime2), 2, 2.9999, N'F', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (877, CAST(N'2024-06-04T06:17:25.5383908' AS DateTime2), 2, 2.9999, N'G', N'FL', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (878, CAST(N'2024-06-04T06:17:25.5384019' AS DateTime2), 2, 2.9999, N'G', N'IF', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (879, CAST(N'2024-06-04T06:17:25.5384122' AS DateTime2), 2, 2.9999, N'G', N'VVS1', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (880, CAST(N'2024-06-04T06:17:25.5384252' AS DateTime2), 2, 2.9999, N'G', N'VVS2', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (881, CAST(N'2024-06-04T06:17:25.5384371' AS DateTime2), 2, 2.9999, N'G', N'VS1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (882, CAST(N'2024-06-04T06:17:25.5384480' AS DateTime2), 2, 2.9999, N'G', N'VS2', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (883, CAST(N'2024-06-04T06:17:25.5384666' AS DateTime2), 2, 2.9999, N'G', N'SI1', 117)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (884, CAST(N'2024-06-04T06:17:25.5384863' AS DateTime2), 2, 2.9999, N'G', N'SI2', 96)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (885, CAST(N'2024-06-04T06:17:25.5385089' AS DateTime2), 2, 2.9999, N'G', N'SI3', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (886, CAST(N'2024-06-04T06:17:25.5385264' AS DateTime2), 2, 2.9999, N'G', N'I1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (887, CAST(N'2024-06-04T06:17:25.5385430' AS DateTime2), 2, 2.9999, N'G', N'I2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (888, CAST(N'2024-06-04T06:17:25.5385564' AS DateTime2), 2, 2.9999, N'G', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (889, CAST(N'2024-06-04T06:17:25.5385749' AS DateTime2), 2, 2.9999, N'H', N'FL', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (890, CAST(N'2024-06-04T06:17:25.5385928' AS DateTime2), 2, 2.9999, N'H', N'IF', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (891, CAST(N'2024-06-04T06:17:25.5386071' AS DateTime2), 2, 2.9999, N'H', N'VVS1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (892, CAST(N'2024-06-04T06:17:25.5386197' AS DateTime2), 2, 2.9999, N'H', N'VVS2', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (893, CAST(N'2024-06-04T06:17:25.5386704' AS DateTime2), 2, 2.9999, N'H', N'VS1', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (894, CAST(N'2024-06-04T06:17:25.5386914' AS DateTime2), 2, 2.9999, N'H', N'VS2', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (895, CAST(N'2024-06-04T06:17:25.5387039' AS DateTime2), 2, 2.9999, N'H', N'SI1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (896, CAST(N'2024-06-04T06:17:25.5387224' AS DateTime2), 2, 2.9999, N'H', N'SI2', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (897, CAST(N'2024-06-04T06:17:25.5387378' AS DateTime2), 2, 2.9999, N'H', N'SI3', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (898, CAST(N'2024-06-04T06:17:25.5387502' AS DateTime2), 2, 2.9999, N'H', N'I1', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (899, CAST(N'2024-06-04T06:17:25.5387641' AS DateTime2), 2, 2.9999, N'H', N'I2', 33)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (900, CAST(N'2024-06-04T06:17:25.5387776' AS DateTime2), 2, 2.9999, N'H', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (901, CAST(N'2024-06-04T06:17:25.5388057' AS DateTime2), 2, 2.9999, N'I', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (902, CAST(N'2024-06-04T06:17:25.5388239' AS DateTime2), 2, 2.9999, N'I', N'IF', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (903, CAST(N'2024-06-04T06:17:25.5388392' AS DateTime2), 2, 2.9999, N'I', N'VVS1', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (904, CAST(N'2024-06-04T06:17:25.5388517' AS DateTime2), 2, 2.9999, N'I', N'VVS2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (905, CAST(N'2024-06-04T06:17:25.5388622' AS DateTime2), 2, 2.9999, N'I', N'VS1', 113)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (906, CAST(N'2024-06-04T06:17:25.5388751' AS DateTime2), 2, 2.9999, N'I', N'VS2', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (907, CAST(N'2024-06-04T06:17:25.5388857' AS DateTime2), 2, 2.9999, N'I', N'SI1', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (908, CAST(N'2024-06-04T06:17:25.5388980' AS DateTime2), 2, 2.9999, N'I', N'SI2', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (909, CAST(N'2024-06-04T06:17:25.5389083' AS DateTime2), 2, 2.9999, N'I', N'SI3', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (910, CAST(N'2024-06-04T06:17:25.5389184' AS DateTime2), 2, 2.9999, N'I', N'I1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (911, CAST(N'2024-06-04T06:17:25.5389287' AS DateTime2), 2, 2.9999, N'I', N'I2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (912, CAST(N'2024-06-04T06:17:25.5389401' AS DateTime2), 2, 2.9999, N'I', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (913, CAST(N'2024-06-04T06:17:25.5389528' AS DateTime2), 2, 2.9999, N'J', N'FL', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (914, CAST(N'2024-06-04T06:17:25.5389661' AS DateTime2), 2, 2.9999, N'J', N'IF', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (915, CAST(N'2024-06-04T06:17:25.5389785' AS DateTime2), 2, 2.9999, N'J', N'VVS1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (916, CAST(N'2024-06-04T06:17:25.5389965' AS DateTime2), 2, 2.9999, N'J', N'VVS2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (917, CAST(N'2024-06-04T06:17:25.5390110' AS DateTime2), 2, 2.9999, N'J', N'VS1', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (918, CAST(N'2024-06-04T06:17:25.5390225' AS DateTime2), 2, 2.9999, N'J', N'VS2', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (919, CAST(N'2024-06-04T06:17:25.5390332' AS DateTime2), 2, 2.9999, N'J', N'SI1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (920, CAST(N'2024-06-04T06:17:25.5390442' AS DateTime2), 2, 2.9999, N'J', N'SI2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (921, CAST(N'2024-06-04T06:17:25.5390907' AS DateTime2), 2, 2.9999, N'J', N'SI3', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (922, CAST(N'2024-06-04T06:17:25.5391182' AS DateTime2), 2, 2.9999, N'J', N'I1', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (923, CAST(N'2024-06-04T06:17:25.5391346' AS DateTime2), 2, 2.9999, N'J', N'I2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (924, CAST(N'2024-06-04T06:17:25.5391518' AS DateTime2), 2, 2.9999, N'J', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (925, CAST(N'2024-06-04T06:17:25.5391807' AS DateTime2), 2, 2.9999, N'K', N'FL', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (926, CAST(N'2024-06-04T06:17:25.5391977' AS DateTime2), 2, 2.9999, N'K', N'IF', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (927, CAST(N'2024-06-04T06:17:25.5392117' AS DateTime2), 2, 2.9999, N'K', N'VVS1', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (928, CAST(N'2024-06-04T06:17:25.5392317' AS DateTime2), 2, 2.9999, N'K', N'VVS2', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (929, CAST(N'2024-06-04T06:17:25.5392453' AS DateTime2), 2, 2.9999, N'K', N'VS1', 79)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (930, CAST(N'2024-06-04T06:17:25.5392552' AS DateTime2), 2, 2.9999, N'K', N'VS2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (931, CAST(N'2024-06-04T06:17:25.5392656' AS DateTime2), 2, 2.9999, N'K', N'SI1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (932, CAST(N'2024-06-04T06:17:25.5392763' AS DateTime2), 2, 2.9999, N'K', N'SI2', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (933, CAST(N'2024-06-04T06:17:25.5392893' AS DateTime2), 2, 2.9999, N'K', N'SI3', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (934, CAST(N'2024-06-04T06:17:25.5393060' AS DateTime2), 2, 2.9999, N'K', N'I1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (935, CAST(N'2024-06-04T06:17:25.5393198' AS DateTime2), 2, 2.9999, N'K', N'I2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (936, CAST(N'2024-06-04T06:17:25.5393304' AS DateTime2), 2, 2.9999, N'K', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (937, CAST(N'2024-06-04T06:17:25.5393431' AS DateTime2), 2, 2.9999, N'L', N'FL', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (938, CAST(N'2024-06-04T06:17:25.5393552' AS DateTime2), 2, 2.9999, N'L', N'IF', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (939, CAST(N'2024-06-04T06:17:25.5393654' AS DateTime2), 2, 2.9999, N'L', N'VVS1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (940, CAST(N'2024-06-04T06:17:25.5393765' AS DateTime2), 2, 2.9999, N'L', N'VVS2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (941, CAST(N'2024-06-04T06:17:25.5393861' AS DateTime2), 2, 2.9999, N'L', N'VS1', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (942, CAST(N'2024-06-04T06:17:25.5393957' AS DateTime2), 2, 2.9999, N'L', N'VS2', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (943, CAST(N'2024-06-04T06:17:25.5394086' AS DateTime2), 2, 2.9999, N'L', N'SI1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (944, CAST(N'2024-06-04T06:17:25.5394219' AS DateTime2), 2, 2.9999, N'L', N'SI2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (945, CAST(N'2024-06-04T06:17:25.5394336' AS DateTime2), 2, 2.9999, N'L', N'SI3', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (946, CAST(N'2024-06-04T06:17:25.5394486' AS DateTime2), 2, 2.9999, N'L', N'I1', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (947, CAST(N'2024-06-04T06:17:25.5394607' AS DateTime2), 2, 2.9999, N'L', N'I2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (948, CAST(N'2024-06-04T06:17:25.5394711' AS DateTime2), 2, 2.9999, N'L', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (949, CAST(N'2024-06-04T06:17:25.5394864' AS DateTime2), 2, 2.9999, N'M', N'FL', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (950, CAST(N'2024-06-04T06:17:25.5394988' AS DateTime2), 2, 2.9999, N'M', N'IF', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (951, CAST(N'2024-06-04T06:17:25.5395097' AS DateTime2), 2, 2.9999, N'M', N'VVS1', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (952, CAST(N'2024-06-04T06:17:25.5395201' AS DateTime2), 2, 2.9999, N'M', N'VVS2', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (953, CAST(N'2024-06-04T06:17:25.5395312' AS DateTime2), 2, 2.9999, N'M', N'VS1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (954, CAST(N'2024-06-04T06:17:25.5395427' AS DateTime2), 2, 2.9999, N'M', N'VS2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (955, CAST(N'2024-06-04T06:17:25.5395531' AS DateTime2), 2, 2.9999, N'M', N'SI1', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (956, CAST(N'2024-06-04T06:17:25.5395659' AS DateTime2), 2, 2.9999, N'M', N'SI2', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (957, CAST(N'2024-06-04T06:17:25.5395765' AS DateTime2), 2, 2.9999, N'M', N'SI3', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (958, CAST(N'2024-06-04T06:17:25.5395864' AS DateTime2), 2, 2.9999, N'M', N'I1', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (959, CAST(N'2024-06-04T06:17:25.5395973' AS DateTime2), 2, 2.9999, N'M', N'I2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (960, CAST(N'2024-06-04T06:17:25.5396086' AS DateTime2), 2, 2.9999, N'M', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (961, CAST(N'2024-06-04T06:17:25.6641954' AS DateTime2), 3, 3.9999, N'D', N'FL', 680)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (962, CAST(N'2024-06-04T06:17:25.6642827' AS DateTime2), 3, 3.9999, N'D', N'IF', 640)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (963, CAST(N'2024-06-04T06:17:25.6643014' AS DateTime2), 3, 3.9999, N'D', N'VVS1', 545)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (964, CAST(N'2024-06-04T06:17:25.6643142' AS DateTime2), 3, 3.9999, N'D', N'VVS2', 465)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (965, CAST(N'2024-06-04T06:17:25.6643254' AS DateTime2), 3, 3.9999, N'D', N'VS1', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (966, CAST(N'2024-06-04T06:17:25.6643432' AS DateTime2), 3, 3.9999, N'D', N'VS2', 330)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (967, CAST(N'2024-06-04T06:17:25.6643607' AS DateTime2), 3, 3.9999, N'D', N'SI1', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (968, CAST(N'2024-06-04T06:17:25.6643729' AS DateTime2), 3, 3.9999, N'D', N'SI2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (969, CAST(N'2024-06-04T06:17:25.6643849' AS DateTime2), 3, 3.9999, N'D', N'SI3', 139)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (970, CAST(N'2024-06-04T06:17:25.6643984' AS DateTime2), 3, 3.9999, N'D', N'I1', 103)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (971, CAST(N'2024-06-04T06:17:25.6644172' AS DateTime2), 3, 3.9999, N'D', N'I2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (972, CAST(N'2024-06-04T06:17:25.6644992' AS DateTime2), 3, 3.9999, N'D', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (973, CAST(N'2024-06-04T06:17:25.6645400' AS DateTime2), 3, 3.9999, N'E', N'FL', 550)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (974, CAST(N'2024-06-04T06:17:25.6645542' AS DateTime2), 3, 3.9999, N'E', N'IF', 515)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (975, CAST(N'2024-06-04T06:17:25.6645666' AS DateTime2), 3, 3.9999, N'E', N'VVS1', 485)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (976, CAST(N'2024-06-04T06:17:25.6646910' AS DateTime2), 3, 3.9999, N'E', N'VVS2', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (977, CAST(N'2024-06-04T06:17:25.6647091' AS DateTime2), 3, 3.9999, N'E', N'VS1', 365)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (978, CAST(N'2024-06-04T06:17:25.6647215' AS DateTime2), 3, 3.9999, N'E', N'VS2', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (979, CAST(N'2024-06-04T06:17:25.6647330' AS DateTime2), 3, 3.9999, N'E', N'SI1', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (980, CAST(N'2024-06-04T06:17:25.6647446' AS DateTime2), 3, 3.9999, N'E', N'SI2', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (981, CAST(N'2024-06-04T06:17:25.6647560' AS DateTime2), 3, 3.9999, N'E', N'SI3', 131)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (982, CAST(N'2024-06-04T06:17:25.6647696' AS DateTime2), 3, 3.9999, N'E', N'I1', 98)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (983, CAST(N'2024-06-04T06:17:25.6647813' AS DateTime2), 3, 3.9999, N'E', N'I2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (984, CAST(N'2024-06-04T06:17:25.6647928' AS DateTime2), 3, 3.9999, N'E', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (985, CAST(N'2024-06-04T06:17:25.6648080' AS DateTime2), 3, 3.9999, N'F', N'FL', 500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (986, CAST(N'2024-06-04T06:17:25.6648202' AS DateTime2), 3, 3.9999, N'F', N'IF', 450)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (987, CAST(N'2024-06-04T06:17:25.6648337' AS DateTime2), 3, 3.9999, N'F', N'VVS1', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (988, CAST(N'2024-06-04T06:17:25.6648465' AS DateTime2), 3, 3.9999, N'F', N'VVS2', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (989, CAST(N'2024-06-04T06:17:25.6648589' AS DateTime2), 3, 3.9999, N'F', N'VS1', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (990, CAST(N'2024-06-04T06:17:25.6648711' AS DateTime2), 3, 3.9999, N'F', N'VS2', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (991, CAST(N'2024-06-04T06:17:25.6648833' AS DateTime2), 3, 3.9999, N'F', N'SI1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (992, CAST(N'2024-06-04T06:17:25.6648948' AS DateTime2), 3, 3.9999, N'F', N'SI2', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (993, CAST(N'2024-06-04T06:17:25.6649082' AS DateTime2), 3, 3.9999, N'F', N'SI3', 124)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (994, CAST(N'2024-06-04T06:17:25.6649199' AS DateTime2), 3, 3.9999, N'F', N'I1', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (995, CAST(N'2024-06-04T06:17:25.6650254' AS DateTime2), 3, 3.9999, N'F', N'I2', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (996, CAST(N'2024-06-04T06:17:25.6650746' AS DateTime2), 3, 3.9999, N'F', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (997, CAST(N'2024-06-04T06:17:25.6651013' AS DateTime2), 3, 3.9999, N'G', N'FL', 420)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (998, CAST(N'2024-06-04T06:17:25.6651233' AS DateTime2), 3, 3.9999, N'G', N'IF', 380)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (999, CAST(N'2024-06-04T06:17:25.6651380' AS DateTime2), 3, 3.9999, N'G', N'VVS1', 355)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1000, CAST(N'2024-06-04T06:17:25.6651569' AS DateTime2), 3, 3.9999, N'G', N'VVS2', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1001, CAST(N'2024-06-04T06:17:25.6651770' AS DateTime2), 3, 3.9999, N'G', N'VS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1002, CAST(N'2024-06-04T06:17:25.6651925' AS DateTime2), 3, 3.9999, N'G', N'VS2', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1003, CAST(N'2024-06-04T06:17:25.6652060' AS DateTime2), 3, 3.9999, N'G', N'SI1', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1004, CAST(N'2024-06-04T06:17:25.6652173' AS DateTime2), 3, 3.9999, N'G', N'SI2', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1005, CAST(N'2024-06-04T06:17:25.6652290' AS DateTime2), 3, 3.9999, N'G', N'SI3', 112)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1006, CAST(N'2024-06-04T06:17:25.6652396' AS DateTime2), 3, 3.9999, N'G', N'I1', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1007, CAST(N'2024-06-04T06:17:25.6652548' AS DateTime2), 3, 3.9999, N'G', N'I2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1008, CAST(N'2024-06-04T06:17:25.6652740' AS DateTime2), 3, 3.9999, N'G', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1009, CAST(N'2024-06-04T06:17:25.6652952' AS DateTime2), 3, 3.9999, N'H', N'FL', 330)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1010, CAST(N'2024-06-04T06:17:25.6653123' AS DateTime2), 3, 3.9999, N'H', N'IF', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1011, CAST(N'2024-06-04T06:17:25.6653321' AS DateTime2), 3, 3.9999, N'H', N'VVS1', 280)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1012, CAST(N'2024-06-04T06:17:25.6653488' AS DateTime2), 3, 3.9999, N'H', N'VVS2', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1013, CAST(N'2024-06-04T06:17:25.6653683' AS DateTime2), 3, 3.9999, N'H', N'VS1', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1014, CAST(N'2024-06-04T06:17:25.6653890' AS DateTime2), 3, 3.9999, N'H', N'VS2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1015, CAST(N'2024-06-04T06:17:25.6654083' AS DateTime2), 3, 3.9999, N'H', N'SI1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1016, CAST(N'2024-06-04T06:17:25.6654279' AS DateTime2), 3, 3.9999, N'H', N'SI2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1017, CAST(N'2024-06-04T06:17:25.6654400' AS DateTime2), 3, 3.9999, N'H', N'SI3', 101)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1018, CAST(N'2024-06-04T06:17:25.6654559' AS DateTime2), 3, 3.9999, N'H', N'I1', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1019, CAST(N'2024-06-04T06:17:25.6654691' AS DateTime2), 3, 3.9999, N'H', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1020, CAST(N'2024-06-04T06:17:25.6654799' AS DateTime2), 3, 3.9999, N'H', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1021, CAST(N'2024-06-04T06:17:25.6654948' AS DateTime2), 3, 3.9999, N'I', N'FL', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1022, CAST(N'2024-06-04T06:17:25.6655059' AS DateTime2), 3, 3.9999, N'I', N'IF', 245)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1023, CAST(N'2024-06-04T06:17:25.6655170' AS DateTime2), 3, 3.9999, N'I', N'VVS1', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1024, CAST(N'2024-06-04T06:17:25.6655294' AS DateTime2), 3, 3.9999, N'I', N'VVS2', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1025, CAST(N'2024-06-04T06:17:25.6655440' AS DateTime2), 3, 3.9999, N'I', N'VS1', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1026, CAST(N'2024-06-04T06:17:25.6655573' AS DateTime2), 3, 3.9999, N'I', N'VS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1027, CAST(N'2024-06-04T06:17:25.6655713' AS DateTime2), 3, 3.9999, N'I', N'SI1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1028, CAST(N'2024-06-04T06:17:25.6655821' AS DateTime2), 3, 3.9999, N'I', N'SI2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1029, CAST(N'2024-06-04T06:17:25.6655929' AS DateTime2), 3, 3.9999, N'I', N'SI3', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1030, CAST(N'2024-06-04T06:17:25.6656049' AS DateTime2), 3, 3.9999, N'I', N'I1', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1031, CAST(N'2024-06-04T06:17:25.6656150' AS DateTime2), 3, 3.9999, N'I', N'I2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1032, CAST(N'2024-06-04T06:17:25.6656260' AS DateTime2), 3, 3.9999, N'I', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1033, CAST(N'2024-06-04T06:17:25.6657022' AS DateTime2), 3, 3.9999, N'J', N'FL', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1034, CAST(N'2024-06-04T06:17:25.6657279' AS DateTime2), 3, 3.9999, N'J', N'IF', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1035, CAST(N'2024-06-04T06:17:25.6657490' AS DateTime2), 3, 3.9999, N'J', N'VVS1', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1036, CAST(N'2024-06-04T06:17:25.6657771' AS DateTime2), 3, 3.9999, N'J', N'VVS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1037, CAST(N'2024-06-04T06:17:25.6657980' AS DateTime2), 3, 3.9999, N'J', N'VS1', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1038, CAST(N'2024-06-04T06:17:25.6658139' AS DateTime2), 3, 3.9999, N'J', N'VS2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1039, CAST(N'2024-06-04T06:17:25.6658279' AS DateTime2), 3, 3.9999, N'J', N'SI1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1040, CAST(N'2024-06-04T06:17:25.6658413' AS DateTime2), 3, 3.9999, N'J', N'SI2', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1041, CAST(N'2024-06-04T06:17:25.6658519' AS DateTime2), 3, 3.9999, N'J', N'SI3', 84)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1042, CAST(N'2024-06-04T06:17:25.6658631' AS DateTime2), 3, 3.9999, N'J', N'I1', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1043, CAST(N'2024-06-04T06:17:25.6658754' AS DateTime2), 3, 3.9999, N'J', N'I2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1044, CAST(N'2024-06-04T06:17:25.6658860' AS DateTime2), 3, 3.9999, N'J', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1045, CAST(N'2024-06-04T06:17:25.6658992' AS DateTime2), 3, 3.9999, N'K', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1046, CAST(N'2024-06-04T06:17:25.6659109' AS DateTime2), 3, 3.9999, N'K', N'IF', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1047, CAST(N'2024-06-04T06:17:25.6659212' AS DateTime2), 3, 3.9999, N'K', N'VVS1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1048, CAST(N'2024-06-04T06:17:25.6659458' AS DateTime2), 3, 3.9999, N'K', N'VVS2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1049, CAST(N'2024-06-04T06:17:25.6659674' AS DateTime2), 3, 3.9999, N'K', N'VS1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1050, CAST(N'2024-06-04T06:17:25.6659816' AS DateTime2), 3, 3.9999, N'K', N'VS2', 117)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1051, CAST(N'2024-06-04T06:17:25.6659982' AS DateTime2), 3, 3.9999, N'K', N'SI1', 107)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1052, CAST(N'2024-06-04T06:17:25.6660092' AS DateTime2), 3, 3.9999, N'K', N'SI2', 97)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1053, CAST(N'2024-06-04T06:17:25.6660775' AS DateTime2), 3, 3.9999, N'K', N'SI3', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1054, CAST(N'2024-06-04T06:17:25.6662122' AS DateTime2), 3, 3.9999, N'K', N'I1', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1055, CAST(N'2024-06-04T06:17:25.6662367' AS DateTime2), 3, 3.9999, N'K', N'I2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1056, CAST(N'2024-06-04T06:17:25.6662667' AS DateTime2), 3, 3.9999, N'K', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1057, CAST(N'2024-06-04T06:17:25.6663232' AS DateTime2), 3, 3.9999, N'L', N'FL', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1058, CAST(N'2024-06-04T06:17:25.6663559' AS DateTime2), 3, 3.9999, N'L', N'IF', 128)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1059, CAST(N'2024-06-04T06:17:25.6663711' AS DateTime2), 3, 3.9999, N'L', N'VVS1', 121)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1060, CAST(N'2024-06-04T06:17:25.6663858' AS DateTime2), 3, 3.9999, N'L', N'VVS2', 114)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1061, CAST(N'2024-06-04T06:17:25.6664091' AS DateTime2), 3, 3.9999, N'L', N'VS1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1062, CAST(N'2024-06-04T06:17:25.6664236' AS DateTime2), 3, 3.9999, N'L', N'VS2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1063, CAST(N'2024-06-04T06:17:25.6664619' AS DateTime2), 3, 3.9999, N'L', N'SI1', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1064, CAST(N'2024-06-04T06:17:25.6664856' AS DateTime2), 3, 3.9999, N'L', N'SI2', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1065, CAST(N'2024-06-04T06:17:25.6665002' AS DateTime2), 3, 3.9999, N'L', N'SI3', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1066, CAST(N'2024-06-04T06:17:25.6665548' AS DateTime2), 3, 3.9999, N'L', N'I1', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1067, CAST(N'2024-06-04T06:17:25.6665899' AS DateTime2), 3, 3.9999, N'L', N'I2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1068, CAST(N'2024-06-04T06:17:25.6666060' AS DateTime2), 3, 3.9999, N'L', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1069, CAST(N'2024-06-04T06:17:25.6666195' AS DateTime2), 3, 3.9999, N'M', N'FL', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1070, CAST(N'2024-06-04T06:17:25.6666612' AS DateTime2), 3, 3.9999, N'M', N'IF', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1071, CAST(N'2024-06-04T06:17:25.6666739' AS DateTime2), 3, 3.9999, N'M', N'VVS1', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1072, CAST(N'2024-06-04T06:17:25.6666871' AS DateTime2), 3, 3.9999, N'M', N'VVS2', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1073, CAST(N'2024-06-04T06:17:25.6668090' AS DateTime2), 3, 3.9999, N'M', N'VS1', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1074, CAST(N'2024-06-04T06:17:25.6668315' AS DateTime2), 3, 3.9999, N'M', N'VS2', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1075, CAST(N'2024-06-04T06:17:25.6668455' AS DateTime2), 3, 3.9999, N'M', N'SI1', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1076, CAST(N'2024-06-04T06:17:25.6668618' AS DateTime2), 3, 3.9999, N'M', N'SI2', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1077, CAST(N'2024-06-04T06:17:25.6668800' AS DateTime2), 3, 3.9999, N'M', N'SI3', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1078, CAST(N'2024-06-04T06:17:25.6668924' AS DateTime2), 3, 3.9999, N'M', N'I1', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1079, CAST(N'2024-06-04T06:17:25.6669039' AS DateTime2), 3, 3.9999, N'M', N'I2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1080, CAST(N'2024-06-04T06:17:25.6669150' AS DateTime2), 3, 3.9999, N'M', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1081, CAST(N'2024-06-04T06:17:25.8213715' AS DateTime2), 4, 4.9999, N'D', N'FL', 840)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1082, CAST(N'2024-06-04T06:17:25.8214765' AS DateTime2), 4, 4.9999, N'D', N'IF', 810)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1083, CAST(N'2024-06-04T06:17:25.8215055' AS DateTime2), 4, 4.9999, N'D', N'VVS1', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1084, CAST(N'2024-06-04T06:17:25.8215487' AS DateTime2), 4, 4.9999, N'D', N'VVS2', 635)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1085, CAST(N'2024-06-04T06:17:25.8215872' AS DateTime2), 4, 4.9999, N'D', N'VS1', 535)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1086, CAST(N'2024-06-04T06:17:25.8216073' AS DateTime2), 4, 4.9999, N'D', N'VS2', 440)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1087, CAST(N'2024-06-04T06:17:25.8216209' AS DateTime2), 4, 4.9999, N'D', N'SI1', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1088, CAST(N'2024-06-04T06:17:25.8216333' AS DateTime2), 4, 4.9999, N'D', N'SI2', 255)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1089, CAST(N'2024-06-04T06:17:25.8224354' AS DateTime2), 4, 4.9999, N'D', N'SI3', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1090, CAST(N'2024-06-04T06:17:25.8226136' AS DateTime2), 4, 4.9999, N'D', N'I1', 111)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1091, CAST(N'2024-06-04T06:17:25.8226805' AS DateTime2), 4, 4.9999, N'D', N'I2', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1092, CAST(N'2024-06-04T06:17:25.8227011' AS DateTime2), 4, 4.9999, N'D', N'I3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1093, CAST(N'2024-06-04T06:17:25.8227579' AS DateTime2), 4, 4.9999, N'E', N'FL', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1094, CAST(N'2024-06-04T06:17:25.8227851' AS DateTime2), 4, 4.9999, N'E', N'IF', 680)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1095, CAST(N'2024-06-04T06:17:25.8228082' AS DateTime2), 4, 4.9999, N'E', N'VVS1', 615)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1096, CAST(N'2024-06-04T06:17:25.8228295' AS DateTime2), 4, 4.9999, N'E', N'VVS2', 550)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1097, CAST(N'2024-06-04T06:17:25.8228472' AS DateTime2), 4, 4.9999, N'E', N'VS1', 490)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1098, CAST(N'2024-06-04T06:17:25.8228697' AS DateTime2), 4, 4.9999, N'E', N'VS2', 410)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1099, CAST(N'2024-06-04T06:17:25.8228901' AS DateTime2), 4, 4.9999, N'E', N'SI1', 295)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1100, CAST(N'2024-06-04T06:17:25.8229094' AS DateTime2), 4, 4.9999, N'E', N'SI2', 240)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1101, CAST(N'2024-06-04T06:17:25.8229217' AS DateTime2), 4, 4.9999, N'E', N'SI3', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1102, CAST(N'2024-06-04T06:17:25.8229362' AS DateTime2), 4, 4.9999, N'E', N'I1', 106)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1103, CAST(N'2024-06-04T06:17:25.8229544' AS DateTime2), 4, 4.9999, N'E', N'I2', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1104, CAST(N'2024-06-04T06:17:25.8229661' AS DateTime2), 4, 4.9999, N'E', N'I3', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1105, CAST(N'2024-06-04T06:17:25.8229813' AS DateTime2), 4, 4.9999, N'F', N'FL', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1106, CAST(N'2024-06-04T06:17:25.8229928' AS DateTime2), 4, 4.9999, N'F', N'IF', 580)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1107, CAST(N'2024-06-04T06:17:25.8230206' AS DateTime2), 4, 4.9999, N'F', N'VVS1', 535)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1108, CAST(N'2024-06-04T06:17:25.8230452' AS DateTime2), 4, 4.9999, N'F', N'VVS2', 490)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1109, CAST(N'2024-06-04T06:17:25.8230655' AS DateTime2), 4, 4.9999, N'F', N'VS1', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1110, CAST(N'2024-06-04T06:17:25.8232823' AS DateTime2), 4, 4.9999, N'F', N'VS2', 365)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1111, CAST(N'2024-06-04T06:17:25.8233223' AS DateTime2), 4, 4.9999, N'F', N'SI1', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1112, CAST(N'2024-06-04T06:17:25.8233590' AS DateTime2), 4, 4.9999, N'F', N'SI2', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1113, CAST(N'2024-06-04T06:17:25.8233925' AS DateTime2), 4, 4.9999, N'F', N'SI3', 138)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1114, CAST(N'2024-06-04T06:17:25.8234067' AS DateTime2), 4, 4.9999, N'F', N'I1', 101)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1115, CAST(N'2024-06-04T06:17:25.8234188' AS DateTime2), 4, 4.9999, N'F', N'I2', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1116, CAST(N'2024-06-04T06:17:25.8234304' AS DateTime2), 4, 4.9999, N'F', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1117, CAST(N'2024-06-04T06:17:25.8234489' AS DateTime2), 4, 4.9999, N'G', N'FL', 500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1118, CAST(N'2024-06-04T06:17:25.8234600' AS DateTime2), 4, 4.9999, N'G', N'IF', 480)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1119, CAST(N'2024-06-04T06:17:25.8235379' AS DateTime2), 4, 4.9999, N'G', N'VVS1', 445)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1120, CAST(N'2024-06-04T06:17:25.8236553' AS DateTime2), 4, 4.9999, N'G', N'VVS2', 405)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1121, CAST(N'2024-06-04T06:17:25.8237554' AS DateTime2), 4, 4.9999, N'G', N'VS1', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1122, CAST(N'2024-06-04T06:17:25.8237906' AS DateTime2), 4, 4.9999, N'G', N'VS2', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1123, CAST(N'2024-06-04T06:17:25.8238076' AS DateTime2), 4, 4.9999, N'G', N'SI1', 245)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1124, CAST(N'2024-06-04T06:17:25.8238196' AS DateTime2), 4, 4.9999, N'G', N'SI2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1125, CAST(N'2024-06-04T06:17:25.8238329' AS DateTime2), 4, 4.9999, N'G', N'SI3', 127)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1126, CAST(N'2024-06-04T06:17:25.8238466' AS DateTime2), 4, 4.9999, N'G', N'I1', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1127, CAST(N'2024-06-04T06:17:25.8238609' AS DateTime2), 4, 4.9999, N'G', N'I2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1128, CAST(N'2024-06-04T06:17:25.8238764' AS DateTime2), 4, 4.9999, N'G', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1129, CAST(N'2024-06-04T06:17:25.8238943' AS DateTime2), 4, 4.9999, N'H', N'FL', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1130, CAST(N'2024-06-04T06:17:25.8239076' AS DateTime2), 4, 4.9999, N'H', N'IF', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1131, CAST(N'2024-06-04T06:17:25.8239218' AS DateTime2), 4, 4.9999, N'H', N'VVS1', 345)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1132, CAST(N'2024-06-04T06:17:25.8239346' AS DateTime2), 4, 4.9999, N'H', N'VVS2', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1133, CAST(N'2024-06-04T06:17:25.8239482' AS DateTime2), 4, 4.9999, N'H', N'VS1', 305)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1134, CAST(N'2024-06-04T06:17:25.8239593' AS DateTime2), 4, 4.9999, N'H', N'VS2', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1135, CAST(N'2024-06-04T06:17:25.8239707' AS DateTime2), 4, 4.9999, N'H', N'SI1', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1136, CAST(N'2024-06-04T06:17:25.8239811' AS DateTime2), 4, 4.9999, N'H', N'SI2', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1137, CAST(N'2024-06-04T06:17:25.8239917' AS DateTime2), 4, 4.9999, N'H', N'SI3', 114)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1138, CAST(N'2024-06-04T06:17:25.8240026' AS DateTime2), 4, 4.9999, N'H', N'I1', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1139, CAST(N'2024-06-04T06:17:25.8240149' AS DateTime2), 4, 4.9999, N'H', N'I2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1140, CAST(N'2024-06-04T06:17:25.8240268' AS DateTime2), 4, 4.9999, N'H', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1141, CAST(N'2024-06-04T06:17:25.8240412' AS DateTime2), 4, 4.9999, N'I', N'FL', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1142, CAST(N'2024-06-04T06:17:25.8240710' AS DateTime2), 4, 4.9999, N'I', N'IF', 290)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1143, CAST(N'2024-06-04T06:17:25.8240918' AS DateTime2), 4, 4.9999, N'I', N'VVS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1144, CAST(N'2024-06-04T06:17:25.8241054' AS DateTime2), 4, 4.9999, N'I', N'VVS2', 255)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1145, CAST(N'2024-06-04T06:17:25.8241184' AS DateTime2), 4, 4.9999, N'I', N'VS1', 240)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1146, CAST(N'2024-06-04T06:17:25.8241317' AS DateTime2), 4, 4.9999, N'I', N'VS2', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1147, CAST(N'2024-06-04T06:17:25.8241429' AS DateTime2), 4, 4.9999, N'I', N'SI1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1148, CAST(N'2024-06-04T06:17:25.8241541' AS DateTime2), 4, 4.9999, N'I', N'SI2', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1149, CAST(N'2024-06-04T06:17:25.8241666' AS DateTime2), 4, 4.9999, N'I', N'SI3', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1150, CAST(N'2024-06-04T06:17:25.8241774' AS DateTime2), 4, 4.9999, N'I', N'I1', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1151, CAST(N'2024-06-04T06:17:25.8242035' AS DateTime2), 4, 4.9999, N'I', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1152, CAST(N'2024-06-04T06:17:25.8242242' AS DateTime2), 4, 4.9999, N'I', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1153, CAST(N'2024-06-04T06:17:25.8242410' AS DateTime2), 4, 4.9999, N'J', N'FL', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1154, CAST(N'2024-06-04T06:17:25.8242572' AS DateTime2), 4, 4.9999, N'J', N'IF', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1155, CAST(N'2024-06-04T06:17:25.8242750' AS DateTime2), 4, 4.9999, N'J', N'VVS1', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1156, CAST(N'2024-06-04T06:17:25.8242983' AS DateTime2), 4, 4.9999, N'J', N'VVS2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1157, CAST(N'2024-06-04T06:17:25.8243121' AS DateTime2), 4, 4.9999, N'J', N'VS1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1158, CAST(N'2024-06-04T06:17:25.8243213' AS DateTime2), 4, 4.9999, N'J', N'VS2', 175)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1159, CAST(N'2024-06-04T06:17:25.8243466' AS DateTime2), 4, 4.9999, N'J', N'SI1', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1160, CAST(N'2024-06-04T06:17:25.8243691' AS DateTime2), 4, 4.9999, N'J', N'SI2', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1161, CAST(N'2024-06-04T06:17:25.8243925' AS DateTime2), 4, 4.9999, N'J', N'SI3', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1162, CAST(N'2024-06-04T06:17:25.8244186' AS DateTime2), 4, 4.9999, N'J', N'I1', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1163, CAST(N'2024-06-04T06:17:25.8244344' AS DateTime2), 4, 4.9999, N'J', N'I2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1164, CAST(N'2024-06-04T06:17:25.8244484' AS DateTime2), 4, 4.9999, N'J', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1165, CAST(N'2024-06-04T06:17:25.8244667' AS DateTime2), 4, 4.9999, N'K', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1166, CAST(N'2024-06-04T06:17:25.8244841' AS DateTime2), 4, 4.9999, N'K', N'IF', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1167, CAST(N'2024-06-04T06:17:25.8245039' AS DateTime2), 4, 4.9999, N'K', N'VVS1', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1168, CAST(N'2024-06-04T06:17:25.8245126' AS DateTime2), 4, 4.9999, N'K', N'VVS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1169, CAST(N'2024-06-04T06:17:25.8245206' AS DateTime2), 4, 4.9999, N'K', N'VS1', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1170, CAST(N'2024-06-04T06:17:25.8245430' AS DateTime2), 4, 4.9999, N'K', N'VS2', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1171, CAST(N'2024-06-04T06:17:25.8245691' AS DateTime2), 4, 4.9999, N'K', N'SI1', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1172, CAST(N'2024-06-04T06:17:25.8245895' AS DateTime2), 4, 4.9999, N'K', N'SI2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1173, CAST(N'2024-06-04T06:17:25.8246083' AS DateTime2), 4, 4.9999, N'K', N'SI3', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1174, CAST(N'2024-06-04T06:17:25.8246235' AS DateTime2), 4, 4.9999, N'K', N'I1', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1175, CAST(N'2024-06-04T06:17:25.8246367' AS DateTime2), 4, 4.9999, N'K', N'I2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1176, CAST(N'2024-06-04T06:17:25.8246610' AS DateTime2), 4, 4.9999, N'K', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1177, CAST(N'2024-06-04T06:17:25.8246897' AS DateTime2), 4, 4.9999, N'L', N'FL', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1178, CAST(N'2024-06-04T06:17:25.8247108' AS DateTime2), 4, 4.9999, N'L', N'IF', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1179, CAST(N'2024-06-04T06:17:25.8247300' AS DateTime2), 4, 4.9999, N'L', N'VVS1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1180, CAST(N'2024-06-04T06:17:25.8247452' AS DateTime2), 4, 4.9999, N'L', N'VVS2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1181, CAST(N'2024-06-04T06:17:25.8247617' AS DateTime2), 4, 4.9999, N'L', N'VS1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1182, CAST(N'2024-06-04T06:17:25.8247820' AS DateTime2), 4, 4.9999, N'L', N'VS2', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1183, CAST(N'2024-06-04T06:17:25.8248076' AS DateTime2), 4, 4.9999, N'L', N'SI1', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1184, CAST(N'2024-06-04T06:17:25.8248317' AS DateTime2), 4, 4.9999, N'L', N'SI2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1185, CAST(N'2024-06-04T06:17:25.8248584' AS DateTime2), 4, 4.9999, N'L', N'SI3', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1186, CAST(N'2024-06-04T06:17:25.8248775' AS DateTime2), 4, 4.9999, N'L', N'I1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1187, CAST(N'2024-06-04T06:17:25.8248937' AS DateTime2), 4, 4.9999, N'L', N'I2', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1188, CAST(N'2024-06-04T06:17:25.8249075' AS DateTime2), 4, 4.9999, N'L', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1189, CAST(N'2024-06-04T06:17:25.8249276' AS DateTime2), 4, 4.9999, N'M', N'FL', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1190, CAST(N'2024-06-04T06:17:25.8249453' AS DateTime2), 4, 4.9999, N'M', N'IF', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1191, CAST(N'2024-06-04T06:17:25.8249548' AS DateTime2), 4, 4.9999, N'M', N'VVS1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1192, CAST(N'2024-06-04T06:17:25.8249625' AS DateTime2), 4, 4.9999, N'M', N'VVS2', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1193, CAST(N'2024-06-04T06:17:25.8249852' AS DateTime2), 4, 4.9999, N'M', N'VS1', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1194, CAST(N'2024-06-04T06:17:25.8250047' AS DateTime2), 4, 4.9999, N'M', N'VS2', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1195, CAST(N'2024-06-04T06:17:25.8250256' AS DateTime2), 4, 4.9999, N'M', N'SI1', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1196, CAST(N'2024-06-04T06:17:25.8250509' AS DateTime2), 4, 4.9999, N'M', N'SI2', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1197, CAST(N'2024-06-04T06:17:25.8250818' AS DateTime2), 4, 4.9999, N'M', N'SI3', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1198, CAST(N'2024-06-04T06:17:25.8250976' AS DateTime2), 4, 4.9999, N'M', N'I1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1199, CAST(N'2024-06-04T06:17:25.8251123' AS DateTime2), 4, 4.9999, N'M', N'I2', 32)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1200, CAST(N'2024-06-04T06:17:25.8251336' AS DateTime2), 4, 4.9999, N'M', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1201, CAST(N'2024-06-04T06:17:25.9625872' AS DateTime2), 5, 5.9999, N'D', N'FL', 1200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1202, CAST(N'2024-06-04T06:17:25.9626877' AS DateTime2), 5, 5.9999, N'D', N'IF', 1130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1203, CAST(N'2024-06-04T06:17:25.9627129' AS DateTime2), 5, 5.9999, N'D', N'VVS1', 970)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1204, CAST(N'2024-06-04T06:17:25.9627318' AS DateTime2), 5, 5.9999, N'D', N'VVS2', 835)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1205, CAST(N'2024-06-04T06:17:25.9627502' AS DateTime2), 5, 5.9999, N'D', N'VS1', 745)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1206, CAST(N'2024-06-04T06:17:25.9627616' AS DateTime2), 5, 5.9999, N'D', N'VS2', 615)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1207, CAST(N'2024-06-04T06:17:25.9627721' AS DateTime2), 5, 5.9999, N'D', N'SI1', 430)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1208, CAST(N'2024-06-04T06:17:25.9627846' AS DateTime2), 5, 5.9999, N'D', N'SI2', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1209, CAST(N'2024-06-04T06:17:25.9627969' AS DateTime2), 5, 5.9999, N'D', N'SI3', 175)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1210, CAST(N'2024-06-04T06:17:25.9628117' AS DateTime2), 5, 5.9999, N'D', N'I1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1211, CAST(N'2024-06-04T06:17:25.9628274' AS DateTime2), 5, 5.9999, N'D', N'I2', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1212, CAST(N'2024-06-04T06:17:25.9628375' AS DateTime2), 5, 5.9999, N'D', N'I3', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1213, CAST(N'2024-06-04T06:17:25.9628522' AS DateTime2), 5, 5.9999, N'E', N'FL', 1000)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1214, CAST(N'2024-06-04T06:17:25.9628658' AS DateTime2), 5, 5.9999, N'E', N'IF', 905)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1215, CAST(N'2024-06-04T06:17:25.9628835' AS DateTime2), 5, 5.9999, N'E', N'VVS1', 825)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1216, CAST(N'2024-06-04T06:17:25.9628964' AS DateTime2), 5, 5.9999, N'E', N'VVS2', 730)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1217, CAST(N'2024-06-04T06:17:25.9629066' AS DateTime2), 5, 5.9999, N'E', N'VS1', 650)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1218, CAST(N'2024-06-04T06:17:25.9629207' AS DateTime2), 5, 5.9999, N'E', N'VS2', 555)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1219, CAST(N'2024-06-04T06:17:25.9629380' AS DateTime2), 5, 5.9999, N'E', N'SI1', 395)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1220, CAST(N'2024-06-04T06:17:25.9629531' AS DateTime2), 5, 5.9999, N'E', N'SI2', 295)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1221, CAST(N'2024-06-04T06:17:25.9629661' AS DateTime2), 5, 5.9999, N'E', N'SI3', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1222, CAST(N'2024-06-04T06:17:25.9629788' AS DateTime2), 5, 5.9999, N'E', N'I1', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1223, CAST(N'2024-06-04T06:17:25.9629932' AS DateTime2), 5, 5.9999, N'E', N'I2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1224, CAST(N'2024-06-04T06:17:25.9630074' AS DateTime2), 5, 5.9999, N'E', N'I3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1225, CAST(N'2024-06-04T06:17:25.9630212' AS DateTime2), 5, 5.9999, N'F', N'FL', 800)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1226, CAST(N'2024-06-04T06:17:25.9630415' AS DateTime2), 5, 5.9999, N'F', N'IF', 775)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1227, CAST(N'2024-06-04T06:17:25.9630590' AS DateTime2), 5, 5.9999, N'F', N'VVS1', 715)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1228, CAST(N'2024-06-04T06:17:25.9630714' AS DateTime2), 5, 5.9999, N'F', N'VVS2', 630)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1229, CAST(N'2024-06-04T06:17:25.9630835' AS DateTime2), 5, 5.9999, N'F', N'VS1', 565)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1230, CAST(N'2024-06-04T06:17:25.9630951' AS DateTime2), 5, 5.9999, N'F', N'VS2', 490)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1231, CAST(N'2024-06-04T06:17:25.9631083' AS DateTime2), 5, 5.9999, N'F', N'SI1', 360)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1232, CAST(N'2024-06-04T06:17:25.9631195' AS DateTime2), 5, 5.9999, N'F', N'SI2', 280)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1233, CAST(N'2024-06-04T06:17:25.9631304' AS DateTime2), 5, 5.9999, N'F', N'SI3', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1234, CAST(N'2024-06-04T06:17:25.9631461' AS DateTime2), 5, 5.9999, N'F', N'I1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1235, CAST(N'2024-06-04T06:17:25.9631608' AS DateTime2), 5, 5.9999, N'F', N'I2', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1236, CAST(N'2024-06-04T06:17:25.9631749' AS DateTime2), 5, 5.9999, N'F', N'I3', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1237, CAST(N'2024-06-04T06:17:25.9631918' AS DateTime2), 5, 5.9999, N'G', N'FL', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1238, CAST(N'2024-06-04T06:17:25.9632056' AS DateTime2), 5, 5.9999, N'G', N'IF', 645)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1239, CAST(N'2024-06-04T06:17:25.9632210' AS DateTime2), 5, 5.9999, N'G', N'VVS1', 595)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1240, CAST(N'2024-06-04T06:17:25.9632316' AS DateTime2), 5, 5.9999, N'G', N'VVS2', 540)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1241, CAST(N'2024-06-04T06:17:25.9632454' AS DateTime2), 5, 5.9999, N'G', N'VS1', 485)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1242, CAST(N'2024-06-04T06:17:25.9632584' AS DateTime2), 5, 5.9999, N'G', N'VS2', 420)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1243, CAST(N'2024-06-04T06:17:25.9632695' AS DateTime2), 5, 5.9999, N'G', N'SI1', 320)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1244, CAST(N'2024-06-04T06:17:25.9632799' AS DateTime2), 5, 5.9999, N'G', N'SI2', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1245, CAST(N'2024-06-04T06:17:25.9632906' AS DateTime2), 5, 5.9999, N'G', N'SI3', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1246, CAST(N'2024-06-04T06:17:25.9633004' AS DateTime2), 5, 5.9999, N'G', N'I1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1247, CAST(N'2024-06-04T06:17:25.9633184' AS DateTime2), 5, 5.9999, N'G', N'I2', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1248, CAST(N'2024-06-04T06:17:25.9633331' AS DateTime2), 5, 5.9999, N'G', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1249, CAST(N'2024-06-04T06:17:25.9633484' AS DateTime2), 5, 5.9999, N'H', N'FL', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1250, CAST(N'2024-06-04T06:17:25.9633632' AS DateTime2), 5, 5.9999, N'H', N'IF', 505)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1251, CAST(N'2024-06-04T06:17:25.9633782' AS DateTime2), 5, 5.9999, N'H', N'VVS1', 475)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1252, CAST(N'2024-06-04T06:17:25.9633940' AS DateTime2), 5, 5.9999, N'H', N'VVS2', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1253, CAST(N'2024-06-04T06:17:25.9634047' AS DateTime2), 5, 5.9999, N'H', N'VS1', 385)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1254, CAST(N'2024-06-04T06:17:25.9634169' AS DateTime2), 5, 5.9999, N'H', N'VS2', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1255, CAST(N'2024-06-04T06:17:25.9634293' AS DateTime2), 5, 5.9999, N'H', N'SI1', 265)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1256, CAST(N'2024-06-04T06:17:25.9634405' AS DateTime2), 5, 5.9999, N'H', N'SI2', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1257, CAST(N'2024-06-04T06:17:25.9634529' AS DateTime2), 5, 5.9999, N'H', N'SI3', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1258, CAST(N'2024-06-04T06:17:25.9634635' AS DateTime2), 5, 5.9999, N'H', N'I1', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1259, CAST(N'2024-06-04T06:17:25.9634772' AS DateTime2), 5, 5.9999, N'H', N'I2', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1260, CAST(N'2024-06-04T06:17:25.9634938' AS DateTime2), 5, 5.9999, N'H', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1261, CAST(N'2024-06-04T06:17:25.9635097' AS DateTime2), 5, 5.9999, N'I', N'FL', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1262, CAST(N'2024-06-04T06:17:25.9635251' AS DateTime2), 5, 5.9999, N'I', N'IF', 385)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1263, CAST(N'2024-06-04T06:17:25.9635414' AS DateTime2), 5, 5.9999, N'I', N'VVS1', 360)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1264, CAST(N'2024-06-04T06:17:25.9635559' AS DateTime2), 5, 5.9999, N'I', N'VVS2', 330)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1265, CAST(N'2024-06-04T06:17:25.9635677' AS DateTime2), 5, 5.9999, N'I', N'VS1', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1266, CAST(N'2024-06-04T06:17:25.9635847' AS DateTime2), 5, 5.9999, N'I', N'VS2', 265)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1267, CAST(N'2024-06-04T06:17:25.9636008' AS DateTime2), 5, 5.9999, N'I', N'SI1', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1268, CAST(N'2024-06-04T06:17:25.9636136' AS DateTime2), 5, 5.9999, N'I', N'SI2', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1269, CAST(N'2024-06-04T06:17:25.9636252' AS DateTime2), 5, 5.9999, N'I', N'SI3', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1270, CAST(N'2024-06-04T06:17:25.9636367' AS DateTime2), 5, 5.9999, N'I', N'I1', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1271, CAST(N'2024-06-04T06:17:25.9636478' AS DateTime2), 5, 5.9999, N'I', N'I2', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1272, CAST(N'2024-06-04T06:17:25.9636595' AS DateTime2), 5, 5.9999, N'I', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1273, CAST(N'2024-06-04T06:17:25.9636816' AS DateTime2), 5, 5.9999, N'J', N'FL', 320)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1274, CAST(N'2024-06-04T06:17:25.9636991' AS DateTime2), 5, 5.9999, N'J', N'IF', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1275, CAST(N'2024-06-04T06:17:25.9637146' AS DateTime2), 5, 5.9999, N'J', N'VVS1', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1276, CAST(N'2024-06-04T06:17:25.9637291' AS DateTime2), 5, 5.9999, N'J', N'VVS2', 255)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1277, CAST(N'2024-06-04T06:17:25.9637425' AS DateTime2), 5, 5.9999, N'J', N'VS1', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1278, CAST(N'2024-06-04T06:17:25.9637575' AS DateTime2), 5, 5.9999, N'J', N'VS2', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1279, CAST(N'2024-06-04T06:17:25.9637723' AS DateTime2), 5, 5.9999, N'J', N'SI1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1280, CAST(N'2024-06-04T06:17:25.9637852' AS DateTime2), 5, 5.9999, N'J', N'SI2', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1281, CAST(N'2024-06-04T06:17:25.9637957' AS DateTime2), 5, 5.9999, N'J', N'SI3', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1282, CAST(N'2024-06-04T06:17:25.9638080' AS DateTime2), 5, 5.9999, N'J', N'I1', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1283, CAST(N'2024-06-04T06:17:25.9638204' AS DateTime2), 5, 5.9999, N'J', N'I2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1284, CAST(N'2024-06-04T06:17:25.9638330' AS DateTime2), 5, 5.9999, N'J', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1285, CAST(N'2024-06-04T06:17:25.9638470' AS DateTime2), 5, 5.9999, N'K', N'FL', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1286, CAST(N'2024-06-04T06:17:25.9638576' AS DateTime2), 5, 5.9999, N'K', N'IF', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1287, CAST(N'2024-06-04T06:17:25.9638723' AS DateTime2), 5, 5.9999, N'K', N'VVS1', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1288, CAST(N'2024-06-04T06:17:25.9638876' AS DateTime2), 5, 5.9999, N'K', N'VVS2', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1289, CAST(N'2024-06-04T06:17:25.9639016' AS DateTime2), 5, 5.9999, N'K', N'VS1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1290, CAST(N'2024-06-04T06:17:25.9639153' AS DateTime2), 5, 5.9999, N'K', N'VS2', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1291, CAST(N'2024-06-04T06:17:25.9639298' AS DateTime2), 5, 5.9999, N'K', N'SI1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1292, CAST(N'2024-06-04T06:17:25.9639454' AS DateTime2), 5, 5.9999, N'K', N'SI2', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1293, CAST(N'2024-06-04T06:17:25.9639561' AS DateTime2), 5, 5.9999, N'K', N'SI3', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1294, CAST(N'2024-06-04T06:17:25.9639717' AS DateTime2), 5, 5.9999, N'K', N'I1', 81)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1295, CAST(N'2024-06-04T06:17:25.9639873' AS DateTime2), 5, 5.9999, N'K', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1296, CAST(N'2024-06-04T06:17:25.9640004' AS DateTime2), 5, 5.9999, N'K', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1297, CAST(N'2024-06-04T06:17:25.9640152' AS DateTime2), 5, 5.9999, N'L', N'FL', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1298, CAST(N'2024-06-04T06:17:25.9640267' AS DateTime2), 5, 5.9999, N'L', N'IF', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1299, CAST(N'2024-06-04T06:17:25.9640377' AS DateTime2), 5, 5.9999, N'L', N'VVS1', 175)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1300, CAST(N'2024-06-04T06:17:25.9640496' AS DateTime2), 5, 5.9999, N'L', N'VVS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1301, CAST(N'2024-06-04T06:17:25.9640601' AS DateTime2), 5, 5.9999, N'L', N'VS1', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1302, CAST(N'2024-06-04T06:17:25.9640780' AS DateTime2), 5, 5.9999, N'L', N'VS2', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1303, CAST(N'2024-06-04T06:17:25.9640917' AS DateTime2), 5, 5.9999, N'L', N'SI1', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1304, CAST(N'2024-06-04T06:17:25.9641053' AS DateTime2), 5, 5.9999, N'L', N'SI2', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1305, CAST(N'2024-06-04T06:17:25.9641213' AS DateTime2), 5, 5.9999, N'L', N'SI3', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1306, CAST(N'2024-06-04T06:17:25.9641380' AS DateTime2), 5, 5.9999, N'L', N'I1', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1307, CAST(N'2024-06-04T06:17:25.9641490' AS DateTime2), 5, 5.9999, N'L', N'I2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1308, CAST(N'2024-06-04T06:17:25.9641597' AS DateTime2), 5, 5.9999, N'L', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1309, CAST(N'2024-06-04T06:17:25.9641752' AS DateTime2), 5, 5.9999, N'M', N'FL', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1310, CAST(N'2024-06-04T06:17:25.9641883' AS DateTime2), 5, 5.9999, N'M', N'IF', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1311, CAST(N'2024-06-04T06:17:25.9641995' AS DateTime2), 5, 5.9999, N'M', N'VVS1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1312, CAST(N'2024-06-04T06:17:25.9642103' AS DateTime2), 5, 5.9999, N'M', N'VVS2', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1313, CAST(N'2024-06-04T06:17:25.9642211' AS DateTime2), 5, 5.9999, N'M', N'VS1', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1314, CAST(N'2024-06-04T06:17:25.9642382' AS DateTime2), 5, 5.9999, N'M', N'VS2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1315, CAST(N'2024-06-04T06:17:25.9642581' AS DateTime2), 5, 5.9999, N'M', N'SI1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1316, CAST(N'2024-06-04T06:17:25.9642746' AS DateTime2), 5, 5.9999, N'M', N'SI2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1317, CAST(N'2024-06-04T06:17:25.9642887' AS DateTime2), 5, 5.9999, N'M', N'SI3', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1318, CAST(N'2024-06-04T06:17:25.9643029' AS DateTime2), 5, 5.9999, N'M', N'I1', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1319, CAST(N'2024-06-04T06:17:25.9643131' AS DateTime2), 5, 5.9999, N'M', N'I2', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1320, CAST(N'2024-06-04T06:17:25.9643251' AS DateTime2), 5, 5.9999, N'M', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1321, CAST(N'2024-06-04T06:17:26.0714754' AS DateTime2), 6, 7.9999, N'D', N'FL', 1700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1322, CAST(N'2024-06-04T06:17:26.0715651' AS DateTime2), 6, 7.9999, N'D', N'IF', 1600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1323, CAST(N'2024-06-04T06:17:26.0715914' AS DateTime2), 6, 7.9999, N'D', N'VVS1', 1480)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1324, CAST(N'2024-06-04T06:17:26.0716135' AS DateTime2), 6, 7.9999, N'D', N'VVS2', 1300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1325, CAST(N'2024-06-04T06:17:26.0716286' AS DateTime2), 6, 7.9999, N'D', N'VS1', 1150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1326, CAST(N'2024-06-04T06:17:26.0716425' AS DateTime2), 6, 7.9999, N'D', N'VS2', 965)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1327, CAST(N'2024-06-04T06:17:26.0716559' AS DateTime2), 6, 7.9999, N'D', N'SI1', 635)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1328, CAST(N'2024-06-04T06:17:26.0716700' AS DateTime2), 6, 7.9999, N'D', N'SI2', 465)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1329, CAST(N'2024-06-04T06:17:26.0716862' AS DateTime2), 6, 7.9999, N'D', N'SI3', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1330, CAST(N'2024-06-04T06:17:26.0716966' AS DateTime2), 6, 7.9999, N'D', N'I1', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1331, CAST(N'2024-06-04T06:17:26.0717068' AS DateTime2), 6, 7.9999, N'D', N'I2', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1332, CAST(N'2024-06-04T06:17:26.0717186' AS DateTime2), 6, 7.9999, N'D', N'I3', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1333, CAST(N'2024-06-04T06:17:26.0717390' AS DateTime2), 6, 7.9999, N'E', N'FL', 1500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1334, CAST(N'2024-06-04T06:17:26.0717548' AS DateTime2), 6, 7.9999, N'E', N'IF', 1380)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1335, CAST(N'2024-06-04T06:17:26.0717712' AS DateTime2), 6, 7.9999, N'E', N'VVS1', 1275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1336, CAST(N'2024-06-04T06:17:26.0717866' AS DateTime2), 6, 7.9999, N'E', N'VVS2', 1130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1337, CAST(N'2024-06-04T06:17:26.0717996' AS DateTime2), 6, 7.9999, N'E', N'VS1', 1015)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1338, CAST(N'2024-06-04T06:17:26.0718166' AS DateTime2), 6, 7.9999, N'E', N'VS2', 875)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1339, CAST(N'2024-06-04T06:17:26.0718303' AS DateTime2), 6, 7.9999, N'E', N'SI1', 585)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1340, CAST(N'2024-06-04T06:17:26.0718447' AS DateTime2), 6, 7.9999, N'E', N'SI2', 430)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1341, CAST(N'2024-06-04T06:17:26.0718595' AS DateTime2), 6, 7.9999, N'E', N'SI3', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1342, CAST(N'2024-06-04T06:17:26.0718771' AS DateTime2), 6, 7.9999, N'E', N'I1', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1343, CAST(N'2024-06-04T06:17:26.0718932' AS DateTime2), 6, 7.9999, N'E', N'I2', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1344, CAST(N'2024-06-04T06:17:26.0719064' AS DateTime2), 6, 7.9999, N'E', N'I3', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1345, CAST(N'2024-06-04T06:17:26.0719258' AS DateTime2), 6, 7.9999, N'F', N'FL', 1200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1346, CAST(N'2024-06-04T06:17:26.0719409' AS DateTime2), 6, 7.9999, N'F', N'IF', 1180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1347, CAST(N'2024-06-04T06:17:26.0719570' AS DateTime2), 6, 7.9999, N'F', N'VVS1', 1110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1348, CAST(N'2024-06-04T06:17:26.0719701' AS DateTime2), 6, 7.9999, N'F', N'VVS2', 985)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1349, CAST(N'2024-06-04T06:17:26.0719825' AS DateTime2), 6, 7.9999, N'F', N'VS1', 875)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1350, CAST(N'2024-06-04T06:17:26.0719946' AS DateTime2), 6, 7.9999, N'F', N'VS2', 755)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1351, CAST(N'2024-06-04T06:17:26.0720042' AS DateTime2), 6, 7.9999, N'F', N'SI1', 535)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1352, CAST(N'2024-06-04T06:17:26.0720139' AS DateTime2), 6, 7.9999, N'F', N'SI2', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1353, CAST(N'2024-06-04T06:17:26.0720306' AS DateTime2), 6, 7.9999, N'F', N'SI3', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1354, CAST(N'2024-06-04T06:17:26.0720454' AS DateTime2), 6, 7.9999, N'F', N'I1', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1355, CAST(N'2024-06-04T06:17:26.0720603' AS DateTime2), 6, 7.9999, N'F', N'I2', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1356, CAST(N'2024-06-04T06:17:26.0720771' AS DateTime2), 6, 7.9999, N'F', N'I3', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1357, CAST(N'2024-06-04T06:17:26.0720923' AS DateTime2), 6, 7.9999, N'G', N'FL', 1000)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1358, CAST(N'2024-06-04T06:17:26.0721025' AS DateTime2), 6, 7.9999, N'G', N'IF', 990)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1359, CAST(N'2024-06-04T06:17:26.0721122' AS DateTime2), 6, 7.9999, N'G', N'VVS1', 930)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1360, CAST(N'2024-06-04T06:17:26.0721225' AS DateTime2), 6, 7.9999, N'G', N'VVS2', 840)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1361, CAST(N'2024-06-04T06:17:26.0721348' AS DateTime2), 6, 7.9999, N'G', N'VS1', 755)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1362, CAST(N'2024-06-04T06:17:26.0721449' AS DateTime2), 6, 7.9999, N'G', N'VS2', 650)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1363, CAST(N'2024-06-04T06:17:26.0721570' AS DateTime2), 6, 7.9999, N'G', N'SI1', 485)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1364, CAST(N'2024-06-04T06:17:26.0721741' AS DateTime2), 6, 7.9999, N'G', N'SI2', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1365, CAST(N'2024-06-04T06:17:26.0721911' AS DateTime2), 6, 7.9999, N'G', N'SI3', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1366, CAST(N'2024-06-04T06:17:26.0722076' AS DateTime2), 6, 7.9999, N'G', N'I1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1367, CAST(N'2024-06-04T06:17:26.0722228' AS DateTime2), 6, 7.9999, N'G', N'I2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1368, CAST(N'2024-06-04T06:17:26.0722372' AS DateTime2), 6, 7.9999, N'G', N'I3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1369, CAST(N'2024-06-04T06:17:26.0722525' AS DateTime2), 6, 7.9999, N'H', N'FL', 820)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1370, CAST(N'2024-06-04T06:17:26.0722626' AS DateTime2), 6, 7.9999, N'H', N'IF', 790)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1371, CAST(N'2024-06-04T06:17:26.0722742' AS DateTime2), 6, 7.9999, N'H', N'VVS1', 740)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1372, CAST(N'2024-06-04T06:17:26.0722857' AS DateTime2), 6, 7.9999, N'H', N'VVS2', 670)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1373, CAST(N'2024-06-04T06:17:26.0722960' AS DateTime2), 6, 7.9999, N'H', N'VS1', 605)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1374, CAST(N'2024-06-04T06:17:26.0723069' AS DateTime2), 6, 7.9999, N'H', N'VS2', 525)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1375, CAST(N'2024-06-04T06:17:26.0723189' AS DateTime2), 6, 7.9999, N'H', N'SI1', 405)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1376, CAST(N'2024-06-04T06:17:26.0723317' AS DateTime2), 6, 7.9999, N'H', N'SI2', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1377, CAST(N'2024-06-04T06:17:26.0723490' AS DateTime2), 6, 7.9999, N'H', N'SI3', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1378, CAST(N'2024-06-04T06:17:26.0723610' AS DateTime2), 6, 7.9999, N'H', N'I1', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1379, CAST(N'2024-06-04T06:17:26.0723750' AS DateTime2), 6, 7.9999, N'H', N'I2', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1380, CAST(N'2024-06-04T06:17:26.0723884' AS DateTime2), 6, 7.9999, N'H', N'I3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1381, CAST(N'2024-06-04T06:17:26.0724069' AS DateTime2), 6, 7.9999, N'I', N'FL', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1382, CAST(N'2024-06-04T06:17:26.0724241' AS DateTime2), 6, 7.9999, N'I', N'IF', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1383, CAST(N'2024-06-04T06:17:26.0724357' AS DateTime2), 6, 7.9999, N'I', N'VVS1', 560)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1384, CAST(N'2024-06-04T06:17:26.0724495' AS DateTime2), 6, 7.9999, N'I', N'VVS2', 520)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1385, CAST(N'2024-06-04T06:17:26.0724611' AS DateTime2), 6, 7.9999, N'I', N'VS1', 480)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1386, CAST(N'2024-06-04T06:17:26.0724723' AS DateTime2), 6, 7.9999, N'I', N'VS2', 420)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1387, CAST(N'2024-06-04T06:17:26.0724857' AS DateTime2), 6, 7.9999, N'I', N'SI1', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1388, CAST(N'2024-06-04T06:17:26.0724964' AS DateTime2), 6, 7.9999, N'I', N'SI2', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1389, CAST(N'2024-06-04T06:17:26.0725111' AS DateTime2), 6, 7.9999, N'I', N'SI3', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1390, CAST(N'2024-06-04T06:17:26.0725295' AS DateTime2), 6, 7.9999, N'I', N'I1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1391, CAST(N'2024-06-04T06:17:26.0725429' AS DateTime2), 6, 7.9999, N'I', N'I2', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1392, CAST(N'2024-06-04T06:17:26.0725564' AS DateTime2), 6, 7.9999, N'I', N'I3', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1393, CAST(N'2024-06-04T06:17:26.0725760' AS DateTime2), 6, 7.9999, N'J', N'FL', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1394, CAST(N'2024-06-04T06:17:26.0725901' AS DateTime2), 6, 7.9999, N'J', N'IF', 470)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1395, CAST(N'2024-06-04T06:17:26.0726012' AS DateTime2), 6, 7.9999, N'J', N'VVS1', 430)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1396, CAST(N'2024-06-04T06:17:26.0726164' AS DateTime2), 6, 7.9999, N'J', N'VVS2', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1397, CAST(N'2024-06-04T06:17:26.0726269' AS DateTime2), 6, 7.9999, N'J', N'VS1', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1398, CAST(N'2024-06-04T06:17:26.0726430' AS DateTime2), 6, 7.9999, N'J', N'VS2', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1399, CAST(N'2024-06-04T06:17:26.0726568' AS DateTime2), 6, 7.9999, N'J', N'SI1', 285)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1400, CAST(N'2024-06-04T06:17:26.0726674' AS DateTime2), 6, 7.9999, N'J', N'SI2', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1401, CAST(N'2024-06-04T06:17:26.0726772' AS DateTime2), 6, 7.9999, N'J', N'SI3', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1402, CAST(N'2024-06-04T06:17:26.0726874' AS DateTime2), 6, 7.9999, N'J', N'I1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1403, CAST(N'2024-06-04T06:17:26.0726995' AS DateTime2), 6, 7.9999, N'J', N'I2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1404, CAST(N'2024-06-04T06:17:26.0727126' AS DateTime2), 6, 7.9999, N'J', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1405, CAST(N'2024-06-04T06:17:26.0727317' AS DateTime2), 6, 7.9999, N'K', N'FL', 500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1406, CAST(N'2024-06-04T06:17:26.0727456' AS DateTime2), 6, 7.9999, N'K', N'IF', 360)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1407, CAST(N'2024-06-04T06:17:26.0727603' AS DateTime2), 6, 7.9999, N'K', N'VVS1', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1408, CAST(N'2024-06-04T06:17:26.0727735' AS DateTime2), 6, 7.9999, N'K', N'VVS2', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1409, CAST(N'2024-06-04T06:17:26.0727842' AS DateTime2), 6, 7.9999, N'K', N'VS1', 290)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1410, CAST(N'2024-06-04T06:17:26.0727981' AS DateTime2), 6, 7.9999, N'K', N'VS2', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1411, CAST(N'2024-06-04T06:17:26.0728144' AS DateTime2), 6, 7.9999, N'K', N'SI1', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1412, CAST(N'2024-06-04T06:17:26.0728295' AS DateTime2), 6, 7.9999, N'K', N'SI2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1413, CAST(N'2024-06-04T06:17:26.0728419' AS DateTime2), 6, 7.9999, N'K', N'SI3', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1414, CAST(N'2024-06-04T06:17:26.0728573' AS DateTime2), 6, 7.9999, N'K', N'I1', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1415, CAST(N'2024-06-04T06:17:26.0728704' AS DateTime2), 6, 7.9999, N'K', N'I2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1416, CAST(N'2024-06-04T06:17:26.0728829' AS DateTime2), 6, 7.9999, N'K', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1417, CAST(N'2024-06-04T06:17:26.0728999' AS DateTime2), 6, 7.9999, N'L', N'FL', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1418, CAST(N'2024-06-04T06:17:26.0729111' AS DateTime2), 6, 7.9999, N'L', N'IF', 285)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1419, CAST(N'2024-06-04T06:17:26.0729241' AS DateTime2), 6, 7.9999, N'L', N'VVS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1420, CAST(N'2024-06-04T06:17:26.0729346' AS DateTime2), 6, 7.9999, N'L', N'VVS2', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1421, CAST(N'2024-06-04T06:17:26.0729443' AS DateTime2), 6, 7.9999, N'L', N'VS1', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1422, CAST(N'2024-06-04T06:17:26.0729543' AS DateTime2), 6, 7.9999, N'L', N'VS2', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1423, CAST(N'2024-06-04T06:17:26.0729642' AS DateTime2), 6, 7.9999, N'L', N'SI1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1424, CAST(N'2024-06-04T06:17:26.0729759' AS DateTime2), 6, 7.9999, N'L', N'SI2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1425, CAST(N'2024-06-04T06:17:26.0729857' AS DateTime2), 6, 7.9999, N'L', N'SI3', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1426, CAST(N'2024-06-04T06:17:26.0729947' AS DateTime2), 6, 7.9999, N'L', N'I1', 85)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1427, CAST(N'2024-06-04T06:17:26.0730043' AS DateTime2), 6, 7.9999, N'L', N'I2', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1428, CAST(N'2024-06-04T06:17:26.0730186' AS DateTime2), 6, 7.9999, N'L', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1429, CAST(N'2024-06-04T06:17:26.0730351' AS DateTime2), 6, 7.9999, N'M', N'FL', 280)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1430, CAST(N'2024-06-04T06:17:26.0730470' AS DateTime2), 6, 7.9999, N'M', N'IF', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1431, CAST(N'2024-06-04T06:17:26.0730576' AS DateTime2), 6, 7.9999, N'M', N'VVS1', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1432, CAST(N'2024-06-04T06:17:26.0730675' AS DateTime2), 6, 7.9999, N'M', N'VVS2', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1433, CAST(N'2024-06-04T06:17:26.0730773' AS DateTime2), 6, 7.9999, N'M', N'VS1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1434, CAST(N'2024-06-04T06:17:26.0730871' AS DateTime2), 6, 7.9999, N'M', N'VS2', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1435, CAST(N'2024-06-04T06:17:26.0731040' AS DateTime2), 6, 7.9999, N'M', N'SI1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1436, CAST(N'2024-06-04T06:17:26.0731282' AS DateTime2), 6, 7.9999, N'M', N'SI2', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1437, CAST(N'2024-06-04T06:17:26.0731489' AS DateTime2), 6, 7.9999, N'M', N'SI3', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1438, CAST(N'2024-06-04T06:17:26.0731741' AS DateTime2), 6, 7.9999, N'M', N'I1', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1439, CAST(N'2024-06-04T06:17:26.0731932' AS DateTime2), 6, 7.9999, N'M', N'I2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1440, CAST(N'2024-06-04T06:17:26.0732103' AS DateTime2), 6, 7.9999, N'M', N'I3', 18)
SET IDENTITY_INSERT [dbo].[diamond_price] OFF
GO
SET IDENTITY_INSERT [dbo].[material_price] ON 

INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (1, 18, CAST(N'2024-06-04T06:17:26.1152976' AS DateTime2), 75.75)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (2, 18, CAST(N'2024-06-04T06:17:26.1318051' AS DateTime2), 78)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (3, 18, CAST(N'2024-06-04T06:17:26.1318514' AS DateTime2), 73.300003051757812)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (4, 18, CAST(N'2024-06-04T06:17:26.1318597' AS DateTime2), 71.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (5, 18, CAST(N'2024-06-04T06:17:26.1318680' AS DateTime2), 72.4000015258789)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (6, 18, CAST(N'2024-06-04T06:17:26.1318741' AS DateTime2), 77.949996948242188)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (7, 18, CAST(N'2024-06-04T06:17:26.1318822' AS DateTime2), 80.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (8, 18, CAST(N'2024-06-04T06:17:26.1318884' AS DateTime2), 81.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (9, 24, CAST(N'2024-06-04T06:17:26.1319147' AS DateTime2), 83.75)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (10, 24, CAST(N'2024-06-04T06:17:26.1319213' AS DateTime2), 87.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (11, 24, CAST(N'2024-06-04T06:17:26.1319274' AS DateTime2), 86.300003051757812)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (12, 24, CAST(N'2024-06-04T06:17:26.1319334' AS DateTime2), 85.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (13, 24, CAST(N'2024-06-04T06:17:26.1319407' AS DateTime2), 89.4000015258789)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (14, 24, CAST(N'2024-06-04T06:17:26.1319466' AS DateTime2), 90.449996948242188)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (15, 24, CAST(N'2024-06-04T06:17:26.1319525' AS DateTime2), 88.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (16, 24, CAST(N'2024-06-04T06:17:26.1319585' AS DateTime2), 88.5)
SET IDENTITY_INSERT [dbo].[material_price] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [total_price], [total_discount_percent], [rank_id], [price_rate_id], [order_status], [shipping_address], [phone_number], [created_at], [customer_id], [sale_staff_id], [delivery_staff_id], [promotion_id]) VALUES (1, 15219.955153035471, 0, 1, 8, N'Pending', N'120 ABC Street', N'0123456789', CAST(N'2024-06-04T06:17:32.5590541' AS DateTime2), 1, 2, 3, NULL)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([order_detail_id], [size], [item_price], [order_id], [diamond_id], [accessory_id], [diamond_price_id], [material_price_id]) VALUES (1, 3.5, 12843.844631195068, 1, 12, 34, 1228, 16)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[price_rate] ON 

INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (1, 5, 1.0575, CAST(N'2024-06-04T06:17:23.9859326' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (2, 5, 1.001, CAST(N'2024-06-04T06:17:24.0217600' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (3, 5, 1.063, CAST(N'2024-06-04T06:17:24.0234200' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (4, 5, 1.035, CAST(N'2024-06-04T06:17:24.0248809' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (5, 5, 1.094, CAST(N'2024-06-04T06:17:24.0280580' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (6, 5, 1.1545, CAST(N'2024-06-04T06:17:24.0336158' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (7, 5, 1.081, CAST(N'2024-06-04T06:17:24.0370340' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (8, 5, 1.185, CAST(N'2024-06-04T06:17:24.0398941' AS DateTime2))
SET IDENTITY_INSERT [dbo].[price_rate] OFF
GO
SET IDENTITY_INSERT [dbo].[rank] ON 

INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (1, N'Bronze', 0, 0)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (2, N'Silver', 0.05, 500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (3, N'Gold', 0.075, 1000)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (4, N'Platinum', 0.1, 1500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (5, N'Emerald', 0.125, 2000)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (6, N'Diamond', 0.15, 2500)
SET IDENTITY_INSERT [dbo].[rank] OFF
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
SET IDENTITY_INSERT [dbo].[warranty_card] ON 

INSERT [dbo].[warranty_card] ([warranty_card_id], [order_detail_id], [start_time], [end_time]) VALUES (1, 1, CAST(N'2024-06-04T06:17:32.6630771' AS DateTime2), CAST(N'2025-06-04T06:17:32.6630780' AS DateTime2))
SET IDENTITY_INSERT [dbo].[warranty_card] OFF
GO
/****** Object:  Index [IX_accessory_accessory_type_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_accessory_type_id] ON [dbo].[accessory]
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_shape_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_shape_id] ON [dbo].[accessory]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_image_accessory_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_image_accessory_id] ON [dbo].[accessory_image]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_rank_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_account_rank_id] ON [dbo].[account]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_blog_author_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_blog_author_id] ON [dbo].[blog]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_diamond_shape_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_diamond_shape_id] ON [dbo].[diamond]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_accessory_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_accessory_id] ON [dbo].[feedback]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_order_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_order_id] ON [dbo].[feedback]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_customer_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_customer_id] ON [dbo].[order]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_delivery_staff_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_delivery_staff_id] ON [dbo].[order]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_price_rate_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_price_rate_id] ON [dbo].[order]
(
	[price_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_promotion_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_promotion_id] ON [dbo].[order]
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_rank_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_rank_id] ON [dbo].[order]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_sale_staff_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_sale_staff_id] ON [dbo].[order]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_accessory_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_accessory_id] ON [dbo].[order_detail]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_order_detail_diamond_id] ON [dbo].[order_detail]
(
	[diamond_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_price_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_diamond_price_id] ON [dbo].[order_detail]
(
	[diamond_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_material_price_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_material_price_id] ON [dbo].[order_detail]
(
	[material_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_order_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_order_id] ON [dbo].[order_detail]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_price_rate_account_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_price_rate_account_id] ON [dbo].[price_rate]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_transaction_order_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_transaction_order_id] ON [dbo].[transaction]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_card_order_detail_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_warranty_card_order_detail_id] ON [dbo].[warranty_card]
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_customer_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_customer_id] ON [dbo].[warranty_request]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_delivery_staff_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_delivery_staff_id] ON [dbo].[warranty_request]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_sale_staff_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_sale_staff_id] ON [dbo].[warranty_request]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_warranty_card_id]    Script Date: 6/4/2024 6:27:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_warranty_card_id] ON [dbo].[warranty_request]
(
	[warranty_card_id] ASC
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
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_price_rate_price_rate_id] FOREIGN KEY([price_rate_id])
REFERENCES [dbo].[price_rate] ([price_rate_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_price_rate_price_rate_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_promotion_promotion_id] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotion] ([promotion_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_promotion_promotion_id]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_rank_rank_id] FOREIGN KEY([rank_id])
REFERENCES [dbo].[rank] ([rank_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_rank_rank_id]
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
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_diamond_price_diamond_price_id] FOREIGN KEY([diamond_price_id])
REFERENCES [dbo].[diamond_price] ([diamond_price_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_diamond_price_diamond_price_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_material_price_material_price_id] FOREIGN KEY([material_price_id])
REFERENCES [dbo].[material_price] ([material_price_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_material_price_material_price_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order_order_id]
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
ALTER TABLE [dbo].[warranty_card]  WITH CHECK ADD  CONSTRAINT [FK_warranty_card_order_detail_order_detail_id] FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[order_detail] ([order_detail_id])
GO
ALTER TABLE [dbo].[warranty_card] CHECK CONSTRAINT [FK_warranty_card_order_detail_order_detail_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_customer_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_delivery_staff_id] FOREIGN KEY([delivery_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_delivery_staff_id]
GO
ALTER TABLE [dbo].[warranty_request]  WITH CHECK ADD  CONSTRAINT [FK_warranty_request_account_sale_staff_id] FOREIGN KEY([sale_staff_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[warranty_request] CHECK CONSTRAINT [FK_warranty_request_account_sale_staff_id]
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
