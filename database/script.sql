USE [master]
GO
/****** Object:  Database [DATJ]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE DATABASE [DATJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DATJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DATJ.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DATJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DATJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
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
ALTER DATABASE [DATJ] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [DATJ] SET  DISABLE_BROKER 
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
ALTER DATABASE [DATJ] SET READ_COMMITTED_SNAPSHOT OFF 
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
/****** Object:  Table [dbo].[accessory]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[accessory_image]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[accessory_type]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[account]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[blog]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[diamond]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[diamond_price]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[feedback]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[material_price]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[order]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[order_detail]    Script Date: 5/30/2024 9:18:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[price_rate]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[promotion]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[rank]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[shape]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[warranty_card]    Script Date: 5/30/2024 9:18:53 AM ******/
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
/****** Object:  Table [dbo].[warranty_request]    Script Date: 5/30/2024 9:18:53 AM ******/
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
SET IDENTITY_INSERT [dbo].[accessory] ON 

INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (1, 18, 17.6376266, N'Classic Round Diamond Four Prong Stud Earrings (F/G SI+)', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (2, 18, 57.01051, N'Toi et Moi Round Front Back Earring', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (3, 24, 27.25815, N'Round Diamond Halo Earrings', 1, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (4, 18, 31.2132549, N'Classic Princess Brilliant Cut Diamond Martini Stud Earrings (F/G VS+)', 1, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (5, 24, 37.0390167, N'Princess Diamond Halo Earrings', 1, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (6, 18, 58.7920876, N'Toi et Moi Halo Emeralds Front Back Earring', 1, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (7, 18, 53.4473534, N'Toi et Moi Round and Emerald Front Back Earrings', 1, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (8, 18, 12.1147337, N'Oval Created Sapphire and Lab Diamond Classic Solitaire Under-Halo Earrings', 1, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (9, 24, 30.21557, N'Classic Oval Diamond Stud Earrings (F/G VS+)', 1, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (10, 24, 62.3552437, N'Toi et Moi Halo Round and Teardrop Front Back Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (11, 24, 84.98129, N'Elegance Pear Drop Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (12, 24, 36.8786736, N'Pear Diamond Halo Earrings', 1, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (13, 24, 160.876541, N'Pear, Round and Heart Matching Earring', 1, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (14, 18, 73.0447159, N'Halo Oval and Heart Front Back Earring', 1, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (15, 18, 37.05683, N'Kite Set Round Lab Created Diamond Solitaire Pendant', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (16, 24, 10.68947, N'Kite Chamfered Bezel Set Solitaire Necklace', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (17, 24, 16.390522, N'Round Created Ruby and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (18, 24, 9.08605, N'Round Created Sapphire and Lab Diamond Classic Solitaire Pendant With Studded Bale', 2, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (19, 24, 14.608943, N'Halo Cushion Lab Created Diamond Necklace', 2, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (20, 24, 24.05131, N'Classic Cushion Bezel Necklace', 2, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (21, 18, 24.05131, N'Classic Heart Bezel Necklace', 2, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (22, 18, 17.9939423, N'Oval Sapphire and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (23, 18, 16.390522, N'Pear Created Ruby and Lab Diamond Classic Halo Pendant With Studded Split Bale', 2, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (24, 18, 24.05131, N'Pear Bezel Drop Necklace', 2, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (25, 18, 24.05131, N'Emerald Bezel Drop Necklace', 2, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (26, 24, 71.4413, N'Round with Trailing Round and Marquise Tennis Bracelet', 4, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (27, 24, 96.561554, N'Round Station Tennis Bracelet', 4, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (28, 24, 112.595757, N'Bezeled Princess Station with Emeralds Tennis Bracelet', 4, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (29, 24, 164.4397, N'Half-Bezeled Emerald East-West Tennis Bracelet', 4, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (30, 24, 97.2741852, N'Half Pave Bezel Bangle', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (31, 24, 83.1997147, N'Oval with Trailing Round and Emeralds Tennis Bracelet', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (32, 18, 128.808121, N'Graduating Oval Tennis Bracelet', 4, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (33, 18, 79.9928741, N'Half Pave Heart Bangle', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (34, 24, 104.934967, N'Multi Heart Bezel Bangle', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (35, 18, 98.34313, N'Bezeled Heart Station Tennis Bracelet', 4, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (36, 18, 130.767853, N'Graduating Pear Tennis Bracelet', 4, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (37, 18, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (38, 24, 57.3668251, N'The Fulton Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (39, 24, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (40, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (41, 18, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (42, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (43, 24, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (44, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (45, 18, 85.51576, N'The Carnegie Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (46, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (47, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (48, 18, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (49, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (50, 18, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (51, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (52, 24, 67.69998, N'The Sutton Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (53, 18, 66.09656, N'The Roosevelt Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (54, 24, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (55, 18, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (56, 24, 57.3668251, N'The Fulton Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (57, 24, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (58, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (59, 18, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (60, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (61, 24, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (62, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (63, 24, 85.51576, N'The Carnegie Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (64, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (65, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (66, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (67, 18, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (68, 18, 66.09656, N'The Roosevelt Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (69, 18, 65.20577, N'The Varick Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (70, 18, 29.0397282, N'The Frick Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (71, 18, 25.2984142, N'Trio Cluster Engagement Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (72, 18, 36.7005157, N'The Fifth Avenue Ring', 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (73, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (74, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (75, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (76, 24, 27.4363079, N'Aura Hidden Accent Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (77, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (78, 24, 37.5913048, N'Split Shank French Halo Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (79, 18, 26.3673611, N'Petite French Set Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (80, 24, 23.3386784, N'Vintage Hidden Halo Classic Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (81, 18, 22.26973, N'Heirloom Milgrain Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (82, 24, 33.84999, N'Infinity Winding Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (83, 18, 23.16052, N'Fine Line Marquise Three Stone Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (84, 24, 29.217886, N'Four Points Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (85, 18, 19.9536781, N'Vintage Art Deco Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (86, 24, 23.8731518, N'Tapered Halo Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (87, 18, 23.3386784, N'Cluster Side Stone Diamond Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (88, 18, 22.6260471, N'Cathedral Halo Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (89, 24, 9.798681, N'Tulip Basket Cathedral Classic Solitaire Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (90, 24, 18.3502579, N'Vintage Knife Edge Side Stone Kite Set Engagement Ring', 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (91, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (92, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (93, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (94, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (95, 18, 29.0397282, N'The Frick Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (96, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (97, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (98, 24, 33.3155174, N'Opulent Classic Pear Trio Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (99, 24, 39.3728828, N'Contemporary Halo Engagement Ring', 3, 4)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (100, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (101, 18, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (102, 18, 31.1776218, N'Twisted Shank Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (103, 24, 40.9763031, N'The Gansevoort Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (104, 24, 39.3728828, N'Fancy Cut Side Stone with Bridge Accent Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (105, 24, 26.3673611, N'Pave Halo Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (106, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (107, 24, 24.585783, N'Diamond Pave Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (108, 24, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (109, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (110, 18, 57.3668251, N'The Fulton Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (111, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (112, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (113, 18, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (114, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (115, 24, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (116, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (117, 18, 85.51576, N'The Carnegie Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (118, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (119, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (120, 24, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (121, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (122, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (123, 18, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (124, 24, 67.69998, N'The Sutton Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (125, 18, 66.09656, N'The Roosevelt Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (126, 24, 65.20577, N'The Varick Ring', 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (127, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (128, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (129, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (130, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (131, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (132, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (133, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (134, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (135, 18, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (136, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (137, 24, 67.69998, N'The Sutton Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (138, 18, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (139, 24, 25.2984142, N'Trio Cluster Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (140, 24, 18.8847313, N'Vintage Celtic Engraved Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (141, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (142, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (143, 18, 35.63157, N'Channel Set Princess Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (144, 24, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (145, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (146, 18, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (147, 24, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (148, 18, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (149, 24, 26.3673611, N'Vine Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (150, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (151, 18, 35.63157, N'Channel Set Princess Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (152, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (153, 24, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (154, 18, 30.46499, N'French Set Diamond Basket Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (155, 18, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (156, 18, 21.022625, N'Classic Hidden Halo Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (157, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (158, 18, 24.585783, N'Diamond Pave Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (159, 18, 34.5626221, N'Royal Twist Hidden Halo Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (160, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (161, 18, 43.826828, N'Braided Twist Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (162, 18, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (163, 18, 32.42473, N'Slender Vine Six Prong Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (164, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (165, 24, 21.5570984, N'Vintage Glamour Twisted Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (166, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (167, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (168, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (169, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (170, 18, 24.76394, N'Vintage Glamour Ribbon Swirl Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (171, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (172, 24, 25.2984142, N'Trio Cluster Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (173, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (174, 24, 47.5681458, N'The Park Avenue Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (175, 18, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (176, 18, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (177, 18, 35.45341, N'Elegance Trillion Three Stone Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (178, 18, 33.4936752, N'Glamorous Fancy Side Stone Hidden Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (179, 18, 39.3728828, N'Contemporary Halo Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (180, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (181, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (182, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (183, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (184, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (185, 24, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (186, 18, 53.80367, N'The Central Park Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (187, 24, 54.5163, N'Scalloped Pear Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (188, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (189, 24, 25.476572, N'Elegance Split Shank Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (190, 24, 24.585783, N'Diamond Pave Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (191, 24, 19.77552, N'6 Claw Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (192, 18, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (193, 18, 44.0049858, N'Knife Edge Scalloped Hidden Halo Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (194, 24, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (195, 24, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (196, 18, 42.2234077, N'Three Row Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (197, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (198, 24, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (199, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 3, 10)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (200, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (201, 18, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (202, 18, 26.3673611, N'Vine Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (203, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (204, 18, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (205, 24, 42.04525, N'Three Row Micro Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (206, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (207, 18, 24.585783, N'Diamond Pave Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (208, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (209, 18, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (210, 18, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (211, 18, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (212, 24, 42.2234077, N'Three Row Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (213, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (214, 24, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (215, 24, 29.0397282, N'Elegance Side-Stone with Hidden Halo Engagement Ring', 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [accessory_type_id], [shape_id]) VALUES (216, 18, 38.12578, N'Pave Scalloped Hidden Halo Engagement Ring', 3, 10)
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
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (55, N'https://www.withclarity.com/cdn/shop/products/RB1502007-ROUND-YELLOW-FRONTVIEW_52a52033-b87e-47b7-91d6-b4e2a1faf99b_800x.jpg?v=1690889930', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (56, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644794', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (57, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644794', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (58, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644794', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (59, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-ROUND-FRONTVIEW_800x.jpg?v=1701056784', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (60, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-ROUND-SIDEVIEW_800x.jpg?v=1701056784', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (61, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-ROUND-PROFILEVIEW_800x.jpg?v=1701056784', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (62, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-frontview_800x.jpg?v=1684023223', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (63, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-sideview_800x.jpg?v=1684023223', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (64, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-profileview_800x.jpg?v=1684023223', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (65, N'https://www.withclarity.com/cdn/shop/products/RB1501791-ROUND-YELLOW-FRONTVIEW_100ca641-2d69-4cf3-a151-d62044d7db9f_800x.jpg?v=1688387747', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (66, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872821', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (67, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872821', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (68, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872821', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (69, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (70, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (71, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (72, N'https://www.withclarity.com/cdn/shop/files/RB1501088-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_408769b9-103e-4e64-b1db-95222bff95b4_800x.jpg?v=1702874407', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (73, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-round-yellow-frontview_eca75500-55fe-48a4-a1bd-3b5cb5789fda_800x.jpg?v=1684010489', 47)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (74, N'https://www.withclarity.com/cdn/shop/products/RB1501699-ROUND-YELLOW-FRONTVIEW_a40a74a1-bfd1-4530-b0c5-0925953f5647_800x.jpg?v=1690201533', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (75, N'https://www.withclarity.com/cdn/shop/files/RB1500082-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_800x.jpg?v=1702640869', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (76, N'https://www.withclarity.com/cdn/shop/files/RB1500082-ROUND-US7.0-2.50CT-YELLOW-SIDEVIEW_800x.jpg?v=1702640869', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (77, N'https://www.withclarity.com/cdn/shop/files/RB1500082-ROUND-US7.0-2.50CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702640869', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (78, N'https://www.withclarity.com/cdn/shop/products/ens1147-round-yellow-frontview_256b69ed-e5fd-4f4c-805b-ddc3e99b1113_800x.jpg?v=1684007718', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (79, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-frontview_800x.jpg?v=1684024555', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (80, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-sideview_800x.jpg?v=1684024555', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (81, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-profileview_800x.jpg?v=1684024555', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (82, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-frontview_800x.jpg?v=1684488384', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (83, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-sideview_800x.jpg?v=1684488384', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (84, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-profileview_800x.jpg?v=1684488384', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (85, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (86, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (87, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (88, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (89, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (90, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (91, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-frontview_800x.jpg?v=1684020012', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (92, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-sideview_800x.jpg?v=1684020012', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (93, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-profileview_800x.jpg?v=1684020012', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (94, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (95, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (96, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (97, N'https://www.withclarity.com/cdn/shop/products/RB1502007-EMERALD-YELLOW-FRONTVIEW_6d80b92d-5329-4306-ae40-78937aeaf173_800x.jpg?v=1690889930', 57)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (98, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-emerald-yellow-frontview_e167b778-d365-453b-b347-64355b1117d6_800x.jpg?v=1684027802', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (99, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-emerald-yellow-frontview_800x.jpg?v=1701056784', 59)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (100, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-emerald-yellow-sideview_800x.jpg?v=1701056784', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (101, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-emerald-yellow-profileview_800x.jpg?v=1701056784', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (102, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-frontview_800x.jpg?v=1684023223', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (103, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-sideview_800x.jpg?v=1684023223', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (104, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-profileview_800x.jpg?v=1684023223', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (105, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (106, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (107, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (108, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-frontview_800x.jpg?v=1684000196', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (109, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-sideview_800x.jpg?v=1684000196', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (110, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-profileview_800x.jpg?v=1684000196', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (111, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (112, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (113, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (114, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-frontview_800x.jpg?v=1684015837', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (115, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-sideview_800x.jpg?v=1684015837', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (116, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-profileview_800x.jpg?v=1684015837', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (117, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-emerald-yellow-frontview_5ea56f03-28f0-436c-a24b-3d2beaf7d9b5_800x.jpg?v=1684010489', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (118, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-emerald-yellow-frontview_7b548c8b-b2f8-4b58-9d00-4ecee66cb6a5_800x.jpg?v=1702640869', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (119, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-frontview_800x.jpg?v=1684007718', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (120, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-sideview_800x.jpg?v=1684007718', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (121, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-profileview_800x.jpg?v=1684007718', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (122, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (123, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (124, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (125, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686128196', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (126, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686128196', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (127, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686128196', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (128, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686826295', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (129, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686826295', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (130, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686826295', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (131, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-frontview_800x.jpg?v=1684015552', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (132, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-sideview_800x.jpg?v=1684015552', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (133, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-profileview_800x.jpg?v=1684015552', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (134, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114790', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (135, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114790', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (136, N'https://www.withclarity.com/cdn/shop/products/RB1501876-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114790', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (137, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-heart-yellow-frontview_30e0e9ba-1456-41af-91cf-559bc1549c53_800x.jpg?v=1684027802', 73)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (138, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-heart-yellow-frontview_03dde7d9-b016-486c-84a0-680f2173e703_800x.jpg?v=1702640869', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (139, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-frontview_800x.jpg?v=1684024555', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (140, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-sideview_800x.jpg?v=1684024555', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (141, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-profileview_800x.jpg?v=1684024555', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (142, N'https://www.withclarity.com/cdn/shop/products/enrrb1501086-heart-yellow-frontview_6b79560a-8c96-4c61-ab6b-9caf792a4412_800x.jpg?v=1684008857', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (143, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (144, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (145, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (146, N'https://www.withclarity.com/cdn/shop/products/ens4125-heart-yellow-frontview_410ef4c4-f86b-4201-a1c0-a0972d07e4ce_800x.jpg?v=1683999062', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (147, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-frontview_800x.jpg?v=1698665519', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (148, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-sideview_800x.jpg?v=1698665519', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (149, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-profileview_800x.jpg?v=1698665519', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (150, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-frontview_800x.jpg?v=1684001733', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (151, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-sideview_800x.jpg?v=1684001733', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (152, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-profileview_800x.jpg?v=1684001733', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (153, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-frontview_800x.jpg?v=1684002653', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (154, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-sideview_800x.jpg?v=1684002653', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (155, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-profileview_800x.jpg?v=1684002653', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (156, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-FRONTVIEW_800x.jpg?v=1691757231', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (157, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-SIDEVIEW_800x.jpg?v=1691757231', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (158, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-PROFILEVIEW_800x.jpg?v=1691757231', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (159, N'https://www.withclarity.com/cdn/shop/products/enrrb1500601-heart-yellow-frontview_ecab8ea2-d503-4c50-81b2-7bf223e10cac_800x.jpg?v=1684002886', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (160, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-frontview_800x.jpg?v=1684007214', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (161, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-sideview_800x.jpg?v=1684007214', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (162, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-profileview_800x.jpg?v=1684007214', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (163, N'https://www.withclarity.com/cdn/shop/products/enrrb1500108-heart-yellow-frontview_d4c12616-0278-4878-b69d-e04986f63d11_800x.jpg?v=1684002171', 85)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (164, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-frontview_800x.jpg?v=1684024398', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (165, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-sideview_800x.jpg?v=1684024398', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (166, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-profileview_800x.jpg?v=1684024398', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (167, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-frontview_800x.jpg?v=1684025003', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (168, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-sideview_800x.jpg?v=1684025003', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (169, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-profileview_800x.jpg?v=1684025003', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (170, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-frontview_800x.jpg?v=1684025822', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (171, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-sideview_800x.jpg?v=1684025822', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (172, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-profileview_800x.jpg?v=1684025822', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (173, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-frontview_800x.jpg?v=1696851926', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (174, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-sideview_800x.jpg?v=1696851926', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (175, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-profileview_800x.jpg?v=1696851926', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (176, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-frontview_800x.jpg?v=1684003323', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (177, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-sideview_800x.jpg?v=1684003323', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (178, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-profileview_800x.jpg?v=1684003323', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (179, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (180, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (181, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1692791490', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (182, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-frontview_800x.jpg?v=1684000196', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (183, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-sideview_800x.jpg?v=1684000196', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (184, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-profileview_800x.jpg?v=1684000196', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (185, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-pear-yellow-frontview_23ee3e3a-ac6f-4225-b11e-153cd88b2e9e_800x.jpg?v=1684010489', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (186, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-pear-yellow-frontview_ea9a4e87-9dab-4595-8ac7-0807a29c843a_800x.jpg?v=1702640869', 94)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (187, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-FRONTVIEW_800x.jpg?v=1688104427', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (188, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-SIDEVIEW_800x.jpg?v=1688104427', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (189, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-PROFILEVIEW_800x.jpg?v=1688104427', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (190, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-frontview_800x.jpg?v=1684003696', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (191, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-sideview_800x.jpg?v=1684003696', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (192, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-profileview_800x.jpg?v=1684003696', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (193, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-frontview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (194, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-sideview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (195, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-profileview_800x.jpg?v=1696413352', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (196, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1709114842', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (197, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1709114842', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (198, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1709114842', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (199, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-pear-yellow-frontview_7f786c4f-a395-46a0-96f6-3a34589afe38_800x.jpg?v=1684008700', 99)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (200, N'https://www.withclarity.com/cdn/shop/products/ens1100-pear-yellow-frontview_b7aa7c89-76ab-4680-97a2-ffaa20027a53_800x.jpg?v=1698729076', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (201, N'https://www.withclarity.com/cdn/shop/products/ens3012-pear-yellow-frontview_800x.jpg?v=1684008019', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (202, N'https://www.withclarity.com/cdn/shop/products/ens3012-pear-yellow-sideview_800x.jpg?v=1684008019', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (203, N'https://www.withclarity.com/cdn/shop/products/ens3012-pear-yellow-profileview_800x.jpg?v=1684008019', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (204, N'https://www.withclarity.com/cdn/shop/products/enrrb1500981-pear-yellow-frontview_800x.jpg?v=1684006077', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (205, N'https://www.withclarity.com/cdn/shop/products/enrrb1500981-pear-yellow-sideview_800x.jpg?v=1684006077', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (206, N'https://www.withclarity.com/cdn/shop/products/enrrb1500981-pear-yellow-profileview_800x.jpg?v=1684006077', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (207, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1689842083', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (208, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1689842083', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (209, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1689842083', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (210, N'https://www.withclarity.com/cdn/shop/products/RB1501786-PEAR-YELLOW-FRONTVIEW_3131d2d5-30c6-4f01-be08-8b69083d4bf1_800x.jpg?v=1696575616', 104)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (211, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-frontview_800x.jpg?v=1684026208', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (212, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-sideview_800x.jpg?v=1684026208', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (213, N'https://www.withclarity.com/cdn/shop/products/ens1161-pear-yellow-profileview_800x.jpg?v=1684026208', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (214, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (215, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (216, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (217, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-frontview_800x.jpg?v=1684027472', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (218, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-sideview_800x.jpg?v=1684027472', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (219, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-profileview_800x.jpg?v=1684027472', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (220, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1707916887', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (221, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1707916887', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (222, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1707916887', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (223, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-frontview_800x.jpg?v=1684020012', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (224, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-sideview_800x.jpg?v=1684020012', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (225, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-profileview_800x.jpg?v=1684020012', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (226, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (227, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (228, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (229, N'https://www.withclarity.com/cdn/shop/products/RB1502007-OVAL-YELLOW-FRONTVIEW_32e9dc9c-bac6-418d-ae7c-d2429a42488e_800x.jpg?v=1690889930', 111)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (230, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644755', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (231, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644755', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (232, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644755', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (233, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-OVAL-FRONTVIEW_800x.jpg?v=1701056784', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (234, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-OVAL-SIDEVIEW_800x.jpg?v=1701056784', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (235, N'https://www.withclarity.com/cdn/shop/files/RB1500083-YELLOW-OVAL-PROFILEVIEW_800x.jpg?v=1701056784', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (236, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-frontview_800x.jpg?v=1684023223', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (237, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-sideview_800x.jpg?v=1684023223', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (238, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-profileview_800x.jpg?v=1684023223', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (239, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (240, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (241, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (242, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872863', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (243, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872863', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (244, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872863', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (245, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (246, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (247, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (248, N'https://www.withclarity.com/cdn/shop/files/RB1501088-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_e376c0fd-ed17-4b49-910f-6d742857e39a_800x.jpg?v=1702874875', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (249, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-oval-yellow-frontview_77d87f4f-70fb-4775-bf42-144c07e2c29c_800x.jpg?v=1684010489', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (250, N'https://www.withclarity.com/cdn/shop/products/RB1501699-OVAL-YELLOW-FRONTVIEW_9f4f007a-b539-4b64-a21e-f2b237e16886_800x.jpg?v=1690201533', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (251, N'https://www.withclarity.com/cdn/shop/files/RB1500082OVALUS7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702640869', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (252, N'https://www.withclarity.com/cdn/shop/files/RB1500082OVALUS7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702640869', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (253, N'https://www.withclarity.com/cdn/shop/files/RB1500082OVALUS7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702640869', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (254, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-frontview_800x.jpg?v=1684007718', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (255, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-sideview_800x.jpg?v=1684007718', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (256, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-profileview_800x.jpg?v=1684007718', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (257, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-frontview_800x.jpg?v=1684024555', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (258, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-sideview_800x.jpg?v=1684024555', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (259, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-profileview_800x.jpg?v=1684024555', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (260, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-frontview_800x.jpg?v=1684488384', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (261, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-sideview_800x.jpg?v=1684488384', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (262, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-profileview_800x.jpg?v=1684488384', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (263, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (264, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (265, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (266, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1686128195', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (267, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1686128195', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (268, N'https://www.withclarity.com/cdn/shop/products/RB1501867-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1686128195', 126)
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
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (279, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-frontview_800x.jpg?v=1684000196', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (280, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-sideview_800x.jpg?v=1684000196', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (281, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-profileview_800x.jpg?v=1684000196', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (282, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-frontview_800x.jpg?v=1684015836', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (283, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-sideview_800x.jpg?v=1684015836', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (284, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-profileview_800x.jpg?v=1684015836', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (285, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-cushion-yellow-frontview_3cfcadbb-4fcc-462a-b259-7cdf2fc7a039_800x.jpg?v=1684010489', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (286, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-cushion-yellow-frontview_3f0054c9-ad5a-49de-8a8c-c118894f6642_800x.jpg?v=1702640869', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (287, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-frontview_800x.jpg?v=1684007718', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (288, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-sideview_800x.jpg?v=1684007718', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (289, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-profileview_800x.jpg?v=1684007718', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (290, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-frontview_800x.jpg?v=1684024555', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (291, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-sideview_800x.jpg?v=1684024555', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (292, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-profileview_800x.jpg?v=1684024555', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (293, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-frontview_800x.jpg?v=1684488384', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (294, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-sideview_800x.jpg?v=1684488384', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (295, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-profileview_800x.jpg?v=1684488384', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (296, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (297, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (298, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (299, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-frontview_800x.jpg?v=1684015552', 139)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (300, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-sideview_800x.jpg?v=1684015552', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (301, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-profileview_800x.jpg?v=1684015552', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (302, N'https://www.withclarity.com/cdn/shop/products/enrrb1500156-cushion-yellow-frontview_1838365b-5bff-45fe-9680-698ecf2f8564_800x.jpg?v=1684001976', 140)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (303, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-frontview_800x.jpg?v=1684003696', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (304, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-sideview_800x.jpg?v=1684003696', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (305, N'https://www.withclarity.com/cdn/shop/products/ens4100-cushion-yellow-profileview_800x.jpg?v=1684003696', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (306, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-frontview_800x.jpg?v=1696413352', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (307, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-sideview_800x.jpg?v=1696413352', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (308, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-cushion-yellow-profileview_800x.jpg?v=1696413352', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (309, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-frontview_800x.jpg?v=1684733093', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (310, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-sideview_800x.jpg?v=1684733093', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (311, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-profileview_800x.jpg?v=1684733093', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (312, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-frontview_800x.jpg?v=1684022961', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (313, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-sideview_800x.jpg?v=1684022961', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (314, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-profileview_800x.jpg?v=1684022961', 144)
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
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (332, N'https://www.withclarity.com/cdn/shop/products/ens1100-princess-yellow-frontview_7146b479-24a9-4d42-9da2-d4568665b547_800x.jpg?v=1698729076', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (333, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1692938717', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (334, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1692938717', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (335, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1692938717', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (336, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-frontview_800x.jpg?v=1684007073', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (337, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-sideview_800x.jpg?v=1684007073', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (338, N'https://www.withclarity.com/cdn/shop/products/ens4101-princess-yellow-profileview_800x.jpg?v=1684007073', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (339, N'https://www.withclarity.com/cdn/shop/products/ens3012-princess-yellow-frontview_800x.jpg?v=1684008019', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (340, N'https://www.withclarity.com/cdn/shop/products/ens3012-princess-yellow-sideview_800x.jpg?v=1684008019', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (341, N'https://www.withclarity.com/cdn/shop/products/ens3012-princess-yellow-profileview_800x.jpg?v=1684008019', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (342, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-frontview_800x.jpg?v=1684013310', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (343, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-sideview_800x.jpg?v=1684013310', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (344, N'https://www.withclarity.com/cdn/shop/products/enrrb1500909-princess-yellow-profileview_800x.jpg?v=1684013310', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (345, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-frontview_800x.jpg?v=1702642290', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (346, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-sideview_800x.jpg?v=1702642290', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (347, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-profileview_800x.jpg?v=1702642290', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (348, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-frontview_800x.jpg?v=1684027472', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (349, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-sideview_800x.jpg?v=1684027472', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (350, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-profileview_800x.jpg?v=1684027472', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (351, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1709114738', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (352, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1709114738', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (353, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1709114738', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (354, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-frontview_800x.jpg?v=1707916887', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (355, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-sideview_800x.jpg?v=1707916887', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (356, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-profileview_800x.jpg?v=1707916887', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (357, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-frontview_800x.jpg?v=1684025123', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (358, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-sideview_800x.jpg?v=1684025123', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (359, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-profileview_800x.jpg?v=1684025123', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (360, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-frontview_800x.jpg?v=1698668120', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (361, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-sideview_800x.jpg?v=1698668120', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (362, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-profileview_800x.jpg?v=1698668120', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (363, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-frontview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (364, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-sideview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (365, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-profileview_800x.jpg?v=1684020011', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (366, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-radiant-yellow-frontview_f563a058-ce34-4c01-a199-3d42007e886b_800x.jpg?v=1684027801', 164)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (367, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-radiant-yellow-frontview_800x.jpg?v=1701056784', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (368, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-radiant-yellow-sideview_800x.jpg?v=1701056784', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (369, N'https://www.withclarity.com/cdn/shop/products/enrrb1500083-radiant-yellow-profileview_800x.jpg?v=1701056784', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (370, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-frontview_800x.jpg?v=1684023223', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (371, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-sideview_800x.jpg?v=1684023223', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (372, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-profileview_800x.jpg?v=1684023223', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (373, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-frontview_800x.jpg?v=1684000196', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (374, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-sideview_800x.jpg?v=1684000196', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (375, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-profileview_800x.jpg?v=1684000196', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (376, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-frontview_800x.jpg?v=1684015836', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (377, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-sideview_800x.jpg?v=1684015836', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (378, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-profileview_800x.jpg?v=1684015836', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (379, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-radiant-yellow-frontview_e4d9c7a2-918f-4afc-a387-643002608407_800x.jpg?v=1684010489', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (380, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-radiant-yellow-frontview_8e35c4e4-d5d7-4acb-8f92-930bc4f8d0f0_800x.jpg?v=1702640869', 170)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (381, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-frontview_800x.jpg?v=1684007718', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (382, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-sideview_800x.jpg?v=1684007718', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (383, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-profileview_800x.jpg?v=1684007718', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (384, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-frontview_800x.jpg?v=1684015552', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (385, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-sideview_800x.jpg?v=1684015552', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (386, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-profileview_800x.jpg?v=1684015552', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (387, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-frontview_800x.jpg?v=1684003696', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (388, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-sideview_800x.jpg?v=1684003696', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (389, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-profileview_800x.jpg?v=1684003696', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (390, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1691477908', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (391, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1691477908', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (392, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1691477908', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (393, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-frontview_800x.jpg?v=1696413352', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (394, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-sideview_800x.jpg?v=1696413352', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (395, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-radiant-yellow-profileview_800x.jpg?v=1696413352', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (396, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-frontview_800x.jpg?v=1684022961', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (397, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-sideview_800x.jpg?v=1684022961', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (398, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-profileview_800x.jpg?v=1684022961', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (399, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1693895169', 177)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (400, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1693895169', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (401, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1693895169', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (402, N'https://www.withclarity.com/cdn/shop/products/enrrb1501017-radiant-yellow-frontview_087c1284-fd4a-4f49-be10-ecfceb3803af_800x.jpg?v=1684019047', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (403, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-radiant-yellow-frontview_00558550-6d87-4d37-9678-da8ab6aac790_800x.jpg?v=1684008700', 179)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (404, N'https://www.withclarity.com/cdn/shop/products/ens1100-radiant-yellow-frontview_691ecc92-74ed-4786-bd88-34e59ed6f9a3_800x.jpg?v=1698729076', 180)
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
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (415, N'https://www.withclarity.com/cdn/shop/products/ens3012-marquise-yellow-frontview_800x.jpg?v=1684008019', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (416, N'https://www.withclarity.com/cdn/shop/products/ens3012-marquise-yellow-sideview_800x.jpg?v=1684008019', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (417, N'https://www.withclarity.com/cdn/shop/products/ens3012-marquise-yellow-profileview_800x.jpg?v=1684008019', 185)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (418, N'https://www.withclarity.com/cdn/shop/products/RB1501850-marquise-yellow-frontview_35afbad7-fcd7-4c02-808f-ee793e1d64f6_800x.jpg?v=1687261230', 186)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (419, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1697026088', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (420, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1697026088', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (421, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1697026088', 187)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (422, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (423, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (424, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 188)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (425, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1689659699', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (426, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1689659699', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (427, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1689659699', 189)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (428, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-frontview_800x.jpg?v=1684027473', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (429, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-sideview_800x.jpg?v=1684027473', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (430, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-profileview_800x.jpg?v=1684027473', 190)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (431, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-frontview_800x.jpg?v=1684010573', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (432, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-sideview_800x.jpg?v=1684010573', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (433, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-profileview_800x.jpg?v=1684010573', 191)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (434, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (435, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (436, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 192)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (437, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1696929172', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (438, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1696929172', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (439, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1696929172', 193)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (440, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-frontview_800x.jpg?v=1684001288', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (441, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-sideview_800x.jpg?v=1684001288', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (442, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-profileview_800x.jpg?v=1684001288', 194)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (443, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-frontview_800x.jpg?v=1684030757', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (444, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-sideview_800x.jpg?v=1684030757', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (445, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-profileview_800x.jpg?v=1684030757', 195)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (446, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-frontview_800x.jpg?v=1684008173', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (447, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-sideview_800x.jpg?v=1684008173', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (448, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-profileview_800x.jpg?v=1684008173', 196)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (449, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-frontview_800x.jpg?v=1684026564', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (450, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-sideview_800x.jpg?v=1684026564', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (451, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-profileview_800x.jpg?v=1684026564', 197)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (452, N'https://www.withclarity.com/cdn/shop/products/RB1501247-marquise-yellow-frontview_eaaa5399-6888-4609-bd0d-00ece005c640_800x.jpg?v=1684030448', 198)
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
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (467, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-frontview_800x.jpg?v=1684008019', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (468, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-sideview_800x.jpg?v=1684008019', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (469, N'https://www.withclarity.com/cdn/shop/products/ens3012-asscher-yellow-profileview_800x.jpg?v=1684008019', 205)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (470, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (471, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (472, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 206)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (473, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-frontview_800x.jpg?v=1684027472', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (474, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-sideview_800x.jpg?v=1684027472', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (475, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-profileview_800x.jpg?v=1684027472', 207)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (476, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-frontview_800x.jpg?v=1707916887', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (477, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-sideview_800x.jpg?v=1707916887', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (478, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-profileview_800x.jpg?v=1707916887', 208)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (479, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-frontview_800x.jpg?v=1698668120', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (480, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-sideview_800x.jpg?v=1698668120', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (481, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-profileview_800x.jpg?v=1698668120', 209)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (482, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-frontview_800x.jpg?v=1684001288', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (483, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-sideview_800x.jpg?v=1684001288', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (484, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-profileview_800x.jpg?v=1684001288', 210)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (485, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-frontview_800x.jpg?v=1684030756', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (486, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-sideview_800x.jpg?v=1684030756', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (487, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-profileview_800x.jpg?v=1684030756', 211)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (488, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-frontview_800x.jpg?v=1684008173', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (489, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-sideview_800x.jpg?v=1684008173', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (490, N'https://www.withclarity.com/cdn/shop/products/ens1111-asscher-yellow-profileview_800x.jpg?v=1684008173', 212)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (491, N'https://www.withclarity.com/cdn/shop/products/ens4139-asscher-yellow-frontview_ae9f1dcf-8b60-4f63-85af-a9acc9df928d_800x.jpg?v=1684026564', 213)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (492, N'https://www.withclarity.com/cdn/shop/products/RB1501247-asscher-yellow-frontview_0fe18450-84e3-4fdd-a921-ca8a44a57044_800x.jpg?v=1684030447', 214)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (493, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (494, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (495, N'https://www.withclarity.com/cdn/shop/products/RB1501998-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1696489044', 215)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (496, N'https://www.withclarity.com/cdn/shop/products/RB1502102-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1707200019', 216)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (497, N'https://www.withclarity.com/cdn/shop/products/RB1502102-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1707200019', 216)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (498, N'https://www.withclarity.com/cdn/shop/products/RB1502102-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1707200019', 216)
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

INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (1, N'Customer', 1, N'ToiLaCustomer', N'customer@gmail.com', N'+Gw0u+tVbdGDjb3+iTErXQ==:/oswumn9SKJc/gy6o/0MhSMpdHZK0VSsj9ge/c61wwc=', N'0123456789', N'120 ABC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-05-30T08:55:12.4089553' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (2, N'SaleStaff', 2, N'ToiLaSaleStaff', N'sale_staff@gmail.com', N'PnfhsjHxCPxgc5Xh7VCf9A==:uBCNzSMK0MTyvCSs0w7KbWL8UF6S+q5NbjwgUPpMqck=', N'0123456785', N'23 AC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-05-30T08:55:12.4097007' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (3, N'DeliveryStaff', 3, N'ToiLaDeliverystaff', N'delivery_staff@gmail.com', N'RQWmfy5NlYc8oNJdFW8SiQ==:lL99G2CS+z/+C2DeJuaTtaFCCNSAJMs+oszF9L9bQlI=', N'0123456783', N'12 BC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-05-30T08:55:12.4097066' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (4, N'Manager', 5, N'ToiLaManager', N'manager@gmail.com', N'NjM2m/SxImU5u9KMecXfNw==:u3KwH8c+V/RWMQtyLqkPIvNVviItRzpGTPQtlV395Ak=', N'0123456789', N'13 AC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-05-30T08:55:12.4097070' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (5, N'Administrator', 6, N'ToiLaAdministrator', N'administrator@gmail.com', N'/3mQ4ZD9sKzRm6xwwKPlHw==:4iMfGMVIOm/I10YZKvyIPx0HTpeow8Upkug6FFa1vGM=', N'0123456789', N'213 BAC Street', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Other', 0, CAST(N'2024-05-30T08:55:12.4097074' AS DateTime2))
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond] ON 

INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (1, N'IGI', 615380399, N'https://www.igi.org/verify-your-report/?r=615380399', N'https://video.diamondasset.in:8080/imagesM/632443228.jpg', 3.03, N'Ideal', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (2, N'IGI', 618491447, N'https://www.igi.org/verify-your-report/?r=618491447', N'https://video.diamondasset.in:8080/imagesM/631455159.jpg', 3.02, N'Ideal', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (3, N'IGI', 620489774, N'https://www.igi.org/verify-your-report/?r=620489774', N'https://video.diamondasset.in:8080/imagesM/632416490.jpg', 3.01, N'Excellent', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (4, N'IGI', 620455816, N'https://www.igi.org/verify-your-report/?r=620455816', N'https://magnifier.s3.us-west-1.amazonaws.com/5493332667.jpg', 3.08, N'Ideal', N'E', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (5, N'IGI', 559293546, N'https://www.igi.org/verify-your-report/?r=559293546', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/559293546.jpg?v=1673429200', 2.54, N'Ideal', N'G', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (6, N'IGI', 561266671, N'https://www.igi.org/verify-your-report/?r=561266671', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/561266671.jpg?v=1673445176', 2.52, N'Ideal', N'F', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (7, N'IGI', 559278351, N'https://www.igi.org/verify-your-report/?r=559278351', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/559278351.jpg?v=1673945752', 1.26, N'Ideal', N'E', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (8, N'IGI', 567357809, N'https://www.igi.org/verify-your-report/?r=567357809', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/567357809.jpg?v=1676382181', 1.2, N'Ideal', N'G', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (9, N'IGI', 570354956, N'https://www.igi.org/verify-your-report/?r=570354956', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/570354956.jpg?v=1678715870', 1.06, N'Ideal', N'E', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (10, N'IGI', 570336841, N'https://www.igi.org/verify-your-report/?r=570336841', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/570336841.jpg?v=1680167685', 1.55, N'Ideal', N'H', N'VS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (11, N'IGI', 573311912, N'https://www.igi.org/verify-your-report/?r=573311912', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/573311912.jpg?v=1680587639', 1.28, N'Ideal', N'F', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (12, N'IGI', 573317197, N'https://www.igi.org/verify-your-report/?r=573317197', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/573317197.jpg?v=1680587658', 1.32, N'Ideal', N'F', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (13, N'IGI', 573310739, N'https://www.igi.org/verify-your-report/?r=573310739', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/573310739.jpg?v=1680701095', 1.18, N'Ideal', N'F', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (14, N'IGI', 573310688, N'https://www.igi.org/verify-your-report/?r=573310688', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/573310688.jpg?v=1680701095', 1.27, N'Ideal', N'F', N'VVS2', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (15, N'IGI', 557240917, N'https://www.igi.org/verify-your-report/?r=557240917', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/557240917.jpg?v=1681119782', 1.57, N'Ideal', N'H', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (16, N'IGI', 560244866, N'https://www.igi.org/verify-your-report/?r=560244866', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/560244866.jpg?v=1681119782', 1.65, N'Ideal', N'H', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (17, N'IGI', 585399672, N'https://www.igi.org/verify-your-report/?r=585399672', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/585359962.jpg?v=1688635631', 2.27, N'Excellent', N'D', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (18, N'IGI', 591345465, N'https://www.igi.org/verify-your-report/?r=591345465', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/591345465.jpg?v=1692688339', 2.04, N'Excellent', N'F', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (19, N'IGI', 592347424, N'https://www.igi.org/verify-your-report/?r=592347424', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/592347424.jpg?v=1692688340', 2.05, N'Excellent', N'F', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (20, N'IGI', 598324540, N'https://www.igi.org/verify-your-report/?r=598324540', N'https://cdn.shopify.com/s/files/1/0590/2630/9278/files/598324540.jpg?v=1696588461', 2.05, N'Excellent', N'D', N'VVS1', N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (21, N'IGI', 618466200, N'https://www.igi.org/verify-your-report/?r=618466200', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e8f12212-9e81-4b63-88be-e66c0ce4d704.jpg', 0.54, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (22, N'IGI', 614303223, N'https://www.igi.org/verify-your-report/?r=614303223', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e94cc0b9-b45a-4b48-8daf-cca267f64d83.jpg', 0.54, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (23, N'IGI', 629421232, N'https://www.igi.org/verify-your-report/?r=629421232', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e12f9cac-ddb0-4300-a35b-dc2a45b604a3.jpg', 0.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (24, N'IGI', 627442214, N'https://www.igi.org/verify-your-report/?r=627442214', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/05a57a0d-cfad-4abf-8009-d8564b58eaaf.jpg', 0.61, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (25, N'IGI', 632469076, N'https://www.igi.org/verify-your-report/?r=632469076', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/109eaa64-465d-4a3e-bb63-e2fcf4c59bcd.jpg', 0.66, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (26, N'IGI', 618466201, N'https://www.igi.org/verify-your-report/?r=618466201', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ff400ba8-7145-450d-9999-fad7581f04c5.jpg', 0.74, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (27, N'IGI', 623438859, N'https://www.igi.org/verify-your-report/?r=623438859', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/025661ff-f10e-4b32-94af-3e77f07fcbdf.jpg', 0.74, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (28, N'IGI', 623438861, N'https://www.igi.org/verify-your-report/?r=623438861', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/fb4abdae-32c5-4071-905e-f194037c03ca.jpg', 0.75, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (29, N'IGI', 621480441, N'https://www.igi.org/verify-your-report/?r=621480441', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/324aec43-72c3-4ff4-9e99-5ca3f820a2bf.jpg', 0.82, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (30, N'IGI', 622479456, N'https://www.igi.org/verify-your-report/?r=622479456', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b147b79d-56d5-4220-b0f3-930e4aff657e.jpg', 0.97, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (31, N'IGI', 626496155, N'https://www.igi.org/verify-your-report/?r=626496155', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/29141da2-3300-4dae-a943-cd3041193214.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (32, N'IGI', 629468690, N'https://www.igi.org/verify-your-report/?r=629468690', N'https://s3.ap-south-1.amazonaws.com/diadna/viewer4/imaged/L16665/L16665_RI.jpg', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (33, N'IGI', 622460382, N'https://www.igi.org/verify-your-report/?r=622460382', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/65eb3bf7-061a-415d-a92a-bd489bff2f40.jpg', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (34, N'IGI', 598389235, N'https://www.igi.org/verify-your-report/?r=598389235', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2992f68e-77a9-4bb7-8dcc-fd7412e5d5ad.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (35, N'IGI', 607349551, N'https://www.igi.org/verify-your-report/?r=607349551', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/73e9c939-b804-4584-ac50-c6ab83e6888d.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (36, N'IGI', 616423874, N'https://www.igi.org/verify-your-report/?r=616423874', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvNzhkMzRjYjctMTk3ZC00YjA3LTk1MzAtMzYzYzdkZDViOTRmP209YyZjdXM9U01HLWY=/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (37, N'IGI', 617441576, N'https://www.igi.org/verify-your-report/?r=617441576', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4b30d13c-6283-4d20-8a98-73a1a4bbaaa6.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (38, N'GIA', 2494317507, N'https://www.gia.edu/report-check?reportno=2494317507', N'https://lgdus.co/ST24-6129/still.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (39, N'IGI', 617462088, N'https://www.igi.org/verify-your-report/?r=617462088', N'https://s3.ap-south-1.amazonaws.com/diadna/viewer4/imaged/L15061/L15061_RI.jpg', 1.01, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (40, N'IGI', 592360337, N'https://www.igi.org/verify-your-report/?r=592360337', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ca3f7377-0eb9-442d-9dbb-8595209290b4.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (41, N'GIA', 6462277426, N'https://www.gia.edu/report-check?reportno=6462277426', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R42574/still.jpg', 5.3, N'Excellent', N'D', N'FL', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (42, N'IGI', 595398135, N'https://www.igi.org/verify-your-report/?r=595398135', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/de03746b-b839-45f0-befc-d5e4683aabe8.jpg', 0.91, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (43, N'IGI', 595398136, N'https://www.igi.org/verify-your-report/?r=595398136', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/953aabfc-9d1f-4050-a446-6881bbab914b.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (44, N'IGI', 633428104, N'https://www.igi.org/verify-your-report/?r=633428104', N'https://www.diamond360.co.in/imaged/B23289/still.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (45, N'IGI', 625435622, N'https://www.igi.org/verify-your-report/?r=625435622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/dbae6690-9d8f-4123-809c-bf8111bc1222.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (46, N'IGI', 625435620, N'https://www.igi.org/verify-your-report/?r=625435620', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/868d7ad3-4e05-4ba9-a76b-0742759e7dcc.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (47, N'IGI', 561296521, N'https://www.igi.org/verify-your-report/?r=561296521', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwMTIzMTAxMC1SQS0yMDItMDQvZ2VtMzYwLTE5MDEyMzEwMTAtUkEtMjAyLTA0Lmh0bWwtZg==/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (48, N'IGI', 589394516, N'https://www.igi.org/verify-your-report/?r=589394516', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwODIzMTEyNy1SQS00MjEtMzg0L2dlbTM2MC0xOTA4MjMxMTI3LVJBLTQyMS0zODQuaHRtbC1m/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (49, N'IGI', 627428471, N'https://www.igi.org/verify-your-report/?r=627428471', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Heart.jpg?v=1702020829', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (50, N'IGI', 625435623, N'https://www.igi.org/verify-your-report/?r=625435623', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7a4fca2d-3a7e-4c4c-b86b-77e65367fb1c.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (51, N'IGI', 624413790, N'https://www.igi.org/verify-your-report/?r=624413790', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30d8d43f-7a76-40c2-8b31-47036e9b67e6.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (52, N'IGI', 600388680, N'https://www.igi.org/verify-your-report/?r=600388680', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c2315f95-69c0-4499-b3ec-347d1db64e29.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (53, N'IGI', 582360652, N'https://www.igi.org/verify-your-report/?r=582360652', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J1158/still.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (54, N'IGI', 602379806, N'https://www.igi.org/verify-your-report/?r=602379806', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/6a5fcda2-ec27-42ec-8f3f-9894341c86cb.jpg', 1.03, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (55, N'IGI', 596332377, N'https://www.igi.org/verify-your-report/?r=596332377', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7d374114-0032-4713-b4d6-1a54012d0f03.jpg', 1.03, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (56, N'IGI', 625435604, N'https://www.igi.org/verify-your-report/?r=625435604', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/70d63002-01b5-4a68-a2d8-189206094dd9.jpg', 1.04, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (57, N'IGI', 624436406, N'https://www.igi.org/verify-your-report/?r=624436406', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/241ee5de-b81a-4284-88a2-75b490c5e537.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (58, N'IGI', 607371036, N'https://www.igi.org/verify-your-report/?r=607371036', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/215691e1-8dca-4a78-b522-feed519a1429.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (59, N'IGI', 627400392, N'https://www.igi.org/verify-your-report/?r=627400392', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9dda1cdd-4930-472a-89f1-b175cd751138.jpg', 1.04, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (60, N'IGI', 600387940, N'https://www.igi.org/verify-your-report/?r=600387940', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Heart.jpg?v=1702020829', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (61, N'IGI', 630443643, N'https://www.igi.org/verify-your-report/?r=630443643', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cf0aa29-53f0-4604-baf0-7df49cee7a13.jpg', 0.51, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (62, N'IGI', 574354378, N'https://www.igi.org/verify-your-report/?r=574354378', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0375269c-23e7-44c5-8863-1c20f2492db3.jpg', 0.93, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (63, N'IGI', 582363275, N'https://www.igi.org/verify-your-report/?r=582363275', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccf1b020-b774-42b2-8fe1-fdb4dba04598.jpg', 0.95, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (64, N'IGI', 595398132, N'https://www.igi.org/verify-your-report/?r=595398132', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7b728fdc-839e-4dcd-9ca1-71141ad7fb39.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (65, N'IGI', 584389215, N'https://www.igi.org/verify-your-report/?r=584389215', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a5cd8cf0-4fe1-4a5e-83fa-81c0de8410c5.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (66, N'IGI', 591311622, N'https://www.igi.org/verify-your-report/?r=591311622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a834f138-5249-44f3-a976-66f02ae39531.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (67, N'IGI', 574354529, N'https://www.igi.org/verify-your-report/?r=574354529', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3d660846-3d98-4da8-abc1-209aedb80a0c.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (68, N'IGI', 624432989, N'https://www.igi.org/verify-your-report/?r=624432989', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/83b83496-6dab-47e6-bcde-ed62cbfd35e0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (69, N'IGI', 622477843, N'https://www.igi.org/verify-your-report/?r=622477843', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccd4d5eb-53a6-449f-ae90-a91eca915ebf.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (70, N'IGI', 598340263, N'https://www.igi.org/verify-your-report/?r=598340263', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e167cfee-003b-4723-ad64-86fc7956a29a.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (71, N'IGI', 634473966, N'https://www.igi.org/verify-your-report/?r=634473966', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/d40bcacf-e951-45ef-b36a-c85b6a7a4f45.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (72, N'IGI', 611379265, N'https://www.igi.org/verify-your-report/?r=611379265', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/bf531274-d326-4d66-b47a-9ab691b907f1.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (73, N'IGI', 620482463, N'https://www.igi.org/verify-your-report/?r=620482463', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a2f02605-e5e6-4dee-97be-db43f7ecafb3.jpg', 1, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (74, N'IGI', 625491361, N'https://www.igi.org/verify-your-report/?r=625491361', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/40c50a8b-75cd-4e5a-89f1-62a33dc546c3.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (75, N'IGI', 625445703, N'https://www.igi.org/verify-your-report/?r=625445703', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5ba19b66-1538-42b4-ae40-01abbe5dd898.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (76, N'IGI', 627461604, N'https://www.igi.org/verify-your-report/?r=627461604', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4ffef725-58d1-4c81-844e-3841dd11aa41.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (77, N'IGI', 625433228, N'https://www.igi.org/verify-your-report/?r=625433228', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1c0cecbc-1439-44e5-aa51-3867e95211d0.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (78, N'IGI', 630448398, N'https://www.igi.org/verify-your-report/?r=630448398', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/09c5b095-d7db-46b2-bbdf-0b34c27c0c5a.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (79, N'IGI', 600343619, N'https://www.igi.org/verify-your-report/?r=600343619', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/6a6dee34-1b7f-423b-a093-278b4f5049c4.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (80, N'IGI', 625491362, N'https://www.igi.org/verify-your-report/?r=625491362', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9ae8d9ba-12e0-4258-b55a-0ed6e1460960.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (81, N'IGI', 618408894, N'https://www.igi.org/verify-your-report/?r=618408894', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5f245848-e0b9-4c74-9f22-377683daaad2.jpg', 0.52, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (82, N'IGI', 634473523, N'https://www.igi.org/verify-your-report/?r=634473523', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b2c0cfa9-fe3d-4ad8-9f12-072048b1b4c7.jpg', 0.53, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (83, N'IGI', 625411690, N'https://www.igi.org/verify-your-report/?r=625411690', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/55c37418-523a-40c7-ba49-f0fa81c98bdd.jpg', 0.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (84, N'IGI', 634473608, N'https://www.igi.org/verify-your-report/?r=634473608', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5989d831-d34b-47fa-baec-7a5abb77167f.jpg', 0.56, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (85, N'IGI', 631412469, N'https://www.igi.org/verify-your-report/?r=631412469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2f4774c8-97c8-423f-80ff-b26d98c579c3.jpg', 0.61, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (86, N'IGI', 601391171, N'https://www.igi.org/verify-your-report/?r=601391171', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4c7320cf-cc4f-4948-80b7-c93c45675466.jpg', 0.9, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (87, N'IGI', 601391170, N'https://www.igi.org/verify-your-report/?r=601391170', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1b486f75-06c8-4665-bb5f-2c1eb6c2bb2f.jpg', 0.9, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (88, N'IGI', 598364764, N'https://www.igi.org/verify-your-report/?r=598364764', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/d38880ab-0045-4ca5-8b9f-eadb3697b701.jpg', 0.91, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (89, N'IGI', 626461369, N'https://www.igi.org/verify-your-report/?r=626461369', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/fb4f8334-d5e1-4a52-b652-de13a0931141.jpg', 0.92, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (90, N'IGI', 600308326, N'https://www.igi.org/verify-your-report/?r=600308326', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/660c3d15-2d40-4fa3-9fb1-ea758bdab5db.jpg', 0.92, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (91, N'IGI', 611388760, N'https://www.igi.org/verify-your-report/?r=611388760', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/06fe115a-112e-418e-a675-a6bc49ce5d29.jpg', 0.92, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (92, N'IGI', 611388759, N'https://www.igi.org/verify-your-report/?r=611388759', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30ba5959-dab9-4d84-8b52-718f85126c1a.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (93, N'IGI', 598322961, N'https://www.igi.org/verify-your-report/?r=598322961', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e8a83300-22a1-446a-8154-e9eb830fac64.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (94, N'IGI', 601391164, N'https://www.igi.org/verify-your-report/?r=601391164', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/efa4dae4-6a08-49cb-86bb-21bb50debad0.jpg', 0.94, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (95, N'IGI', 605326341, N'https://www.igi.org/verify-your-report/?r=605326341', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/6095907c-94c0-4439-b5cc-8977bfb206ef.jpg', 0.94, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (96, N'IGI', 602310573, N'https://www.igi.org/verify-your-report/?r=602310573', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1320dddf-b1c0-4eef-b398-e922acd723a3.jpg', 0.95, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (97, N'IGI', 616432484, N'https://www.igi.org/verify-your-report/?r=616432484', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b37427aa-2e8b-421a-8d35-e5a117689a60.jpg', 0.96, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (98, N'IGI', 605334477, N'https://www.igi.org/verify-your-report/?r=605334477', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2c5cad16-1bb8-4668-99c8-3853e0fdd22a.jpg', 0.96, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (99, N'IGI', 598303690, N'https://www.igi.org/verify-your-report/?r=598303690', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/613154db-7533-45b2-a408-73fc59595548.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (100, N'IGI', 584376807, N'https://www.igi.org/verify-your-report/?r=584376807', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0754c60b-9e2c-4d03-a35b-ddbea563b679.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (101, N'IGI', 624433053, N'https://www.igi.org/verify-your-report/?r=624433053', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3285c554-3234-464f-a18a-3a4743ce9856.jpg', 0.97, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (102, N'IGI', 624433054, N'https://www.igi.org/verify-your-report/?r=624433054', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c93045cd-5eb2-4e52-8840-0ea37dc47419.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (103, N'IGI', 627400042, N'https://www.igi.org/verify-your-report/?r=627400042', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4d20b790-e258-4a07-9384-ad1758697380.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (104, N'IGI', 625445698, N'https://www.igi.org/verify-your-report/?r=625445698', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7e7462f4-c0ba-4fbe-ae1e-68746ce8a176.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (105, N'IGI', 600397986, N'https://www.igi.org/verify-your-report/?r=600397986', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMTU3YWYxZDAtMmY3MC00MzkzLWI3YzItYjM4MTBlMTA1ODhlP209YyZjdXM9U01HLWY=/0.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (106, N'IGI', 589300247, N'https://www.igi.org/verify-your-report/?r=589300247', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvM2JjYTcyNWItMDc0ZC00ZjVmLTgxNGUtNTI5ZDAwZjIwZjAxP209YyZjdXM9U01HLWY=/0.jpg', 1.01, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (107, N'IGI', 602316890, N'https://www.igi.org/verify-your-report/?r=602316890', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMGY2ZGVmOWUtZTgwNy00YzliLWJmMmMtZGUwNmI0ODQ5ZDdmP209YyZjdXM9U01HLWY=/0.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (108, N'IGI', 627400050, N'https://www.igi.org/verify-your-report/?r=627400050', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cbfbf09-866b-4e33-9392-8064090c54cc.jpg', 1.03, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (109, N'IGI', 625433469, N'https://www.igi.org/verify-your-report/?r=625433469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1cec1f62-c38e-4a83-a4f6-e87e0f32ff97.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (110, N'IGI', 631412485, N'https://www.igi.org/verify-your-report/?r=631412485', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8073a583-98c5-49a9-9a13-6cb88a535880.jpg', 1.29, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (111, N'IGI', 626476954, N'https://www.igi.org/verify-your-report/?r=626476954', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30a6233d-a8c4-4c6b-bc04-810a25910eb7.jpg', 1.35, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (112, N'IGI', 627406174, N'https://www.igi.org/verify-your-report/?r=627406174', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9847be04-4fa7-42bf-bc81-454e1a682fa2.jpg', 1.42, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (113, N'IGI', 627408762, N'https://www.igi.org/verify-your-report/?r=627408762', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/00b5d85b-a453-436f-8437-67981ea8ccc7.jpg', 1.45, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (114, N'IGI', 630443228, N'https://www.igi.org/verify-your-report/?r=630443228', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/340a1812-7514-435c-bf84-acd3c1de374a.jpg', 1.47, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (115, N'IGI', 629434927, N'https://www.igi.org/verify-your-report/?r=629434927', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0f42c519-28dd-404b-aab1-ee39740d33d6.jpg', 1.53, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (116, N'IGI', 629435359, N'https://www.igi.org/verify-your-report/?r=629435359', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a64f96dd-2e84-4471-8bba-a6017f2bf156.jpg', 1.55, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (117, N'GIA', 2496331012, N'https://www.gia.edu/report-check?reportno=2496331012', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/afaa4c17-aee2-46a3-969d-4266cf1d62ae.jpg', 1.56, N'Excellent', N'D', N'IF', N'Very Good', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (118, N'IGI', 629405936, N'https://www.igi.org/verify-your-report/?r=629405936', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/bf94b5bf-bdf1-4d15-b1f5-9599f2b7ada1.jpg', 1.56, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (119, N'IGI', 623421243, N'https://www.igi.org/verify-your-report/?r=623421243', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/031eed36-361e-4742-b3c8-b15a1b4da351.jpg', 1.72, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (120, N'IGI', 624422485, N'https://www.igi.org/verify-your-report/?r=624422485', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2051ee61-6e9c-4d6f-930c-13490f224a80.jpg', 2, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (121, N'IGI', 631409041, N'https://www.igi.org/verify-your-report/?r=631409041', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/27dc257d-5e7c-418a-bfa3-7c5ead477326.jpg', 0.7, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (122, N'IGI', 629438666, N'https://www.igi.org/verify-your-report/?r=629438666', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/704069c9-1f27-4232-9004-51074182df32.jpg', 0.73, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (123, N'IGI', 618409592, N'https://www.igi.org/verify-your-report/?r=618409592', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/947a4663-e77b-4b85-8d2f-8e95f6e988ab.jpg', 0.76, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (124, N'IGI', 583399008, N'https://www.igi.org/verify-your-report/?r=583399008', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9019604a-9146-4513-9f7f-6f2766a773ce.jpg', 0.77, N'Excellent', N'D', N'IF', N'Very Good', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (125, N'IGI', 622478048, N'https://www.igi.org/verify-your-report/?r=622478048', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/af889cec-31c9-4e09-b212-cfebcd5a6cf5.jpg', 0.77, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (126, N'IGI', 633465409, N'https://www.igi.org/verify-your-report/?r=633465409', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4020039e-46b4-4060-ad91-04dae562cffb.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (127, N'IGI', 613380447, N'https://www.igi.org/verify-your-report/?r=613380447', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ef835aee-a500-4fab-992b-02e7981f9a50.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (128, N'IGI', 567358132, N'https://www.igi.org/verify-your-report/?r=567358132', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTUwMzIzMDYyMC1BLTE5MC00MzcvZ2VtMzYwLTE1MDMyMzA2MjAtQS0xOTAtNDM3Lmh0bWwtZg==/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (129, N'IGI', 604322986, N'https://www.igi.org/verify-your-report/?r=604322986', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/236db07a-6685-4298-9038-0bacc58bff89.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (130, N'IGI', 613391257, N'https://www.igi.org/verify-your-report/?r=613391257', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f4c12791-be3c-43c1-9239-58b9e57f461a.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (131, N'IGI', 615365548, N'https://www.igi.org/verify-your-report/?r=615365548', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4baaa6d0-2428-414e-8e55-b5c52dcd3a34.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (132, N'IGI', 608395229, N'https://www.igi.org/verify-your-report/?r=608395229', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccf7efb2-f75b-4513-98f1-8814cfcfbdc2.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (133, N'IGI', 616403928, N'https://www.igi.org/verify-your-report/?r=616403928', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/25c83479-b67b-43d2-98a3-3b3018a5be8b.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (134, N'IGI', 598334820, N'https://www.igi.org/verify-your-report/?r=598334820', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/44e31b9f-f16d-46ca-993c-0c24e63ae08d.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (135, N'IGI', 628402046, N'https://www.igi.org/verify-your-report/?r=628402046', N'https://www.diamond360.co.in/imaged/B22504/still.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (136, N'IGI', 628406586, N'https://www.igi.org/verify-your-report/?r=628406586', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-32236/still.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (137, N'IGI', 603352650, N'https://www.igi.org/verify-your-report/?r=603352650', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4ea6049d-88cb-48f4-a5ab-94aabaf71741.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (138, N'IGI', 593380048, N'https://www.igi.org/verify-your-report/?r=593380048', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/cc27b921-eb66-4a76-a773-56ad04541fdc.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (139, N'IGI', 596319216, N'https://www.igi.org/verify-your-report/?r=596319216', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e1cd6dd4-ab08-488b-ac66-21ada3df4149.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (140, N'IGI', 608395235, N'https://www.igi.org/verify-your-report/?r=608395235', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a9d1813a-271c-49f4-9453-09ad12462ef2.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (141, N'IGI', 627456359, N'https://www.igi.org/verify-your-report/?r=627456359', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9912c9ae-f8b9-4d3a-8cc3-73cf90d37ff7.jpg', 0.76, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (142, N'IGI', 623422664, N'https://www.igi.org/verify-your-report/?r=623422664', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ecd2f196-07ae-470a-b810-3f68159dda2e.jpg', 0.78, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (143, N'IGI', 627409078, N'https://www.igi.org/verify-your-report/?r=627409078', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/557fb28a-0d02-4447-8817-16f83426d538.jpg', 0.79, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (144, N'IGI', 633465410, N'https://www.igi.org/verify-your-report/?r=633465410', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/267bfcc6-92a4-4034-9b6d-ad2ad02f7e38.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (145, N'IGI', 615345308, N'https://www.igi.org/verify-your-report/?r=615345308', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0852a50e-ad5e-49e2-8fe8-cd94ecc8b48a.jpg', 0.93, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (146, N'IGI', 634473609, N'https://www.igi.org/verify-your-report/?r=634473609', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3c752434-9889-484c-a4f7-7f3f4b65b503.jpg', 0.93, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (147, N'IGI', 621413518, N'https://www.igi.org/verify-your-report/?r=621413518', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/473453e5-beb6-48e1-8ad4-1b0b784ed0e0.jpg', 0.93, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (148, N'IGI', 626430836, N'https://www.igi.org/verify-your-report/?r=626430836', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3ec7a5d3-471e-46e2-aa43-483e64b10a5b.jpg', 0.94, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (149, N'IGI', 625421772, N'https://www.igi.org/verify-your-report/?r=625421772', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-31470/still.jpg', 0.96, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (150, N'IGI', 623414023, N'https://www.igi.org/verify-your-report/?r=623414023', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/809b5bc8-6d68-4779-bcee-eb922e98f6ca.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (151, N'IGI', 631429217, N'https://www.igi.org/verify-your-report/?r=631429217', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2a33555a-bd0d-4140-bf11-87b5f141b42d.jpg', 0.98, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (152, N'IGI', 628462549, N'https://www.igi.org/verify-your-report/?r=628462549', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2be2110f-84b6-49c9-b468-7629913e841b.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (153, N'IGI', 633430832, N'https://www.igi.org/verify-your-report/?r=633430832', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c8165605-d252-4f87-9b8f-5890fabc5547.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (154, N'IGI', 584360586, N'https://www.igi.org/verify-your-report/?r=584360586', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMGY5YTc5NDctZmU2OC00OTNlLTk4ZjItMDhjZDI3M2M5MzA1P209YyZjdXM9U01HLWY=/0.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (155, N'IGI', 579359505, N'https://www.igi.org/verify-your-report/?r=579359505', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J7810/still.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (156, N'IGI', 625452557, N'https://www.igi.org/verify-your-report/?r=625452557', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b6e1efb9-e556-46cb-b918-3b85624b4a5a.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (157, N'IGI', 617439159, N'https://www.igi.org/verify-your-report/?r=617439159', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a59a7757-3c47-4588-bdff-7436ded52e5a.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (158, N'IGI', 589397742, N'https://www.igi.org/verify-your-report/?r=589397742', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwODIzMDczMi1SQS00MjgtNDEyL2dlbTM2MC0xOTA4MjMwNzMyLVJBLTQyOC00MTIuaHRtbC1m/0.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (159, N'IGI', 605358244, N'https://www.igi.org/verify-your-report/?r=605358244', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvNGJmZmZkODgtNzEzYS00MTQ0LTlhOWYtMWQyOTUwZDVlOTBhP209YyZjdXM9U01HLWY=/0.jpg', 1.01, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (160, N'IGI', 619446864, N'https://www.igi.org/verify-your-report/?r=619446864', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-27736/still.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (161, N'IGI', 517286121, N'https://www.igi.org/verify-your-report/?r=517286121', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1f92e504-cc21-4b06-9a72-098cb7ca0cd7.jpg', 1.01, N'Excellent', N'D', N'I1', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (162, N'IGI', 627423146, N'https://www.igi.org/verify-your-report/?r=627423146', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4e161da9-e0d9-4aa5-b5cc-b852fc57e1b2.jpg', 0.81, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (163, N'IGI', 634491844, N'https://www.igi.org/verify-your-report/?r=634491844', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8e561015-edb5-4031-9e24-f6074e397b26.jpg', 0.83, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (164, N'IGI', 604397084, N'https://www.igi.org/verify-your-report/?r=604397084', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119558/still.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (165, N'IGI', 620452326, N'https://www.igi.org/verify-your-report/?r=620452326', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10103B/still.jpg', 1, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (166, N'IGI', 630456355, N'https://www.igi.org/verify-your-report/?r=630456355', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a8ceabb5-6a13-4262-9dba-af04e49af1ce.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (167, N'IGI', 629405992, N'https://www.igi.org/verify-your-report/?r=629405992', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8cc95c6d-3f95-48df-85ff-7895c017bec9.jpg', 1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (168, N'IGI', 627425727, N'https://www.igi.org/verify-your-report/?r=627425727', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f6709477-2ed7-4a1e-b9e0-cc890cca5f57.jpg', 1.01, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (169, N'IGI', 629468829, N'https://www.igi.org/verify-your-report/?r=629468829', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e35aebf3-4350-4908-a561-b6bb7002c034.jpg', 1.01, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (170, N'IGI', 602378981, N'https://www.igi.org/verify-your-report/?r=602378981', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/434588de-36f6-4e41-a1e3-5b49eda91e31.jpg', 1.02, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (171, N'IGI', 608395118, N'https://www.igi.org/verify-your-report/?r=608395118', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/97992d84-9676-4ef5-a08a-5021d8a012de.jpg', 1.02, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (172, N'IGI', 627461450, N'https://www.igi.org/verify-your-report/?r=627461450', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5c507110-ef52-474b-8316-d5886dd86e2b.jpg', 1.04, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (173, N'IGI', 625439413, N'https://www.igi.org/verify-your-report/?r=625439413', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10210AI/still.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (174, N'IGI', 591341230, N'https://www.igi.org/verify-your-report/?r=591341230', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL2MvNzJjMGNmNDItNzM3MC00MjEwLTkyYjAtYzFiYzdkMjdlZjRiP209ZCZhPTU5MTM0MTIzMC1m/0.jpg', 1.05, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (175, N'IGI', 630456361, N'https://www.igi.org/verify-your-report/?r=630456361', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c130f50e-b044-44ff-8d09-26a2353054ec.jpg', 1.05, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (176, N'IGI', 626497769, N'https://www.igi.org/verify-your-report/?r=626497769', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/a93df6f6-c191-42ee-b07c-c9a99bb79a90.jpg', 1.06, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (177, N'IGI', 615345211, N'https://www.igi.org/verify-your-report/?r=615345211', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R969174/still.jpg', 1.08, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (178, N'IGI', 605360228, N'https://www.igi.org/verify-your-report/?r=605360228', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119570/still.jpg', 1.09, N'Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (179, N'IGI', 634400531, N'https://www.igi.org/verify-your-report/?r=634400531', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0cc810b2-a510-4a16-b11a-71c32c5444df.jpg', 1.09, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (180, N'IGI', 625433232, N'https://www.igi.org/verify-your-report/?r=625433232', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2cf0ab02-72ac-4bc8-a2d8-8173f3cf5a25.jpg', 1.11, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (181, N'IGI', 632499573, N'https://www.igi.org/verify-your-report/?r=632499573', N'https://www.diamond360.co.in/imaged/B23068/still.jpg', 1.09, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (182, N'IGI', 631442496, N'https://www.igi.org/verify-your-report/?r=631442496', N'https://www.diamond360.co.in/imaged/B22764/still.jpg', 1.1, N'Excellent', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (183, N'IGI', 617488495, N'https://www.igi.org/verify-your-report/?r=617488495', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/asscher.jpg?v=1702020829', 1.78, N'Very Good', N'D', N'IF', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (184, N'IGI', 591368773, N'https://www.igi.org/verify-your-report/?r=591368773', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/413098/still.jpg', 0.93, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (185, N'IGI', 585302661, N'https://www.igi.org/verify-your-report/?r=585302661', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-15121/still.jpg', 1, N'Excellent', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (186, N'GIA', 1495082704, N'https://www.gia.edu/report-check?reportno=1495082704', N'https://lgdus.co/B18333AA/still.jpg', 1, N'Excellent', N'D', N'VS1', N'Very Good', N'Very Good', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (187, N'IGI', 589313602, N'https://www.igi.org/verify-your-report/?r=589313602', N'https://www.diamond360.co.in/imaged/B19012/still.jpg', 1, N'Excellent', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (188, N'IGI', 585302698, N'https://www.igi.org/verify-your-report/?r=585302698', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-15174/still.jpg', 1.01, N'Excellent', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (189, N'IGI', 585332258, N'https://www.igi.org/verify-your-report/?r=585332258', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-15378/still.jpg', 1.01, N'Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (190, N'IGI', 631413008, N'https://www.igi.org/verify-your-report/?r=631413008', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/533278/still.jpg', 1.01, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (191, N'IGI', 620421954, N'https://www.igi.org/verify-your-report/?r=620421954', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421954', 1.03, N'Excellent', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (192, N'IGI', 620421851, N'https://www.igi.org/verify-your-report/?r=620421851', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421851', 1.03, N'Very Good', N'D', N'VS1', N'Very Good', N'Very Good', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (193, N'IGI', 630454324, N'https://www.igi.org/verify-your-report/?r=630454324', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/531303/still.jpg', 1.04, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (194, N'IGI', 633477251, N'https://www.igi.org/verify-your-report/?r=633477251', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/543747/still.jpg', 1.04, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (195, N'IGI', 591316609, N'https://www.igi.org/verify-your-report/?r=591316609', N'https://www.diamond360.co.in/imaged/B19486/still.jpg', 1.06, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (196, N'IGI', 625447607, N'https://www.igi.org/verify-your-report/?r=625447607', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/512852/still.jpg', 1.06, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (197, N'IGI', 593391848, N'https://www.igi.org/verify-your-report/?r=593391848', N'https://www.diamond360.co.in/imaged/B19670/still.jpg', 1.07, N'Excellent', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (198, N'IGI', 625447614, N'https://www.igi.org/verify-your-report/?r=625447614', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/512941/still.jpg', 1.08, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (199, N'IGI', 625445564, N'https://www.igi.org/verify-your-report/?r=625445564', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/516312/still.jpg', 1.08, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (200, N'IGI', 585304297, N'https://www.igi.org/verify-your-report/?r=585304297', N'https://dna-hthmd8bzgcfjetdb.z01.azurefd.net/vision/imaged/401396/still.jpg', 1.1, N'Very Good', N'D', N'VS1', N'Excellent', N'Excellent', N'None', 1, 10)
SET IDENTITY_INSERT [dbo].[diamond] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond_price] ON 

INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1, CAST(N'2024-05-30T08:56:05.5399806' AS DateTime2), 0, 0.3999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (2, CAST(N'2024-05-30T08:56:05.5644293' AS DateTime2), 0, 0.3999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (3, CAST(N'2024-05-30T08:56:05.5647094' AS DateTime2), 0, 0.3999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (4, CAST(N'2024-05-30T08:56:05.5647512' AS DateTime2), 0, 0.3999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (5, CAST(N'2024-05-30T08:56:05.5647977' AS DateTime2), 0, 0.3999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (6, CAST(N'2024-05-30T08:56:05.5648201' AS DateTime2), 0, 0.3999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (7, CAST(N'2024-05-30T08:56:05.5648370' AS DateTime2), 0, 0.3999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (8, CAST(N'2024-05-30T08:56:05.5648538' AS DateTime2), 0, 0.3999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (9, CAST(N'2024-05-30T08:56:05.5648790' AS DateTime2), 0, 0.3999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (10, CAST(N'2024-05-30T08:56:05.5649862' AS DateTime2), 0, 0.3999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (11, CAST(N'2024-05-30T08:56:05.5650180' AS DateTime2), 0, 0.3999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (12, CAST(N'2024-05-30T08:56:05.5650937' AS DateTime2), 0, 0.3999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (13, CAST(N'2024-05-30T08:56:05.5651194' AS DateTime2), 0, 0.3999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (14, CAST(N'2024-05-30T08:56:05.5651365' AS DateTime2), 0, 0.3999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (15, CAST(N'2024-05-30T08:56:05.5651739' AS DateTime2), 0, 0.3999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (16, CAST(N'2024-05-30T08:56:05.5651966' AS DateTime2), 0, 0.3999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (17, CAST(N'2024-05-30T08:56:05.5652125' AS DateTime2), 0, 0.3999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (18, CAST(N'2024-05-30T08:56:05.5652321' AS DateTime2), 0, 0.3999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (19, CAST(N'2024-05-30T08:56:05.5652648' AS DateTime2), 0, 0.3999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (20, CAST(N'2024-05-30T08:56:05.5656720' AS DateTime2), 0, 0.3999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (21, CAST(N'2024-05-30T08:56:05.5657227' AS DateTime2), 0, 0.3999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (22, CAST(N'2024-05-30T08:56:05.5657534' AS DateTime2), 0, 0.3999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (23, CAST(N'2024-05-30T08:56:05.5657970' AS DateTime2), 0, 0.3999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (24, CAST(N'2024-05-30T08:56:05.5658358' AS DateTime2), 0, 0.3999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (25, CAST(N'2024-05-30T08:56:05.5658559' AS DateTime2), 0, 0.3999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (26, CAST(N'2024-05-30T08:56:05.5658768' AS DateTime2), 0, 0.3999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (27, CAST(N'2024-05-30T08:56:05.5658970' AS DateTime2), 0, 0.3999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (28, CAST(N'2024-05-30T08:56:05.5659118' AS DateTime2), 0, 0.3999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (29, CAST(N'2024-05-30T08:56:05.5659409' AS DateTime2), 0, 0.3999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (30, CAST(N'2024-05-30T08:56:05.5659562' AS DateTime2), 0, 0.3999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (31, CAST(N'2024-05-30T08:56:05.5659731' AS DateTime2), 0, 0.3999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (32, CAST(N'2024-05-30T08:56:05.5660290' AS DateTime2), 0, 0.3999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (33, CAST(N'2024-05-30T08:56:05.5660477' AS DateTime2), 0, 0.3999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (34, CAST(N'2024-05-30T08:56:05.5660813' AS DateTime2), 0, 0.3999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (35, CAST(N'2024-05-30T08:56:05.5661032' AS DateTime2), 0, 0.3999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (36, CAST(N'2024-05-30T08:56:05.5661226' AS DateTime2), 0, 0.3999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (37, CAST(N'2024-05-30T08:56:05.5661423' AS DateTime2), 0, 0.3999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (38, CAST(N'2024-05-30T08:56:05.5661615' AS DateTime2), 0, 0.3999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (39, CAST(N'2024-05-30T08:56:05.5662802' AS DateTime2), 0, 0.3999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (40, CAST(N'2024-05-30T08:56:05.5664136' AS DateTime2), 0, 0.3999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (41, CAST(N'2024-05-30T08:56:05.5664468' AS DateTime2), 0, 0.3999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (42, CAST(N'2024-05-30T08:56:05.5664893' AS DateTime2), 0, 0.3999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (43, CAST(N'2024-05-30T08:56:05.5665137' AS DateTime2), 0, 0.3999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (44, CAST(N'2024-05-30T08:56:05.5665302' AS DateTime2), 0, 0.3999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (45, CAST(N'2024-05-30T08:56:05.5665529' AS DateTime2), 0, 0.3999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (46, CAST(N'2024-05-30T08:56:05.5665707' AS DateTime2), 0, 0.3999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (47, CAST(N'2024-05-30T08:56:05.5666372' AS DateTime2), 0, 0.3999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (48, CAST(N'2024-05-30T08:56:05.5667202' AS DateTime2), 0, 0.3999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (49, CAST(N'2024-05-30T08:56:05.5667787' AS DateTime2), 0, 0.3999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (50, CAST(N'2024-05-30T08:56:05.5668125' AS DateTime2), 0, 0.3999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (51, CAST(N'2024-05-30T08:56:05.5668292' AS DateTime2), 0, 0.3999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (52, CAST(N'2024-05-30T08:56:05.5671016' AS DateTime2), 0, 0.3999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (53, CAST(N'2024-05-30T08:56:05.5671474' AS DateTime2), 0, 0.3999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (54, CAST(N'2024-05-30T08:56:05.5671632' AS DateTime2), 0, 0.3999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (55, CAST(N'2024-05-30T08:56:05.5671776' AS DateTime2), 0, 0.3999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (56, CAST(N'2024-05-30T08:56:05.5671972' AS DateTime2), 0, 0.3999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (57, CAST(N'2024-05-30T08:56:05.5672200' AS DateTime2), 0, 0.3999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (58, CAST(N'2024-05-30T08:56:05.5672423' AS DateTime2), 0, 0.3999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (59, CAST(N'2024-05-30T08:56:05.5673469' AS DateTime2), 0, 0.3999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (60, CAST(N'2024-05-30T08:56:05.5673750' AS DateTime2), 0, 0.3999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (61, CAST(N'2024-05-30T08:56:05.5673930' AS DateTime2), 0, 0.3999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (62, CAST(N'2024-05-30T08:56:05.5674078' AS DateTime2), 0, 0.3999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (63, CAST(N'2024-05-30T08:56:05.5674345' AS DateTime2), 0, 0.3999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (64, CAST(N'2024-05-30T08:56:05.5674507' AS DateTime2), 0, 0.3999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (65, CAST(N'2024-05-30T08:56:05.5677970' AS DateTime2), 0, 0.3999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (66, CAST(N'2024-05-30T08:56:05.5678408' AS DateTime2), 0, 0.3999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (67, CAST(N'2024-05-30T08:56:05.5678644' AS DateTime2), 0, 0.3999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (68, CAST(N'2024-05-30T08:56:05.5679024' AS DateTime2), 0, 0.3999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (69, CAST(N'2024-05-30T08:56:05.5679172' AS DateTime2), 0, 0.3999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (70, CAST(N'2024-05-30T08:56:05.5679322' AS DateTime2), 0, 0.3999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (71, CAST(N'2024-05-30T08:56:05.5679462' AS DateTime2), 0, 0.3999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (72, CAST(N'2024-05-30T08:56:05.5679600' AS DateTime2), 0, 0.3999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (73, CAST(N'2024-05-30T08:56:05.5680154' AS DateTime2), 0, 0.3999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (74, CAST(N'2024-05-30T08:56:05.5680557' AS DateTime2), 0, 0.3999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (75, CAST(N'2024-05-30T08:56:05.5680724' AS DateTime2), 0, 0.3999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (76, CAST(N'2024-05-30T08:56:05.5680891' AS DateTime2), 0, 0.3999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (77, CAST(N'2024-05-30T08:56:05.5681059' AS DateTime2), 0, 0.3999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (78, CAST(N'2024-05-30T08:56:05.5681660' AS DateTime2), 0, 0.3999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (79, CAST(N'2024-05-30T08:56:05.5682171' AS DateTime2), 0, 0.3999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (80, CAST(N'2024-05-30T08:56:05.5682479' AS DateTime2), 0, 0.3999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (81, CAST(N'2024-05-30T08:56:05.5682680' AS DateTime2), 0, 0.3999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (82, CAST(N'2024-05-30T08:56:05.5699132' AS DateTime2), 0, 0.3999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (83, CAST(N'2024-05-30T08:56:05.5701705' AS DateTime2), 0, 0.3999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (84, CAST(N'2024-05-30T08:56:05.5702587' AS DateTime2), 0, 0.3999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (85, CAST(N'2024-05-30T08:56:05.5703456' AS DateTime2), 0, 0.3999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (86, CAST(N'2024-05-30T08:56:05.5703714' AS DateTime2), 0, 0.3999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (87, CAST(N'2024-05-30T08:56:05.5703874' AS DateTime2), 0, 0.3999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (88, CAST(N'2024-05-30T08:56:05.5704025' AS DateTime2), 0, 0.3999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (89, CAST(N'2024-05-30T08:56:05.5704327' AS DateTime2), 0, 0.3999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (90, CAST(N'2024-05-30T08:56:05.5704496' AS DateTime2), 0, 0.3999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (91, CAST(N'2024-05-30T08:56:05.5704777' AS DateTime2), 0, 0.3999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (92, CAST(N'2024-05-30T08:56:05.5704931' AS DateTime2), 0, 0.3999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (93, CAST(N'2024-05-30T08:56:05.5705098' AS DateTime2), 0, 0.3999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (94, CAST(N'2024-05-30T08:56:05.5705245' AS DateTime2), 0, 0.3999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (95, CAST(N'2024-05-30T08:56:05.5705575' AS DateTime2), 0, 0.3999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (96, CAST(N'2024-05-30T08:56:05.5705740' AS DateTime2), 0, 0.3999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (97, CAST(N'2024-05-30T08:56:05.5706071' AS DateTime2), 0, 0.3999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (98, CAST(N'2024-05-30T08:56:05.5706351' AS DateTime2), 0, 0.3999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (99, CAST(N'2024-05-30T08:56:05.5706512' AS DateTime2), 0, 0.3999, N'L', N'I3', 3)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (100, CAST(N'2024-05-30T08:56:05.5706689' AS DateTime2), 0, 0.3999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (101, CAST(N'2024-05-30T08:56:05.5706936' AS DateTime2), 0, 0.3999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (102, CAST(N'2024-05-30T08:56:05.5707091' AS DateTime2), 0, 0.3999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (103, CAST(N'2024-05-30T08:56:05.5707321' AS DateTime2), 0, 0.3999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (104, CAST(N'2024-05-30T08:56:05.5707475' AS DateTime2), 0, 0.3999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (105, CAST(N'2024-05-30T08:56:05.5707626' AS DateTime2), 0, 0.3999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (106, CAST(N'2024-05-30T08:56:05.5707770' AS DateTime2), 0, 0.3999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (107, CAST(N'2024-05-30T08:56:05.5707921' AS DateTime2), 0, 0.3999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (108, CAST(N'2024-05-30T08:56:05.5708133' AS DateTime2), 0, 0.3999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (109, CAST(N'2024-05-30T08:56:05.5708284' AS DateTime2), 0, 0.3999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (110, CAST(N'2024-05-30T08:56:05.5708430' AS DateTime2), 0, 0.3999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (111, CAST(N'2024-05-30T08:56:05.9454931' AS DateTime2), 0.4, 0.4999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (112, CAST(N'2024-05-30T08:56:05.9456113' AS DateTime2), 0.4, 0.4999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (113, CAST(N'2024-05-30T08:56:05.9456750' AS DateTime2), 0.4, 0.4999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (114, CAST(N'2024-05-30T08:56:05.9456944' AS DateTime2), 0.4, 0.4999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (115, CAST(N'2024-05-30T08:56:05.9457126' AS DateTime2), 0.4, 0.4999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (116, CAST(N'2024-05-30T08:56:05.9457263' AS DateTime2), 0.4, 0.4999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (117, CAST(N'2024-05-30T08:56:05.9457433' AS DateTime2), 0.4, 0.4999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (118, CAST(N'2024-05-30T08:56:05.9458215' AS DateTime2), 0.4, 0.4999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (119, CAST(N'2024-05-30T08:56:05.9458476' AS DateTime2), 0.4, 0.4999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (120, CAST(N'2024-05-30T08:56:05.9458647' AS DateTime2), 0.4, 0.4999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (121, CAST(N'2024-05-30T08:56:05.9458790' AS DateTime2), 0.4, 0.4999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (122, CAST(N'2024-05-30T08:56:05.9458998' AS DateTime2), 0.4, 0.4999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (123, CAST(N'2024-05-30T08:56:05.9459306' AS DateTime2), 0.4, 0.4999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (124, CAST(N'2024-05-30T08:56:05.9459489' AS DateTime2), 0.4, 0.4999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (125, CAST(N'2024-05-30T08:56:05.9459780' AS DateTime2), 0.4, 0.4999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (126, CAST(N'2024-05-30T08:56:05.9459990' AS DateTime2), 0.4, 0.4999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (127, CAST(N'2024-05-30T08:56:05.9460144' AS DateTime2), 0.4, 0.4999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (128, CAST(N'2024-05-30T08:56:05.9460358' AS DateTime2), 0.4, 0.4999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (129, CAST(N'2024-05-30T08:56:05.9460557' AS DateTime2), 0.4, 0.4999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (130, CAST(N'2024-05-30T08:56:05.9461106' AS DateTime2), 0.4, 0.4999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (131, CAST(N'2024-05-30T08:56:05.9461944' AS DateTime2), 0.4, 0.4999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (132, CAST(N'2024-05-30T08:56:05.9462298' AS DateTime2), 0.4, 0.4999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (133, CAST(N'2024-05-30T08:56:05.9462526' AS DateTime2), 0.4, 0.4999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (134, CAST(N'2024-05-30T08:56:05.9462851' AS DateTime2), 0.4, 0.4999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (135, CAST(N'2024-05-30T08:56:05.9463006' AS DateTime2), 0.4, 0.4999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (136, CAST(N'2024-05-30T08:56:05.9463211' AS DateTime2), 0.4, 0.4999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (137, CAST(N'2024-05-30T08:56:05.9463348' AS DateTime2), 0.4, 0.4999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (138, CAST(N'2024-05-30T08:56:05.9463482' AS DateTime2), 0.4, 0.4999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (139, CAST(N'2024-05-30T08:56:05.9463710' AS DateTime2), 0.4, 0.4999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (140, CAST(N'2024-05-30T08:56:05.9463914' AS DateTime2), 0.4, 0.4999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (141, CAST(N'2024-05-30T08:56:05.9464077' AS DateTime2), 0.4, 0.4999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (142, CAST(N'2024-05-30T08:56:05.9464207' AS DateTime2), 0.4, 0.4999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (143, CAST(N'2024-05-30T08:56:05.9464326' AS DateTime2), 0.4, 0.4999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (144, CAST(N'2024-05-30T08:56:05.9464531' AS DateTime2), 0.4, 0.4999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (145, CAST(N'2024-05-30T08:56:05.9464678' AS DateTime2), 0.4, 0.4999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (146, CAST(N'2024-05-30T08:56:05.9464824' AS DateTime2), 0.4, 0.4999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (147, CAST(N'2024-05-30T08:56:05.9464970' AS DateTime2), 0.4, 0.4999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (148, CAST(N'2024-05-30T08:56:05.9465183' AS DateTime2), 0.4, 0.4999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (149, CAST(N'2024-05-30T08:56:05.9466614' AS DateTime2), 0.4, 0.4999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (150, CAST(N'2024-05-30T08:56:05.9467025' AS DateTime2), 0.4, 0.4999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (151, CAST(N'2024-05-30T08:56:05.9467195' AS DateTime2), 0.4, 0.4999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (152, CAST(N'2024-05-30T08:56:05.9467344' AS DateTime2), 0.4, 0.4999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (153, CAST(N'2024-05-30T08:56:05.9467473' AS DateTime2), 0.4, 0.4999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (154, CAST(N'2024-05-30T08:56:05.9467598' AS DateTime2), 0.4, 0.4999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (155, CAST(N'2024-05-30T08:56:05.9467859' AS DateTime2), 0.4, 0.4999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (156, CAST(N'2024-05-30T08:56:05.9467990' AS DateTime2), 0.4, 0.4999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (157, CAST(N'2024-05-30T08:56:05.9468125' AS DateTime2), 0.4, 0.4999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (158, CAST(N'2024-05-30T08:56:05.9468268' AS DateTime2), 0.4, 0.4999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (159, CAST(N'2024-05-30T08:56:05.9468978' AS DateTime2), 0.4, 0.4999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (160, CAST(N'2024-05-30T08:56:05.9471961' AS DateTime2), 0.4, 0.4999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (161, CAST(N'2024-05-30T08:56:05.9472327' AS DateTime2), 0.4, 0.4999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (162, CAST(N'2024-05-30T08:56:05.9473027' AS DateTime2), 0.4, 0.4999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (163, CAST(N'2024-05-30T08:56:05.9473277' AS DateTime2), 0.4, 0.4999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (164, CAST(N'2024-05-30T08:56:05.9473483' AS DateTime2), 0.4, 0.4999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (165, CAST(N'2024-05-30T08:56:05.9474958' AS DateTime2), 0.4, 0.4999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (166, CAST(N'2024-05-30T08:56:05.9475627' AS DateTime2), 0.4, 0.4999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (167, CAST(N'2024-05-30T08:56:05.9476124' AS DateTime2), 0.4, 0.4999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (168, CAST(N'2024-05-30T08:56:05.9476957' AS DateTime2), 0.4, 0.4999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (169, CAST(N'2024-05-30T08:56:05.9477256' AS DateTime2), 0.4, 0.4999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (170, CAST(N'2024-05-30T08:56:05.9477413' AS DateTime2), 0.4, 0.4999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (171, CAST(N'2024-05-30T08:56:05.9477764' AS DateTime2), 0.4, 0.4999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (172, CAST(N'2024-05-30T08:56:05.9477910' AS DateTime2), 0.4, 0.4999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (173, CAST(N'2024-05-30T08:56:05.9478057' AS DateTime2), 0.4, 0.4999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (174, CAST(N'2024-05-30T08:56:05.9478209' AS DateTime2), 0.4, 0.4999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (175, CAST(N'2024-05-30T08:56:05.9478347' AS DateTime2), 0.4, 0.4999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (176, CAST(N'2024-05-30T08:56:05.9478550' AS DateTime2), 0.4, 0.4999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (177, CAST(N'2024-05-30T08:56:05.9478718' AS DateTime2), 0.4, 0.4999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (178, CAST(N'2024-05-30T08:56:05.9478853' AS DateTime2), 0.4, 0.4999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (179, CAST(N'2024-05-30T08:56:05.9478988' AS DateTime2), 0.4, 0.4999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (180, CAST(N'2024-05-30T08:56:05.9479125' AS DateTime2), 0.4, 0.4999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (181, CAST(N'2024-05-30T08:56:05.9479375' AS DateTime2), 0.4, 0.4999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (182, CAST(N'2024-05-30T08:56:05.9479568' AS DateTime2), 0.4, 0.4999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (183, CAST(N'2024-05-30T08:56:05.9479833' AS DateTime2), 0.4, 0.4999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (184, CAST(N'2024-05-30T08:56:05.9480088' AS DateTime2), 0.4, 0.4999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (185, CAST(N'2024-05-30T08:56:05.9480449' AS DateTime2), 0.4, 0.4999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (186, CAST(N'2024-05-30T08:56:05.9480679' AS DateTime2), 0.4, 0.4999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (187, CAST(N'2024-05-30T08:56:05.9480828' AS DateTime2), 0.4, 0.4999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (188, CAST(N'2024-05-30T08:56:05.9480992' AS DateTime2), 0.4, 0.4999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (189, CAST(N'2024-05-30T08:56:05.9481138' AS DateTime2), 0.4, 0.4999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (190, CAST(N'2024-05-30T08:56:05.9481276' AS DateTime2), 0.4, 0.4999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (191, CAST(N'2024-05-30T08:56:05.9481410' AS DateTime2), 0.4, 0.4999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (192, CAST(N'2024-05-30T08:56:05.9481622' AS DateTime2), 0.4, 0.4999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (193, CAST(N'2024-05-30T08:56:05.9481759' AS DateTime2), 0.4, 0.4999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (194, CAST(N'2024-05-30T08:56:05.9481892' AS DateTime2), 0.4, 0.4999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (195, CAST(N'2024-05-30T08:56:05.9482030' AS DateTime2), 0.4, 0.4999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (196, CAST(N'2024-05-30T08:56:05.9482166' AS DateTime2), 0.4, 0.4999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (197, CAST(N'2024-05-30T08:56:05.9482346' AS DateTime2), 0.4, 0.4999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (198, CAST(N'2024-05-30T08:56:05.9482498' AS DateTime2), 0.4, 0.4999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (199, CAST(N'2024-05-30T08:56:05.9483038' AS DateTime2), 0.4, 0.4999, N'L', N'IF', 9)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (200, CAST(N'2024-05-30T08:56:05.9483658' AS DateTime2), 0.4, 0.4999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (201, CAST(N'2024-05-30T08:56:05.9484493' AS DateTime2), 0.4, 0.4999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (202, CAST(N'2024-05-30T08:56:05.9484704' AS DateTime2), 0.4, 0.4999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (203, CAST(N'2024-05-30T08:56:05.9484849' AS DateTime2), 0.4, 0.4999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (204, CAST(N'2024-05-30T08:56:05.9484989' AS DateTime2), 0.4, 0.4999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (205, CAST(N'2024-05-30T08:56:05.9485128' AS DateTime2), 0.4, 0.4999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (206, CAST(N'2024-05-30T08:56:05.9485330' AS DateTime2), 0.4, 0.4999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (207, CAST(N'2024-05-30T08:56:05.9485474' AS DateTime2), 0.4, 0.4999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (208, CAST(N'2024-05-30T08:56:05.9485613' AS DateTime2), 0.4, 0.4999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (209, CAST(N'2024-05-30T08:56:05.9485752' AS DateTime2), 0.4, 0.4999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (210, CAST(N'2024-05-30T08:56:05.9486056' AS DateTime2), 0.4, 0.4999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (211, CAST(N'2024-05-30T08:56:05.9490645' AS DateTime2), 0.4, 0.4999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (212, CAST(N'2024-05-30T08:56:05.9492574' AS DateTime2), 0.4, 0.4999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (213, CAST(N'2024-05-30T08:56:05.9493440' AS DateTime2), 0.4, 0.4999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (214, CAST(N'2024-05-30T08:56:05.9493896' AS DateTime2), 0.4, 0.4999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (215, CAST(N'2024-05-30T08:56:05.9494047' AS DateTime2), 0.4, 0.4999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (216, CAST(N'2024-05-30T08:56:05.9498603' AS DateTime2), 0.4, 0.4999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (217, CAST(N'2024-05-30T08:56:05.9503235' AS DateTime2), 0.4, 0.4999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (218, CAST(N'2024-05-30T08:56:05.9506549' AS DateTime2), 0.4, 0.4999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (219, CAST(N'2024-05-30T08:56:05.9507715' AS DateTime2), 0.4, 0.4999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (220, CAST(N'2024-05-30T08:56:05.9508004' AS DateTime2), 0.4, 0.4999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (221, CAST(N'2024-05-30T08:56:06.3786516' AS DateTime2), 0.5, 0.6999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (222, CAST(N'2024-05-30T08:56:06.3788518' AS DateTime2), 0.5, 0.6999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (223, CAST(N'2024-05-30T08:56:06.3788898' AS DateTime2), 0.5, 0.6999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (224, CAST(N'2024-05-30T08:56:06.3789636' AS DateTime2), 0.5, 0.6999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (225, CAST(N'2024-05-30T08:56:06.3789849' AS DateTime2), 0.5, 0.6999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (226, CAST(N'2024-05-30T08:56:06.3790042' AS DateTime2), 0.5, 0.6999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (227, CAST(N'2024-05-30T08:56:06.3790213' AS DateTime2), 0.5, 0.6999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (228, CAST(N'2024-05-30T08:56:06.3790380' AS DateTime2), 0.5, 0.6999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (229, CAST(N'2024-05-30T08:56:06.3790619' AS DateTime2), 0.5, 0.6999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (230, CAST(N'2024-05-30T08:56:06.3790789' AS DateTime2), 0.5, 0.6999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (231, CAST(N'2024-05-30T08:56:06.3790925' AS DateTime2), 0.5, 0.6999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (232, CAST(N'2024-05-30T08:56:06.3791124' AS DateTime2), 0.5, 0.6999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (233, CAST(N'2024-05-30T08:56:06.3791338' AS DateTime2), 0.5, 0.6999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (234, CAST(N'2024-05-30T08:56:06.3791621' AS DateTime2), 0.5, 0.6999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (235, CAST(N'2024-05-30T08:56:06.3791839' AS DateTime2), 0.5, 0.6999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (236, CAST(N'2024-05-30T08:56:06.3792035' AS DateTime2), 0.5, 0.6999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (237, CAST(N'2024-05-30T08:56:06.3792195' AS DateTime2), 0.5, 0.6999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (238, CAST(N'2024-05-30T08:56:06.3792356' AS DateTime2), 0.5, 0.6999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (239, CAST(N'2024-05-30T08:56:06.3792580' AS DateTime2), 0.5, 0.6999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (240, CAST(N'2024-05-30T08:56:06.3792868' AS DateTime2), 0.5, 0.6999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (241, CAST(N'2024-05-30T08:56:06.3793091' AS DateTime2), 0.5, 0.6999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (242, CAST(N'2024-05-30T08:56:06.3793320' AS DateTime2), 0.5, 0.6999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (243, CAST(N'2024-05-30T08:56:06.3793577' AS DateTime2), 0.5, 0.6999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (244, CAST(N'2024-05-30T08:56:06.3793800' AS DateTime2), 0.5, 0.6999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (245, CAST(N'2024-05-30T08:56:06.3794107' AS DateTime2), 0.5, 0.6999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (246, CAST(N'2024-05-30T08:56:06.3794292' AS DateTime2), 0.5, 0.6999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (247, CAST(N'2024-05-30T08:56:06.3794433' AS DateTime2), 0.5, 0.6999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (248, CAST(N'2024-05-30T08:56:06.3794606' AS DateTime2), 0.5, 0.6999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (249, CAST(N'2024-05-30T08:56:06.3794743' AS DateTime2), 0.5, 0.6999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (250, CAST(N'2024-05-30T08:56:06.3795049' AS DateTime2), 0.5, 0.6999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (251, CAST(N'2024-05-30T08:56:06.3795309' AS DateTime2), 0.5, 0.6999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (252, CAST(N'2024-05-30T08:56:06.3795461' AS DateTime2), 0.5, 0.6999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (253, CAST(N'2024-05-30T08:56:06.3795606' AS DateTime2), 0.5, 0.6999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (254, CAST(N'2024-05-30T08:56:06.3795786' AS DateTime2), 0.5, 0.6999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (255, CAST(N'2024-05-30T08:56:06.3796071' AS DateTime2), 0.5, 0.6999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (256, CAST(N'2024-05-30T08:56:06.3796228' AS DateTime2), 0.5, 0.6999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (257, CAST(N'2024-05-30T08:56:06.3796366' AS DateTime2), 0.5, 0.6999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (258, CAST(N'2024-05-30T08:56:06.3796511' AS DateTime2), 0.5, 0.6999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (259, CAST(N'2024-05-30T08:56:06.3796652' AS DateTime2), 0.5, 0.6999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (260, CAST(N'2024-05-30T08:56:06.3796792' AS DateTime2), 0.5, 0.6999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (261, CAST(N'2024-05-30T08:56:06.3797111' AS DateTime2), 0.5, 0.6999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (262, CAST(N'2024-05-30T08:56:06.3797256' AS DateTime2), 0.5, 0.6999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (263, CAST(N'2024-05-30T08:56:06.3797392' AS DateTime2), 0.5, 0.6999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (264, CAST(N'2024-05-30T08:56:06.3797531' AS DateTime2), 0.5, 0.6999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (265, CAST(N'2024-05-30T08:56:06.3797706' AS DateTime2), 0.5, 0.6999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (266, CAST(N'2024-05-30T08:56:06.3797951' AS DateTime2), 0.5, 0.6999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (267, CAST(N'2024-05-30T08:56:06.3798090' AS DateTime2), 0.5, 0.6999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (268, CAST(N'2024-05-30T08:56:06.3798227' AS DateTime2), 0.5, 0.6999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (269, CAST(N'2024-05-30T08:56:06.3798365' AS DateTime2), 0.5, 0.6999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (270, CAST(N'2024-05-30T08:56:06.3798500' AS DateTime2), 0.5, 0.6999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (271, CAST(N'2024-05-30T08:56:06.3798693' AS DateTime2), 0.5, 0.6999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (272, CAST(N'2024-05-30T08:56:06.3798833' AS DateTime2), 0.5, 0.6999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (273, CAST(N'2024-05-30T08:56:06.3798974' AS DateTime2), 0.5, 0.6999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (274, CAST(N'2024-05-30T08:56:06.3799107' AS DateTime2), 0.5, 0.6999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (275, CAST(N'2024-05-30T08:56:06.3799237' AS DateTime2), 0.5, 0.6999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (276, CAST(N'2024-05-30T08:56:06.3799458' AS DateTime2), 0.5, 0.6999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (277, CAST(N'2024-05-30T08:56:06.3799606' AS DateTime2), 0.5, 0.6999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (278, CAST(N'2024-05-30T08:56:06.3799746' AS DateTime2), 0.5, 0.6999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (279, CAST(N'2024-05-30T08:56:06.3799894' AS DateTime2), 0.5, 0.6999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (280, CAST(N'2024-05-30T08:56:06.3800030' AS DateTime2), 0.5, 0.6999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (281, CAST(N'2024-05-30T08:56:06.3800163' AS DateTime2), 0.5, 0.6999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (282, CAST(N'2024-05-30T08:56:06.3800363' AS DateTime2), 0.5, 0.6999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (283, CAST(N'2024-05-30T08:56:06.3800503' AS DateTime2), 0.5, 0.6999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (284, CAST(N'2024-05-30T08:56:06.3800637' AS DateTime2), 0.5, 0.6999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (285, CAST(N'2024-05-30T08:56:06.3800790' AS DateTime2), 0.5, 0.6999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (286, CAST(N'2024-05-30T08:56:06.3800923' AS DateTime2), 0.5, 0.6999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (287, CAST(N'2024-05-30T08:56:06.3801156' AS DateTime2), 0.5, 0.6999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (288, CAST(N'2024-05-30T08:56:06.3801303' AS DateTime2), 0.5, 0.6999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (289, CAST(N'2024-05-30T08:56:06.3801441' AS DateTime2), 0.5, 0.6999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (290, CAST(N'2024-05-30T08:56:06.3801578' AS DateTime2), 0.5, 0.6999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (291, CAST(N'2024-05-30T08:56:06.3801714' AS DateTime2), 0.5, 0.6999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (292, CAST(N'2024-05-30T08:56:06.3801911' AS DateTime2), 0.5, 0.6999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (293, CAST(N'2024-05-30T08:56:06.3802056' AS DateTime2), 0.5, 0.6999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (294, CAST(N'2024-05-30T08:56:06.3802191' AS DateTime2), 0.5, 0.6999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (295, CAST(N'2024-05-30T08:56:06.3802327' AS DateTime2), 0.5, 0.6999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (296, CAST(N'2024-05-30T08:56:06.3802461' AS DateTime2), 0.5, 0.6999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (297, CAST(N'2024-05-30T08:56:06.3802597' AS DateTime2), 0.5, 0.6999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (298, CAST(N'2024-05-30T08:56:06.3802815' AS DateTime2), 0.5, 0.6999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (299, CAST(N'2024-05-30T08:56:06.3802956' AS DateTime2), 0.5, 0.6999, N'K', N'VVS1', 9)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (300, CAST(N'2024-05-30T08:56:06.3803090' AS DateTime2), 0.5, 0.6999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (301, CAST(N'2024-05-30T08:56:06.3803222' AS DateTime2), 0.5, 0.6999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (302, CAST(N'2024-05-30T08:56:06.3803355' AS DateTime2), 0.5, 0.6999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (303, CAST(N'2024-05-30T08:56:06.3803613' AS DateTime2), 0.5, 0.6999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (304, CAST(N'2024-05-30T08:56:06.3803749' AS DateTime2), 0.5, 0.6999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (305, CAST(N'2024-05-30T08:56:06.3803879' AS DateTime2), 0.5, 0.6999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (306, CAST(N'2024-05-30T08:56:06.3804015' AS DateTime2), 0.5, 0.6999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (307, CAST(N'2024-05-30T08:56:06.3804152' AS DateTime2), 0.5, 0.6999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (308, CAST(N'2024-05-30T08:56:06.3804371' AS DateTime2), 0.5, 0.6999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (309, CAST(N'2024-05-30T08:56:06.3804543' AS DateTime2), 0.5, 0.6999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (310, CAST(N'2024-05-30T08:56:06.3804684' AS DateTime2), 0.5, 0.6999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (311, CAST(N'2024-05-30T08:56:06.3804816' AS DateTime2), 0.5, 0.6999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (312, CAST(N'2024-05-30T08:56:06.3804952' AS DateTime2), 0.5, 0.6999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (313, CAST(N'2024-05-30T08:56:06.3805146' AS DateTime2), 0.5, 0.6999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (314, CAST(N'2024-05-30T08:56:06.3805290' AS DateTime2), 0.5, 0.6999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (315, CAST(N'2024-05-30T08:56:06.3805421' AS DateTime2), 0.5, 0.6999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (316, CAST(N'2024-05-30T08:56:06.3805564' AS DateTime2), 0.5, 0.6999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (317, CAST(N'2024-05-30T08:56:06.3805705' AS DateTime2), 0.5, 0.6999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (318, CAST(N'2024-05-30T08:56:06.3805967' AS DateTime2), 0.5, 0.6999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (319, CAST(N'2024-05-30T08:56:06.3806221' AS DateTime2), 0.5, 0.6999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (320, CAST(N'2024-05-30T08:56:06.3806498' AS DateTime2), 0.5, 0.6999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (321, CAST(N'2024-05-30T08:56:06.3806715' AS DateTime2), 0.5, 0.6999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (322, CAST(N'2024-05-30T08:56:06.3806872' AS DateTime2), 0.5, 0.6999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (323, CAST(N'2024-05-30T08:56:06.3807020' AS DateTime2), 0.5, 0.6999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (324, CAST(N'2024-05-30T08:56:06.3807387' AS DateTime2), 0.5, 0.6999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (325, CAST(N'2024-05-30T08:56:06.3807608' AS DateTime2), 0.5, 0.6999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (326, CAST(N'2024-05-30T08:56:06.3807760' AS DateTime2), 0.5, 0.6999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (327, CAST(N'2024-05-30T08:56:06.3807900' AS DateTime2), 0.5, 0.6999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (328, CAST(N'2024-05-30T08:56:06.3808041' AS DateTime2), 0.5, 0.6999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (329, CAST(N'2024-05-30T08:56:06.3808247' AS DateTime2), 0.5, 0.6999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (330, CAST(N'2024-05-30T08:56:06.3808388' AS DateTime2), 0.5, 0.6999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (331, CAST(N'2024-05-30T08:56:07.2907870' AS DateTime2), 0.7, 0.8999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (332, CAST(N'2024-05-30T08:56:07.2909023' AS DateTime2), 0.7, 0.8999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (333, CAST(N'2024-05-30T08:56:07.2909346' AS DateTime2), 0.7, 0.8999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (334, CAST(N'2024-05-30T08:56:07.2909805' AS DateTime2), 0.7, 0.8999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (335, CAST(N'2024-05-30T08:56:07.2910030' AS DateTime2), 0.7, 0.8999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (336, CAST(N'2024-05-30T08:56:07.2910193' AS DateTime2), 0.7, 0.8999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (337, CAST(N'2024-05-30T08:56:07.2910362' AS DateTime2), 0.7, 0.8999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (338, CAST(N'2024-05-30T08:56:07.2910531' AS DateTime2), 0.7, 0.8999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (339, CAST(N'2024-05-30T08:56:07.2910695' AS DateTime2), 0.7, 0.8999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (340, CAST(N'2024-05-30T08:56:07.2911004' AS DateTime2), 0.7, 0.8999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (341, CAST(N'2024-05-30T08:56:07.2911169' AS DateTime2), 0.7, 0.8999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (342, CAST(N'2024-05-30T08:56:07.2911365' AS DateTime2), 0.7, 0.8999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (343, CAST(N'2024-05-30T08:56:07.2911540' AS DateTime2), 0.7, 0.8999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (344, CAST(N'2024-05-30T08:56:07.2911709' AS DateTime2), 0.7, 0.8999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (345, CAST(N'2024-05-30T08:56:07.2911959' AS DateTime2), 0.7, 0.8999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (346, CAST(N'2024-05-30T08:56:07.2912123' AS DateTime2), 0.7, 0.8999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (347, CAST(N'2024-05-30T08:56:07.2912284' AS DateTime2), 0.7, 0.8999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (348, CAST(N'2024-05-30T08:56:07.2912440' AS DateTime2), 0.7, 0.8999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (349, CAST(N'2024-05-30T08:56:07.2912612' AS DateTime2), 0.7, 0.8999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (350, CAST(N'2024-05-30T08:56:07.2912846' AS DateTime2), 0.7, 0.8999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (351, CAST(N'2024-05-30T08:56:07.2913027' AS DateTime2), 0.7, 0.8999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (352, CAST(N'2024-05-30T08:56:07.2913192' AS DateTime2), 0.7, 0.8999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (353, CAST(N'2024-05-30T08:56:07.2913405' AS DateTime2), 0.7, 0.8999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (354, CAST(N'2024-05-30T08:56:07.2913585' AS DateTime2), 0.7, 0.8999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (355, CAST(N'2024-05-30T08:56:07.2913893' AS DateTime2), 0.7, 0.8999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (356, CAST(N'2024-05-30T08:56:07.2914085' AS DateTime2), 0.7, 0.8999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (357, CAST(N'2024-05-30T08:56:07.2914270' AS DateTime2), 0.7, 0.8999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (358, CAST(N'2024-05-30T08:56:07.2914402' AS DateTime2), 0.7, 0.8999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (359, CAST(N'2024-05-30T08:56:07.2914533' AS DateTime2), 0.7, 0.8999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (360, CAST(N'2024-05-30T08:56:07.2914661' AS DateTime2), 0.7, 0.8999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (361, CAST(N'2024-05-30T08:56:07.2914927' AS DateTime2), 0.7, 0.8999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (362, CAST(N'2024-05-30T08:56:07.2915113' AS DateTime2), 0.7, 0.8999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (363, CAST(N'2024-05-30T08:56:07.2915280' AS DateTime2), 0.7, 0.8999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (364, CAST(N'2024-05-30T08:56:07.2915473' AS DateTime2), 0.7, 0.8999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (365, CAST(N'2024-05-30T08:56:07.2915611' AS DateTime2), 0.7, 0.8999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (366, CAST(N'2024-05-30T08:56:07.2915886' AS DateTime2), 0.7, 0.8999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (367, CAST(N'2024-05-30T08:56:07.2916061' AS DateTime2), 0.7, 0.8999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (368, CAST(N'2024-05-30T08:56:07.2916205' AS DateTime2), 0.7, 0.8999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (369, CAST(N'2024-05-30T08:56:07.2916326' AS DateTime2), 0.7, 0.8999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (370, CAST(N'2024-05-30T08:56:07.2916447' AS DateTime2), 0.7, 0.8999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (371, CAST(N'2024-05-30T08:56:07.2916624' AS DateTime2), 0.7, 0.8999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (372, CAST(N'2024-05-30T08:56:07.2916750' AS DateTime2), 0.7, 0.8999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (373, CAST(N'2024-05-30T08:56:07.2916875' AS DateTime2), 0.7, 0.8999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (374, CAST(N'2024-05-30T08:56:07.2917007' AS DateTime2), 0.7, 0.8999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (375, CAST(N'2024-05-30T08:56:07.2917177' AS DateTime2), 0.7, 0.8999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (376, CAST(N'2024-05-30T08:56:07.2917499' AS DateTime2), 0.7, 0.8999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (377, CAST(N'2024-05-30T08:56:07.2917658' AS DateTime2), 0.7, 0.8999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (378, CAST(N'2024-05-30T08:56:07.2917799' AS DateTime2), 0.7, 0.8999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (379, CAST(N'2024-05-30T08:56:07.2917938' AS DateTime2), 0.7, 0.8999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (380, CAST(N'2024-05-30T08:56:07.2918082' AS DateTime2), 0.7, 0.8999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (381, CAST(N'2024-05-30T08:56:07.2918220' AS DateTime2), 0.7, 0.8999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (382, CAST(N'2024-05-30T08:56:07.2918480' AS DateTime2), 0.7, 0.8999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (383, CAST(N'2024-05-30T08:56:07.2918628' AS DateTime2), 0.7, 0.8999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (384, CAST(N'2024-05-30T08:56:07.2918767' AS DateTime2), 0.7, 0.8999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (385, CAST(N'2024-05-30T08:56:07.2918906' AS DateTime2), 0.7, 0.8999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (386, CAST(N'2024-05-30T08:56:07.2919084' AS DateTime2), 0.7, 0.8999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (387, CAST(N'2024-05-30T08:56:07.2919343' AS DateTime2), 0.7, 0.8999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (388, CAST(N'2024-05-30T08:56:07.2919489' AS DateTime2), 0.7, 0.8999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (389, CAST(N'2024-05-30T08:56:07.2919882' AS DateTime2), 0.7, 0.8999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (390, CAST(N'2024-05-30T08:56:07.2920082' AS DateTime2), 0.7, 0.8999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (391, CAST(N'2024-05-30T08:56:07.2920235' AS DateTime2), 0.7, 0.8999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (392, CAST(N'2024-05-30T08:56:07.2920454' AS DateTime2), 0.7, 0.8999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (393, CAST(N'2024-05-30T08:56:07.2920601' AS DateTime2), 0.7, 0.8999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (394, CAST(N'2024-05-30T08:56:07.2920752' AS DateTime2), 0.7, 0.8999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (395, CAST(N'2024-05-30T08:56:07.2920890' AS DateTime2), 0.7, 0.8999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (396, CAST(N'2024-05-30T08:56:07.2921024' AS DateTime2), 0.7, 0.8999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (397, CAST(N'2024-05-30T08:56:07.2921194' AS DateTime2), 0.7, 0.8999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (398, CAST(N'2024-05-30T08:56:07.2921421' AS DateTime2), 0.7, 0.8999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (399, CAST(N'2024-05-30T08:56:07.2921557' AS DateTime2), 0.7, 0.8999, N'J', N'VVS2', 9)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (400, CAST(N'2024-05-30T08:56:07.2921678' AS DateTime2), 0.7, 0.8999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (401, CAST(N'2024-05-30T08:56:07.2921799' AS DateTime2), 0.7, 0.8999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (402, CAST(N'2024-05-30T08:56:07.2921937' AS DateTime2), 0.7, 0.8999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (403, CAST(N'2024-05-30T08:56:07.2922140' AS DateTime2), 0.7, 0.8999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (404, CAST(N'2024-05-30T08:56:07.2922276' AS DateTime2), 0.7, 0.8999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (405, CAST(N'2024-05-30T08:56:07.2922404' AS DateTime2), 0.7, 0.8999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (406, CAST(N'2024-05-30T08:56:07.2922532' AS DateTime2), 0.7, 0.8999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (407, CAST(N'2024-05-30T08:56:07.2922667' AS DateTime2), 0.7, 0.8999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (408, CAST(N'2024-05-30T08:56:07.2922918' AS DateTime2), 0.7, 0.8999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (409, CAST(N'2024-05-30T08:56:07.2923083' AS DateTime2), 0.7, 0.8999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (410, CAST(N'2024-05-30T08:56:07.2923217' AS DateTime2), 0.7, 0.8999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (411, CAST(N'2024-05-30T08:56:07.2923355' AS DateTime2), 0.7, 0.8999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (412, CAST(N'2024-05-30T08:56:07.2923499' AS DateTime2), 0.7, 0.8999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (413, CAST(N'2024-05-30T08:56:07.2923689' AS DateTime2), 0.7, 0.8999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (414, CAST(N'2024-05-30T08:56:07.2923837' AS DateTime2), 0.7, 0.8999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (415, CAST(N'2024-05-30T08:56:07.2923974' AS DateTime2), 0.7, 0.8999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (416, CAST(N'2024-05-30T08:56:07.2924113' AS DateTime2), 0.7, 0.8999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (417, CAST(N'2024-05-30T08:56:07.2924234' AS DateTime2), 0.7, 0.8999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (418, CAST(N'2024-05-30T08:56:07.2924495' AS DateTime2), 0.7, 0.8999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (419, CAST(N'2024-05-30T08:56:07.2924708' AS DateTime2), 0.7, 0.8999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (420, CAST(N'2024-05-30T08:56:07.2924857' AS DateTime2), 0.7, 0.8999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (421, CAST(N'2024-05-30T08:56:07.2924983' AS DateTime2), 0.7, 0.8999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (422, CAST(N'2024-05-30T08:56:07.2925118' AS DateTime2), 0.7, 0.8999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (423, CAST(N'2024-05-30T08:56:07.2925250' AS DateTime2), 0.7, 0.8999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (424, CAST(N'2024-05-30T08:56:07.2925485' AS DateTime2), 0.7, 0.8999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (425, CAST(N'2024-05-30T08:56:07.2925631' AS DateTime2), 0.7, 0.8999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (426, CAST(N'2024-05-30T08:56:07.2925779' AS DateTime2), 0.7, 0.8999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (427, CAST(N'2024-05-30T08:56:07.2926014' AS DateTime2), 0.7, 0.8999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (428, CAST(N'2024-05-30T08:56:07.2926158' AS DateTime2), 0.7, 0.8999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (429, CAST(N'2024-05-30T08:56:07.2926383' AS DateTime2), 0.7, 0.8999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (430, CAST(N'2024-05-30T08:56:07.2926573' AS DateTime2), 0.7, 0.8999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (431, CAST(N'2024-05-30T08:56:07.2926713' AS DateTime2), 0.7, 0.8999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (432, CAST(N'2024-05-30T08:56:07.2926845' AS DateTime2), 0.7, 0.8999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (433, CAST(N'2024-05-30T08:56:07.2927271' AS DateTime2), 0.7, 0.8999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (434, CAST(N'2024-05-30T08:56:07.2927403' AS DateTime2), 0.7, 0.8999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (435, CAST(N'2024-05-30T08:56:07.2927520' AS DateTime2), 0.7, 0.8999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (436, CAST(N'2024-05-30T08:56:07.2927636' AS DateTime2), 0.7, 0.8999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (437, CAST(N'2024-05-30T08:56:07.2927832' AS DateTime2), 0.7, 0.8999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (438, CAST(N'2024-05-30T08:56:07.2927959' AS DateTime2), 0.7, 0.8999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (439, CAST(N'2024-05-30T08:56:07.2928080' AS DateTime2), 0.7, 0.8999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (440, CAST(N'2024-05-30T08:56:07.2928195' AS DateTime2), 0.7, 0.8999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (441, CAST(N'2024-05-30T08:56:07.6629273' AS DateTime2), 0.9, 0.9999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (442, CAST(N'2024-05-30T08:56:07.7973749' AS DateTime2), 0.9, 0.9999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (443, CAST(N'2024-05-30T08:56:07.7975013' AS DateTime2), 0.9, 0.9999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (444, CAST(N'2024-05-30T08:56:07.7975329' AS DateTime2), 0.9, 0.9999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (445, CAST(N'2024-05-30T08:56:07.7975517' AS DateTime2), 0.9, 0.9999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (446, CAST(N'2024-05-30T08:56:07.7975682' AS DateTime2), 0.9, 0.9999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (447, CAST(N'2024-05-30T08:56:07.7975903' AS DateTime2), 0.9, 0.9999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (448, CAST(N'2024-05-30T08:56:07.7976470' AS DateTime2), 0.9, 0.9999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (449, CAST(N'2024-05-30T08:56:07.7976729' AS DateTime2), 0.9, 0.9999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (450, CAST(N'2024-05-30T08:56:07.7976865' AS DateTime2), 0.9, 0.9999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (451, CAST(N'2024-05-30T08:56:07.7977081' AS DateTime2), 0.9, 0.9999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (452, CAST(N'2024-05-30T08:56:07.7977309' AS DateTime2), 0.9, 0.9999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (453, CAST(N'2024-05-30T08:56:07.7977584' AS DateTime2), 0.9, 0.9999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (454, CAST(N'2024-05-30T08:56:07.7977806' AS DateTime2), 0.9, 0.9999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (455, CAST(N'2024-05-30T08:56:07.7978007' AS DateTime2), 0.9, 0.9999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (456, CAST(N'2024-05-30T08:56:07.7978155' AS DateTime2), 0.9, 0.9999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (457, CAST(N'2024-05-30T08:56:07.7978349' AS DateTime2), 0.9, 0.9999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (458, CAST(N'2024-05-30T08:56:07.7978643' AS DateTime2), 0.9, 0.9999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (459, CAST(N'2024-05-30T08:56:07.7978849' AS DateTime2), 0.9, 0.9999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (460, CAST(N'2024-05-30T08:56:07.7979042' AS DateTime2), 0.9, 0.9999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (461, CAST(N'2024-05-30T08:56:07.7979228' AS DateTime2), 0.9, 0.9999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (462, CAST(N'2024-05-30T08:56:07.7979411' AS DateTime2), 0.9, 0.9999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (463, CAST(N'2024-05-30T08:56:07.7979641' AS DateTime2), 0.9, 0.9999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (464, CAST(N'2024-05-30T08:56:07.7979917' AS DateTime2), 0.9, 0.9999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (465, CAST(N'2024-05-30T08:56:07.7980108' AS DateTime2), 0.9, 0.9999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (466, CAST(N'2024-05-30T08:56:07.7980281' AS DateTime2), 0.9, 0.9999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (467, CAST(N'2024-05-30T08:56:07.7980452' AS DateTime2), 0.9, 0.9999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (468, CAST(N'2024-05-30T08:56:07.7980675' AS DateTime2), 0.9, 0.9999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (469, CAST(N'2024-05-30T08:56:07.7981005' AS DateTime2), 0.9, 0.9999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (470, CAST(N'2024-05-30T08:56:07.7981218' AS DateTime2), 0.9, 0.9999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (471, CAST(N'2024-05-30T08:56:07.7981429' AS DateTime2), 0.9, 0.9999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (472, CAST(N'2024-05-30T08:56:07.7981636' AS DateTime2), 0.9, 0.9999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (473, CAST(N'2024-05-30T08:56:07.7981903' AS DateTime2), 0.9, 0.9999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (474, CAST(N'2024-05-30T08:56:07.7982243' AS DateTime2), 0.9, 0.9999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (475, CAST(N'2024-05-30T08:56:07.7983748' AS DateTime2), 0.9, 0.9999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (476, CAST(N'2024-05-30T08:56:07.7998868' AS DateTime2), 0.9, 0.9999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (477, CAST(N'2024-05-30T08:56:07.7999623' AS DateTime2), 0.9, 0.9999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (478, CAST(N'2024-05-30T08:56:07.7999905' AS DateTime2), 0.9, 0.9999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (479, CAST(N'2024-05-30T08:56:07.8001375' AS DateTime2), 0.9, 0.9999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (480, CAST(N'2024-05-30T08:56:07.8004862' AS DateTime2), 0.9, 0.9999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (481, CAST(N'2024-05-30T08:56:07.8005580' AS DateTime2), 0.9, 0.9999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (482, CAST(N'2024-05-30T08:56:07.8007014' AS DateTime2), 0.9, 0.9999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (483, CAST(N'2024-05-30T08:56:07.8007743' AS DateTime2), 0.9, 0.9999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (484, CAST(N'2024-05-30T08:56:07.8008363' AS DateTime2), 0.9, 0.9999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (485, CAST(N'2024-05-30T08:56:07.8008693' AS DateTime2), 0.9, 0.9999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (486, CAST(N'2024-05-30T08:56:07.8008868' AS DateTime2), 0.9, 0.9999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (487, CAST(N'2024-05-30T08:56:07.8009047' AS DateTime2), 0.9, 0.9999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (488, CAST(N'2024-05-30T08:56:07.8009223' AS DateTime2), 0.9, 0.9999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (489, CAST(N'2024-05-30T08:56:07.8009386' AS DateTime2), 0.9, 0.9999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (490, CAST(N'2024-05-30T08:56:07.8009846' AS DateTime2), 0.9, 0.9999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (491, CAST(N'2024-05-30T08:56:07.8010072' AS DateTime2), 0.9, 0.9999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (492, CAST(N'2024-05-30T08:56:07.8010252' AS DateTime2), 0.9, 0.9999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (493, CAST(N'2024-05-30T08:56:07.8010566' AS DateTime2), 0.9, 0.9999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (494, CAST(N'2024-05-30T08:56:07.8010885' AS DateTime2), 0.9, 0.9999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (495, CAST(N'2024-05-30T08:56:07.8011138' AS DateTime2), 0.9, 0.9999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (496, CAST(N'2024-05-30T08:56:07.8011389' AS DateTime2), 0.9, 0.9999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (497, CAST(N'2024-05-30T08:56:07.8011541' AS DateTime2), 0.9, 0.9999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (498, CAST(N'2024-05-30T08:56:07.8011671' AS DateTime2), 0.9, 0.9999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (499, CAST(N'2024-05-30T08:56:07.8011853' AS DateTime2), 0.9, 0.9999, N'I', N'VS1', 8.2)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (500, CAST(N'2024-05-30T08:56:07.8012099' AS DateTime2), 0.9, 0.9999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (501, CAST(N'2024-05-30T08:56:07.8012312' AS DateTime2), 0.9, 0.9999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (502, CAST(N'2024-05-30T08:56:07.8012493' AS DateTime2), 0.9, 0.9999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (503, CAST(N'2024-05-30T08:56:07.8012640' AS DateTime2), 0.9, 0.9999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (504, CAST(N'2024-05-30T08:56:07.8012822' AS DateTime2), 0.9, 0.9999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (505, CAST(N'2024-05-30T08:56:07.8013012' AS DateTime2), 0.9, 0.9999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (506, CAST(N'2024-05-30T08:56:07.8013306' AS DateTime2), 0.9, 0.9999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (507, CAST(N'2024-05-30T08:56:07.8013654' AS DateTime2), 0.9, 0.9999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (508, CAST(N'2024-05-30T08:56:07.8013955' AS DateTime2), 0.9, 0.9999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (509, CAST(N'2024-05-30T08:56:07.8014236' AS DateTime2), 0.9, 0.9999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (510, CAST(N'2024-05-30T08:56:07.8014439' AS DateTime2), 0.9, 0.9999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (511, CAST(N'2024-05-30T08:56:07.8014737' AS DateTime2), 0.9, 0.9999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (512, CAST(N'2024-05-30T08:56:07.8014889' AS DateTime2), 0.9, 0.9999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (513, CAST(N'2024-05-30T08:56:07.8015105' AS DateTime2), 0.9, 0.9999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (514, CAST(N'2024-05-30T08:56:07.8015271' AS DateTime2), 0.9, 0.9999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (515, CAST(N'2024-05-30T08:56:07.8015430' AS DateTime2), 0.9, 0.9999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (516, CAST(N'2024-05-30T08:56:07.8015691' AS DateTime2), 0.9, 0.9999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (517, CAST(N'2024-05-30T08:56:07.8015999' AS DateTime2), 0.9, 0.9999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (518, CAST(N'2024-05-30T08:56:07.8016211' AS DateTime2), 0.9, 0.9999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (519, CAST(N'2024-05-30T08:56:07.8016457' AS DateTime2), 0.9, 0.9999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (520, CAST(N'2024-05-30T08:56:07.8016700' AS DateTime2), 0.9, 0.9999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (521, CAST(N'2024-05-30T08:56:07.8017028' AS DateTime2), 0.9, 0.9999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (522, CAST(N'2024-05-30T08:56:07.8017266' AS DateTime2), 0.9, 0.9999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (523, CAST(N'2024-05-30T08:56:07.8017398' AS DateTime2), 0.9, 0.9999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (524, CAST(N'2024-05-30T08:56:07.8017514' AS DateTime2), 0.9, 0.9999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (525, CAST(N'2024-05-30T08:56:07.8017629' AS DateTime2), 0.9, 0.9999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (526, CAST(N'2024-05-30T08:56:07.8017759' AS DateTime2), 0.9, 0.9999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (527, CAST(N'2024-05-30T08:56:07.8018054' AS DateTime2), 0.9, 0.9999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (528, CAST(N'2024-05-30T08:56:07.8018198' AS DateTime2), 0.9, 0.9999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (529, CAST(N'2024-05-30T08:56:07.8018372' AS DateTime2), 0.9, 0.9999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (530, CAST(N'2024-05-30T08:56:07.8018511' AS DateTime2), 0.9, 0.9999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (531, CAST(N'2024-05-30T08:56:07.8018654' AS DateTime2), 0.9, 0.9999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (532, CAST(N'2024-05-30T08:56:07.8018898' AS DateTime2), 0.9, 0.9999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (533, CAST(N'2024-05-30T08:56:07.8019054' AS DateTime2), 0.9, 0.9999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (534, CAST(N'2024-05-30T08:56:07.8019194' AS DateTime2), 0.9, 0.9999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (535, CAST(N'2024-05-30T08:56:07.8019337' AS DateTime2), 0.9, 0.9999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (536, CAST(N'2024-05-30T08:56:07.8019778' AS DateTime2), 0.9, 0.9999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (537, CAST(N'2024-05-30T08:56:07.8020011' AS DateTime2), 0.9, 0.9999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (538, CAST(N'2024-05-30T08:56:07.8020197' AS DateTime2), 0.9, 0.9999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (539, CAST(N'2024-05-30T08:56:07.8020355' AS DateTime2), 0.9, 0.9999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (540, CAST(N'2024-05-30T08:56:07.8020515' AS DateTime2), 0.9, 0.9999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (541, CAST(N'2024-05-30T08:56:07.8020668' AS DateTime2), 0.9, 0.9999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (542, CAST(N'2024-05-30T08:56:07.8020891' AS DateTime2), 0.9, 0.9999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (543, CAST(N'2024-05-30T08:56:07.8021050' AS DateTime2), 0.9, 0.9999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (544, CAST(N'2024-05-30T08:56:07.8021193' AS DateTime2), 0.9, 0.9999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (545, CAST(N'2024-05-30T08:56:07.8021335' AS DateTime2), 0.9, 0.9999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (546, CAST(N'2024-05-30T08:56:07.8021475' AS DateTime2), 0.9, 0.9999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (547, CAST(N'2024-05-30T08:56:07.8021617' AS DateTime2), 0.9, 0.9999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (548, CAST(N'2024-05-30T08:56:07.8021859' AS DateTime2), 0.9, 0.9999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (549, CAST(N'2024-05-30T08:56:07.8022017' AS DateTime2), 0.9, 0.9999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (550, CAST(N'2024-05-30T08:56:07.8022162' AS DateTime2), 0.9, 0.9999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (551, CAST(N'2024-05-30T08:56:08.2219109' AS DateTime2), 1, 1.4999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (552, CAST(N'2024-05-30T08:56:08.4421476' AS DateTime2), 1, 1.4999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (553, CAST(N'2024-05-30T08:56:08.4422679' AS DateTime2), 1, 1.4999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (554, CAST(N'2024-05-30T08:56:08.4422917' AS DateTime2), 1, 1.4999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (555, CAST(N'2024-05-30T08:56:08.4423091' AS DateTime2), 1, 1.4999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (556, CAST(N'2024-05-30T08:56:08.4423253' AS DateTime2), 1, 1.4999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (557, CAST(N'2024-05-30T08:56:08.4423421' AS DateTime2), 1, 1.4999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (558, CAST(N'2024-05-30T08:56:08.4423679' AS DateTime2), 1, 1.4999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (559, CAST(N'2024-05-30T08:56:08.4423843' AS DateTime2), 1, 1.4999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (560, CAST(N'2024-05-30T08:56:08.4423996' AS DateTime2), 1, 1.4999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (561, CAST(N'2024-05-30T08:56:08.4424147' AS DateTime2), 1, 1.4999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (562, CAST(N'2024-05-30T08:56:08.4424350' AS DateTime2), 1, 1.4999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (563, CAST(N'2024-05-30T08:56:08.4424563' AS DateTime2), 1, 1.4999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (564, CAST(N'2024-05-30T08:56:08.4424723' AS DateTime2), 1, 1.4999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (565, CAST(N'2024-05-30T08:56:08.4424873' AS DateTime2), 1, 1.4999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (566, CAST(N'2024-05-30T08:56:08.4425040' AS DateTime2), 1, 1.4999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (567, CAST(N'2024-05-30T08:56:08.4425190' AS DateTime2), 1, 1.4999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (568, CAST(N'2024-05-30T08:56:08.4425513' AS DateTime2), 1, 1.4999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (569, CAST(N'2024-05-30T08:56:08.4425684' AS DateTime2), 1, 1.4999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (570, CAST(N'2024-05-30T08:56:08.4425845' AS DateTime2), 1, 1.4999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (571, CAST(N'2024-05-30T08:56:08.4426093' AS DateTime2), 1, 1.4999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (572, CAST(N'2024-05-30T08:56:08.4426254' AS DateTime2), 1, 1.4999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (573, CAST(N'2024-05-30T08:56:08.4426442' AS DateTime2), 1, 1.4999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (574, CAST(N'2024-05-30T08:56:08.4426706' AS DateTime2), 1, 1.4999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (575, CAST(N'2024-05-30T08:56:08.4426862' AS DateTime2), 1, 1.4999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (576, CAST(N'2024-05-30T08:56:08.4427014' AS DateTime2), 1, 1.4999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (577, CAST(N'2024-05-30T08:56:08.4427201' AS DateTime2), 1, 1.4999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (578, CAST(N'2024-05-30T08:56:08.4427368' AS DateTime2), 1, 1.4999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (579, CAST(N'2024-05-30T08:56:08.4427605' AS DateTime2), 1, 1.4999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (580, CAST(N'2024-05-30T08:56:08.4427768' AS DateTime2), 1, 1.4999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (581, CAST(N'2024-05-30T08:56:08.4428009' AS DateTime2), 1, 1.4999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (582, CAST(N'2024-05-30T08:56:08.4428175' AS DateTime2), 1, 1.4999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (583, CAST(N'2024-05-30T08:56:08.4428328' AS DateTime2), 1, 1.4999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (584, CAST(N'2024-05-30T08:56:08.4428672' AS DateTime2), 1, 1.4999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (585, CAST(N'2024-05-30T08:56:08.4428880' AS DateTime2), 1, 1.4999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (586, CAST(N'2024-05-30T08:56:08.4429049' AS DateTime2), 1, 1.4999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (587, CAST(N'2024-05-30T08:56:08.4429202' AS DateTime2), 1, 1.4999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (588, CAST(N'2024-05-30T08:56:08.4429361' AS DateTime2), 1, 1.4999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (589, CAST(N'2024-05-30T08:56:08.4429586' AS DateTime2), 1, 1.4999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (590, CAST(N'2024-05-30T08:56:08.4429749' AS DateTime2), 1, 1.4999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (591, CAST(N'2024-05-30T08:56:08.4429895' AS DateTime2), 1, 1.4999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (592, CAST(N'2024-05-30T08:56:08.4430059' AS DateTime2), 1, 1.4999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (593, CAST(N'2024-05-30T08:56:08.4430206' AS DateTime2), 1, 1.4999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (594, CAST(N'2024-05-30T08:56:08.4430372' AS DateTime2), 1, 1.4999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (595, CAST(N'2024-05-30T08:56:08.4430628' AS DateTime2), 1, 1.4999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (596, CAST(N'2024-05-30T08:56:08.4430791' AS DateTime2), 1, 1.4999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (597, CAST(N'2024-05-30T08:56:08.4430948' AS DateTime2), 1, 1.4999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (598, CAST(N'2024-05-30T08:56:08.4431105' AS DateTime2), 1, 1.4999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (599, CAST(N'2024-05-30T08:56:08.4431253' AS DateTime2), 1, 1.4999, N'H', N'VS2', 10)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (600, CAST(N'2024-05-30T08:56:08.4431472' AS DateTime2), 1, 1.4999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (601, CAST(N'2024-05-30T08:56:08.4431625' AS DateTime2), 1, 1.4999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (602, CAST(N'2024-05-30T08:56:08.4431819' AS DateTime2), 1, 1.4999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (603, CAST(N'2024-05-30T08:56:08.4432128' AS DateTime2), 1, 1.4999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (604, CAST(N'2024-05-30T08:56:08.4432315' AS DateTime2), 1, 1.4999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (605, CAST(N'2024-05-30T08:56:08.4432540' AS DateTime2), 1, 1.4999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (606, CAST(N'2024-05-30T08:56:08.4432746' AS DateTime2), 1, 1.4999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (607, CAST(N'2024-05-30T08:56:08.4432901' AS DateTime2), 1, 1.4999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (608, CAST(N'2024-05-30T08:56:08.4433064' AS DateTime2), 1, 1.4999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (609, CAST(N'2024-05-30T08:56:08.4433220' AS DateTime2), 1, 1.4999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (610, CAST(N'2024-05-30T08:56:08.4433512' AS DateTime2), 1, 1.4999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (611, CAST(N'2024-05-30T08:56:08.4433681' AS DateTime2), 1, 1.4999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (612, CAST(N'2024-05-30T08:56:08.4433833' AS DateTime2), 1, 1.4999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (613, CAST(N'2024-05-30T08:56:08.4433992' AS DateTime2), 1, 1.4999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (614, CAST(N'2024-05-30T08:56:08.4434144' AS DateTime2), 1, 1.4999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (615, CAST(N'2024-05-30T08:56:08.4434294' AS DateTime2), 1, 1.4999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (616, CAST(N'2024-05-30T08:56:08.4434538' AS DateTime2), 1, 1.4999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (617, CAST(N'2024-05-30T08:56:08.4434718' AS DateTime2), 1, 1.4999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (618, CAST(N'2024-05-30T08:56:08.4434873' AS DateTime2), 1, 1.4999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (619, CAST(N'2024-05-30T08:56:08.4435025' AS DateTime2), 1, 1.4999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (620, CAST(N'2024-05-30T08:56:08.4435186' AS DateTime2), 1, 1.4999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (621, CAST(N'2024-05-30T08:56:08.4435410' AS DateTime2), 1, 1.4999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (622, CAST(N'2024-05-30T08:56:08.4435566' AS DateTime2), 1, 1.4999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (623, CAST(N'2024-05-30T08:56:08.4435725' AS DateTime2), 1, 1.4999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (624, CAST(N'2024-05-30T08:56:08.4435945' AS DateTime2), 1, 1.4999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (625, CAST(N'2024-05-30T08:56:08.4436118' AS DateTime2), 1, 1.4999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (626, CAST(N'2024-05-30T08:56:08.4436340' AS DateTime2), 1, 1.4999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (627, CAST(N'2024-05-30T08:56:08.4436498' AS DateTime2), 1, 1.4999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (628, CAST(N'2024-05-30T08:56:08.4436679' AS DateTime2), 1, 1.4999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (629, CAST(N'2024-05-30T08:56:08.4436832' AS DateTime2), 1, 1.4999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (630, CAST(N'2024-05-30T08:56:08.4436981' AS DateTime2), 1, 1.4999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (631, CAST(N'2024-05-30T08:56:08.4437141' AS DateTime2), 1, 1.4999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (632, CAST(N'2024-05-30T08:56:08.4437373' AS DateTime2), 1, 1.4999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (633, CAST(N'2024-05-30T08:56:08.4437532' AS DateTime2), 1, 1.4999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (634, CAST(N'2024-05-30T08:56:08.4437685' AS DateTime2), 1, 1.4999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (635, CAST(N'2024-05-30T08:56:08.4437851' AS DateTime2), 1, 1.4999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (636, CAST(N'2024-05-30T08:56:08.4438006' AS DateTime2), 1, 1.4999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (637, CAST(N'2024-05-30T08:56:08.4438227' AS DateTime2), 1, 1.4999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (638, CAST(N'2024-05-30T08:56:08.4438370' AS DateTime2), 1, 1.4999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (639, CAST(N'2024-05-30T08:56:08.4438550' AS DateTime2), 1, 1.4999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (640, CAST(N'2024-05-30T08:56:08.4438702' AS DateTime2), 1, 1.4999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (641, CAST(N'2024-05-30T08:56:08.4438841' AS DateTime2), 1, 1.4999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (642, CAST(N'2024-05-30T08:56:08.4439107' AS DateTime2), 1, 1.4999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (643, CAST(N'2024-05-30T08:56:08.4439261' AS DateTime2), 1, 1.4999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (644, CAST(N'2024-05-30T08:56:08.4439422' AS DateTime2), 1, 1.4999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (645, CAST(N'2024-05-30T08:56:08.4439570' AS DateTime2), 1, 1.4999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (646, CAST(N'2024-05-30T08:56:08.4439712' AS DateTime2), 1, 1.4999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (647, CAST(N'2024-05-30T08:56:08.4439916' AS DateTime2), 1, 1.4999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (648, CAST(N'2024-05-30T08:56:08.4440088' AS DateTime2), 1, 1.4999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (649, CAST(N'2024-05-30T08:56:08.4440240' AS DateTime2), 1, 1.4999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (650, CAST(N'2024-05-30T08:56:08.4440513' AS DateTime2), 1, 1.4999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (651, CAST(N'2024-05-30T08:56:08.4440752' AS DateTime2), 1, 1.4999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (652, CAST(N'2024-05-30T08:56:08.4440901' AS DateTime2), 1, 1.4999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (653, CAST(N'2024-05-30T08:56:08.4441215' AS DateTime2), 1, 1.4999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (654, CAST(N'2024-05-30T08:56:08.4441380' AS DateTime2), 1, 1.4999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (655, CAST(N'2024-05-30T08:56:08.4441543' AS DateTime2), 1, 1.4999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (656, CAST(N'2024-05-30T08:56:08.4441686' AS DateTime2), 1, 1.4999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (657, CAST(N'2024-05-30T08:56:08.4441840' AS DateTime2), 1, 1.4999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (658, CAST(N'2024-05-30T08:56:08.4442088' AS DateTime2), 1, 1.4999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (659, CAST(N'2024-05-30T08:56:08.4442235' AS DateTime2), 1, 1.4999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (660, CAST(N'2024-05-30T08:56:08.4442390' AS DateTime2), 1, 1.4999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (661, CAST(N'2024-05-30T08:56:09.0585035' AS DateTime2), 1.5, 1.9999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (662, CAST(N'2024-05-30T08:56:09.0586994' AS DateTime2), 1.5, 1.9999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (663, CAST(N'2024-05-30T08:56:09.0590008' AS DateTime2), 1.5, 1.9999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (664, CAST(N'2024-05-30T08:56:09.0590389' AS DateTime2), 1.5, 1.9999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (665, CAST(N'2024-05-30T08:56:09.0590555' AS DateTime2), 1.5, 1.9999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (666, CAST(N'2024-05-30T08:56:09.0590691' AS DateTime2), 1.5, 1.9999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (667, CAST(N'2024-05-30T08:56:09.0591075' AS DateTime2), 1.5, 1.9999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (668, CAST(N'2024-05-30T08:56:09.0591210' AS DateTime2), 1.5, 1.9999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (669, CAST(N'2024-05-30T08:56:09.0591335' AS DateTime2), 1.5, 1.9999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (670, CAST(N'2024-05-30T08:56:09.0591458' AS DateTime2), 1.5, 1.9999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (671, CAST(N'2024-05-30T08:56:09.0591634' AS DateTime2), 1.5, 1.9999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (672, CAST(N'2024-05-30T08:56:09.0591928' AS DateTime2), 1.5, 1.9999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (673, CAST(N'2024-05-30T08:56:09.0592156' AS DateTime2), 1.5, 1.9999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (674, CAST(N'2024-05-30T08:56:09.0592361' AS DateTime2), 1.5, 1.9999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (675, CAST(N'2024-05-30T08:56:09.0592547' AS DateTime2), 1.5, 1.9999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (676, CAST(N'2024-05-30T08:56:09.0592679' AS DateTime2), 1.5, 1.9999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (677, CAST(N'2024-05-30T08:56:09.0592884' AS DateTime2), 1.5, 1.9999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (678, CAST(N'2024-05-30T08:56:09.0593028' AS DateTime2), 1.5, 1.9999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (679, CAST(N'2024-05-30T08:56:09.0593173' AS DateTime2), 1.5, 1.9999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (680, CAST(N'2024-05-30T08:56:09.0593295' AS DateTime2), 1.5, 1.9999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (681, CAST(N'2024-05-30T08:56:09.0593464' AS DateTime2), 1.5, 1.9999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (682, CAST(N'2024-05-30T08:56:09.0593690' AS DateTime2), 1.5, 1.9999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (683, CAST(N'2024-05-30T08:56:09.0593866' AS DateTime2), 1.5, 1.9999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (684, CAST(N'2024-05-30T08:56:09.0594002' AS DateTime2), 1.5, 1.9999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (685, CAST(N'2024-05-30T08:56:09.0594133' AS DateTime2), 1.5, 1.9999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (686, CAST(N'2024-05-30T08:56:09.0594281' AS DateTime2), 1.5, 1.9999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (687, CAST(N'2024-05-30T08:56:09.0594440' AS DateTime2), 1.5, 1.9999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (688, CAST(N'2024-05-30T08:56:09.0594608' AS DateTime2), 1.5, 1.9999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (689, CAST(N'2024-05-30T08:56:09.0594769' AS DateTime2), 1.5, 1.9999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (690, CAST(N'2024-05-30T08:56:09.0595143' AS DateTime2), 1.5, 1.9999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (691, CAST(N'2024-05-30T08:56:09.0595329' AS DateTime2), 1.5, 1.9999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (692, CAST(N'2024-05-30T08:56:09.0595454' AS DateTime2), 1.5, 1.9999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (693, CAST(N'2024-05-30T08:56:09.0595575' AS DateTime2), 1.5, 1.9999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (694, CAST(N'2024-05-30T08:56:09.0595726' AS DateTime2), 1.5, 1.9999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (695, CAST(N'2024-05-30T08:56:09.0596039' AS DateTime2), 1.5, 1.9999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (696, CAST(N'2024-05-30T08:56:09.0596640' AS DateTime2), 1.5, 1.9999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (697, CAST(N'2024-05-30T08:56:09.0596973' AS DateTime2), 1.5, 1.9999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (698, CAST(N'2024-05-30T08:56:09.0597203' AS DateTime2), 1.5, 1.9999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (699, CAST(N'2024-05-30T08:56:09.0597408' AS DateTime2), 1.5, 1.9999, N'G', N'SI1', 10.1)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (700, CAST(N'2024-05-30T08:56:09.0597586' AS DateTime2), 1.5, 1.9999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (701, CAST(N'2024-05-30T08:56:09.0597981' AS DateTime2), 1.5, 1.9999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (702, CAST(N'2024-05-30T08:56:09.0598169' AS DateTime2), 1.5, 1.9999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (703, CAST(N'2024-05-30T08:56:09.0598355' AS DateTime2), 1.5, 1.9999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (704, CAST(N'2024-05-30T08:56:09.0598493' AS DateTime2), 1.5, 1.9999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (705, CAST(N'2024-05-30T08:56:09.0598707' AS DateTime2), 1.5, 1.9999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (706, CAST(N'2024-05-30T08:56:09.0598998' AS DateTime2), 1.5, 1.9999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (707, CAST(N'2024-05-30T08:56:09.0599227' AS DateTime2), 1.5, 1.9999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (708, CAST(N'2024-05-30T08:56:09.0599444' AS DateTime2), 1.5, 1.9999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (709, CAST(N'2024-05-30T08:56:09.0599621' AS DateTime2), 1.5, 1.9999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (710, CAST(N'2024-05-30T08:56:09.0599770' AS DateTime2), 1.5, 1.9999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (711, CAST(N'2024-05-30T08:56:09.0600019' AS DateTime2), 1.5, 1.9999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (712, CAST(N'2024-05-30T08:56:09.0600219' AS DateTime2), 1.5, 1.9999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (713, CAST(N'2024-05-30T08:56:09.0600412' AS DateTime2), 1.5, 1.9999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (714, CAST(N'2024-05-30T08:56:09.0600633' AS DateTime2), 1.5, 1.9999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (715, CAST(N'2024-05-30T08:56:09.0600847' AS DateTime2), 1.5, 1.9999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (716, CAST(N'2024-05-30T08:56:09.0601026' AS DateTime2), 1.5, 1.9999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (717, CAST(N'2024-05-30T08:56:09.0601349' AS DateTime2), 1.5, 1.9999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (718, CAST(N'2024-05-30T08:56:09.0601532' AS DateTime2), 1.5, 1.9999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (719, CAST(N'2024-05-30T08:56:09.0601679' AS DateTime2), 1.5, 1.9999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (720, CAST(N'2024-05-30T08:56:09.0601855' AS DateTime2), 1.5, 1.9999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (721, CAST(N'2024-05-30T08:56:09.0601991' AS DateTime2), 1.5, 1.9999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (722, CAST(N'2024-05-30T08:56:09.0602337' AS DateTime2), 1.5, 1.9999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (723, CAST(N'2024-05-30T08:56:09.0602561' AS DateTime2), 1.5, 1.9999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (724, CAST(N'2024-05-30T08:56:09.0602729' AS DateTime2), 1.5, 1.9999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (725, CAST(N'2024-05-30T08:56:09.0602881' AS DateTime2), 1.5, 1.9999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (726, CAST(N'2024-05-30T08:56:09.0603023' AS DateTime2), 1.5, 1.9999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (727, CAST(N'2024-05-30T08:56:09.0603290' AS DateTime2), 1.5, 1.9999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (728, CAST(N'2024-05-30T08:56:09.0603453' AS DateTime2), 1.5, 1.9999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (729, CAST(N'2024-05-30T08:56:09.0603605' AS DateTime2), 1.5, 1.9999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (730, CAST(N'2024-05-30T08:56:09.0603753' AS DateTime2), 1.5, 1.9999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (731, CAST(N'2024-05-30T08:56:09.0603901' AS DateTime2), 1.5, 1.9999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (732, CAST(N'2024-05-30T08:56:09.0604216' AS DateTime2), 1.5, 1.9999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (733, CAST(N'2024-05-30T08:56:09.0604365' AS DateTime2), 1.5, 1.9999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (734, CAST(N'2024-05-30T08:56:09.0604520' AS DateTime2), 1.5, 1.9999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (735, CAST(N'2024-05-30T08:56:09.0604674' AS DateTime2), 1.5, 1.9999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (736, CAST(N'2024-05-30T08:56:09.0604817' AS DateTime2), 1.5, 1.9999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (737, CAST(N'2024-05-30T08:56:09.0604962' AS DateTime2), 1.5, 1.9999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (738, CAST(N'2024-05-30T08:56:09.0605308' AS DateTime2), 1.5, 1.9999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (739, CAST(N'2024-05-30T08:56:09.0605466' AS DateTime2), 1.5, 1.9999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (740, CAST(N'2024-05-30T08:56:09.0605615' AS DateTime2), 1.5, 1.9999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (741, CAST(N'2024-05-30T08:56:09.0605747' AS DateTime2), 1.5, 1.9999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (742, CAST(N'2024-05-30T08:56:09.0605984' AS DateTime2), 1.5, 1.9999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (743, CAST(N'2024-05-30T08:56:09.0606247' AS DateTime2), 1.5, 1.9999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (744, CAST(N'2024-05-30T08:56:09.0606423' AS DateTime2), 1.5, 1.9999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (745, CAST(N'2024-05-30T08:56:09.0606564' AS DateTime2), 1.5, 1.9999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (746, CAST(N'2024-05-30T08:56:09.0606730' AS DateTime2), 1.5, 1.9999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (747, CAST(N'2024-05-30T08:56:09.0607018' AS DateTime2), 1.5, 1.9999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (748, CAST(N'2024-05-30T08:56:09.0607321' AS DateTime2), 1.5, 1.9999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (749, CAST(N'2024-05-30T08:56:09.0607525' AS DateTime2), 1.5, 1.9999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (750, CAST(N'2024-05-30T08:56:09.0607678' AS DateTime2), 1.5, 1.9999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (751, CAST(N'2024-05-30T08:56:09.0607826' AS DateTime2), 1.5, 1.9999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (752, CAST(N'2024-05-30T08:56:09.0607960' AS DateTime2), 1.5, 1.9999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (753, CAST(N'2024-05-30T08:56:09.0608195' AS DateTime2), 1.5, 1.9999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (754, CAST(N'2024-05-30T08:56:09.0608365' AS DateTime2), 1.5, 1.9999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (755, CAST(N'2024-05-30T08:56:09.0608528' AS DateTime2), 1.5, 1.9999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (756, CAST(N'2024-05-30T08:56:09.0608674' AS DateTime2), 1.5, 1.9999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (757, CAST(N'2024-05-30T08:56:09.0608815' AS DateTime2), 1.5, 1.9999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (758, CAST(N'2024-05-30T08:56:09.0608960' AS DateTime2), 1.5, 1.9999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (759, CAST(N'2024-05-30T08:56:09.0609198' AS DateTime2), 1.5, 1.9999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (760, CAST(N'2024-05-30T08:56:09.0609380' AS DateTime2), 1.5, 1.9999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (761, CAST(N'2024-05-30T08:56:09.0609536' AS DateTime2), 1.5, 1.9999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (762, CAST(N'2024-05-30T08:56:09.0609684' AS DateTime2), 1.5, 1.9999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (763, CAST(N'2024-05-30T08:56:09.0609831' AS DateTime2), 1.5, 1.9999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (764, CAST(N'2024-05-30T08:56:09.0610063' AS DateTime2), 1.5, 1.9999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (765, CAST(N'2024-05-30T08:56:09.0610211' AS DateTime2), 1.5, 1.9999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (766, CAST(N'2024-05-30T08:56:09.0610357' AS DateTime2), 1.5, 1.9999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (767, CAST(N'2024-05-30T08:56:09.0610503' AS DateTime2), 1.5, 1.9999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (768, CAST(N'2024-05-30T08:56:09.0610646' AS DateTime2), 1.5, 1.9999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (769, CAST(N'2024-05-30T08:56:09.0610866' AS DateTime2), 1.5, 1.9999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (770, CAST(N'2024-05-30T08:56:09.0611031' AS DateTime2), 1.5, 1.9999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (771, CAST(N'2024-05-30T08:56:09.3726979' AS DateTime2), 2, 2.9999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (772, CAST(N'2024-05-30T08:56:09.6602812' AS DateTime2), 2, 2.9999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (773, CAST(N'2024-05-30T08:56:09.6606164' AS DateTime2), 2, 2.9999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (774, CAST(N'2024-05-30T08:56:09.6606490' AS DateTime2), 2, 2.9999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (775, CAST(N'2024-05-30T08:56:09.6606627' AS DateTime2), 2, 2.9999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (776, CAST(N'2024-05-30T08:56:09.6607037' AS DateTime2), 2, 2.9999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (777, CAST(N'2024-05-30T08:56:09.6607264' AS DateTime2), 2, 2.9999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (778, CAST(N'2024-05-30T08:56:09.6607404' AS DateTime2), 2, 2.9999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (779, CAST(N'2024-05-30T08:56:09.6607530' AS DateTime2), 2, 2.9999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (780, CAST(N'2024-05-30T08:56:09.6607649' AS DateTime2), 2, 2.9999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (781, CAST(N'2024-05-30T08:56:09.6607763' AS DateTime2), 2, 2.9999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (782, CAST(N'2024-05-30T08:56:09.6608010' AS DateTime2), 2, 2.9999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (783, CAST(N'2024-05-30T08:56:09.6608135' AS DateTime2), 2, 2.9999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (784, CAST(N'2024-05-30T08:56:09.6608254' AS DateTime2), 2, 2.9999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (785, CAST(N'2024-05-30T08:56:09.6608367' AS DateTime2), 2, 2.9999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (786, CAST(N'2024-05-30T08:56:09.6608491' AS DateTime2), 2, 2.9999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (787, CAST(N'2024-05-30T08:56:09.6608680' AS DateTime2), 2, 2.9999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (788, CAST(N'2024-05-30T08:56:09.6608797' AS DateTime2), 2, 2.9999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (789, CAST(N'2024-05-30T08:56:09.6608911' AS DateTime2), 2, 2.9999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (790, CAST(N'2024-05-30T08:56:09.6609020' AS DateTime2), 2, 2.9999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (791, CAST(N'2024-05-30T08:56:09.6609136' AS DateTime2), 2, 2.9999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (792, CAST(N'2024-05-30T08:56:09.6609312' AS DateTime2), 2, 2.9999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (793, CAST(N'2024-05-30T08:56:09.6609463' AS DateTime2), 2, 2.9999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (794, CAST(N'2024-05-30T08:56:09.6609579' AS DateTime2), 2, 2.9999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (795, CAST(N'2024-05-30T08:56:09.6609686' AS DateTime2), 2, 2.9999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (796, CAST(N'2024-05-30T08:56:09.6609804' AS DateTime2), 2, 2.9999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (797, CAST(N'2024-05-30T08:56:09.6609984' AS DateTime2), 2, 2.9999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (798, CAST(N'2024-05-30T08:56:09.6610097' AS DateTime2), 2, 2.9999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (799, CAST(N'2024-05-30T08:56:09.6610207' AS DateTime2), 2, 2.9999, N'F', N'SI2', 9)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (800, CAST(N'2024-05-30T08:56:09.6610319' AS DateTime2), 2, 2.9999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (801, CAST(N'2024-05-30T08:56:09.6610433' AS DateTime2), 2, 2.9999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (802, CAST(N'2024-05-30T08:56:09.6610552' AS DateTime2), 2, 2.9999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (803, CAST(N'2024-05-30T08:56:09.6610718' AS DateTime2), 2, 2.9999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (804, CAST(N'2024-05-30T08:56:09.6610860' AS DateTime2), 2, 2.9999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (805, CAST(N'2024-05-30T08:56:09.6610982' AS DateTime2), 2, 2.9999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (806, CAST(N'2024-05-30T08:56:09.6611106' AS DateTime2), 2, 2.9999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (807, CAST(N'2024-05-30T08:56:09.6611242' AS DateTime2), 2, 2.9999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (808, CAST(N'2024-05-30T08:56:09.6611777' AS DateTime2), 2, 2.9999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (809, CAST(N'2024-05-30T08:56:09.6611924' AS DateTime2), 2, 2.9999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (810, CAST(N'2024-05-30T08:56:09.6612027' AS DateTime2), 2, 2.9999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (811, CAST(N'2024-05-30T08:56:09.6612187' AS DateTime2), 2, 2.9999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (812, CAST(N'2024-05-30T08:56:09.6612311' AS DateTime2), 2, 2.9999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (813, CAST(N'2024-05-30T08:56:09.6612651' AS DateTime2), 2, 2.9999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (814, CAST(N'2024-05-30T08:56:09.6612832' AS DateTime2), 2, 2.9999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (815, CAST(N'2024-05-30T08:56:09.6612988' AS DateTime2), 2, 2.9999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (816, CAST(N'2024-05-30T08:56:09.6613105' AS DateTime2), 2, 2.9999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (817, CAST(N'2024-05-30T08:56:09.6613203' AS DateTime2), 2, 2.9999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (818, CAST(N'2024-05-30T08:56:09.6613366' AS DateTime2), 2, 2.9999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (819, CAST(N'2024-05-30T08:56:09.6613473' AS DateTime2), 2, 2.9999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (820, CAST(N'2024-05-30T08:56:09.6613580' AS DateTime2), 2, 2.9999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (821, CAST(N'2024-05-30T08:56:09.6613678' AS DateTime2), 2, 2.9999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (822, CAST(N'2024-05-30T08:56:09.6613778' AS DateTime2), 2, 2.9999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (823, CAST(N'2024-05-30T08:56:09.6613883' AS DateTime2), 2, 2.9999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (824, CAST(N'2024-05-30T08:56:09.6614040' AS DateTime2), 2, 2.9999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (825, CAST(N'2024-05-30T08:56:09.6614143' AS DateTime2), 2, 2.9999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (826, CAST(N'2024-05-30T08:56:09.6614271' AS DateTime2), 2, 2.9999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (827, CAST(N'2024-05-30T08:56:09.6614373' AS DateTime2), 2, 2.9999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (828, CAST(N'2024-05-30T08:56:09.6614471' AS DateTime2), 2, 2.9999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (829, CAST(N'2024-05-30T08:56:09.6614638' AS DateTime2), 2, 2.9999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (830, CAST(N'2024-05-30T08:56:09.6614741' AS DateTime2), 2, 2.9999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (831, CAST(N'2024-05-30T08:56:09.6614841' AS DateTime2), 2, 2.9999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (832, CAST(N'2024-05-30T08:56:09.6614945' AS DateTime2), 2, 2.9999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (833, CAST(N'2024-05-30T08:56:09.6615084' AS DateTime2), 2, 2.9999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (834, CAST(N'2024-05-30T08:56:09.6615463' AS DateTime2), 2, 2.9999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (835, CAST(N'2024-05-30T08:56:09.6615741' AS DateTime2), 2, 2.9999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (836, CAST(N'2024-05-30T08:56:09.6616091' AS DateTime2), 2, 2.9999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (837, CAST(N'2024-05-30T08:56:09.6616371' AS DateTime2), 2, 2.9999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (838, CAST(N'2024-05-30T08:56:09.6616701' AS DateTime2), 2, 2.9999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (839, CAST(N'2024-05-30T08:56:09.6617064' AS DateTime2), 2, 2.9999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (840, CAST(N'2024-05-30T08:56:09.6617368' AS DateTime2), 2, 2.9999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (841, CAST(N'2024-05-30T08:56:09.6617551' AS DateTime2), 2, 2.9999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (842, CAST(N'2024-05-30T08:56:09.6617666' AS DateTime2), 2, 2.9999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (843, CAST(N'2024-05-30T08:56:09.6617770' AS DateTime2), 2, 2.9999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (844, CAST(N'2024-05-30T08:56:09.6618215' AS DateTime2), 2, 2.9999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (845, CAST(N'2024-05-30T08:56:09.6618716' AS DateTime2), 2, 2.9999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (846, CAST(N'2024-05-30T08:56:09.6618854' AS DateTime2), 2, 2.9999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (847, CAST(N'2024-05-30T08:56:09.6618959' AS DateTime2), 2, 2.9999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (848, CAST(N'2024-05-30T08:56:09.6619096' AS DateTime2), 2, 2.9999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (849, CAST(N'2024-05-30T08:56:09.6619213' AS DateTime2), 2, 2.9999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (850, CAST(N'2024-05-30T08:56:09.6619393' AS DateTime2), 2, 2.9999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (851, CAST(N'2024-05-30T08:56:09.6619503' AS DateTime2), 2, 2.9999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (852, CAST(N'2024-05-30T08:56:09.6619608' AS DateTime2), 2, 2.9999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (853, CAST(N'2024-05-30T08:56:09.6619708' AS DateTime2), 2, 2.9999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (854, CAST(N'2024-05-30T08:56:09.6619810' AS DateTime2), 2, 2.9999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (855, CAST(N'2024-05-30T08:56:09.6619983' AS DateTime2), 2, 2.9999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (856, CAST(N'2024-05-30T08:56:09.6620178' AS DateTime2), 2, 2.9999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (857, CAST(N'2024-05-30T08:56:09.6620845' AS DateTime2), 2, 2.9999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (858, CAST(N'2024-05-30T08:56:09.6621074' AS DateTime2), 2, 2.9999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (859, CAST(N'2024-05-30T08:56:09.6621269' AS DateTime2), 2, 2.9999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (860, CAST(N'2024-05-30T08:56:09.6621542' AS DateTime2), 2, 2.9999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (861, CAST(N'2024-05-30T08:56:09.6622491' AS DateTime2), 2, 2.9999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (862, CAST(N'2024-05-30T08:56:09.6622865' AS DateTime2), 2, 2.9999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (863, CAST(N'2024-05-30T08:56:09.6623080' AS DateTime2), 2, 2.9999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (864, CAST(N'2024-05-30T08:56:09.6623247' AS DateTime2), 2, 2.9999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (865, CAST(N'2024-05-30T08:56:09.6623407' AS DateTime2), 2, 2.9999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (866, CAST(N'2024-05-30T08:56:09.6623844' AS DateTime2), 2, 2.9999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (867, CAST(N'2024-05-30T08:56:09.6624030' AS DateTime2), 2, 2.9999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (868, CAST(N'2024-05-30T08:56:09.6624177' AS DateTime2), 2, 2.9999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (869, CAST(N'2024-05-30T08:56:09.6624311' AS DateTime2), 2, 2.9999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (870, CAST(N'2024-05-30T08:56:09.6624494' AS DateTime2), 2, 2.9999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (871, CAST(N'2024-05-30T08:56:09.6625088' AS DateTime2), 2, 2.9999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (872, CAST(N'2024-05-30T08:56:09.6625495' AS DateTime2), 2, 2.9999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (873, CAST(N'2024-05-30T08:56:09.6625662' AS DateTime2), 2, 2.9999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (874, CAST(N'2024-05-30T08:56:09.6625775' AS DateTime2), 2, 2.9999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (875, CAST(N'2024-05-30T08:56:09.6625941' AS DateTime2), 2, 2.9999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (876, CAST(N'2024-05-30T08:56:09.6626397' AS DateTime2), 2, 2.9999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (877, CAST(N'2024-05-30T08:56:09.6626575' AS DateTime2), 2, 2.9999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (878, CAST(N'2024-05-30T08:56:09.6626809' AS DateTime2), 2, 2.9999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (879, CAST(N'2024-05-30T08:56:09.6627034' AS DateTime2), 2, 2.9999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (880, CAST(N'2024-05-30T08:56:09.6627196' AS DateTime2), 2, 2.9999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (881, CAST(N'2024-05-30T08:56:10.1601812' AS DateTime2), 3, 3.9999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (882, CAST(N'2024-05-30T08:56:10.2238764' AS DateTime2), 3, 3.9999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (883, CAST(N'2024-05-30T08:56:10.2239969' AS DateTime2), 3, 3.9999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (884, CAST(N'2024-05-30T08:56:10.2240158' AS DateTime2), 3, 3.9999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (885, CAST(N'2024-05-30T08:56:10.2240286' AS DateTime2), 3, 3.9999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (886, CAST(N'2024-05-30T08:56:10.2240408' AS DateTime2), 3, 3.9999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (887, CAST(N'2024-05-30T08:56:10.2240533' AS DateTime2), 3, 3.9999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (888, CAST(N'2024-05-30T08:56:10.2240777' AS DateTime2), 3, 3.9999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (889, CAST(N'2024-05-30T08:56:10.2240896' AS DateTime2), 3, 3.9999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (890, CAST(N'2024-05-30T08:56:10.2241009' AS DateTime2), 3, 3.9999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (891, CAST(N'2024-05-30T08:56:10.2241121' AS DateTime2), 3, 3.9999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (892, CAST(N'2024-05-30T08:56:10.2241273' AS DateTime2), 3, 3.9999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (893, CAST(N'2024-05-30T08:56:10.2241476' AS DateTime2), 3, 3.9999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (894, CAST(N'2024-05-30T08:56:10.2241601' AS DateTime2), 3, 3.9999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (895, CAST(N'2024-05-30T08:56:10.2241717' AS DateTime2), 3, 3.9999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (896, CAST(N'2024-05-30T08:56:10.2241838' AS DateTime2), 3, 3.9999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (897, CAST(N'2024-05-30T08:56:10.2241962' AS DateTime2), 3, 3.9999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (898, CAST(N'2024-05-30T08:56:10.2242143' AS DateTime2), 3, 3.9999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (899, CAST(N'2024-05-30T08:56:10.2242270' AS DateTime2), 3, 3.9999, N'E', N'SI3', 9)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (900, CAST(N'2024-05-30T08:56:10.2242386' AS DateTime2), 3, 3.9999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (901, CAST(N'2024-05-30T08:56:10.2242506' AS DateTime2), 3, 3.9999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (902, CAST(N'2024-05-30T08:56:10.2242609' AS DateTime2), 3, 3.9999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (903, CAST(N'2024-05-30T08:56:10.2242752' AS DateTime2), 3, 3.9999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (904, CAST(N'2024-05-30T08:56:10.2242953' AS DateTime2), 3, 3.9999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (905, CAST(N'2024-05-30T08:56:10.2243063' AS DateTime2), 3, 3.9999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (906, CAST(N'2024-05-30T08:56:10.2243177' AS DateTime2), 3, 3.9999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (907, CAST(N'2024-05-30T08:56:10.2243291' AS DateTime2), 3, 3.9999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (908, CAST(N'2024-05-30T08:56:10.2243405' AS DateTime2), 3, 3.9999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (909, CAST(N'2024-05-30T08:56:10.2243602' AS DateTime2), 3, 3.9999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (910, CAST(N'2024-05-30T08:56:10.2243720' AS DateTime2), 3, 3.9999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (911, CAST(N'2024-05-30T08:56:10.2243831' AS DateTime2), 3, 3.9999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (912, CAST(N'2024-05-30T08:56:10.2243953' AS DateTime2), 3, 3.9999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (913, CAST(N'2024-05-30T08:56:10.2244069' AS DateTime2), 3, 3.9999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (914, CAST(N'2024-05-30T08:56:10.2244285' AS DateTime2), 3, 3.9999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (915, CAST(N'2024-05-30T08:56:10.2244432' AS DateTime2), 3, 3.9999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (916, CAST(N'2024-05-30T08:56:10.2244554' AS DateTime2), 3, 3.9999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (917, CAST(N'2024-05-30T08:56:10.2244677' AS DateTime2), 3, 3.9999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (918, CAST(N'2024-05-30T08:56:10.2244801' AS DateTime2), 3, 3.9999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (919, CAST(N'2024-05-30T08:56:10.2244910' AS DateTime2), 3, 3.9999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (920, CAST(N'2024-05-30T08:56:10.2245074' AS DateTime2), 3, 3.9999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (921, CAST(N'2024-05-30T08:56:10.2246137' AS DateTime2), 3, 3.9999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (922, CAST(N'2024-05-30T08:56:10.2247727' AS DateTime2), 3, 3.9999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (923, CAST(N'2024-05-30T08:56:10.2248692' AS DateTime2), 3, 3.9999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (924, CAST(N'2024-05-30T08:56:10.2249537' AS DateTime2), 3, 3.9999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (925, CAST(N'2024-05-30T08:56:10.2249928' AS DateTime2), 3, 3.9999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (926, CAST(N'2024-05-30T08:56:10.2250101' AS DateTime2), 3, 3.9999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (927, CAST(N'2024-05-30T08:56:10.2250214' AS DateTime2), 3, 3.9999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (928, CAST(N'2024-05-30T08:56:10.2250328' AS DateTime2), 3, 3.9999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (929, CAST(N'2024-05-30T08:56:10.2250442' AS DateTime2), 3, 3.9999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (930, CAST(N'2024-05-30T08:56:10.2250573' AS DateTime2), 3, 3.9999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (931, CAST(N'2024-05-30T08:56:10.2250685' AS DateTime2), 3, 3.9999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (932, CAST(N'2024-05-30T08:56:10.2250935' AS DateTime2), 3, 3.9999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (933, CAST(N'2024-05-30T08:56:10.2251064' AS DateTime2), 3, 3.9999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (934, CAST(N'2024-05-30T08:56:10.2251176' AS DateTime2), 3, 3.9999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (935, CAST(N'2024-05-30T08:56:10.2251287' AS DateTime2), 3, 3.9999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (936, CAST(N'2024-05-30T08:56:10.2251425' AS DateTime2), 3, 3.9999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (937, CAST(N'2024-05-30T08:56:10.2251714' AS DateTime2), 3, 3.9999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (938, CAST(N'2024-05-30T08:56:10.2251906' AS DateTime2), 3, 3.9999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (939, CAST(N'2024-05-30T08:56:10.2252064' AS DateTime2), 3, 3.9999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (940, CAST(N'2024-05-30T08:56:10.2252896' AS DateTime2), 3, 3.9999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (941, CAST(N'2024-05-30T08:56:10.2253223' AS DateTime2), 3, 3.9999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (942, CAST(N'2024-05-30T08:56:10.2253457' AS DateTime2), 3, 3.9999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (943, CAST(N'2024-05-30T08:56:10.2253816' AS DateTime2), 3, 3.9999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (944, CAST(N'2024-05-30T08:56:10.2253934' AS DateTime2), 3, 3.9999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (945, CAST(N'2024-05-30T08:56:10.2254057' AS DateTime2), 3, 3.9999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (946, CAST(N'2024-05-30T08:56:10.2254182' AS DateTime2), 3, 3.9999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (947, CAST(N'2024-05-30T08:56:10.2254346' AS DateTime2), 3, 3.9999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (948, CAST(N'2024-05-30T08:56:10.2254483' AS DateTime2), 3, 3.9999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (949, CAST(N'2024-05-30T08:56:10.2254746' AS DateTime2), 3, 3.9999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (950, CAST(N'2024-05-30T08:56:10.2254875' AS DateTime2), 3, 3.9999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (951, CAST(N'2024-05-30T08:56:10.2254983' AS DateTime2), 3, 3.9999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (952, CAST(N'2024-05-30T08:56:10.2255101' AS DateTime2), 3, 3.9999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (953, CAST(N'2024-05-30T08:56:10.2255314' AS DateTime2), 3, 3.9999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (954, CAST(N'2024-05-30T08:56:10.2255688' AS DateTime2), 3, 3.9999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (955, CAST(N'2024-05-30T08:56:10.2255948' AS DateTime2), 3, 3.9999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (956, CAST(N'2024-05-30T08:56:10.2256093' AS DateTime2), 3, 3.9999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (957, CAST(N'2024-05-30T08:56:10.2256204' AS DateTime2), 3, 3.9999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (958, CAST(N'2024-05-30T08:56:10.2256349' AS DateTime2), 3, 3.9999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (959, CAST(N'2024-05-30T08:56:10.2256541' AS DateTime2), 3, 3.9999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (960, CAST(N'2024-05-30T08:56:10.2256673' AS DateTime2), 3, 3.9999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (961, CAST(N'2024-05-30T08:56:10.2256793' AS DateTime2), 3, 3.9999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (962, CAST(N'2024-05-30T08:56:10.2256922' AS DateTime2), 3, 3.9999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (963, CAST(N'2024-05-30T08:56:10.2257082' AS DateTime2), 3, 3.9999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (964, CAST(N'2024-05-30T08:56:10.2257219' AS DateTime2), 3, 3.9999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (965, CAST(N'2024-05-30T08:56:10.2257559' AS DateTime2), 3, 3.9999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (966, CAST(N'2024-05-30T08:56:10.2257719' AS DateTime2), 3, 3.9999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (967, CAST(N'2024-05-30T08:56:10.2257837' AS DateTime2), 3, 3.9999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (968, CAST(N'2024-05-30T08:56:10.2257947' AS DateTime2), 3, 3.9999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (969, CAST(N'2024-05-30T08:56:10.2258100' AS DateTime2), 3, 3.9999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (970, CAST(N'2024-05-30T08:56:10.2258307' AS DateTime2), 3, 3.9999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (971, CAST(N'2024-05-30T08:56:10.2258432' AS DateTime2), 3, 3.9999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (972, CAST(N'2024-05-30T08:56:10.2258547' AS DateTime2), 3, 3.9999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (973, CAST(N'2024-05-30T08:56:10.2258661' AS DateTime2), 3, 3.9999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (974, CAST(N'2024-05-30T08:56:10.2258769' AS DateTime2), 3, 3.9999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (975, CAST(N'2024-05-30T08:56:10.2258963' AS DateTime2), 3, 3.9999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (976, CAST(N'2024-05-30T08:56:10.2259077' AS DateTime2), 3, 3.9999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (977, CAST(N'2024-05-30T08:56:10.2259191' AS DateTime2), 3, 3.9999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (978, CAST(N'2024-05-30T08:56:10.2259387' AS DateTime2), 3, 3.9999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (979, CAST(N'2024-05-30T08:56:10.2259546' AS DateTime2), 3, 3.9999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (980, CAST(N'2024-05-30T08:56:10.2259722' AS DateTime2), 3, 3.9999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (981, CAST(N'2024-05-30T08:56:10.2259946' AS DateTime2), 3, 3.9999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (982, CAST(N'2024-05-30T08:56:10.2260080' AS DateTime2), 3, 3.9999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (983, CAST(N'2024-05-30T08:56:10.2260242' AS DateTime2), 3, 3.9999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (984, CAST(N'2024-05-30T08:56:10.2260986' AS DateTime2), 3, 3.9999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (985, CAST(N'2024-05-30T08:56:10.2261140' AS DateTime2), 3, 3.9999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (986, CAST(N'2024-05-30T08:56:10.2261425' AS DateTime2), 3, 3.9999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (987, CAST(N'2024-05-30T08:56:10.2261551' AS DateTime2), 3, 3.9999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (988, CAST(N'2024-05-30T08:56:10.2261657' AS DateTime2), 3, 3.9999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (989, CAST(N'2024-05-30T08:56:10.2261772' AS DateTime2), 3, 3.9999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (990, CAST(N'2024-05-30T08:56:10.2261882' AS DateTime2), 3, 3.9999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (991, CAST(N'2024-05-30T08:56:10.9741897' AS DateTime2), 4, 4.9999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (992, CAST(N'2024-05-30T08:56:10.9742755' AS DateTime2), 4, 4.9999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (993, CAST(N'2024-05-30T08:56:10.9742981' AS DateTime2), 4, 4.9999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (994, CAST(N'2024-05-30T08:56:10.9743098' AS DateTime2), 4, 4.9999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (995, CAST(N'2024-05-30T08:56:10.9743206' AS DateTime2), 4, 4.9999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (996, CAST(N'2024-05-30T08:56:10.9743542' AS DateTime2), 4, 4.9999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (997, CAST(N'2024-05-30T08:56:10.9743652' AS DateTime2), 4, 4.9999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (998, CAST(N'2024-05-30T08:56:10.9743755' AS DateTime2), 4, 4.9999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (999, CAST(N'2024-05-30T08:56:10.9743856' AS DateTime2), 4, 4.9999, N'D', N'I1', 9)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1000, CAST(N'2024-05-30T08:56:10.9743955' AS DateTime2), 4, 4.9999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1001, CAST(N'2024-05-30T08:56:10.9746993' AS DateTime2), 4, 4.9999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1002, CAST(N'2024-05-30T08:56:10.9748630' AS DateTime2), 4, 4.9999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1003, CAST(N'2024-05-30T08:56:10.9748832' AS DateTime2), 4, 4.9999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1004, CAST(N'2024-05-30T08:56:10.9748957' AS DateTime2), 4, 4.9999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1005, CAST(N'2024-05-30T08:56:10.9749076' AS DateTime2), 4, 4.9999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1006, CAST(N'2024-05-30T08:56:10.9749396' AS DateTime2), 4, 4.9999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1007, CAST(N'2024-05-30T08:56:10.9749563' AS DateTime2), 4, 4.9999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1008, CAST(N'2024-05-30T08:56:10.9749677' AS DateTime2), 4, 4.9999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1009, CAST(N'2024-05-30T08:56:10.9749827' AS DateTime2), 4, 4.9999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1010, CAST(N'2024-05-30T08:56:10.9749941' AS DateTime2), 4, 4.9999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1011, CAST(N'2024-05-30T08:56:10.9750117' AS DateTime2), 4, 4.9999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1012, CAST(N'2024-05-30T08:56:10.9750232' AS DateTime2), 4, 4.9999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1013, CAST(N'2024-05-30T08:56:10.9750361' AS DateTime2), 4, 4.9999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1014, CAST(N'2024-05-30T08:56:10.9750465' AS DateTime2), 4, 4.9999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1015, CAST(N'2024-05-30T08:56:10.9750574' AS DateTime2), 4, 4.9999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1016, CAST(N'2024-05-30T08:56:10.9750678' AS DateTime2), 4, 4.9999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1017, CAST(N'2024-05-30T08:56:10.9750862' AS DateTime2), 4, 4.9999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1018, CAST(N'2024-05-30T08:56:10.9750969' AS DateTime2), 4, 4.9999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1019, CAST(N'2024-05-30T08:56:10.9751071' AS DateTime2), 4, 4.9999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1020, CAST(N'2024-05-30T08:56:10.9752113' AS DateTime2), 4, 4.9999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1021, CAST(N'2024-05-30T08:56:10.9752467' AS DateTime2), 4, 4.9999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1022, CAST(N'2024-05-30T08:56:10.9752773' AS DateTime2), 4, 4.9999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1023, CAST(N'2024-05-30T08:56:10.9752906' AS DateTime2), 4, 4.9999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1024, CAST(N'2024-05-30T08:56:10.9753067' AS DateTime2), 4, 4.9999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1025, CAST(N'2024-05-30T08:56:10.9753188' AS DateTime2), 4, 4.9999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1026, CAST(N'2024-05-30T08:56:10.9753304' AS DateTime2), 4, 4.9999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1027, CAST(N'2024-05-30T08:56:10.9753545' AS DateTime2), 4, 4.9999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1028, CAST(N'2024-05-30T08:56:10.9753718' AS DateTime2), 4, 4.9999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1029, CAST(N'2024-05-30T08:56:10.9753836' AS DateTime2), 4, 4.9999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1030, CAST(N'2024-05-30T08:56:10.9753973' AS DateTime2), 4, 4.9999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1031, CAST(N'2024-05-30T08:56:10.9754088' AS DateTime2), 4, 4.9999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1032, CAST(N'2024-05-30T08:56:10.9754189' AS DateTime2), 4, 4.9999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1033, CAST(N'2024-05-30T08:56:10.9754368' AS DateTime2), 4, 4.9999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1034, CAST(N'2024-05-30T08:56:10.9754475' AS DateTime2), 4, 4.9999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1035, CAST(N'2024-05-30T08:56:10.9754617' AS DateTime2), 4, 4.9999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1036, CAST(N'2024-05-30T08:56:10.9754729' AS DateTime2), 4, 4.9999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1037, CAST(N'2024-05-30T08:56:10.9754841' AS DateTime2), 4, 4.9999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1038, CAST(N'2024-05-30T08:56:10.9755027' AS DateTime2), 4, 4.9999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1039, CAST(N'2024-05-30T08:56:10.9755227' AS DateTime2), 4, 4.9999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1040, CAST(N'2024-05-30T08:56:10.9755352' AS DateTime2), 4, 4.9999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1041, CAST(N'2024-05-30T08:56:10.9755448' AS DateTime2), 4, 4.9999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1042, CAST(N'2024-05-30T08:56:10.9755551' AS DateTime2), 4, 4.9999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1043, CAST(N'2024-05-30T08:56:10.9755740' AS DateTime2), 4, 4.9999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1044, CAST(N'2024-05-30T08:56:10.9755946' AS DateTime2), 4, 4.9999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1045, CAST(N'2024-05-30T08:56:10.9756058' AS DateTime2), 4, 4.9999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1046, CAST(N'2024-05-30T08:56:10.9756194' AS DateTime2), 4, 4.9999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1047, CAST(N'2024-05-30T08:56:10.9756296' AS DateTime2), 4, 4.9999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1048, CAST(N'2024-05-30T08:56:10.9756448' AS DateTime2), 4, 4.9999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1049, CAST(N'2024-05-30T08:56:10.9756563' AS DateTime2), 4, 4.9999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1050, CAST(N'2024-05-30T08:56:10.9756673' AS DateTime2), 4, 4.9999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1051, CAST(N'2024-05-30T08:56:10.9756782' AS DateTime2), 4, 4.9999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1052, CAST(N'2024-05-30T08:56:10.9756883' AS DateTime2), 4, 4.9999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1053, CAST(N'2024-05-30T08:56:10.9756980' AS DateTime2), 4, 4.9999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1054, CAST(N'2024-05-30T08:56:10.9757293' AS DateTime2), 4, 4.9999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1055, CAST(N'2024-05-30T08:56:10.9757420' AS DateTime2), 4, 4.9999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1056, CAST(N'2024-05-30T08:56:10.9757554' AS DateTime2), 4, 4.9999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1057, CAST(N'2024-05-30T08:56:10.9757687' AS DateTime2), 4, 4.9999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1058, CAST(N'2024-05-30T08:56:10.9757794' AS DateTime2), 4, 4.9999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1059, CAST(N'2024-05-30T08:56:10.9758017' AS DateTime2), 4, 4.9999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1060, CAST(N'2024-05-30T08:56:10.9758134' AS DateTime2), 4, 4.9999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1061, CAST(N'2024-05-30T08:56:10.9758234' AS DateTime2), 4, 4.9999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1062, CAST(N'2024-05-30T08:56:10.9758333' AS DateTime2), 4, 4.9999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1063, CAST(N'2024-05-30T08:56:10.9758479' AS DateTime2), 4, 4.9999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1064, CAST(N'2024-05-30T08:56:10.9758659' AS DateTime2), 4, 4.9999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1065, CAST(N'2024-05-30T08:56:10.9758782' AS DateTime2), 4, 4.9999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1066, CAST(N'2024-05-30T08:56:10.9758880' AS DateTime2), 4, 4.9999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1067, CAST(N'2024-05-30T08:56:10.9758975' AS DateTime2), 4, 4.9999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1068, CAST(N'2024-05-30T08:56:10.9759100' AS DateTime2), 4, 4.9999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1069, CAST(N'2024-05-30T08:56:10.9759287' AS DateTime2), 4, 4.9999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1070, CAST(N'2024-05-30T08:56:10.9759492' AS DateTime2), 4, 4.9999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1071, CAST(N'2024-05-30T08:56:10.9759617' AS DateTime2), 4, 4.9999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1072, CAST(N'2024-05-30T08:56:10.9759720' AS DateTime2), 4, 4.9999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1073, CAST(N'2024-05-30T08:56:10.9759887' AS DateTime2), 4, 4.9999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1074, CAST(N'2024-05-30T08:56:10.9760061' AS DateTime2), 4, 4.9999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1075, CAST(N'2024-05-30T08:56:10.9762367' AS DateTime2), 4, 4.9999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1076, CAST(N'2024-05-30T08:56:10.9762729' AS DateTime2), 4, 4.9999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1077, CAST(N'2024-05-30T08:56:10.9762855' AS DateTime2), 4, 4.9999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1078, CAST(N'2024-05-30T08:56:10.9762969' AS DateTime2), 4, 4.9999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1079, CAST(N'2024-05-30T08:56:10.9763117' AS DateTime2), 4, 4.9999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1080, CAST(N'2024-05-30T08:56:10.9763399' AS DateTime2), 4, 4.9999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1081, CAST(N'2024-05-30T08:56:10.9763523' AS DateTime2), 4, 4.9999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1082, CAST(N'2024-05-30T08:56:10.9763629' AS DateTime2), 4, 4.9999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1083, CAST(N'2024-05-30T08:56:10.9763738' AS DateTime2), 4, 4.9999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1084, CAST(N'2024-05-30T08:56:10.9763846' AS DateTime2), 4, 4.9999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1085, CAST(N'2024-05-30T08:56:10.9764023' AS DateTime2), 4, 4.9999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1086, CAST(N'2024-05-30T08:56:10.9764139' AS DateTime2), 4, 4.9999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1087, CAST(N'2024-05-30T08:56:10.9764425' AS DateTime2), 4, 4.9999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1088, CAST(N'2024-05-30T08:56:10.9764543' AS DateTime2), 4, 4.9999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1089, CAST(N'2024-05-30T08:56:10.9766873' AS DateTime2), 4, 4.9999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1090, CAST(N'2024-05-30T08:56:10.9769269' AS DateTime2), 4, 4.9999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1091, CAST(N'2024-05-30T08:56:10.9770088' AS DateTime2), 4, 4.9999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1092, CAST(N'2024-05-30T08:56:10.9770282' AS DateTime2), 4, 4.9999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1093, CAST(N'2024-05-30T08:56:10.9770458' AS DateTime2), 4, 4.9999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1094, CAST(N'2024-05-30T08:56:10.9770635' AS DateTime2), 4, 4.9999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1095, CAST(N'2024-05-30T08:56:10.9776717' AS DateTime2), 4, 4.9999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1096, CAST(N'2024-05-30T08:56:10.9777733' AS DateTime2), 4, 4.9999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1097, CAST(N'2024-05-30T08:56:10.9777982' AS DateTime2), 4, 4.9999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1098, CAST(N'2024-05-30T08:56:10.9778166' AS DateTime2), 4, 4.9999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1099, CAST(N'2024-05-30T08:56:10.9780018' AS DateTime2), 4, 4.9999, N'M', N'I2', 2)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1100, CAST(N'2024-05-30T08:56:10.9780354' AS DateTime2), 4, 4.9999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1101, CAST(N'2024-05-30T08:56:11.3269965' AS DateTime2), 5, 5.9999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1102, CAST(N'2024-05-30T08:56:11.3271685' AS DateTime2), 5, 5.9999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1103, CAST(N'2024-05-30T08:56:11.3272036' AS DateTime2), 5, 5.9999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1104, CAST(N'2024-05-30T08:56:11.3272402' AS DateTime2), 5, 5.9999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1105, CAST(N'2024-05-30T08:56:11.3272992' AS DateTime2), 5, 5.9999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1106, CAST(N'2024-05-30T08:56:11.3273648' AS DateTime2), 5, 5.9999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1107, CAST(N'2024-05-30T08:56:11.3274221' AS DateTime2), 5, 5.9999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1108, CAST(N'2024-05-30T08:56:11.3274478' AS DateTime2), 5, 5.9999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1109, CAST(N'2024-05-30T08:56:11.3274634' AS DateTime2), 5, 5.9999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1110, CAST(N'2024-05-30T08:56:11.3274941' AS DateTime2), 5, 5.9999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1111, CAST(N'2024-05-30T08:56:11.3275089' AS DateTime2), 5, 5.9999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1112, CAST(N'2024-05-30T08:56:11.3275240' AS DateTime2), 5, 5.9999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1113, CAST(N'2024-05-30T08:56:11.3275358' AS DateTime2), 5, 5.9999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1114, CAST(N'2024-05-30T08:56:11.3275517' AS DateTime2), 5, 5.9999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1115, CAST(N'2024-05-30T08:56:11.3275728' AS DateTime2), 5, 5.9999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1116, CAST(N'2024-05-30T08:56:11.3275927' AS DateTime2), 5, 5.9999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1117, CAST(N'2024-05-30T08:56:11.3276139' AS DateTime2), 5, 5.9999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1118, CAST(N'2024-05-30T08:56:11.3276363' AS DateTime2), 5, 5.9999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1119, CAST(N'2024-05-30T08:56:11.3276651' AS DateTime2), 5, 5.9999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1120, CAST(N'2024-05-30T08:56:11.3276830' AS DateTime2), 5, 5.9999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1121, CAST(N'2024-05-30T08:56:11.3277042' AS DateTime2), 5, 5.9999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1122, CAST(N'2024-05-30T08:56:11.3277201' AS DateTime2), 5, 5.9999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1123, CAST(N'2024-05-30T08:56:11.3277327' AS DateTime2), 5, 5.9999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1124, CAST(N'2024-05-30T08:56:11.3277430' AS DateTime2), 5, 5.9999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1125, CAST(N'2024-05-30T08:56:11.3277540' AS DateTime2), 5, 5.9999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1126, CAST(N'2024-05-30T08:56:11.3277832' AS DateTime2), 5, 5.9999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1127, CAST(N'2024-05-30T08:56:11.3278338' AS DateTime2), 5, 5.9999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1128, CAST(N'2024-05-30T08:56:11.3278807' AS DateTime2), 5, 5.9999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1129, CAST(N'2024-05-30T08:56:11.3278989' AS DateTime2), 5, 5.9999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1130, CAST(N'2024-05-30T08:56:11.3279162' AS DateTime2), 5, 5.9999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1131, CAST(N'2024-05-30T08:56:11.3279464' AS DateTime2), 5, 5.9999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1132, CAST(N'2024-05-30T08:56:11.3279609' AS DateTime2), 5, 5.9999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1133, CAST(N'2024-05-30T08:56:11.3279717' AS DateTime2), 5, 5.9999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1134, CAST(N'2024-05-30T08:56:11.3279850' AS DateTime2), 5, 5.9999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1135, CAST(N'2024-05-30T08:56:11.3279950' AS DateTime2), 5, 5.9999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1136, CAST(N'2024-05-30T08:56:11.3280123' AS DateTime2), 5, 5.9999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1137, CAST(N'2024-05-30T08:56:11.3280250' AS DateTime2), 5, 5.9999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1138, CAST(N'2024-05-30T08:56:11.3280366' AS DateTime2), 5, 5.9999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1139, CAST(N'2024-05-30T08:56:11.3280536' AS DateTime2), 5, 5.9999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1140, CAST(N'2024-05-30T08:56:11.3280693' AS DateTime2), 5, 5.9999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1141, CAST(N'2024-05-30T08:56:11.3280844' AS DateTime2), 5, 5.9999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1142, CAST(N'2024-05-30T08:56:11.3281053' AS DateTime2), 5, 5.9999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1143, CAST(N'2024-05-30T08:56:11.3281172' AS DateTime2), 5, 5.9999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1144, CAST(N'2024-05-30T08:56:11.3281294' AS DateTime2), 5, 5.9999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1145, CAST(N'2024-05-30T08:56:11.3281433' AS DateTime2), 5, 5.9999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1146, CAST(N'2024-05-30T08:56:11.3281545' AS DateTime2), 5, 5.9999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1147, CAST(N'2024-05-30T08:56:11.3281746' AS DateTime2), 5, 5.9999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1148, CAST(N'2024-05-30T08:56:11.3281859' AS DateTime2), 5, 5.9999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1149, CAST(N'2024-05-30T08:56:11.3281967' AS DateTime2), 5, 5.9999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1150, CAST(N'2024-05-30T08:56:11.3282070' AS DateTime2), 5, 5.9999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1151, CAST(N'2024-05-30T08:56:11.3282167' AS DateTime2), 5, 5.9999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1152, CAST(N'2024-05-30T08:56:11.3282348' AS DateTime2), 5, 5.9999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1153, CAST(N'2024-05-30T08:56:11.3282456' AS DateTime2), 5, 5.9999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1154, CAST(N'2024-05-30T08:56:11.3282551' AS DateTime2), 5, 5.9999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1155, CAST(N'2024-05-30T08:56:11.3282649' AS DateTime2), 5, 5.9999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1156, CAST(N'2024-05-30T08:56:11.3282781' AS DateTime2), 5, 5.9999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1157, CAST(N'2024-05-30T08:56:11.3282901' AS DateTime2), 5, 5.9999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1158, CAST(N'2024-05-30T08:56:11.3283100' AS DateTime2), 5, 5.9999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1159, CAST(N'2024-05-30T08:56:11.3283201' AS DateTime2), 5, 5.9999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1160, CAST(N'2024-05-30T08:56:11.3283295' AS DateTime2), 5, 5.9999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1161, CAST(N'2024-05-30T08:56:11.3283390' AS DateTime2), 5, 5.9999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1162, CAST(N'2024-05-30T08:56:11.3283480' AS DateTime2), 5, 5.9999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1163, CAST(N'2024-05-30T08:56:11.3283741' AS DateTime2), 5, 5.9999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1164, CAST(N'2024-05-30T08:56:11.3283845' AS DateTime2), 5, 5.9999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1165, CAST(N'2024-05-30T08:56:11.3283961' AS DateTime2), 5, 5.9999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1166, CAST(N'2024-05-30T08:56:11.3284088' AS DateTime2), 5, 5.9999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1167, CAST(N'2024-05-30T08:56:11.3284211' AS DateTime2), 5, 5.9999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1168, CAST(N'2024-05-30T08:56:11.3284415' AS DateTime2), 5, 5.9999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1169, CAST(N'2024-05-30T08:56:11.3284550' AS DateTime2), 5, 5.9999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1170, CAST(N'2024-05-30T08:56:11.3284956' AS DateTime2), 5, 5.9999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1171, CAST(N'2024-05-30T08:56:11.3285383' AS DateTime2), 5, 5.9999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1172, CAST(N'2024-05-30T08:56:11.3285684' AS DateTime2), 5, 5.9999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1173, CAST(N'2024-05-30T08:56:11.3286127' AS DateTime2), 5, 5.9999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1174, CAST(N'2024-05-30T08:56:11.3286256' AS DateTime2), 5, 5.9999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1175, CAST(N'2024-05-30T08:56:11.3286376' AS DateTime2), 5, 5.9999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1176, CAST(N'2024-05-30T08:56:11.3286483' AS DateTime2), 5, 5.9999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1177, CAST(N'2024-05-30T08:56:11.3286584' AS DateTime2), 5, 5.9999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1178, CAST(N'2024-05-30T08:56:11.3286731' AS DateTime2), 5, 5.9999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1179, CAST(N'2024-05-30T08:56:11.3286928' AS DateTime2), 5, 5.9999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1180, CAST(N'2024-05-30T08:56:11.3287049' AS DateTime2), 5, 5.9999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1181, CAST(N'2024-05-30T08:56:11.3287223' AS DateTime2), 5, 5.9999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1182, CAST(N'2024-05-30T08:56:11.3287468' AS DateTime2), 5, 5.9999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1183, CAST(N'2024-05-30T08:56:11.3287596' AS DateTime2), 5, 5.9999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1184, CAST(N'2024-05-30T08:56:11.3287796' AS DateTime2), 5, 5.9999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1185, CAST(N'2024-05-30T08:56:11.3287912' AS DateTime2), 5, 5.9999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1186, CAST(N'2024-05-30T08:56:11.3288014' AS DateTime2), 5, 5.9999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1187, CAST(N'2024-05-30T08:56:11.3288120' AS DateTime2), 5, 5.9999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1188, CAST(N'2024-05-30T08:56:11.3288219' AS DateTime2), 5, 5.9999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1189, CAST(N'2024-05-30T08:56:11.3288451' AS DateTime2), 5, 5.9999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1190, CAST(N'2024-05-30T08:56:11.3288617' AS DateTime2), 5, 5.9999, N'L', N'VVS1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1191, CAST(N'2024-05-30T08:56:11.3288720' AS DateTime2), 5, 5.9999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1192, CAST(N'2024-05-30T08:56:11.3288816' AS DateTime2), 5, 5.9999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1193, CAST(N'2024-05-30T08:56:11.3288905' AS DateTime2), 5, 5.9999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1194, CAST(N'2024-05-30T08:56:11.3289082' AS DateTime2), 5, 5.9999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1195, CAST(N'2024-05-30T08:56:11.3289239' AS DateTime2), 5, 5.9999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1196, CAST(N'2024-05-30T08:56:11.3289345' AS DateTime2), 5, 5.9999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1197, CAST(N'2024-05-30T08:56:11.3289436' AS DateTime2), 5, 5.9999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1198, CAST(N'2024-05-30T08:56:11.3290513' AS DateTime2), 5, 5.9999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1199, CAST(N'2024-05-30T08:56:11.3291039' AS DateTime2), 5, 5.9999, N'L', N'I3', 3)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1200, CAST(N'2024-05-30T08:56:11.3291492' AS DateTime2), 5, 5.9999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1201, CAST(N'2024-05-30T08:56:11.3291665' AS DateTime2), 5, 5.9999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1202, CAST(N'2024-05-30T08:56:11.3291805' AS DateTime2), 5, 5.9999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1203, CAST(N'2024-05-30T08:56:11.3291916' AS DateTime2), 5, 5.9999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1204, CAST(N'2024-05-30T08:56:11.3292044' AS DateTime2), 5, 5.9999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1205, CAST(N'2024-05-30T08:56:11.3294017' AS DateTime2), 5, 5.9999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1206, CAST(N'2024-05-30T08:56:11.3294263' AS DateTime2), 5, 5.9999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1207, CAST(N'2024-05-30T08:56:11.3294377' AS DateTime2), 5, 5.9999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1208, CAST(N'2024-05-30T08:56:11.3294480' AS DateTime2), 5, 5.9999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1209, CAST(N'2024-05-30T08:56:11.3294598' AS DateTime2), 5, 5.9999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1210, CAST(N'2024-05-30T08:56:11.3294784' AS DateTime2), 5, 5.9999, N'M', N'I3', 1.2)
SET IDENTITY_INSERT [dbo].[diamond_price] OFF
GO
SET IDENTITY_INSERT [dbo].[material_price] ON 

INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (1, 18, CAST(N'2024-05-30T08:56:11.5641383' AS DateTime2), 75.75)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (2, 18, CAST(N'2024-05-30T08:56:11.5810628' AS DateTime2), 78)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (3, 18, CAST(N'2024-05-30T08:56:11.5811103' AS DateTime2), 73.300003051757812)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (4, 18, CAST(N'2024-05-30T08:56:11.5811189' AS DateTime2), 71.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (5, 18, CAST(N'2024-05-30T08:56:11.5811470' AS DateTime2), 72.4000015258789)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (6, 18, CAST(N'2024-05-30T08:56:11.5811549' AS DateTime2), 77.949996948242188)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (7, 18, CAST(N'2024-05-30T08:56:11.5811599' AS DateTime2), 80.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (8, 18, CAST(N'2024-05-30T08:56:11.5811644' AS DateTime2), 81.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (9, 24, CAST(N'2024-05-30T08:56:11.5811700' AS DateTime2), 105.75)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (10, 24, CAST(N'2024-05-30T08:56:11.5811971' AS DateTime2), 100.09999847412109)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (11, 24, CAST(N'2024-05-30T08:56:11.5812090' AS DateTime2), 106.30000305175781)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (12, 24, CAST(N'2024-05-30T08:56:11.5812152' AS DateTime2), 103.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (13, 24, CAST(N'2024-05-30T08:56:11.5812206' AS DateTime2), 109.40000152587891)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (14, 24, CAST(N'2024-05-30T08:56:11.5812311' AS DateTime2), 115.44999694824219)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (15, 24, CAST(N'2024-05-30T08:56:11.5812421' AS DateTime2), 98.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (16, 24, CAST(N'2024-05-30T08:56:11.5812644' AS DateTime2), 118.5)
SET IDENTITY_INSERT [dbo].[material_price] OFF
GO
SET IDENTITY_INSERT [dbo].[price_rate] ON 

INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (1, 5, 105.75, CAST(N'2024-05-30T08:56:05.1804865' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (2, 5, 100.1, CAST(N'2024-05-30T08:56:05.2300537' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (3, 5, 106.3, CAST(N'2024-05-30T08:56:05.2395852' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (4, 5, 103.5, CAST(N'2024-05-30T08:56:05.2428711' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (5, 5, 109.4, CAST(N'2024-05-30T08:56:05.2518141' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (6, 5, 115.45, CAST(N'2024-05-30T08:56:05.2607709' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (7, 5, 98.1, CAST(N'2024-05-30T08:56:05.2679563' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (8, 5, 118.5, CAST(N'2024-05-30T08:56:05.2796232' AS DateTime2))
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
/****** Object:  Index [IX_accessory_accessory_type_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_accessory_type_id] ON [dbo].[accessory]
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_shape_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_shape_id] ON [dbo].[accessory]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_image_accessory_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_image_accessory_id] ON [dbo].[accessory_image]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_rank_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_account_rank_id] ON [dbo].[account]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_blog_author_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_blog_author_id] ON [dbo].[blog]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_diamond_shape_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_diamond_shape_id] ON [dbo].[diamond]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_accessory_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_accessory_id] ON [dbo].[feedback]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_order_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_order_id] ON [dbo].[feedback]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_customer_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_customer_id] ON [dbo].[order]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_delivery_staff_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_delivery_staff_id] ON [dbo].[order]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_price_rate_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_price_rate_id] ON [dbo].[order]
(
	[price_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_promotion_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_promotion_id] ON [dbo].[order]
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_rank_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_rank_id] ON [dbo].[order]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_sale_staff_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_sale_staff_id] ON [dbo].[order]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_accessory_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_accessory_id] ON [dbo].[order_detail]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_price_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_diamond_price_id] ON [dbo].[order_detail]
(
	[diamond_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_material_price_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_material_price_id] ON [dbo].[order_detail]
(
	[material_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_order_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_order_id] ON [dbo].[order_detail]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_price_rate_account_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_price_rate_account_id] ON [dbo].[price_rate]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_transaction_order_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_transaction_order_id] ON [dbo].[transaction]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_customer_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_customer_id] ON [dbo].[warranty_request]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_delivery_staff_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_delivery_staff_id] ON [dbo].[warranty_request]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_sale_staff_id]    Script Date: 5/30/2024 9:18:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_sale_staff_id] ON [dbo].[warranty_request]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_warranty_card_id]    Script Date: 5/30/2024 9:18:53 AM ******/
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
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_diamond_order_detail_id] FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[diamond] ([diamond_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_diamond_order_detail_id]
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
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_warranty_card_order_detail_id] FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[warranty_card] ([warranty_card_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_warranty_card_order_detail_id]
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
