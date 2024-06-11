USE [master]
GO
/****** Object:  Database [DATJ]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE DATABASE [DATJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DATJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DATJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[accessory]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory](
	[accessory_id] [bigint] IDENTITY(1,1) NOT NULL,
	[karat] [int] NOT NULL,
	[material_weight] [real] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[accessory_type_id] [bigint] NOT NULL,
	[shape_id] [bigint] NOT NULL,
 CONSTRAINT [PK_accessory] PRIMARY KEY CLUSTERED 
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accessory_image]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[accessory_type]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[account]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[blog]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[diamond]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[diamond_price]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[feedback]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[material_price]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[merchant]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchant](
	[Id] [nvarchar](250) NOT NULL,
	[MerchantName] [nvarchar](250) NULL,
	[MerchantWebLink] [nvarchar](250) NULL,
	[MerchentIpnUrl] [nvarchar](250) NULL,
	[MerchantReturnUrl] [nvarchar](250) NULL,
	[SecretKey] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[LastUpdatedBy] [nvarchar](50) NULL,
	[LastUpdateAt] [datetime2](7) NULL,
 CONSTRAINT [PK_merchant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 6/11/2024 8:31:56 PM ******/
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
	[sale_staff_id] [bigint] NULL,
	[delivery_staff_id] [bigint] NULL,
	[promotion_id] [bigint] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[size] [real] NULL,
	[item_price] [float] NULL,
	[order_id] [bigint] NOT NULL,
	[diamond_id] [bigint] NOT NULL,
	[accessory_id] [bigint] NULL,
	[diamond_price_id] [bigint] NOT NULL,
	[material_price_id] [bigint] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[Id] [nvarchar](50) NOT NULL,
	[PaymentContent] [nvarchar](250) NOT NULL,
	[PaymentCurrency] [nvarchar](250) NOT NULL,
	[PaymentRefId] [nvarchar](250) NOT NULL,
	[RequiredAmount] [decimal](19, 2) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[ExpireDate] [datetime2](7) NULL,
	[PaymentLanguage] [nvarchar](250) NULL,
	[MerchantId] [nvarchar](250) NULL,
	[PaymentDestinationId] [nvarchar](250) NULL,
	[PaidAmount] [nvarchar](250) NULL,
	[PaymentStatus] [nvarchar](250) NULL,
	[PaymentLastMessage] [nvarchar](250) NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDestination]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDestination](
	[Id] [nvarchar](250) NOT NULL,
	[DesLogo] [nvarchar](250) NULL,
	[DesShortName] [nvarchar](250) NULL,
	[DesName] [nvarchar](50) NULL,
	[DesSortIndex] [int] NULL,
	[DesParentId] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[LastUpdatedBy] [nvarchar](50) NULL,
	[LastUpdateAt] [datetime2](7) NULL,
 CONSTRAINT [PK_PaymentDestination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentNotification]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentNotification](
	[Id] [nvarchar](50) NOT NULL,
	[PaymentRefId] [nvarchar](50) NULL,
	[NotiDate] [datetime2](7) NULL,
	[NotiContent] [nvarchar](50) NULL,
	[NotiAmount] [decimal](19, 2) NOT NULL,
	[NotiMessage] [nvarchar](50) NULL,
	[NotiSignature] [nvarchar](50) NULL,
	[NotiPaymentId] [nvarchar](50) NULL,
	[NotiMerchantId] [nvarchar](250) NULL,
	[NotiStatus] [nvarchar](50) NULL,
	[NotiResDate] [datetime2](7) NULL,
	[NotiResMessage] [nvarchar](50) NULL,
	[NotiResHttpCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_paymentNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentSignature]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentSignature](
	[Id] [nvarchar](50) NOT NULL,
	[SignValue] [nvarchar](500) NULL,
	[SignAlgo] [nvarchar](50) NULL,
	[SignDate] [datetime2](7) NULL,
	[SignOwn] [nvarchar](50) NULL,
	[PaymentId] [nvarchar](50) NULL,
	[IsValid] [bit] NOT NULL,
 CONSTRAINT [PK_paymentSignature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentTransaction]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentTransaction](
	[Id] [nvarchar](50) NOT NULL,
	[TransMessage] [nvarchar](250) NULL,
	[TranPayload] [nvarchar](500) NULL,
	[TranStatus] [nvarchar](10) NULL,
	[TranAmount] [decimal](19, 2) NULL,
	[TranDate] [datetime2](7) NULL,
	[PaymentId] [nvarchar](50) NULL,
	[TranRefId] [nvarchar](250) NULL,
	[AccountId] [bigint] NULL,
 CONSTRAINT [PK_paymentTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[price_rate]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[promotion]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[rank]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[shape]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[transaction]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[warranty_card]    Script Date: 6/11/2024 8:31:56 PM ******/
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
/****** Object:  Table [dbo].[warranty_request]    Script Date: 6/11/2024 8:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warranty_request](
	[warranty_request_id] [bigint] IDENTITY(1,1) NOT NULL,
	[warranty_reason] [nvarchar](max) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[sale_staff_id] [bigint] NULL,
	[delivery_staff_id] [bigint] NULL,
	[warranty_card_id] [bigint] NOT NULL,
	[receive_time] [datetime2](7) NOT NULL,
	[return_time] [datetime2](7) NULL,
	[warranty_status] [nvarchar](max) NOT NULL,
	[shipping_address] [nvarchar](max) NOT NULL,
	[phone_number] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_warranty_request] PRIMARY KEY CLUSTERED 
(
	[warranty_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240611113655_init', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[accessory] ON 

INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (1, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (2, 24, 57.3668251, N'The Fulton Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (3, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (4, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (5, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (6, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (7, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (8, 18, 66.09656, N'The Roosevelt Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (9, 18, 85.51576, N'The Carnegie Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (10, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (11, 18, 41.8670921, N'Brilliant Trio Cathedral Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (12, 24, 25.2984142, N'Trio Cluster Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (13, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (14, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (15, 24, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (16, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (17, 24, 67.69998, N'The Sutton Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (18, 18, 29.0397282, N'The Frick Ring', 1000, 3, 1)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (19, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (20, 24, 57.3668251, N'The Fulton Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (21, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (22, 18, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (23, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (24, 24, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (25, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (26, 18, 66.09656, N'The Roosevelt Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (27, 24, 85.51576, N'The Carnegie Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (28, 24, 25.2984142, N'Trio Cluster Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (29, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (30, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (31, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (32, 18, 29.0397282, N'The Frick Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (33, 18, 65.20577, N'The Varick Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (34, 18, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (35, 24, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (36, 24, 18.8847313, N'Vintage Celtic Engraved Engagement Ring', 1000, 3, 2)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (37, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (38, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (39, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (40, 24, 37.5913048, N'Split Shank French Halo Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (41, 24, 26.3673611, N'Petite French Set Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (42, 18, 9.798681, N'Tulip Basket Cathedral Classic Solitaire Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (43, 18, 24.76394, N'Glamour Ribbon Swirl Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (44, 24, 22.26973, N'Heirloom Milgrain Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (45, 18, 33.84999, N'Infinity Winding Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (46, 24, 19.9536781, N'Vintage Art Deco Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (47, 18, 27.4363079, N'Aura Hidden Accent Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (48, 24, 29.217886, N'Four Points Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (49, 18, 23.8731518, N'Tapered Halo Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (50, 24, 23.3386784, N'Cluster Side Stone Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (51, 18, 23.3386784, N'Vintage Hidden Halo Classic Diamond Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (52, 18, 22.6260471, N'Cathedral Halo Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (53, 24, 23.16052, N'Fine Line Marquise Three Stone Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (54, 18, 18.3502579, N'Vintage Knife Edge Side Stone Kite Set Engagement Ring', 1000, 3, 3)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (55, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (56, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (57, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (58, 18, 29.0397282, N'The Frick Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (59, 24, 33.3155174, N'Opulent Classic Pear Trio Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (60, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (61, 24, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (62, 24, 25.2984142, N'Pave Halo and Shank Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (63, 24, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (64, 24, 26.3673611, N'Vine Diamond Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (65, 18, 39.3728828, N'Contemporary Halo Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (66, 24, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (67, 24, 40.9763031, N'The Gansevoort Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (68, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (69, 24, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (70, 18, 24.585783, N'Diamond Pave Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (71, 18, 28.6834126, N'Princess Studded Engagement Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (72, 18, 30.999464, N'The Bryant Park Ring', 1000, 3, 4)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (73, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (74, 18, 57.3668251, N'The Fulton Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (75, 18, 35.63157, N'Elegance Diamond Studded Gallery Hidden Halo Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (76, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (77, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (78, 18, 72.86656, N'Emerald Side Stone Broad Band Hidden Halo Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (79, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (80, 24, 66.09656, N'The Roosevelt Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (81, 24, 85.51576, N'The Carnegie Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (82, 24, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (83, 18, 41.8670921, N'Brilliant Trio Cathedral Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (84, 18, 25.2984142, N'Trio Cluster Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (85, 24, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (86, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (87, 18, 110.636024, N'U-Prong Oval Side Studded Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (88, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (89, 18, 67.69998, N'The Sutton Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (90, 24, 29.0397282, N'The Frick Ring', 1000, 3, 5)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (91, 24, 32.42473, N'Slender Vine Six Prong Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (92, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (93, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (94, 18, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (95, 18, 25.1202564, N'Twisted Vine Hidden Halo Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (96, 18, 25.2984142, N'Trio Cluster Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (97, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (98, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (99, 24, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 6)
GO
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (100, 18, 67.69998, N'The Sutton Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (101, 24, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (102, 24, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (103, 18, 18.8847313, N'Vintage Celtic Engraved Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (104, 18, 25.2984142, N'Pave Halo and Shank Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (105, 18, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (106, 18, 35.63157, N'Channel Set Princess Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (107, 24, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (108, 24, 33.4936752, N'Glamorous Fancy Side Stone Hidden Halo Engagement Ring', 1000, 3, 6)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (109, 18, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (110, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (111, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (112, 18, 25.2984142, N'Pave Halo and Shank Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (113, 18, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (114, 24, 35.63157, N'Channel Set Princess Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (115, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (116, 24, 26.3673611, N'Vine Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (117, 18, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (118, 18, 17.4594688, N'Vintage Celtic Entwined Trinity Knot Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (119, 24, 38.12578, N'Three Stone Princess Studded Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (120, 18, 14.07447, N'Cathedral Twist Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (121, 18, 22.44789, N'French Cut Pave Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (122, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (123, 18, 24.585783, N'Diamond Pave Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (124, 24, 28.6834126, N'Princess Studded Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (125, 24, 34.5626221, N'Royal Twist Hidden Halo Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (126, 18, 43.826828, N'Braided Twist Diamond Engagement Ring', 1000, 3, 7)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (127, 18, 32.42473, N'Slender Vine Six Prong Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (128, 24, 16.56868, N'Modern Fine Line High Hidden Halo Solitaire Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (129, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (130, 24, 25.8328876, N'Fine Line Pear Three Stone Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (131, 18, 25.2984142, N'Trio Cluster Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (132, 18, 9.264208, N'Classic Four Prong Petite Comfort Fit Solitaire Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (133, 24, 33.3155174, N'Traditional Three Baguette Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (134, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (135, 18, 19.4192047, N'Studded Prong Hidden Halo Pave Shank Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (136, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (137, 24, 47.5681458, N'The Park Avenue Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (138, 24, 35.45341, N'Elegance Trillion Three Stone Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (139, 24, 33.84999, N'Emerald and Round Side Stone Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (140, 24, 33.4936752, N'Glamorous Fancy Side Stone Hidden Halo Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (141, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (142, 18, 20.1318359, N'Solitaire Classic Hidden Halo Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (143, 24, 26.3673611, N'Vine Diamond Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (144, 18, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 1000, 3, 8)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (145, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (146, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (147, 18, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (148, 24, 35.8097267, N'Elegance Pear Side Stone Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (149, 24, 25.476572, N'Elegance Split Shank Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (150, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (151, 18, 26.3673611, N'Vine Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (152, 18, 53.80367, N'The Central Park Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (153, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (154, 24, 24.585783, N'Diamond Pave Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (155, 24, 19.77552, N'6 Claw Hidden Halo Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (156, 24, 28.6834126, N'Princess Studded Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (157, 18, 54.5163, N'Scalloped Pear Hidden Halo Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (158, 24, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (159, 24, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (160, 24, 44.0049858, N'Knife Edge Scalloped Hidden Halo Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (161, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (162, 18, 42.2234077, N'Three Row Diamond Engagement Ring', 1000, 3, 9)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (163, 24, 17.4594688, N'Arc Hidden Halo Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (164, 18, 28.3270969, N'Pave Love Knot Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (165, 24, 25.2984142, N'Forever Twisting Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (166, 24, 40.44183, N'Elegance Trillion Diamond Three Stone Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (167, 18, 41.33262, N'Ascending Gallery Studded Hidden Halo Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (168, 18, 24.9420986, N'Three Stone Tapered Baguette Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (169, 18, 26.3673611, N'Vine Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (170, 24, 8.373419, N'Classic Four Prong Solitaire Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (171, 18, 38.12578, N'Three Stone Princess Studded Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (172, 24, 33.3155174, N'Elegance Split Shank Halo Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (173, 24, 22.44789, N'French Cut Pave Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (174, 18, 10.1549969, N'Petite Solitaire Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (175, 24, 24.585783, N'Diamond Pave Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (176, 24, 28.6834126, N'Princess Studded Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (177, 24, 22.8042049, N'Ara Fine Classic Pave Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (178, 24, 30.6431484, N'Braided Cathedral Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (179, 18, 21.37894, N'Ara Midi Classic Pave Diamond Engagement Ring', 1000, 3, 10)
INSERT [dbo].[accessory] ([accessory_id], [karat], [material_weight], [name], [quantity], [accessory_type_id], [shape_id]) VALUES (180, 18, 26.3673611, N'Elegance Hidden Halo and Pave Diamond Engagement Ring', 1000, 3, 10)
SET IDENTITY_INSERT [dbo].[accessory] OFF
GO
SET IDENTITY_INSERT [dbo].[accessory_image] ON 

INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (1, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-frontview_800x.jpg?v=1684020011', 1)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (2, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-sideview_800x.jpg?v=1684020011', 1)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (3, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-round-yellow-profileview_800x.jpg?v=1684020011', 1)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (4, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 2)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (5, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 2)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (6, N'https://www.withclarity.com/cdn/shop/products/RB1501874-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 2)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (7, N'https://www.withclarity.com/cdn/shop/products/RB1502007-ROUND-YELLOW-FRONTVIEW_52a52033-b87e-47b7-91d6-b4e2a1faf99b_800x.jpg?v=1690889930', 3)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (8, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-frontview_800x.jpg?v=1684023223', 4)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (9, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-sideview_800x.jpg?v=1684023223', 4)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (10, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-round-yellow-profileview_800x.jpg?v=1684023223', 4)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (11, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644794', 5)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (12, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644794', 5)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (13, N'https://www.withclarity.com/cdn/shop/files/RB1501006-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644794', 5)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (14, N'https://www.withclarity.com/cdn/shop/products/RB1501791-ROUND-YELLOW-FRONTVIEW_100ca641-2d69-4cf3-a151-d62044d7db9f_800x.jpg?v=1688387747', 6)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (15, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-round-yellow-frontview_eca75500-55fe-48a4-a1bd-3b5cb5789fda_800x.jpg?v=1684010489', 7)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (16, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 8)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (17, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 8)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (18, N'https://www.withclarity.com/cdn/shop/products/RB1501882-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 8)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (19, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 9)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (20, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 9)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (21, N'https://www.withclarity.com/cdn/shop/files/RB1501922-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 9)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (22, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-frontview_800x.jpg?v=1684024555', 10)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (23, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-sideview_800x.jpg?v=1684024555', 10)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (24, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-round-yellow-profileview_800x.jpg?v=1684024555', 10)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (25, N'https://www.withclarity.com/cdn/shop/products/RB1502248-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1707289810', 11)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (26, N'https://www.withclarity.com/cdn/shop/products/RB1502248-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1707289810', 11)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (27, N'https://www.withclarity.com/cdn/shop/products/RB1502248-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1707289810', 11)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (28, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-round-yellow-frontview_800x.jpg?v=1684015552', 12)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (29, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-round-yellow-sideview_800x.jpg?v=1684015552', 12)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (30, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-round-yellow-profileview_800x.jpg?v=1684015552', 12)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (31, N'https://www.withclarity.com/cdn/shop/files/RB1501088-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_408769b9-103e-4e64-b1db-95222bff95b4_800x.jpg?v=1702874407', 13)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (32, N'https://www.withclarity.com/cdn/shop/products/ens1147-round-yellow-frontview_256b69ed-e5fd-4f4c-805b-ddc3e99b1113_800x.jpg?v=1684007718', 14)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (33, N'https://www.withclarity.com/cdn/shop/products/RB1501699-ROUND-YELLOW-FRONTVIEW_a40a74a1-bfd1-4530-b0c5-0925953f5647_800x.jpg?v=1690201533', 15)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (34, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872821', 16)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (35, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872821', 16)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (36, N'https://www.withclarity.com/cdn/shop/files/RB1500352-ROUND-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872821', 16)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (37, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-frontview_800x.jpg?v=1684488384', 17)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (38, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-sideview_800x.jpg?v=1684488384', 17)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (39, N'https://www.withclarity.com/cdn/shop/products/1501787-round-yellow-profileview_800x.jpg?v=1684488384', 17)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (40, N'https://www.withclarity.com/cdn/shop/products/RB1501933-ROUND-YELLOW-FRONTVIEW_800x.jpg?v=1686826294', 18)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (41, N'https://www.withclarity.com/cdn/shop/products/RB1501933-ROUND-YELLOW-SIDEVIEW_800x.jpg?v=1686826294', 18)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (42, N'https://www.withclarity.com/cdn/shop/products/RB1501933-ROUND-YELLOW-PROFILEVIEW_800x.jpg?v=1686826294', 18)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (43, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-frontview_800x.jpg?v=1684020012', 19)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (44, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-sideview_800x.jpg?v=1684020012', 19)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (45, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-emerald-yellow-profileview_800x.jpg?v=1684020012', 19)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (46, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 20)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (47, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 20)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (48, N'https://www.withclarity.com/cdn/shop/products/RB1501874-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 20)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (49, N'https://www.withclarity.com/cdn/shop/products/RB1502007-EMERALD-YELLOW-FRONTVIEW_6d80b92d-5329-4306-ae40-78937aeaf173_800x.jpg?v=1690889930', 21)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (50, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-frontview_800x.jpg?v=1684023223', 22)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (51, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-sideview_800x.jpg?v=1684023223', 22)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (52, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-emerald-yellow-profileview_800x.jpg?v=1684023223', 22)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (53, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-emerald-yellow-frontview_e167b778-d365-453b-b347-64355b1117d6_800x.jpg?v=1684027802', 23)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (54, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 24)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (55, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 24)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (56, N'https://www.withclarity.com/cdn/shop/products/RB1501791-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 24)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (57, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-emerald-yellow-frontview_5ea56f03-28f0-436c-a24b-3d2beaf7d9b5_800x.jpg?v=1684010489', 25)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (58, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 26)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (59, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 26)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (60, N'https://www.withclarity.com/cdn/shop/products/RB1501882-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 26)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (61, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 27)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (62, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 27)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (63, N'https://www.withclarity.com/cdn/shop/files/RB1501922-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 27)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (64, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-frontview_800x.jpg?v=1684015552', 28)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (65, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-sideview_800x.jpg?v=1684015552', 28)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (66, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-emerald-yellow-profileview_800x.jpg?v=1684015552', 28)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (67, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-frontview_800x.jpg?v=1684015837', 29)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (68, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-sideview_800x.jpg?v=1684015837', 29)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (69, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-emerald-yellow-profileview_800x.jpg?v=1684015837', 29)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (70, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-frontview_800x.jpg?v=1684007718', 30)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (71, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-sideview_800x.jpg?v=1684007718', 30)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (72, N'https://www.withclarity.com/cdn/shop/products/ens1147-emerald-yellow-profileview_800x.jpg?v=1684007718', 30)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (73, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-frontview_800x.jpg?v=1684000196', 31)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (74, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-sideview_800x.jpg?v=1684000196', 31)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (75, N'https://www.withclarity.com/cdn/shop/products/ens4104-emerald-yellow-profileview_800x.jpg?v=1684000196', 31)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (76, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686826295', 32)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (77, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686826295', 32)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (78, N'https://www.withclarity.com/cdn/shop/products/RB1501933-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686826295', 32)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (79, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1686128196', 33)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (80, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1686128196', 33)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (81, N'https://www.withclarity.com/cdn/shop/products/RB1501867-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1686128196', 33)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (82, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-emerald-yellow-frontview_800x.jpg?v=1684022961', 34)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (83, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-emerald-yellow-sideview_800x.jpg?v=1684022961', 34)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (84, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-emerald-yellow-profileview_800x.jpg?v=1684022961', 34)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (85, N'https://www.withclarity.com/cdn/shop/products/ens4139-emerald-yellow-frontview_800x.jpg?v=1684026564', 35)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (86, N'https://www.withclarity.com/cdn/shop/products/ens4139-emerald-yellow-sideview_800x.jpg?v=1684026564', 35)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (87, N'https://www.withclarity.com/cdn/shop/products/ens4139-emerald-yellow-profileview_800x.jpg?v=1684026564', 35)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (88, N'https://www.withclarity.com/cdn/shop/files/RB1500156-EMERALD-YELLOW-FRONTVIEW_800x.jpg?v=1693892735', 36)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (89, N'https://www.withclarity.com/cdn/shop/files/RB1500156-EMERALD-YELLOW-SIDEVIEW_800x.jpg?v=1693892735', 36)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (90, N'https://www.withclarity.com/cdn/shop/files/RB1500156-EMERALD-YELLOW-PROFILEVIEW_800x.jpg?v=1693892735', 36)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (91, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-heart-yellow-frontview_30e0e9ba-1456-41af-91cf-559bc1549c53_800x.jpg?v=1684027802', 37)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (92, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-frontview_800x.jpg?v=1684024555', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (93, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-sideview_800x.jpg?v=1684024555', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (94, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-heart-yellow-profileview_800x.jpg?v=1684024555', 38)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (95, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (96, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (97, N'https://www.withclarity.com/cdn/shop/files/RB1500137-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 39)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (98, N'https://www.withclarity.com/cdn/shop/products/ens4125-heart-yellow-frontview_410ef4c4-f86b-4201-a1c0-a0972d07e4ce_800x.jpg?v=1683999062', 40)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (99, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-frontview_800x.jpg?v=1698665519', 41)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (100, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-sideview_800x.jpg?v=1698665519', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (101, N'https://www.withclarity.com/cdn/shop/products/RB1500277-heart-yellow-profileview_800x.jpg?v=1698665519', 41)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (102, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-frontview_800x.jpg?v=1696851926', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (103, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-sideview_800x.jpg?v=1696851926', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (104, N'https://www.withclarity.com/cdn/shop/products/enrrb1501094-heart-yellow-profileview_800x.jpg?v=1696851926', 42)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (105, N'https://www.withclarity.com/cdn/shop/products/enrrb1500082-heart-yellow-frontview_03dde7d9-b016-486c-84a0-680f2173e703_800x.jpg?v=1702640869', 43)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (106, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-frontview_800x.jpg?v=1684002653', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (107, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-sideview_800x.jpg?v=1684002653', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (108, N'https://www.withclarity.com/cdn/shop/products/ens1149-heart-yellow-profileview_800x.jpg?v=1684002653', 44)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (109, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-FRONTVIEW_800x.jpg?v=1691757231', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (110, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-SIDEVIEW_800x.jpg?v=1691757231', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (111, N'https://www.withclarity.com/cdn/shop/files/RB1500308-HEART-YELLOW-PROFILEVIEW_800x.jpg?v=1691757231', 45)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (112, N'https://www.withclarity.com/cdn/shop/products/enrrb1500108-heart-yellow-frontview_d4c12616-0278-4878-b69d-e04986f63d11_800x.jpg?v=1684002171', 46)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (113, N'https://www.withclarity.com/cdn/shop/products/enrrb1501086-heart-yellow-frontview_6b79560a-8c96-4c61-ab6b-9caf792a4412_800x.jpg?v=1684008857', 47)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (114, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-frontview_800x.jpg?v=1684007214', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (115, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-sideview_800x.jpg?v=1684007214', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (116, N'https://www.withclarity.com/cdn/shop/products/ens3026-heart-yellow-profileview_800x.jpg?v=1684007214', 48)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (117, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-frontview_800x.jpg?v=1684024398', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (118, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-sideview_800x.jpg?v=1684024398', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (119, N'https://www.withclarity.com/cdn/shop/products/ens3085-heart-yellow-profileview_800x.jpg?v=1684024398', 49)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (120, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-frontview_800x.jpg?v=1684025003', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (121, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-sideview_800x.jpg?v=1684025003', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (122, N'https://www.withclarity.com/cdn/shop/products/ens1216-heart-yellow-profileview_800x.jpg?v=1684025003', 50)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (123, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-frontview_800x.jpg?v=1684001733', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (124, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-sideview_800x.jpg?v=1684001733', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (125, N'https://www.withclarity.com/cdn/shop/products/enrrb1500100-heart-yellow-profileview_800x.jpg?v=1684001733', 51)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (126, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-frontview_800x.jpg?v=1684025822', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (127, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-sideview_800x.jpg?v=1684025822', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (128, N'https://www.withclarity.com/cdn/shop/products/enrrb1501139-heart-yellow-profileview_800x.jpg?v=1684025822', 52)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (129, N'https://www.withclarity.com/cdn/shop/products/enrrb1500601-heart-yellow-frontview_ecab8ea2-d503-4c50-81b2-7bf223e10cac_800x.jpg?v=1684002886', 53)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (130, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-frontview_800x.jpg?v=1684003323', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (131, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-sideview_800x.jpg?v=1684003323', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (132, N'https://www.withclarity.com/cdn/shop/products/enrrb1501055-heart-yellow-profileview_800x.jpg?v=1684003323', 54)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (133, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1692791490', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (134, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1692791490', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (135, N'https://www.withclarity.com/cdn/shop/products/RB1501006-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1692791490', 55)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (136, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-pear-yellow-frontview_23ee3e3a-ac6f-4225-b11e-153cd88b2e9e_800x.jpg?v=1684010489', 56)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (137, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-frontview_800x.jpg?v=1684000196', 57)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (138, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-sideview_800x.jpg?v=1684000196', 57)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (139, N'https://www.withclarity.com/cdn/shop/products/ens4104-pear-yellow-profileview_800x.jpg?v=1684000196', 57)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (140, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-FRONTVIEW_800x.jpg?v=1688104427', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (141, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-SIDEVIEW_800x.jpg?v=1688104427', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (142, N'https://www.withclarity.com/cdn/shop/files/RB1501933-ROSE-YELLOW-PROFILEVIEW_800x.jpg?v=1688104427', 58)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (143, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1709114842', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (144, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1709114842', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (145, N'https://www.withclarity.com/cdn/shop/products/RB1502249-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1709114842', 59)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (146, N'https://www.withclarity.com/cdn/shop/products/ens4139-pear-yellow-frontview_795d1766-02c9-4c3c-bfd3-08bc37a60620_800x.jpg?v=1684026564', 60)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (147, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (148, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (149, N'https://www.withclarity.com/cdn/shop/files/RB1502002-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 61)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (150, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-pear-yellow-frontview_38d63d6a-01fe-43b2-9c7d-9f333a4cbad0_800x.jpg?v=1684008617', 62)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (151, N'https://www.withclarity.com/cdn/shop/products/ens1100-pear-yellow-frontview_b7aa7c89-76ab-4680-97a2-ffaa20027a53_800x.jpg?v=1698729076', 63)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (152, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-frontview_800x.jpg?v=1684003696', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (153, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-sideview_800x.jpg?v=1684003696', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (154, N'https://www.withclarity.com/cdn/shop/products/ens4100-pear-yellow-profileview_800x.jpg?v=1684003696', 64)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (155, N'https://www.withclarity.com/cdn/shop/products/enrrb1500979-pear-yellow-frontview_7f786c4f-a395-46a0-96f6-3a34589afe38_800x.jpg?v=1684008700', 65)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (156, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-frontview_800x.jpg?v=1696413352', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (157, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-sideview_800x.jpg?v=1696413352', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (158, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-pear-yellow-profileview_800x.jpg?v=1696413352', 66)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (159, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1689842083', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (160, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1689842083', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (161, N'https://www.withclarity.com/cdn/shop/products/RB1501866-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1689842083', 67)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (162, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1707916887', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (163, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1707916887', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (164, N'https://www.withclarity.com/cdn/shop/products/1500217-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1707916887', 68)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (165, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (166, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (167, N'https://www.withclarity.com/cdn/shop/files/RB1500137-PEAR-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 69)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (168, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-frontview_800x.jpg?v=1684027472', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (169, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-sideview_800x.jpg?v=1684027472', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (170, N'https://www.withclarity.com/cdn/shop/products/ens4109-pear-yellow-profileview_800x.jpg?v=1684027472', 70)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (171, N'https://www.withclarity.com/cdn/shop/products/ens3017-pear-yellow-frontview_800x.jpg?v=1684000060', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (172, N'https://www.withclarity.com/cdn/shop/products/ens3017-pear-yellow-sideview_800x.jpg?v=1684000060', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (173, N'https://www.withclarity.com/cdn/shop/products/ens3017-pear-yellow-profileview_800x.jpg?v=1684000060', 71)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (174, N'https://www.withclarity.com/cdn/shop/products/RB1501852-PEAR-YELLOW-FRONTVIEW_a63bbb2b-5278-4f98-bcb2-d9c121002e7a_800x.jpg?v=1686825373', 72)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (175, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-frontview_800x.jpg?v=1684020012', 73)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (176, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-sideview_800x.jpg?v=1684020012', 73)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (177, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-oval-yellow-profileview_800x.jpg?v=1684020012', 73)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (178, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1685449895', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (179, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1685449895', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (180, N'https://www.withclarity.com/cdn/shop/products/RB1501874-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1685449895', 74)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (181, N'https://www.withclarity.com/cdn/shop/products/RB1502007-OVAL-YELLOW-FRONTVIEW_32e9dc9c-bac6-418d-ae7c-d2429a42488e_800x.jpg?v=1690889930', 75)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (182, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-frontview_800x.jpg?v=1684023223', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (183, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-sideview_800x.jpg?v=1684023223', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (184, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-oval-yellow-profileview_800x.jpg?v=1684023223', 76)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (185, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_800x.jpg?v=1702644755', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (186, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-SIDEVIEW_800x.jpg?v=1702644755', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (187, N'https://www.withclarity.com/cdn/shop/files/RB1501006-OVAL-US7.0-2.50CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702644755', 77)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (188, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688387747', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (189, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688387747', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (190, N'https://www.withclarity.com/cdn/shop/products/RB1501791-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688387747', 78)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (191, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-oval-yellow-frontview_77d87f4f-70fb-4775-bf42-144c07e2c29c_800x.jpg?v=1684010489', 79)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (192, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1688114926', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (193, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1688114926', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (194, N'https://www.withclarity.com/cdn/shop/products/RB1501882-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1688114926', 80)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (195, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1694171662', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (196, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1694171662', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (197, N'https://www.withclarity.com/cdn/shop/files/RB1501922-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1694171662', 81)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (198, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-frontview_800x.jpg?v=1684024555', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (199, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-sideview_800x.jpg?v=1684024555', 82)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (200, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-oval-yellow-profileview_800x.jpg?v=1684024555', 82)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (201, N'https://www.withclarity.com/cdn/shop/products/RB1502248-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1707289810', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (202, N'https://www.withclarity.com/cdn/shop/products/RB1502248-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1707289810', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (203, N'https://www.withclarity.com/cdn/shop/products/RB1502248-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1707289810', 83)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (204, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-frontview_800x.jpg?v=1684015552', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (205, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-sideview_800x.jpg?v=1684015552', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (206, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-oval-yellow-profileview_800x.jpg?v=1684015552', 84)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (207, N'https://www.withclarity.com/cdn/shop/files/RB1501088-OVAL-US7.0-2.50CT-YELLOW-FRONTVIEW_e376c0fd-ed17-4b49-910f-6d742857e39a_800x.jpg?v=1702874875', 85)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (208, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-frontview_800x.jpg?v=1684007718', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (209, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-sideview_800x.jpg?v=1684007718', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (210, N'https://www.withclarity.com/cdn/shop/products/ens1147-oval-yellow-profileview_800x.jpg?v=1684007718', 86)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (211, N'https://www.withclarity.com/cdn/shop/products/RB1501699-OVAL-YELLOW-FRONTVIEW_9f4f007a-b539-4b64-a21e-f2b237e16886_800x.jpg?v=1690201533', 87)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (212, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-FRONTVIEW_800x.jpg?v=1702872863', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (213, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-SIDEVIEW_800x.jpg?v=1702872863', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (214, N'https://www.withclarity.com/cdn/shop/files/RB1500352-OVAL-US7.0-2.5CT-YELLOW-PROFILEVIEW_800x.jpg?v=1702872863', 88)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (215, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-frontview_800x.jpg?v=1684488384', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (216, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-sideview_800x.jpg?v=1684488384', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (217, N'https://www.withclarity.com/cdn/shop/products/1501787-oval-yellow-profileview_800x.jpg?v=1684488384', 89)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (218, N'https://www.withclarity.com/cdn/shop/products/RB1501933-OVAL-YELLOW-FRONTVIEW_800x.jpg?v=1686826295', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (219, N'https://www.withclarity.com/cdn/shop/products/RB1501933-OVAL-YELLOW-SIDEVIEW_800x.jpg?v=1686826295', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (220, N'https://www.withclarity.com/cdn/shop/products/RB1501933-OVAL-YELLOW-PROFILEVIEW_800x.jpg?v=1686826295', 90)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (221, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-frontview_800x.jpg?v=1684020012', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (222, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-sideview_800x.jpg?v=1684020012', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (223, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-cushion-yellow-profileview_800x.jpg?v=1684020012', 91)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (224, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-frontview_800x.jpg?v=1684023223', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (225, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-sideview_800x.jpg?v=1684023223', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (226, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-cushion-yellow-profileview_800x.jpg?v=1684023223', 92)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (227, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-cushion-yellow-frontview_ee1d3e94-8e47-434a-835c-8a461d87adae_800x.jpg?v=1684027802', 93)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (228, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-cushion-yellow-frontview_3cfcadbb-4fcc-462a-b259-7cdf2fc7a039_800x.jpg?v=1684010489', 94)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (229, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-frontview_800x.jpg?v=1684024555', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (230, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-sideview_800x.jpg?v=1684024555', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (231, N'https://www.withclarity.com/cdn/shop/products/enrrb1500546-cushion-yellow-profileview_800x.jpg?v=1684024555', 95)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (232, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-frontview_800x.jpg?v=1684015552', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (233, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-sideview_800x.jpg?v=1684015552', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (234, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-cushion-yellow-profileview_800x.jpg?v=1684015552', 96)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (235, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-frontview_800x.jpg?v=1684015836', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (236, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-sideview_800x.jpg?v=1684015836', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (237, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-cushion-yellow-profileview_800x.jpg?v=1684015836', 97)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (238, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-frontview_800x.jpg?v=1684007718', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (239, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-sideview_800x.jpg?v=1684007718', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (240, N'https://www.withclarity.com/cdn/shop/products/ens1147-cushion-yellow-profileview_800x.jpg?v=1684007718', 98)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (241, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-frontview_800x.jpg?v=1684000196', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (242, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-sideview_800x.jpg?v=1684000196', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (243, N'https://www.withclarity.com/cdn/shop/products/ens4104-cushion-yellow-profileview_800x.jpg?v=1684000196', 99)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (244, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-frontview_800x.jpg?v=1684488384', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (245, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-sideview_800x.jpg?v=1684488384', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (246, N'https://www.withclarity.com/cdn/shop/products/1501787-cushion-yellow-profileview_800x.jpg?v=1684488384', 100)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (247, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-frontview_800x.jpg?v=1684022961', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (248, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-sideview_800x.jpg?v=1684022961', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (249, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-cushion-yellow-profileview_800x.jpg?v=1684022961', 101)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (250, N'https://www.withclarity.com/cdn/shop/products/ens4139-cushion-yellow-frontview_85a93baf-7e92-463c-9d22-a530c085b203_800x.jpg?v=1684026564', 102)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (251, N'https://www.withclarity.com/cdn/shop/products/enrrb1500156-cushion-yellow-frontview_1838365b-5bff-45fe-9680-698ecf2f8564_800x.jpg?v=1684001976', 103)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (252, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-cushion-yellow-frontview_78393285-e6c2-4243-9906-d3b2e3b21d9b_800x.jpg?v=1684008617', 104)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (253, N'https://www.withclarity.com/cdn/shop/files/RB1502003-CUSHION-YELLOW-FRONTVIEW_800x.jpg?v=1692938717', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (254, N'https://www.withclarity.com/cdn/shop/files/RB1502003-CUSHION-YELLOW-SIDEVIEW_800x.jpg?v=1692938717', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (255, N'https://www.withclarity.com/cdn/shop/files/RB1502003-CUSHION-YELLOW-PROFILEVIEW_800x.jpg?v=1692938717', 105)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (256, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-frontview_800x.jpg?v=1684733093', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (257, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-sideview_800x.jpg?v=1684733093', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (258, N'https://www.withclarity.com/cdn/shop/products/ens1166-cushion-yellow-profileview_800x.jpg?v=1684733093', 106)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (259, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-FRONTVIEW_800x.jpg?v=1711944345', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (260, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-SIDEVIEW_800x.jpg?v=1711944345', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (261, N'https://www.withclarity.com/cdn/shop/files/RB1502153-CUSHION-YELLOW-PROFILEVIEW_800x.jpg?v=1711944345', 107)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (262, N'https://www.withclarity.com/cdn/shop/products/enrrb1501017-cushion-yellow-frontview_5f7df887-11c7-466d-bce7-1fc4af7271e0_800x.jpg?v=1684019047', 108)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (263, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-princess-yellow-frontview_6b125954-37d4-4406-b944-41340b3d4b1f_800x.jpg?v=1684027801', 109)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (264, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-frontview_800x.jpg?v=1684007718', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (265, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-sideview_800x.jpg?v=1684007718', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (266, N'https://www.withclarity.com/cdn/shop/products/ens1147-princess-yellow-profileview_800x.jpg?v=1684007718', 110)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (267, N'https://www.withclarity.com/cdn/shop/products/ens4139-princess-yellow-frontview_5414893e-2efd-4209-b389-03094f49ed7d_800x.jpg?v=1684026564', 111)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (268, N'https://www.withclarity.com/cdn/shop/products/enrrb1500911-princess-yellow-frontview_c525f101-32c6-4553-ace0-101488de829a_800x.jpg?v=1684008617', 112)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (269, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1692938717', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (270, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1692938717', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (271, N'https://www.withclarity.com/cdn/shop/files/RB1502003-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1692938717', 113)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (272, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-frontview_800x.jpg?v=1684733093', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (273, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-sideview_800x.jpg?v=1684733093', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (274, N'https://www.withclarity.com/cdn/shop/products/ens1166-princess-yellow-profileview_800x.jpg?v=1684733093', 114)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (275, N'https://www.withclarity.com/cdn/shop/products/ens1100-princess-yellow-frontview_7146b479-24a9-4d42-9da2-d4568665b547_800x.jpg?v=1698729076', 115)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (276, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-frontview_800x.jpg?v=1684003696', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (277, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-sideview_800x.jpg?v=1684003696', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (278, N'https://www.withclarity.com/cdn/shop/products/ens4100-princess-yellow-profileview_800x.jpg?v=1684003696', 116)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (279, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-frontview_800x.jpg?v=1698668120', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (280, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-sideview_800x.jpg?v=1698668120', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (281, N'https://www.withclarity.com/cdn/shop/products/enr8101-princess-yellow-profileview_800x.jpg?v=1698668120', 117)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (282, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-frontview_800x.jpg?v=1696413352', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (283, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-sideview_800x.jpg?v=1696413352', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (284, N'https://www.withclarity.com/cdn/shop/products/enrrb1500092-princess-yellow-profileview_800x.jpg?v=1696413352', 118)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (285, N'https://www.withclarity.com/cdn/shop/products/ens3022-princess-yellow-frontview_800x.jpg?v=1684002284', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (286, N'https://www.withclarity.com/cdn/shop/products/ens3022-princess-yellow-sideview_800x.jpg?v=1684002284', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (287, N'https://www.withclarity.com/cdn/shop/products/ens3022-princess-yellow-profileview_800x.jpg?v=1684002284', 119)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (288, N'https://www.withclarity.com/cdn/shop/products/ens1156-princess-yellow-frontview_800x.jpg?v=1684004608', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (289, N'https://www.withclarity.com/cdn/shop/products/ens1156-princess-yellow-sideview_800x.jpg?v=1684004608', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (290, N'https://www.withclarity.com/cdn/shop/products/ens1156-princess-yellow-profileview_800x.jpg?v=1684004608', 120)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (291, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-frontview_800x.jpg?v=1707916887', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (292, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-sideview_800x.jpg?v=1707916887', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (293, N'https://www.withclarity.com/cdn/shop/products/ens3009-princess-yellow-profileview_800x.jpg?v=1707916887', 121)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (294, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-frontview_800x.jpg?v=1702642290', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (295, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-sideview_800x.jpg?v=1702642290', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (296, N'https://www.withclarity.com/cdn/shop/products/RB1500137-princess-yellow-profileview_800x.jpg?v=1702642290', 122)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (297, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-frontview_800x.jpg?v=1684027472', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (298, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-sideview_800x.jpg?v=1684027472', 123)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (299, N'https://www.withclarity.com/cdn/shop/products/ens4109-princess-yellow-profileview_800x.jpg?v=1684027472', 123)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (300, N'https://www.withclarity.com/cdn/shop/products/ens3017-princess-yellow-frontview_800x.jpg?v=1684000060', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (301, N'https://www.withclarity.com/cdn/shop/products/ens3017-princess-yellow-sideview_800x.jpg?v=1684000060', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (302, N'https://www.withclarity.com/cdn/shop/products/ens3017-princess-yellow-profileview_800x.jpg?v=1684000060', 124)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (303, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-FRONTVIEW_800x.jpg?v=1709114738', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (304, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-SIDEVIEW_800x.jpg?v=1709114738', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (305, N'https://www.withclarity.com/cdn/shop/products/RB1502243-PRINCESS-YELLOW-PROFILEVIEW_800x.jpg?v=1709114738', 125)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (306, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-frontview_800x.jpg?v=1684025123', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (307, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-sideview_800x.jpg?v=1684025123', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (308, N'https://www.withclarity.com/cdn/shop/products/enr8175-princess-yellow-profileview_800x.jpg?v=1684025123', 126)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (309, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-frontview_800x.jpg?v=1684020011', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (310, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-sideview_800x.jpg?v=1684020011', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (311, N'https://www.withclarity.com/cdn/shop/products/enrrb1501106-radiant-yellow-profileview_800x.jpg?v=1684020011', 127)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (312, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-frontview_800x.jpg?v=1684023223', 128)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (313, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-sideview_800x.jpg?v=1684023223', 128)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (314, N'https://www.withclarity.com/cdn/shop/products/enrrb1500976-radiant-yellow-profileview_800x.jpg?v=1684023223', 128)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (315, N'https://www.withclarity.com/cdn/shop/products/enrrb1501006-radiant-yellow-frontview_f563a058-ce34-4c01-a199-3d42007e886b_800x.jpg?v=1684027801', 129)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (316, N'https://www.withclarity.com/cdn/shop/products/enrrb1500600-radiant-yellow-frontview_e4d9c7a2-918f-4afc-a387-643002608407_800x.jpg?v=1684010489', 130)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (317, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-frontview_800x.jpg?v=1684015552', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (318, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-sideview_800x.jpg?v=1684015552', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (319, N'https://www.withclarity.com/cdn/shop/products/enrrb1501116-radiant-yellow-profileview_800x.jpg?v=1684015552', 131)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (320, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-frontview_800x.jpg?v=1684015836', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (321, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-sideview_800x.jpg?v=1684015836', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (322, N'https://www.withclarity.com/cdn/shop/products/enrrb1501088-radiant-yellow-profileview_800x.jpg?v=1684015836', 132)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (323, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-frontview_800x.jpg?v=1684007718', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (324, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-sideview_800x.jpg?v=1684007718', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (325, N'https://www.withclarity.com/cdn/shop/products/ens1147-radiant-yellow-profileview_800x.jpg?v=1684007718', 133)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (326, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-frontview_800x.jpg?v=1684000196', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (327, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-sideview_800x.jpg?v=1684000196', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (328, N'https://www.withclarity.com/cdn/shop/products/ens4104-radiant-yellow-profileview_800x.jpg?v=1684000196', 134)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (329, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-frontview_800x.jpg?v=1684022961', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (330, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-sideview_800x.jpg?v=1684022961', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (331, N'https://www.withclarity.com/cdn/shop/products/enrrb1501120-radiant-yellow-profileview_800x.jpg?v=1684022961', 135)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (332, N'https://www.withclarity.com/cdn/shop/products/ens4139-radiant-yellow-frontview_1eed1a63-609c-434b-932c-6ffdd6a0af47_800x.jpg?v=1684026564', 136)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (333, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1691477908', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (334, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1691477908', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (335, N'https://www.withclarity.com/cdn/shop/files/RB1501790-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1691477908', 137)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (336, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1693895169', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (337, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1693895169', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (338, N'https://www.withclarity.com/cdn/shop/files/RB1502082-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1693895169', 138)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (339, N'https://www.withclarity.com/cdn/shop/files/RB1501788-RADIANT-YELLOW-FRONTVIEW_800x.jpg?v=1692254547', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (340, N'https://www.withclarity.com/cdn/shop/files/RB1501788-RADIANT-YELLOW-SIDEVIEW_800x.jpg?v=1692254547', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (341, N'https://www.withclarity.com/cdn/shop/files/RB1501788-RADIANT-YELLOW-PROFILEVIEW_800x.jpg?v=1692254547', 139)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (342, N'https://www.withclarity.com/cdn/shop/products/enrrb1501017-radiant-yellow-frontview_087c1284-fd4a-4f49-be10-ecfceb3803af_800x.jpg?v=1684019047', 140)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (343, N'https://www.withclarity.com/cdn/shop/products/ens1100-radiant-yellow-frontview_691ecc92-74ed-4786-bd88-34e59ed6f9a3_800x.jpg?v=1698729076', 141)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (344, N'https://www.withclarity.com/cdn/shop/products/enrrb1501205-radiant-yellow-frontview_86502de5-4eee-4949-b033-5e5a3207d718_800x.jpg?v=1684388350', 142)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (345, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-frontview_800x.jpg?v=1684003696', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (346, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-sideview_800x.jpg?v=1684003696', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (347, N'https://www.withclarity.com/cdn/shop/products/ens4100-radiant-yellow-profileview_800x.jpg?v=1684003696', 143)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (348, N'https://www.withclarity.com/cdn/shop/products/enr8101-radiant-yellow-frontview_800x.jpg?v=1698668120', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (349, N'https://www.withclarity.com/cdn/shop/products/enr8101-radiant-yellow-sideview_800x.jpg?v=1698668120', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (350, N'https://www.withclarity.com/cdn/shop/products/enr8101-radiant-yellow-profileview_800x.jpg?v=1698668120', 144)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (351, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1692791491', 145)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (352, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1692791491', 145)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (353, N'https://www.withclarity.com/cdn/shop/products/RB1501006-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1692791491', 145)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (354, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-frontview_800x.jpg?v=1684000196', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (355, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-sideview_800x.jpg?v=1684000196', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (356, N'https://www.withclarity.com/cdn/shop/products/ens4104-marquise-yellow-profileview_800x.jpg?v=1684000196', 146)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (357, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-frontview_800x.jpg?v=1684026564', 147)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (358, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-sideview_800x.jpg?v=1684026564', 147)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (359, N'https://www.withclarity.com/cdn/shop/products/ens4139-marquise-yellow-profileview_800x.jpg?v=1684026564', 147)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (360, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1694173213', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (361, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1694173213', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (362, N'https://www.withclarity.com/cdn/shop/files/RB1502002-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1694173213', 148)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (363, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1689659699', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (364, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1689659699', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (365, N'https://www.withclarity.com/cdn/shop/products/RB1501991-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1689659699', 149)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (366, N'https://www.withclarity.com/cdn/shop/products/ens1100-marquise-yellow-frontview_10e93f6f-c2ed-465f-adf7-d8cead1258ac_800x.jpg?v=1698729076', 150)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (367, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-frontview_800x.jpg?v=1684003697', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (368, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-sideview_800x.jpg?v=1684003697', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (369, N'https://www.withclarity.com/cdn/shop/products/ens4100-marquise-yellow-profileview_800x.jpg?v=1684003697', 151)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (370, N'https://www.withclarity.com/cdn/shop/products/RB1501850-marquise-yellow-frontview_35afbad7-fcd7-4c02-808f-ee793e1d64f6_800x.jpg?v=1687261230', 152)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (371, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (372, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (373, N'https://www.withclarity.com/cdn/shop/files/RB1500137-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 153)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (374, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-frontview_800x.jpg?v=1684027473', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (375, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-sideview_800x.jpg?v=1684027473', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (376, N'https://www.withclarity.com/cdn/shop/products/ens4109-marquise-yellow-profileview_800x.jpg?v=1684027473', 154)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (377, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-frontview_800x.jpg?v=1684010573', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (378, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-sideview_800x.jpg?v=1684010573', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (379, N'https://www.withclarity.com/cdn/shop/products/enrrb1500528-marquise-yellow-profileview_800x.jpg?v=1684010573', 155)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (380, N'https://www.withclarity.com/cdn/shop/products/ens3017-marquise-yellow-frontview_800x.jpg?v=1684000060', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (381, N'https://www.withclarity.com/cdn/shop/products/ens3017-marquise-yellow-sideview_800x.jpg?v=1684000060', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (382, N'https://www.withclarity.com/cdn/shop/products/ens3017-marquise-yellow-profileview_800x.jpg?v=1684000060', 156)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (383, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1697026088', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (384, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1697026088', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (385, N'https://www.withclarity.com/cdn/shop/products/RB1502100-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1697026088', 157)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (386, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-frontview_800x.jpg?v=1684030757', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (387, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-sideview_800x.jpg?v=1684030757', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (388, N'https://www.withclarity.com/cdn/shop/products/RB1501245-marquise-yellow-profileview_800x.jpg?v=1684030757', 158)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (389, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-frontview_800x.jpg?v=1684001288', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (390, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-sideview_800x.jpg?v=1684001288', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (391, N'https://www.withclarity.com/cdn/shop/products/ens4122-marquise-yellow-profileview_800x.jpg?v=1684001288', 159)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (392, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-FRONTVIEW_800x.jpg?v=1696929172', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (393, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-SIDEVIEW_800x.jpg?v=1696929172', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (394, N'https://www.withclarity.com/cdn/shop/products/RB1502103-MARQUISE-YELLOW-PROFILEVIEW_800x.jpg?v=1696929172', 160)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (395, N'https://www.withclarity.com/cdn/shop/products/RB1501247-marquise-yellow-frontview_eaaa5399-6888-4609-bd0d-00ece005c640_800x.jpg?v=1684030448', 161)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (396, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-frontview_800x.jpg?v=1684008173', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (397, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-sideview_800x.jpg?v=1684008173', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (398, N'https://www.withclarity.com/cdn/shop/products/ens1111-marquise-yellow-profileview_800x.jpg?v=1684008173', 162)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (399, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1692791491', 163)
GO
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (400, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1692791491', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (401, N'https://www.withclarity.com/cdn/shop/products/RB1501006-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1692791491', 163)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (402, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-frontview_800x.jpg?v=1684000196', 164)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (403, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-sideview_800x.jpg?v=1684000196', 164)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (404, N'https://www.withclarity.com/cdn/shop/products/ens4104-asscher-yellow-profileview_800x.jpg?v=1684000196', 164)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (405, N'https://www.withclarity.com/cdn/shop/products/ens4139-asscher-yellow-frontview_ae9f1dcf-8b60-4f63-85af-a9acc9df928d_800x.jpg?v=1684026564', 165)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (406, N'https://www.withclarity.com/cdn/shop/products/RB1502003-EMERALD-YELLOW-FRONTVIEW_5766cd79-97a6-4d6f-a7cc-6f2b5bbbaf96_800x.jpg?v=1692938715', 166)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (407, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1711944346', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (408, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1711944346', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (409, N'https://www.withclarity.com/cdn/shop/files/RB1502153-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1711944346', 167)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (410, N'https://www.withclarity.com/cdn/shop/products/ens1100-asscher-yellow-frontview_c205c21d-26c7-4946-98c2-4009dc4e26c5_800x.jpg?v=1698729076', 168)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (411, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-frontview_800x.jpg?v=1684003696', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (412, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-sideview_800x.jpg?v=1684003696', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (413, N'https://www.withclarity.com/cdn/shop/products/ens4100-asscher-yellow-profileview_800x.jpg?v=1684003696', 169)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (414, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-frontview_800x.jpg?v=1698668120', 170)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (415, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-sideview_800x.jpg?v=1698668120', 170)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (416, N'https://www.withclarity.com/cdn/shop/products/enr8101-asscher-yellow-profileview_800x.jpg?v=1698668120', 170)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (417, N'https://www.withclarity.com/cdn/shop/products/ens3022-asscher-yellow-frontview_800x.jpg?v=1684002284', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (418, N'https://www.withclarity.com/cdn/shop/products/ens3022-asscher-yellow-sideview_800x.jpg?v=1684002284', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (419, N'https://www.withclarity.com/cdn/shop/products/ens3022-asscher-yellow-profileview_800x.jpg?v=1684002284', 171)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (420, N'https://www.withclarity.com/cdn/shop/products/RB1501994-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1690802818', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (421, N'https://www.withclarity.com/cdn/shop/products/RB1501994-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1690802818', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (422, N'https://www.withclarity.com/cdn/shop/products/RB1501994-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1690802818', 172)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (423, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-frontview_800x.jpg?v=1707916887', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (424, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-sideview_800x.jpg?v=1707916887', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (425, N'https://www.withclarity.com/cdn/shop/products/ens3009-asscher-yellow-profileview_800x.jpg?v=1707916887', 173)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (426, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-FRONTVIEW_800x.jpg?v=1702642290', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (427, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-SIDEVIEW_800x.jpg?v=1702642290', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (428, N'https://www.withclarity.com/cdn/shop/files/RB1500137-ASCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1702642290', 174)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (429, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-frontview_800x.jpg?v=1684027472', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (430, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-sideview_800x.jpg?v=1684027472', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (431, N'https://www.withclarity.com/cdn/shop/products/ens4109-asscher-yellow-profileview_800x.jpg?v=1684027472', 175)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (432, N'https://www.withclarity.com/cdn/shop/products/ens3017-asscher-yellow-frontview_800x.jpg?v=1684000060', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (433, N'https://www.withclarity.com/cdn/shop/products/ens3017-asscher-yellow-sideview_800x.jpg?v=1684000060', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (434, N'https://www.withclarity.com/cdn/shop/products/ens3017-asscher-yellow-profileview_800x.jpg?v=1684000060', 176)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (435, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-frontview_800x.jpg?v=1684030756', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (436, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-sideview_800x.jpg?v=1684030756', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (437, N'https://www.withclarity.com/cdn/shop/products/RB1501245-asscher-yellow-profileview_800x.jpg?v=1684030756', 177)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (438, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-frontview_800x.jpg?v=1684001288', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (439, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-sideview_800x.jpg?v=1684001288', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (440, N'https://www.withclarity.com/cdn/shop/products/ens4122-asscher-yellow-profileview_800x.jpg?v=1684001288', 178)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (441, N'https://www.withclarity.com/cdn/shop/products/RB1501247-asscher-yellow-frontview_0fe18450-84e3-4fdd-a921-ca8a44a57044_800x.jpg?v=1684030447', 179)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (442, N'https://www.withclarity.com/cdn/shop/files/RB1501997-ASSCHER-YELLOW-FRONTVIEW_800x.jpg?v=1690861797', 180)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (443, N'https://www.withclarity.com/cdn/shop/files/RB1501997-ASSCHER-YELLOW-SIDEVIEW_800x.jpg?v=1690861797', 180)
INSERT [dbo].[accessory_image] ([image_id], [image_url], [accessory_id]) VALUES (444, N'https://www.withclarity.com/cdn/shop/files/RB1501997-ASSCHER-YELLOW-PROFILEVIEW_800x.jpg?v=1690861797', 180)
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

INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (1, N'Customer', 6, N'Dao Trong Customer', N'customer@gmail.com', N'8CziFEOuHbeveeGawrCwYg==:24Gq0lNNue+fvF6VoBf/G7tKSnMj91ma7dHLnBfWP10=', N'0154346439', N'120 Continental Street', CAST(N'2002-04-12T14:48:21.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.5248622' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (2, N'SaleStaff', 6, N'Nguyen Tien Sale', N'sale_staff@gmail.com', N'UZXM8RPTs1vArDc+pz1Suw==:ngA1znnh2xYJLEqvLXSEkQ9BoTacUx5e3ZCS1sAC6xI=', N'9551819190', N'23 Claremont Street', CAST(N'1991-06-26T10:30:28.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.6356317' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (3, N'DeliveryStaff', 6, N'Do Long Delivery', N'delivery_staff@gmail.com', N'wQAFzeVcLOva63F0nS+QdQ==:UFArE4RnZOZ+RbF8BFyUZ5Ay5wFS6E+KiYEZpfxz2SY=', N'3052617866', N'12 Bayside', CAST(N'1996-10-27T23:09:42.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.6500259' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (4, N'Manager', 6, N'Vo Do Quang Manager', N'manager@gmail.com', N'e8jB8V62y0zZn6K66NyDyQ==:PvbJoomwZ07jkcZQKLt4Hlvncn6La/Jv+hC+V8H61og=', N'3682157063', N'13 Marquette Way', CAST(N'1995-02-22T21:31:35.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.6735150' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (5, N'Administrator', 6, N'Le The Admin', N'administrator@gmail.com', N'9hfegEkU9Mb7odjh6FX0nw==:XMjPXENlvWy8kggjci7gnBHQbYXSWlCkzcAvFKwqfWk=', N'3841709435', N'213 Anzinger Crossing', CAST(N'1993-12-14T07:53:45.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.7025583' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (6, N'Customer', 6, N'Paxon Attenbrow', N'pattenbrow0@taobao.com', N'QbS42s3wB5rt7LJ+X/COxQ==:FAOqS+jCU6/Go1Yphd+mh751IeETmLfrcrdJhaIZ2Qo=', N'6846223816', N'72335 Twin Pines Court', CAST(N'2002-11-17T01:00:46.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.7225616' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (7, N'Customer', 6, N'Johan Kinny', N'jkinny1@biglobe.ne.jp', N'MsSv0BMLmQRdUYc60v7M6A==:KycgVf9rNtMK53lwHPzjj6BDd7jCMtFVGiWbRJyL6XE=', N'2393484544', N'8 Dryden Pass', CAST(N'1983-05-01T06:13:47.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.7404224' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (8, N'Customer', 6, N'Trever Syder', N'tsyder2@japanpost.jp', N'AqXweZgnd3DLLLvFjFkWZA==:rblQLSei79OOroC60aJgOwO0GwZziqMMbpvz1XOyYgg=', N'2372972066', N'2053 Victoria Junction', CAST(N'1987-01-09T23:18:24.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.7591734' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (9, N'Customer', 6, N'Erminie Khomich', N'ekhomich3@yolasite.com', N'OW4nd/NvbTytwWawevvXtQ==:fh5SQM50bUE4dTQBcHTNUl/VsIcfv3RrFkR4xAfbqJQ=', N'7372156077', N'5 Schurz Point', CAST(N'1966-03-11T08:05:23.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.7847940' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (10, N'Customer', 6, N'Erastus Shrimpton', N'eshrimpton4@abc.net.au', N'5ctI0z157y3T8CiNYt8nwA==:d8AjWWXoM0/uC1U93a5KwJwaa1SEgNI8Uh7aLPRCPKM=', N'4336614074', N'280 Golden Leaf Hill', CAST(N'1976-06-01T17:08:23.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.8068385' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (11, N'Customer', 6, N'Michaella Dominighi', N'mdominighi5@alibaba.com', N'127J0e6GOKVbnuNr7pm6Lw==:e91ypETS6JxD3CQojES4EYyiIJum+/CCbcA+MKgUZkY=', N'9132585664', N'18576 Coolidge Way', CAST(N'1961-11-16T21:21:49.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.8234735' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (12, N'Customer', 6, N'Lauretta Padginton', N'lpadginton6@goo.gl', N'OZ/g+skAlf9lxHkoIbm7TA==:1TlQqsL/HB+mkbCfHdbhObbndWLn/bzq4YWytL4oBPo=', N'7783480257', N'96 Linden Junction', CAST(N'1976-10-06T22:58:03.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.8503544' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (13, N'Customer', 6, N'Lilyan Lafay', N'llafay7@icq.com', N'gQF/Mg2AM5zJm3Nn9GP3cg==:KHRySpzJCyvpkiCdJanZjZZe3XnBo3o84M7xLa27LIk=', N'4962751014', N'29 Southridge Point', CAST(N'1985-10-10T04:59:42.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.8709440' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (14, N'Customer', 6, N'Sonni Grabham', N'sgrabham8@ted.com', N'FabTZ07Lea7MGi8QhwHL5g==:FdlmorNKOWeIAfABhdYX48BYjCPhnOUd54tmVg9f56Q=', N'2713561617', N'113 Comanche Crossing', CAST(N'2002-04-12T14:48:21.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.9044510' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (15, N'Customer', 6, N'Emmy Halfacre', N'ehalfacre9@yellowbook.com', N'dn4nldwC45T4aj8ItODRtg==:wXVZzPAkIIxbKKpNNxeZ9SDa5furY6fZKQSKFrvzGzU=', N'2913896581', N'43 Ramsey Parkway', CAST(N'1973-02-15T10:38:52.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.9413144' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (16, N'Customer', 6, N'Dody Johnsson', N'djohnssona@liveinternet.ru', N'eUl/KgGaXIGkGdjPzhcRag==:dFjRjq87ASYMqT31E/FE3azPeDVJ3SjV63ygA60gNQk=', N'5006626180', N'6245 Continental Street', CAST(N'1970-01-18T06:50:58.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:15.9761288' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (17, N'Customer', 6, N'Dore Odam', N'dodamb@amazonaws.com', N'ff/lWPJTMJbokhETMx/SZA==:YFtINGjX4g+1JK1C46Kk+TgfNxSrXSh/k9jxrSZkEHE=', N'9028237960', N'995 Anniversary Circle', CAST(N'1999-08-12T22:44:12.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.0203316' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (18, N'Customer', 6, N'Alvira Treske', N'atreskec@wordpress.com', N'DxrPsbK4VoLCMORipsY21g==:MG7UbGu+GXgr9vn2bfj0KvUVLO+0N22BsC041CddIjc=', N'3662945862', N'200 Lawn Lane', CAST(N'1978-02-21T23:59:12.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.0529195' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (19, N'Customer', 6, N'Romola Ettels', N'rettelsd@mac.com', N'njinMMtTH6h0nyjSZ0bSZQ==:UJQDipcOLBAmYCGiXu1vCrZ8mu6L5qpF5T4/yM3Drvc=', N'9977388065', N'1 Fisk Trail', CAST(N'1976-09-14T14:51:36.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.0754526' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (20, N'Customer', 6, N'Devland Peris', N'dperise@wix.com', N'5ualcQO/Xpv6cTh4p6rmKw==:/Ce6LWJcg7UOXpwKySastxcCcdWqgTU53FdR8oeJeAU=', N'3223573946', N'44 Ronald Regan Way', CAST(N'1991-06-26T10:30:28.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.1018659' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (21, N'Customer', 6, N'Budd Pawlik', N'bpawlikf@fema.gov', N'HLm3tiD0cifSi9Nb4EfnbQ==:9kGpBd66T/YEuVpRky+BKNefsxuD8TiaEz0Ptmg5OKA=', N'6831883994', N'28 Ilene Junction', CAST(N'1977-12-17T21:49:25.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.1193220' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (22, N'Customer', 6, N'Karine Lonergan', N'klonergang@dailymail.co.uk', N'678AYtTRXXZVihDHzt3xMQ==:mcBKXJ9RItA1kSlK6vNo59N/ixxiMx8jnOzuEyYg0sE=', N'5505446518', N'75137 Kenwood Hill', CAST(N'1971-10-25T01:12:50.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.1410154' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (23, N'Customer', 6, N'Felizio Beardshall', N'fbeardshallh@ovh.net', N'emNKHgDkGqA6cYn3hIyx1Q==:PT9zTZ7HYEigeILdPbBQv4dOOwLLNzNZAASunXovpag=', N'5671547650', N'52 Oak Terrace', CAST(N'1990-11-03T14:18:06.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.1748260' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (24, N'Customer', 6, N'Davidde Davies', N'ddaviesi@imageshack.us', N'kEFFtDp14Lro6AVa8oCjng==:7Hg2OC8wruJKxna2SasjtKcALoFjq8FenUMvtpt3D+0=', N'9551819190', N'810 Claremont Pass', CAST(N'1996-10-27T23:09:42.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.2015621' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (25, N'Customer', 6, N'Glyn Heathcote', N'gheathcotej@twitter.com', N'DzLXqtwSpcc3QK2yXGIC6Q==:wCSL/VjDAsx/j98d/7yQTcZ+lp+LmeTudrecJUWm3qM=', N'6576178042', N'14763 Iowa Circle', CAST(N'1995-02-22T21:31:35.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.2248011' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (26, N'Customer', 6, N'Gavra Heustace', N'gheustacek@about.com', N'fRZ6hmKvHGvyr9YfGI1llw==:xue/CNKQdS/VicLYrAsKaTtLRO+Y6bBVycMrb5PWy8I=', N'9006360632', N'7236 Algoma Plaza', CAST(N'1960-03-30T14:26:35.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.2511970' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (27, N'Customer', 6, N'Standford Shakesbye', N'sshakesbyel@wunderground.com', N'JXi6cdvr6iOijtqc/CQcXg==:h1v0jSt19wJAPn9GNZh6RnSE3nKf3asugyQ0rhJ2PlE=', N'2219861146', N'6 Marquette Way', CAST(N'1993-12-14T07:53:45.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.2750773' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (28, N'Customer', 6, N'Jessamyn Chaloner', N'jchalonerm@themeforest.net', N'Os/yh/cf+aozoU97q5fwUg==:LCamPOryN/UA7Z7n/s75OLcmvgDmjCY7uJ+fOkJyKFI=', N'7888178446', N'4286 Hauk Drive', CAST(N'1961-03-07T11:12:34.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.3033845' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (29, N'Customer', 6, N'Theobald Oldmeadow', N'toldmeadown@1und1.de', N'prPrGjZ2WpOOY7TS+yk2Sg==:XP4KaJd1WTsyYHLvp6XhUlvsAFFHJ2WrBlB8CSpD7zw=', N'3384042952', N'41 Forest Run Road', CAST(N'1981-06-28T14:07:08.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.3216382' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (30, N'Customer', 6, N'Gusta Macbeth', N'gmacbetho@tamu.edu', N'wB3bzR3O8FolTgl7//Wn1Q==:nk0inTK+KM1/XGB6g7+B5AG/khmjXpsUgn/XMUlYA/k=', N'4221124533', N'35183 Bayside Drive', CAST(N'1973-09-29T20:48:44.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.3403801' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (31, N'Customer', 6, N'Alanah Iglesiaz', N'aiglesiazp@dell.com', N'uBtPPcp07pwDYLoOtaA6Ew==:J3Andk3/qHCuUJtRv9cVgDfSO4NpWOE/hDuV8jI/B9c=', N'2023674136', N'46696 Prairie Rose Alley', CAST(N'1969-08-05T14:18:22.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.3596824' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (32, N'Customer', 6, N'Alvan Piwell', N'apiwellq@istockphoto.com', N'JC2iSF8WU6xMRKnS1iRimQ==:5cQjesdNM/YNgsoL94K4H8FHzKxt+l1XMY5WvKpSBJA=', N'4575954933', N'706 Anzinger Crossing', CAST(N'1975-01-16T19:04:50.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.3839555' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (33, N'Customer', 6, N'Fleming Clingan', N'fclinganr@istockphoto.com', N'W9dOTBMMi4ljCyhIhYAzVQ==:huWMyn+VG/5Ggxg1gQox/LDJ4vo4O48yBjV826pHLBg=', N'3052617866', N'4 Dennis Street', CAST(N'1980-05-03T07:57:29.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.4027468' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (34, N'Customer', 6, N'Gnni Heal', N'gheals@exblog.jp', N'WXbldsh6C4CHOHoohXbRUQ==:e45u2F8muTTelItQr0ExbdWV6Z0W/Kb/39WV1s+Pzik=', N'9855715141', N'12366 Norway Maple Street', CAST(N'1974-04-30T23:05:06.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.4190843' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (35, N'Customer', 6, N'Anton Kinkead', N'akinkeadt@umn.edu', N'LtaBkkD4f5w4fbKQyYq7zQ==:uCiDxZ13IEL3aKjdl0RRby28VGT6ZyJHhlX0HV6H4qo=', N'8036245307', N'49 Redwing Plaza', CAST(N'1984-02-22T09:33:39.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.4358502' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (36, N'Customer', 6, N'Ardella Harbard', N'aharbardu@cocolog-nifty.com', N'Mpp3hGuhbtZ7kychuAcb/g==:o9YdkkfKVu9fjMst2sg7UYFnCzwKFNG7a45WK2pbLq4=', N'3185497892', N'05256 Dennis Terrace', CAST(N'1978-12-06T18:55:02.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.4538751' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (37, N'Customer', 6, N'Emeline Aspinwall', N'easpinwallv@paginegialle.it', N'nr+D+LaLFrbCixRuzLBtOg==:pUm6bLanKY4Q2V/BC9nY8PIy8FEZ+Qg2fGf4KICEVEM=', N'4275534397', N'2459 Grim Crossing', CAST(N'1968-04-05T04:41:10.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.4751978' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (38, N'Customer', 6, N'Gunther Fernan', N'gfernanw@meetup.com', N'EfQr3SUPl7aE17KSwsEbJA==:Zi0mJRwoTdohgF9Y1+hzWZvs6l9s6g2Xdh3Lt1Cu/Cw=', N'3841709435', N'45454 Dahle Pass', CAST(N'1960-12-06T00:14:26.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.5079148' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (39, N'Manager', 6, N'Jacquie Frosch', N'jfroschx@scientificamerican.com', N'/hyPrXLMEc+spk9dLjt5DA==:y0y1NDTECUXfIqYvxxIqA5tFztRVFIyb1py4g6Nh3jQ=', N'3682157063', N'06 Bashford Drive', CAST(N'1986-10-21T21:21:48.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.5397127' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (40, N'Manager', 6, N'Jozef Stretton', N'jstrettony@yahoo.co.jp', N'ekvFXRLVL0D6K/lxqipMaQ==:NyTcv5UlhZZhixpa5L3xKUvyHRI+rNqN/I7vZdiUzWg=', N'7529114994', N'980 Mifflin Circle', CAST(N'1982-09-07T00:11:06.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.5553259' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (41, N'SaleStaff', 6, N'Zabrina Murley', N'zmurleyz@google.it', N'MuX9jYRVqSc5isvSt4f5Lw==:/rWtX2icFg6ruTeq1prOHsWhKEtzU78TbhqS7pWyE08=', N'4843026558', N'5 John Wall Trail', CAST(N'1969-01-14T05:47:43.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.5826302' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (42, N'SaleStaff', 6, N'Mariele Kimbury', N'mkimbury10@soup.io', N'veLQ9/IpDuO/qmq+FBHKGw==:xFqfox7tNP2Jtj+BvUBemJ6Ce499COPuuPhL16VoyxQ=', N'6562447422', N'8 Birchwood Alley', CAST(N'1962-06-29T07:58:36.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.6056800' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (43, N'SaleStaff', 6, N'Welsh Lunny', N'wlunny11@tumblr.com', N'Au0S4Ntgo5plXl8vrWcGVw==:QjgP/MrYl/oZFcBG1Pkzi5Np+AJ15nFs3IrrbOY9R1Y=', N'6951666422', N'589 Grayhawk Circle', CAST(N'1987-11-02T22:28:04.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.6247393' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (44, N'SaleStaff', 6, N'Juanita Duckitt', N'jduckitt12@163.com', N'y2oY2EejJUezgWhh+grgoA==:cztFZFQoMN8TQ0H2/vBLrYTepj788OVajdepVbHiY1A=', N'6538107375', N'4275 Continental Crossing', CAST(N'1988-12-21T02:09:01.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.6412490' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (45, N'SaleStaff', 6, N'Arlinda Manders', N'amanders13@baidu.com', N'3qr6wAovQ2u+lgXs5X+LUw==:EWyF3qVlwcYfuPUT65A33Y3YKHkPLNWbkfIKdw7sPWE=', N'2583521596', N'428 Duke Trail', CAST(N'1987-12-31T13:50:10.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.6563569' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (46, N'SaleStaff', 6, N'Aldis Wasmer', N'awasmer14@si.edu', N'TYIfKPbmftc+1FwvO2XOJQ==:30NXK5FUUm8Eo3vhPwbQCIGxWrC2PBTS1VUJ2lU7IL0=', N'9456304471', N'309 Red Cloud Way', CAST(N'1995-03-09T08:14:46.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.6737832' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (47, N'SaleStaff', 6, N'Garald Inchan', N'ginchan15@hubpages.com', N'RZqkPn8kKR5fDCfm/Z0/Sg==:I/b8h7qqLBtdppUCuJtzoGsAUj7LTdE/u3cD3JO9Ssg=', N'9327850317', N'16500 Rigney Junction', CAST(N'1988-01-22T17:14:00.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.6923856' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (48, N'DeliveryStaff', 6, N'Omar Eagger', N'oeagger16@utexas.edu', N'5bCKQg+ZykrlEOrmVlJ8Hw==:ME0a+ZgxhQF5ArSvkq55/c8fTparFg4iyZbAJjaB9ZA=', N'2922130177', N'55 Coolidge Hill', CAST(N'1999-01-15T22:30:43.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.7635931' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (49, N'DeliveryStaff', 6, N'Colly Dunniom', N'cdunniom17@cornell.edu', N'B1AlH3E4GG2142kJCA9l+Q==:goU4CbMMjtdv+VlE35hwT6xuabbLxixs7aJ9fUKziO0=', N'3985383009', N'654 Hallows Place', CAST(N'1960-07-19T02:58:18.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.8257830' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (50, N'DeliveryStaff', 6, N'Carmelina McKernan', N'cmckernan18@theguardian.com', N'56QTQmfIugieKia+k+kJWw==:DDC+JgF9/+tt1hRdpZf3inaya4EWTjBmsL2uKnOfBio=', N'8817509280', N'0 Rutledge Place', CAST(N'1979-10-06T10:24:41.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.8569128' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (51, N'DeliveryStaff', 6, N'Else Calvie', N'ecalvie19@odnoklassniki.ru', N'oTk6p7BL2dE5M8gUy7/wnQ==:nMCwGjcv7y6E7Sn45VukIYlNprxeWHfFxpNT4BD3PAc=', N'2692053668', N'16841 Schiller Way', CAST(N'1961-09-22T20:48:55.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.9226420' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (52, N'DeliveryStaff', 6, N'Zabrina Tohill', N'ztohill1a@dyndns.org', N'rSMxq7y1TBUFJ0dWXUs1Jg==:pBG7oOsrs4Omk3bxlFdwlcIDZjskdkymY/JU+6BqTiA=', N'2462498276', N'142 South Terrace', CAST(N'1974-12-16T18:15:24.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:16.9555783' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (53, N'DeliveryStaff', 6, N'Kele Speller', N'kspeller1b@google.ca', N'VGIrIBoYnQxlcklGODNeHQ==:9nJlp8ic3u1wcaFSKYHmzGd6s6dfUOiP52tOB02SmJI=', N'5242755890', N'031 Express Pass', CAST(N'1991-09-07T14:47:42.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:17.0043190' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (54, N'DeliveryStaff', 6, N'Stesha Bugdall', N'sbugdall1c@miibeian.gov.cn', N'UctEf1E11/IVEKX91rhoBg==:Q53GVHkHhIRZm2NfH4dozd5kQ06j4cLEwWV6ts7E1dQ=', N'7893940343', N'602 Lunder Road', CAST(N'1966-09-15T23:57:57.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:17.0398599' AS DateTime2))
INSERT [dbo].[account] ([account_id], [role], [rank_id], [name], [email], [password], [phone_number], [address], [birthday], [gender], [reward_point], [created_at]) VALUES (55, N'DeliveryStaff', 6, N'Felisha Sabathier', N'fsabathier1d@gravatar.com', N'Od2rkbaa2WuoWMhW1vLPfQ==:oH7JGe/HnZ/cXUXWMM5Tpl8742LYX9Lyhtb33DnTRvg=', N'5383928998', N'649 Charing Cross Drive', CAST(N'1966-11-12T12:56:28.0000000' AS DateTime2), N'Female', 0, CAST(N'2024-06-11T20:22:17.0606142' AS DateTime2))
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond] ON 

INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (1, N'IGI', 615380399, N'https://www.igi.org/verify-your-report/?r=615380399', N'https://video.diamondasset.in:8080/imagesM/632443228.jpg', 3.03, N'Ideal', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (2, N'IGI', 618491447, N'https://www.igi.org/verify-your-report/?r=618491447', N'https://video.diamondasset.in:8080/imagesM/631455159.jpg', 3.02, N'Ideal', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (3, N'IGI', 620489774, N'https://www.igi.org/verify-your-report/?r=620489774', N'https://video.diamondasset.in:8080/imagesM/632416490.jpg', 3.01, N'Excellent', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (4, N'IGI', 620455816, N'https://www.igi.org/verify-your-report/?r=620455816', N'https://magnifier.s3.us-west-1.amazonaws.com/5493332667.jpg', 3.08, N'Ideal', 17, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (5, N'IGI', 632427706, N'https://www.igi.org/verify-your-report/?r=632427706', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Round_0b870701-a9aa-420d-8b43-031fc6eca7f2.jpg?v=1702020829', 5.05, N'Ideal', 15, 9, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (6, N'IGI', 632423081, N'https://www.igi.org/verify-your-report/?r=632423081', N'https://video.diamondasset.in:8080/imagesM/632423081.jpg', 5.45, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (7, N'IGI', 632423578, N'https://www.igi.org/verify-your-report/?r=632423578', N'https://video.diamondasset.in:8080/imagesM/632423578.jpg', 5.13, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (8, N'IGI', 632416344, N'https://www.igi.org/verify-your-report/?r=632416344', N'https://video.diamondasset.in:8080/imagesM/632416344.jpg', 5.17, N'Ideal', 17, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (9, N'IGI', 631455311, N'https://www.igi.org/verify-your-report/?r=631455311', N'https://video.diamondasset.in:8080/imagesM/631455311.jpg', 5.36, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (10, N'IGI', 632422863, N'https://www.igi.org/verify-your-report/?r=632422863', N'https://video.diamondasset.in:8080/imagesM/632422863.jpg', 5.6, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (11, N'IGI', 632416477, N'https://www.igi.org/verify-your-report/?r=632416477', N'https://video.diamondasset.in:8080/imagesM/632416477.jpg', 5.17, N'Ideal', 16, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (12, N'IGI', 620427330, N'https://www.igi.org/verify-your-report/?r=620427330', N'https://video.diamondasset.in:8080/imagesM/620427330.jpg', 7.04, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (13, N'IGI', 626495160, N'https://www.igi.org/verify-your-report/?r=626495160', N'https://video.diamondasset.in:8080/imagesM/626495160.jpg', 6.13, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (14, N'IGI', 625413392, N'https://www.igi.org/verify-your-report/?r=625413392', N'https://video.diamondasset.in:8080/imagesM/625413392.jpg', 6.25, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (15, N'IGI', 618438766, N'https://www.igi.org/verify-your-report/?r=618438766', N'https://video.diamondasset.in:8080/imagesM/618438766.jpg', 5.23, N'Excellent', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (16, N'IGI', 632422795, N'https://www.igi.org/verify-your-report/?r=632422795', N'https://video.diamondasset.in:8080/imagesM/632422795.jpg', 5.11, N'Excellent', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (17, N'IGI', 621408910, N'https://www.igi.org/verify-your-report/?r=621408910', N'https://video.diamondasset.in:8080/imagesM/621408910.jpg', 5.13, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (18, N'IGI', 620428070, N'https://www.igi.org/verify-your-report/?r=620428070', N'https://video.diamondasset.in:8080/imagesM/620428070.jpg', 5.22, N'Ideal', 15, 8, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (19, N'IGI', 627411581, N'https://www.igi.org/verify-your-report/?r=627411581', N'https://video.diamondasset.in:8080/imagesM/627411581.jpg', 7.09, N'Ideal', 15, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (20, N'IGI', 619432257, N'https://www.igi.org/verify-your-report/?r=619432257', N'https://video.diamondasset.in:8080/imagesM/619432257.jpg', 6.87, N'Ideal', 15, 7, N'Excellent', N'Excellent', N'None', 1, 1)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (21, N'IGI', 618466200, N'https://www.igi.org/verify-your-report/?r=618466200', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e8f12212-9e81-4b63-88be-e66c0ce4d704.jpg', 0.54, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (22, N'IGI', 614303223, N'https://www.igi.org/verify-your-report/?r=614303223', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e94cc0b9-b45a-4b48-8daf-cca267f64d83.jpg', 0.54, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (23, N'IGI', 629421232, N'https://www.igi.org/verify-your-report/?r=629421232', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e12f9cac-ddb0-4300-a35b-dc2a45b604a3.jpg', 0.55, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (24, N'IGI', 627442214, N'https://www.igi.org/verify-your-report/?r=627442214', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/05a57a0d-cfad-4abf-8009-d8564b58eaaf.jpg', 0.61, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (25, N'IGI', 618466201, N'https://www.igi.org/verify-your-report/?r=618466201', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ff400ba8-7145-450d-9999-fad7581f04c5.jpg', 0.74, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (26, N'IGI', 623438859, N'https://www.igi.org/verify-your-report/?r=623438859', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/025661ff-f10e-4b32-94af-3e77f07fcbdf.jpg', 0.74, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (27, N'IGI', 623438861, N'https://www.igi.org/verify-your-report/?r=623438861', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/fb4abdae-32c5-4071-905e-f194037c03ca.jpg', 0.75, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (28, N'IGI', 627489685, N'https://www.igi.org/verify-your-report/?r=627489685', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV408-216A', 0.81, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (29, N'IGI', 621480441, N'https://www.igi.org/verify-your-report/?r=621480441', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/324aec43-72c3-4ff4-9e99-5ca3f820a2bf.jpg', 0.82, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (30, N'IGI', 627489683, N'https://www.igi.org/verify-your-report/?r=627489683', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV406-412A', 0.82, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (31, N'IGI', 627489961, N'https://www.igi.org/verify-your-report/?r=627489961', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP82-244', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (32, N'IGI', 620461086, N'https://www.igi.org/verify-your-report/?r=620461086', N'https://v360.in/V360Images.aspx?cid=vd&d=620461086', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (33, N'IGI', 622460382, N'https://www.igi.org/verify-your-report/?r=622460382', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/65eb3bf7-061a-415d-a92a-bd489bff2f40.jpg', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (34, N'IGI', 617441576, N'https://www.igi.org/verify-your-report/?r=617441576', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4b30d13c-6283-4d20-8a98-73a1a4bbaaa6.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (35, N'IGI', 616423874, N'https://www.igi.org/verify-your-report/?r=616423874', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvNzhkMzRjYjctMTk3ZC00YjA3LTk1MzAtMzYzYzdkZDViOTRmP209YyZjdXM9U01HLWY=/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (36, N'IGI', 595302663, N'https://www.igi.org/verify-your-report/?r=595302663', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV327-472A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (37, N'IGI', 598303567, N'https://www.igi.org/verify-your-report/?r=598303567', N'https://v360.in/V360Images.aspx?cid=vd&d=KG316-491A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (38, N'IGI', 621483302, N'https://www.igi.org/verify-your-report/?r=621483302', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV354-655A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (39, N'IGI', 626479809, N'https://www.igi.org/verify-your-report/?r=626479809', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP12-420', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (40, N'IGI', 592360337, N'https://www.igi.org/verify-your-report/?r=592360337', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ca3f7377-0eb9-442d-9dbb-8595209290b4.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 2)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (41, N'GIA', 6462277426, N'https://www.gia.edu/report-check?reportno=6462277426', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R42574/still.jpg', 5.3, N'Excellent', 18, 11, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (42, N'IGI', 625435620, N'https://www.igi.org/verify-your-report/?r=625435620', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/868d7ad3-4e05-4ba9-a76b-0742759e7dcc.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (43, N'IGI', 625435622, N'https://www.igi.org/verify-your-report/?r=625435622', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/dbae6690-9d8f-4123-809c-bf8111bc1222.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (44, N'IGI', 561296521, N'https://www.igi.org/verify-your-report/?r=561296521', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwMTIzMTAxMC1SQS0yMDItMDQvZ2VtMzYwLTE5MDEyMzEwMTAtUkEtMjAyLTA0Lmh0bWwtZg==/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (45, N'IGI', 589394516, N'https://www.igi.org/verify-your-report/?r=589394516', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTkwODIzMTEyNy1SQS00MjEtMzg0L2dlbTM2MC0xOTA4MjMxMTI3LVJBLTQyMS0zODQuaHRtbC1m/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (46, N'IGI', 591351839, N'https://www.igi.org/verify-your-report/?r=591351839', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV331-70A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (47, N'IGI', 598356702, N'https://www.igi.org/verify-your-report/?r=598356702', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598356702', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (48, N'IGI', 598394159, N'https://www.igi.org/verify-your-report/?r=598394159', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598394159', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (49, N'IGI', 625427812, N'https://www.igi.org/verify-your-report/?r=625427812', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP30-636', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (50, N'IGI', 633428104, N'https://www.igi.org/verify-your-report/?r=633428104', N'https://www.diamond360.co.in/imaged/B23289/still.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (51, N'IGI', 624413790, N'https://www.igi.org/verify-your-report/?r=624413790', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30d8d43f-7a76-40c2-8b31-47036e9b67e6.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (52, N'IGI', 625435623, N'https://www.igi.org/verify-your-report/?r=625435623', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7a4fca2d-3a7e-4c4c-b86b-77e65367fb1c.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (53, N'IGI', 627428471, N'https://www.igi.org/verify-your-report/?r=627428471', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Heart.jpg?v=1702020829', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (54, N'IGI', 591351503, N'https://www.igi.org/verify-your-report/?r=591351503', N'https://ds-360.jaykar.co.in/Ds360/DMV324-19A/Still.JPG', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (55, N'IGI', 596349277, N'https://www.igi.org/verify-your-report/?r=596349277', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-737A', 1.01, N'Good', 18, 10, N'Excellent', N'Very Good', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (56, N'IGI', 598393883, N'https://www.igi.org/verify-your-report/?r=598393883', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598393883', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (57, N'IGI', 598393884, N'https://www.igi.org/verify-your-report/?r=598393884', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598393884', 1.01, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (58, N'IGI', 598394261, N'https://www.igi.org/verify-your-report/?r=598394261', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598394261', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (59, N'IGI', 620463130, N'https://www.igi.org/verify-your-report/?r=620463130', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV397-860A', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (60, N'IGI', 620421919, N'https://www.igi.org/verify-your-report/?r=620421919', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421919', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 3)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (61, N'IGI', 635411485, N'https://www.igi.org/verify-your-report/?r=635411485', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9fc38b7a-4183-424e-b903-268a84468ba8.jpg', 0.5, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (62, N'IGI', 621444766, N'https://www.igi.org/verify-your-report/?r=621444766', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444766', 0.72, N'Excellent', 18, 10, N'Good', N'Very Good', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (63, N'IGI', 635419335, N'https://www.igi.org/verify-your-report/?r=635419335', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30173e7f-71e0-427a-bfdb-516493d49ec3.jpg', 0.91, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (64, N'IGI', 618402115, N'https://www.igi.org/verify-your-report/?r=618402115', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=618402115', 0.94, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (65, N'IGI', 622477843, N'https://www.igi.org/verify-your-report/?r=622477843', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ccd4d5eb-53a6-449f-ae90-a91eca915ebf.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (66, N'IGI', 624432989, N'https://www.igi.org/verify-your-report/?r=624432989', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/83b83496-6dab-47e6-bcde-ed62cbfd35e0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (67, N'IGI', 598340263, N'https://www.igi.org/verify-your-report/?r=598340263', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/e167cfee-003b-4723-ad64-86fc7956a29a.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (68, N'IGI', 634473966, N'https://www.igi.org/verify-your-report/?r=634473966', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/d40bcacf-e951-45ef-b36a-c85b6a7a4f45.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (69, N'IGI', 611379265, N'https://www.igi.org/verify-your-report/?r=611379265', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/bf531274-d326-4d66-b47a-9ab691b907f1.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (70, N'IGI', 616497765, N'https://www.igi.org/verify-your-report/?r=616497765', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=616497765', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (71, N'IGI', 627454156, N'https://www.igi.org/verify-your-report/?r=627454156', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV478-330A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (72, N'IGI', 627454164, N'https://www.igi.org/verify-your-report/?r=627454164', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP37-212', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (73, N'IGI', 633405712, N'https://www.igi.org/verify-your-report/?r=633405712', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/210d94a3-bcb0-4e44-805b-f878f14a7742.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (74, N'IGI', 625491361, N'https://www.igi.org/verify-your-report/?r=625491361', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/40c50a8b-75cd-4e5a-89f1-62a33dc546c3.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (75, N'IGI', 625445703, N'https://www.igi.org/verify-your-report/?r=625445703', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5ba19b66-1538-42b4-ae40-01abbe5dd898.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (76, N'IGI', 636476309, N'https://www.igi.org/verify-your-report/?r=636476309', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7ab33a05-89b8-495b-a487-889174bd54de.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (77, N'IGI', 627461604, N'https://www.igi.org/verify-your-report/?r=627461604', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4ffef725-58d1-4c81-844e-3841dd11aa41.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (78, N'IGI', 630448398, N'https://www.igi.org/verify-your-report/?r=630448398', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/09c5b095-d7db-46b2-bbdf-0b34c27c0c5a.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (79, N'IGI', 591351447, N'https://www.igi.org/verify-your-report/?r=591351447', N'https://cdn.shopify.com/s/files/1/0757/8851/7659/files/Pear_fd8332bf-627b-4981-9cac-7f6b0b600b47.jpg?v=1702020829', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (80, N'IGI', 600343619, N'https://www.igi.org/verify-your-report/?r=600343619', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/6a6dee34-1b7f-423b-a093-278b4f5049c4.jpg', 1.02, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 4)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (81, N'IGI', 618408894, N'https://www.igi.org/verify-your-report/?r=618408894', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5f245848-e0b9-4c74-9f22-377683daaad2.jpg', 0.52, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (82, N'IGI', 634473523, N'https://www.igi.org/verify-your-report/?r=634473523', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/b2c0cfa9-fe3d-4ad8-9f12-072048b1b4c7.jpg', 0.53, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (83, N'IGI', 634473608, N'https://www.igi.org/verify-your-report/?r=634473608', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5989d831-d34b-47fa-baec-7a5abb77167f.jpg', 0.56, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (84, N'IGI', 631412469, N'https://www.igi.org/verify-your-report/?r=631412469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2f4774c8-97c8-423f-80ff-b26d98c579c3.jpg', 0.61, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (85, N'IGI', 621444880, N'https://www.igi.org/verify-your-report/?r=621444880', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444880', 0.7, N'Excellent', 18, 10, N'Very Good', N'Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (86, N'IGI', 621484034, N'https://www.igi.org/verify-your-report/?r=621484034', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484034', 0.7, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (87, N'IGI', 622462748, N'https://www.igi.org/verify-your-report/?r=622462748', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462748', 0.7, N'Very Good', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (88, N'IGI', 621444976, N'https://www.igi.org/verify-your-report/?r=621444976', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444976', 0.71, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (89, N'IGI', 621484139, N'https://www.igi.org/verify-your-report/?r=621484139', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484139', 0.71, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (90, N'IGI', 621484869, N'https://www.igi.org/verify-your-report/?r=621484869', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484869', 0.71, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (91, N'IGI', 621444713, N'https://www.igi.org/verify-your-report/?r=621444713', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621444713', 0.72, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (92, N'IGI', 621484090, N'https://www.igi.org/verify-your-report/?r=621484090', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484090', 0.72, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (93, N'IGI', 621484180, N'https://www.igi.org/verify-your-report/?r=621484180', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484180', 0.72, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (94, N'IGI', 622462722, N'https://www.igi.org/verify-your-report/?r=622462722', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462722', 0.72, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (95, N'IGI', 621484171, N'https://www.igi.org/verify-your-report/?r=621484171', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484171', 0.73, N'Excellent', 18, 10, N'Very Good', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (96, N'IGI', 622462785, N'https://www.igi.org/verify-your-report/?r=622462785', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=622462785', 0.73, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (97, N'IGI', 621484905, N'https://www.igi.org/verify-your-report/?r=621484905', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484905', 0.74, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (98, N'IGI', 627489857, N'https://www.igi.org/verify-your-report/?r=627489857', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV495-370A', 0.74, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (99, N'IGI', 621484005, N'https://www.igi.org/verify-your-report/?r=621484005', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484005', 0.75, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 5)
GO
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (100, N'IGI', 621484041, N'https://www.igi.org/verify-your-report/?r=621484041', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=621484041', 0.75, N'Very Good', 18, 10, N'Very Good', N'Excellent', N'None', 1, 5)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (101, N'IGI', 601322432, N'https://www.igi.org/verify-your-report/?r=601322432', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322432', 0.96, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (102, N'IGI', 624433053, N'https://www.igi.org/verify-your-report/?r=624433053', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3285c554-3234-464f-a18a-3a4743ce9856.jpg', 0.97, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (103, N'IGI', 624433054, N'https://www.igi.org/verify-your-report/?r=624433054', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c93045cd-5eb2-4e52-8840-0ea37dc47419.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (104, N'IGI', 602301951, N'https://www.igi.org/verify-your-report/?r=602301951', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=602301951', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (105, N'IGI', 598394553, N'https://www.igi.org/verify-your-report/?r=598394553', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV339-466A', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (106, N'IGI', 620421921, N'https://www.igi.org/verify-your-report/?r=620421921', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421921', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (107, N'IGI', 620421945, N'https://www.igi.org/verify-your-report/?r=620421945', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=620421945', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (108, N'IGI', 625445698, N'https://www.igi.org/verify-your-report/?r=625445698', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/7e7462f4-c0ba-4fbe-ae1e-68746ce8a176.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (109, N'IGI', 600397986, N'https://www.igi.org/verify-your-report/?r=600397986', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMTU3YWYxZDAtMmY3MC00MzkzLWI3YzItYjM4MTBlMTA1ODhlP209YyZjdXM9U01HLWY=/0.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (110, N'IGI', 601322007, N'https://www.igi.org/verify-your-report/?r=601322007', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322007', 1.01, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (111, N'IGI', 602316890, N'https://www.igi.org/verify-your-report/?r=602316890', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMGY2ZGVmOWUtZTgwNy00YzliLWJmMmMtZGUwNmI0ODQ5ZDdmP209YyZjdXM9U01HLWY=/0.jpg', 1.02, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (112, N'IGI', 598394389, N'https://www.igi.org/verify-your-report/?r=598394389', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-44A', 1.02, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (113, N'IGI', 601322542, N'https://www.igi.org/verify-your-report/?r=601322542', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322542', 1.03, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (114, N'IGI', 601322549, N'https://www.igi.org/verify-your-report/?r=601322549', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=601322549', 1.03, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (115, N'IGI', 625433469, N'https://www.igi.org/verify-your-report/?r=625433469', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1cec1f62-c38e-4a83-a4f6-e87e0f32ff97.jpg', 1.04, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (116, N'IGI', 591350749, N'https://www.igi.org/verify-your-report/?r=591350749', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV333-591A', 1.05, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (117, N'IGI', 626476954, N'https://www.igi.org/verify-your-report/?r=626476954', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/30a6233d-a8c4-4c6b-bc04-810a25910eb7.jpg', 1.35, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (118, N'IGI', 627406174, N'https://www.igi.org/verify-your-report/?r=627406174', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9847be04-4fa7-42bf-bc81-454e1a682fa2.jpg', 1.42, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (119, N'IGI', 627408762, N'https://www.igi.org/verify-your-report/?r=627408762', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/00b5d85b-a453-436f-8437-67981ea8ccc7.jpg', 1.45, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (120, N'IGI', 598394110, N'https://www.igi.org/verify-your-report/?r=598394110', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=598394110', 1.51, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 6)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (121, N'IGI', 636476322, N'https://www.igi.org/verify-your-report/?r=636476322', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/26499d61-93f2-4a5d-a3a4-baf7fa39edc0.jpg', 0.54, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (122, N'IGI', 618401132, N'https://www.igi.org/verify-your-report/?r=618401132', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV372-168A', 0.55, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (123, N'IGI', 631409041, N'https://www.igi.org/verify-your-report/?r=631409041', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/27dc257d-5e7c-418a-bfa3-7c5ead477326.jpg', 0.7, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (124, N'IGI', 629438666, N'https://www.igi.org/verify-your-report/?r=629438666', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/704069c9-1f27-4232-9004-51074182df32.jpg', 0.73, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (125, N'IGI', 618409592, N'https://www.igi.org/verify-your-report/?r=618409592', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/947a4663-e77b-4b85-8d2f-8e95f6e988ab.jpg', 0.76, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (126, N'IGI', 610326888, N'https://www.igi.org/verify-your-report/?r=610326888', N'https://v360.in/V360Images.aspx?cid=vd&d=610326888', 0.76, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (127, N'IGI', 583399008, N'https://www.igi.org/verify-your-report/?r=583399008', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9019604a-9146-4513-9f7f-6f2766a773ce.jpg', 0.77, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (128, N'IGI', 633465409, N'https://www.igi.org/verify-your-report/?r=633465409', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4020039e-46b4-4060-ad91-04dae562cffb.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (129, N'IGI', 613380447, N'https://www.igi.org/verify-your-report/?r=613380447', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ef835aee-a500-4fab-992b-02e7981f9a50.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (130, N'IGI', 567358132, N'https://www.igi.org/verify-your-report/?r=567358132', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92aWV3LmdlbTM2MC5pbi9nZW0zNjAvMTUwMzIzMDYyMC1BLTE5MC00MzcvZ2VtMzYwLTE1MDMyMzA2MjAtQS0xOTAtNDM3Lmh0bWwtZg==/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (131, N'IGI', 541250376, N'https://www.igi.org/verify-your-report/?r=541250376', N'https://v360.in/V360Images.aspx?cid=vd&d=GG221-263A', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (132, N'IGI', 555264994, N'https://www.igi.org/verify-your-report/?r=555264994', N'https://v360.in/V360Images.aspx?cid=vd&d=DM393-12A', 1, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (133, N'IGI', 591351333, N'https://www.igi.org/verify-your-report/?r=591351333', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-889A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (134, N'IGI', 591351343, N'https://www.igi.org/verify-your-report/?r=591351343', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-733A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (135, N'IGI', 591351411, N'https://www.igi.org/verify-your-report/?r=591351411', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV334-557A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (136, N'IGI', 591351559, N'https://www.igi.org/verify-your-report/?r=591351559', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-383A', 1, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (137, N'IGI', 591350887, N'https://www.igi.org/verify-your-report/?r=591350887', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-113A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (138, N'IGI', 591345717, N'https://www.igi.org/verify-your-report/?r=591345717', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV324-523A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (139, N'IGI', 593304404, N'https://www.igi.org/verify-your-report/?r=593304404', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-781A', 1, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (140, N'IGI', 593304407, N'https://www.igi.org/verify-your-report/?r=593304407', N'https://v360.in/V360Images.aspx?cid=vd&d=DMV335-188A', 1, N'Excellent', 18, 10, N'Excellent', N'Very Good', N'None', 1, 7)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (141, N'IGI', 636491493, N'https://www.igi.org/verify-your-report/?r=636491493', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/00040ebf-68b3-4d92-b2d4-696ac7db38a0.jpg', 0.53, N'Excellent', 18, 10, N'Very Good', N'Very Good', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (142, N'IGI', 628415289, N'https://www.igi.org/verify-your-report/?r=628415289', N'https://v360.in/V360Images.aspx?cid=vd&d=CD121-422A', 0.55, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (143, N'IGI', 627456359, N'https://www.igi.org/verify-your-report/?r=627456359', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/9912c9ae-f8b9-4d3a-8cc3-73cf90d37ff7.jpg', 0.76, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (144, N'IGI', 623422664, N'https://www.igi.org/verify-your-report/?r=623422664', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/ecd2f196-07ae-470a-b810-3f68159dda2e.jpg', 0.78, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (145, N'IGI', 627489235, N'https://www.igi.org/verify-your-report/?r=627489235', N'https://v360.in/V360Images.aspx?cid=vd&d=LLP12-320', 0.78, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (146, N'IGI', 627409078, N'https://www.igi.org/verify-your-report/?r=627409078', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/557fb28a-0d02-4447-8817-16f83426d538.jpg', 0.79, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (147, N'IGI', 615345308, N'https://www.igi.org/verify-your-report/?r=615345308', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/0852a50e-ad5e-49e2-8fe8-cd94ecc8b48a.jpg', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (148, N'IGI', 633465410, N'https://www.igi.org/verify-your-report/?r=633465410', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/267bfcc6-92a4-4034-9b6d-ad2ad02f7e38.jpg', 0.93, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (149, N'IGI', 634473609, N'https://www.igi.org/verify-your-report/?r=634473609', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3c752434-9889-484c-a4f7-7f3f4b65b503.jpg', 0.93, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (150, N'IGI', 621413518, N'https://www.igi.org/verify-your-report/?r=621413518', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/473453e5-beb6-48e1-8ad4-1b0b784ed0e0.jpg', 0.93, N'Very Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (151, N'IGI', 626430836, N'https://www.igi.org/verify-your-report/?r=626430836', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/3ec7a5d3-471e-46e2-aa43-483e64b10a5b.jpg', 0.94, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (152, N'IGI', 625421772, N'https://www.igi.org/verify-your-report/?r=625421772', N'https://dimdna.azureedge.net/hdfile/HD/imaged/ES-AA-31470/still.jpg', 0.96, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (153, N'IGI', 623414023, N'https://www.igi.org/verify-your-report/?r=623414023', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/809b5bc8-6d68-4779-bcee-eb922e98f6ca.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (154, N'IGI', 631429217, N'https://www.igi.org/verify-your-report/?r=631429217', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2a33555a-bd0d-4140-bf11-87b5f141b42d.jpg', 0.98, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (155, N'IGI', 628462549, N'https://www.igi.org/verify-your-report/?r=628462549', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/2be2110f-84b6-49c9-b468-7629913e841b.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (156, N'IGI', 633430832, N'https://www.igi.org/verify-your-report/?r=633430832', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c8165605-d252-4f87-9b8f-5890fabc5547.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (157, N'IGI', 584360586, N'https://www.igi.org/verify-your-report/?r=584360586', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL3UvMGY5YTc5NDctZmU2OC00OTNlLTk4ZjItMDhjZDI3M2M5MzA1P209YyZjdXM9U01HLWY=/0.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (158, N'IGI', 627471789, N'https://www.igi.org/verify-your-report/?r=627471789', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/c2133b7f-48ff-4f51-b468-55eb6d1b1b11.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (159, N'IGI', 583303556, N'https://www.igi.org/verify-your-report/?r=583303556', N'https://v360.in/V360Images.aspx?cid=vd&d=KG234-196A', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (160, N'IGI', 623466846, N'https://www.igi.org/verify-your-report/?r=623466846', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=623466846', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 8)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (161, N'IGI', 517286121, N'https://www.igi.org/verify-your-report/?r=517286121', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/1f92e504-cc21-4b06-9a72-098cb7ca0cd7.jpg', 1.01, N'Excellent', 18, 2, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (162, N'IGI', 627423146, N'https://www.igi.org/verify-your-report/?r=627423146', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/4e161da9-e0d9-4aa5-b5cc-b852fc57e1b2.jpg', 0.81, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (163, N'IGI', 634491844, N'https://www.igi.org/verify-your-report/?r=634491844', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/8e561015-edb5-4031-9e24-f6074e397b26.jpg', 0.83, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (164, N'IGI', 604397084, N'https://www.igi.org/verify-your-report/?r=604397084', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119558/still.jpg', 1, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (165, N'IGI', 620452326, N'https://www.igi.org/verify-your-report/?r=620452326', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10103B/still.jpg', 1, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (166, N'IGI', 627425727, N'https://www.igi.org/verify-your-report/?r=627425727', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f6709477-2ed7-4a1e-b9e0-cc890cca5f57.jpg', 1.01, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (167, N'IGI', 602378981, N'https://www.igi.org/verify-your-report/?r=602378981', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/434588de-36f6-4e41-a1e3-5b49eda91e31.jpg', 1.02, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (168, N'IGI', 606361854, N'https://www.igi.org/verify-your-report/?r=606361854', N'https://v360.diamonds/c/72c0cf42-7370-4210-92b0-c1bc7d27ef4b?m=t&a=606361854', 1.03, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (169, N'IGI', 627461450, N'https://www.igi.org/verify-your-report/?r=627461450', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/5c507110-ef52-474b-8316-d5886dd86e2b.jpg', 1.04, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (170, N'IGI', 591341230, N'https://www.igi.org/verify-your-report/?r=591341230', N'https://nivoda-images.s3.amazonaws.com/aHR0cHM6Ly92MzYwLmRpYW1vbmRzL2MvNzJjMGNmNDItNzM3MC00MjEwLTkyYjAtYzFiYzdkMjdlZjRiP209ZCZhPTU5MTM0MTIzMC1m/0.jpg', 1.05, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (171, N'IGI', 625439413, N'https://www.igi.org/verify-your-report/?r=625439413', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10210AI/still.jpg', 1.05, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (172, N'IGI', 636496143, N'https://www.igi.org/verify-your-report/?r=636496143', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/310f9275-55a1-4425-b231-036c6e678bf7.jpg', 1.07, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (173, N'IGI', 636476310, N'https://www.igi.org/verify-your-report/?r=636476310', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f7212361-0630-45c5-adea-b5260e71e49f.jpg', 1.08, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (174, N'IGI', 615345211, N'https://www.igi.org/verify-your-report/?r=615345211', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/R969174/still.jpg', 1.08, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (175, N'IGI', 605360228, N'https://www.igi.org/verify-your-report/?r=605360228', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/J3119570/still.jpg', 1.09, N'Good', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (176, N'IGI', 619443059, N'https://www.igi.org/verify-your-report/?r=619443059', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/VD10103A/still.jpg', 1.12, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (177, N'IGI', 631459778, N'https://www.igi.org/verify-your-report/?r=631459778', N'https://dr8ye45d8423r.cloudfront.net/v360/imaged/JL10309A/still.jpg', 1.48, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (178, N'IGI', 627415767, N'https://www.igi.org/verify-your-report/?r=627415767', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/928d41ab-c455-4351-94d0-a6aef59963f1.jpg', 1.52, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (179, N'IGI', 635486409, N'https://www.igi.org/verify-your-report/?r=635486409', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/d03c42a0-17e4-4cf0-9e78-133f31fe2684.jpg', 1.53, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (180, N'IGI', 632400635, N'https://www.igi.org/verify-your-report/?r=632400635', N'https://nivoda-images.s3.eu-west-2.amazonaws.com/f0e8b000-f248-41a5-a0c4-9662b36f23ca.jpg', 1.53, N'Excellent', 18, 10, N'Excellent', N'Excellent', N'None', 1, 9)
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
INSERT [dbo].[diamond] ([diamond_id], [lab], [certificate_number], [certificate_url], [image_url], [carat], [cut], [color], [clarity], [polish], [symmetry], [fluorescence], [availability], [shape_id]) VALUES (200, N'IGI', 529258404, N'https://www.igi.org/verify-your-report/?r=529258404', N'https://v360.in/V360Images.aspx?cid=vd&d=KG131-24A', 1.54, N'Good', 18, 5, N'Excellent', N'Excellent', N'None', 1, 10)
SET IDENTITY_INSERT [dbo].[diamond] OFF
GO
SET IDENTITY_INSERT [dbo].[diamond_price] ON 

INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1, CAST(N'2024-06-11T20:23:37.6235981' AS DateTime2), 0, 0.3999, N'D', N'FL', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (2, CAST(N'2024-06-11T20:23:37.6550470' AS DateTime2), 0, 0.3999, N'D', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (3, CAST(N'2024-06-11T20:23:37.6551897' AS DateTime2), 0, 0.3999, N'D', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (4, CAST(N'2024-06-11T20:23:37.6552540' AS DateTime2), 0, 0.3999, N'D', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (5, CAST(N'2024-06-11T20:23:37.6553222' AS DateTime2), 0, 0.3999, N'D', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (6, CAST(N'2024-06-11T20:23:37.6553822' AS DateTime2), 0, 0.3999, N'D', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (7, CAST(N'2024-06-11T20:23:37.6554829' AS DateTime2), 0, 0.3999, N'D', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (8, CAST(N'2024-06-11T20:23:37.6555605' AS DateTime2), 0, 0.3999, N'D', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (9, CAST(N'2024-06-11T20:23:37.6556190' AS DateTime2), 0, 0.3999, N'D', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (10, CAST(N'2024-06-11T20:23:37.6556868' AS DateTime2), 0, 0.3999, N'D', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (11, CAST(N'2024-06-11T20:23:37.6557464' AS DateTime2), 0, 0.3999, N'D', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (12, CAST(N'2024-06-11T20:23:37.6558159' AS DateTime2), 0, 0.3999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (13, CAST(N'2024-06-11T20:23:37.6559034' AS DateTime2), 0, 0.3999, N'E', N'FL', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (14, CAST(N'2024-06-11T20:23:37.6559517' AS DateTime2), 0, 0.3999, N'E', N'IF', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (15, CAST(N'2024-06-11T20:23:37.6560068' AS DateTime2), 0, 0.3999, N'E', N'VVS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (16, CAST(N'2024-06-11T20:23:37.6560496' AS DateTime2), 0, 0.3999, N'E', N'VVS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (17, CAST(N'2024-06-11T20:23:37.6560881' AS DateTime2), 0, 0.3999, N'E', N'VS1', 13.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (18, CAST(N'2024-06-11T20:23:37.6561375' AS DateTime2), 0, 0.3999, N'E', N'VS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (19, CAST(N'2024-06-11T20:23:37.6561799' AS DateTime2), 0, 0.3999, N'E', N'SI1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (20, CAST(N'2024-06-11T20:23:37.6562130' AS DateTime2), 0, 0.3999, N'E', N'SI2', 10.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (21, CAST(N'2024-06-11T20:23:37.6562651' AS DateTime2), 0, 0.3999, N'E', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (22, CAST(N'2024-06-11T20:23:37.6563694' AS DateTime2), 0, 0.3999, N'E', N'I1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (23, CAST(N'2024-06-11T20:23:37.6564707' AS DateTime2), 0, 0.3999, N'E', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (24, CAST(N'2024-06-11T20:23:37.6565179' AS DateTime2), 0, 0.3999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (25, CAST(N'2024-06-11T20:23:37.6565699' AS DateTime2), 0, 0.3999, N'F', N'FL', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (26, CAST(N'2024-06-11T20:23:37.6566029' AS DateTime2), 0, 0.3999, N'F', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (27, CAST(N'2024-06-11T20:23:37.6595137' AS DateTime2), 0, 0.3999, N'F', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (28, CAST(N'2024-06-11T20:23:37.6596638' AS DateTime2), 0, 0.3999, N'F', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (29, CAST(N'2024-06-11T20:23:37.6597500' AS DateTime2), 0, 0.3999, N'F', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (30, CAST(N'2024-06-11T20:23:37.6598073' AS DateTime2), 0, 0.3999, N'F', N'VS2', 11.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (31, CAST(N'2024-06-11T20:23:37.6598982' AS DateTime2), 0, 0.3999, N'F', N'SI1', 10.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (32, CAST(N'2024-06-11T20:23:37.6599646' AS DateTime2), 0, 0.3999, N'F', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (33, CAST(N'2024-06-11T20:23:37.6600155' AS DateTime2), 0, 0.3999, N'F', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (34, CAST(N'2024-06-11T20:23:37.6600609' AS DateTime2), 0, 0.3999, N'F', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (35, CAST(N'2024-06-11T20:23:37.6601073' AS DateTime2), 0, 0.3999, N'F', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (36, CAST(N'2024-06-11T20:23:37.6601529' AS DateTime2), 0, 0.3999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (37, CAST(N'2024-06-11T20:23:37.6602949' AS DateTime2), 0, 0.3999, N'G', N'FL', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (38, CAST(N'2024-06-11T20:23:37.6604333' AS DateTime2), 0, 0.3999, N'G', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (39, CAST(N'2024-06-11T20:23:37.6605662' AS DateTime2), 0, 0.3999, N'G', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (40, CAST(N'2024-06-11T20:23:37.6607174' AS DateTime2), 0, 0.3999, N'G', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (41, CAST(N'2024-06-11T20:23:37.6609464' AS DateTime2), 0, 0.3999, N'G', N'VS1', 11.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (42, CAST(N'2024-06-11T20:23:37.6610403' AS DateTime2), 0, 0.3999, N'G', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (43, CAST(N'2024-06-11T20:23:37.6611561' AS DateTime2), 0, 0.3999, N'G', N'SI1', 10.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (44, CAST(N'2024-06-11T20:23:37.6612720' AS DateTime2), 0, 0.3999, N'G', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (45, CAST(N'2024-06-11T20:23:37.6613735' AS DateTime2), 0, 0.3999, N'G', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (46, CAST(N'2024-06-11T20:23:37.6614666' AS DateTime2), 0, 0.3999, N'G', N'I1', 6.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (47, CAST(N'2024-06-11T20:23:37.6615595' AS DateTime2), 0, 0.3999, N'G', N'I2', 6.3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (48, CAST(N'2024-06-11T20:23:37.6616665' AS DateTime2), 0, 0.3999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (49, CAST(N'2024-06-11T20:23:37.6620955' AS DateTime2), 0, 0.3999, N'H', N'FL', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (50, CAST(N'2024-06-11T20:23:37.6622290' AS DateTime2), 0, 0.3999, N'H', N'IF', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (51, CAST(N'2024-06-11T20:23:37.6622886' AS DateTime2), 0, 0.3999, N'H', N'VVS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (52, CAST(N'2024-06-11T20:23:37.6623359' AS DateTime2), 0, 0.3999, N'H', N'VVS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (53, CAST(N'2024-06-11T20:23:37.6623819' AS DateTime2), 0, 0.3999, N'H', N'VS1', 9.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (54, CAST(N'2024-06-11T20:23:37.6624912' AS DateTime2), 0, 0.3999, N'H', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (55, CAST(N'2024-06-11T20:23:37.6630447' AS DateTime2), 0, 0.3999, N'H', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (56, CAST(N'2024-06-11T20:23:37.6632129' AS DateTime2), 0, 0.3999, N'H', N'SI2', 7.6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (57, CAST(N'2024-06-11T20:23:37.6632573' AS DateTime2), 0, 0.3999, N'H', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (58, CAST(N'2024-06-11T20:23:37.6633105' AS DateTime2), 0, 0.3999, N'H', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (59, CAST(N'2024-06-11T20:23:37.6633964' AS DateTime2), 0, 0.3999, N'H', N'I2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (60, CAST(N'2024-06-11T20:23:37.6634623' AS DateTime2), 0, 0.3999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (61, CAST(N'2024-06-11T20:23:37.6635179' AS DateTime2), 0, 0.3999, N'I', N'FL', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (62, CAST(N'2024-06-11T20:23:37.6635652' AS DateTime2), 0, 0.3999, N'I', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (63, CAST(N'2024-06-11T20:23:37.6635957' AS DateTime2), 0, 0.3999, N'I', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (64, CAST(N'2024-06-11T20:23:37.6636174' AS DateTime2), 0, 0.3999, N'I', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (65, CAST(N'2024-06-11T20:23:37.6636373' AS DateTime2), 0, 0.3999, N'I', N'VS1', 8.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (66, CAST(N'2024-06-11T20:23:37.6636765' AS DateTime2), 0, 0.3999, N'I', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (67, CAST(N'2024-06-11T20:23:37.6636985' AS DateTime2), 0, 0.3999, N'I', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (68, CAST(N'2024-06-11T20:23:37.6637179' AS DateTime2), 0, 0.3999, N'I', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (69, CAST(N'2024-06-11T20:23:37.6637371' AS DateTime2), 0, 0.3999, N'I', N'SI3', 5.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (70, CAST(N'2024-06-11T20:23:37.6637564' AS DateTime2), 0, 0.3999, N'I', N'I1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (71, CAST(N'2024-06-11T20:23:37.6637816' AS DateTime2), 0, 0.3999, N'I', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (72, CAST(N'2024-06-11T20:23:37.6638006' AS DateTime2), 0, 0.3999, N'I', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (73, CAST(N'2024-06-11T20:23:37.6638210' AS DateTime2), 0, 0.3999, N'J', N'FL', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (74, CAST(N'2024-06-11T20:23:37.6638396' AS DateTime2), 0, 0.3999, N'J', N'IF', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (75, CAST(N'2024-06-11T20:23:37.6638578' AS DateTime2), 0, 0.3999, N'J', N'VVS1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (76, CAST(N'2024-06-11T20:23:37.6638805' AS DateTime2), 0, 0.3999, N'J', N'VVS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (77, CAST(N'2024-06-11T20:23:37.6639008' AS DateTime2), 0, 0.3999, N'J', N'VS1', 7.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (78, CAST(N'2024-06-11T20:23:37.6639291' AS DateTime2), 0, 0.3999, N'J', N'VS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (79, CAST(N'2024-06-11T20:23:37.6639743' AS DateTime2), 0, 0.3999, N'J', N'SI1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (80, CAST(N'2024-06-11T20:23:37.6641382' AS DateTime2), 0, 0.3999, N'J', N'SI2', 6.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (81, CAST(N'2024-06-11T20:23:37.6642861' AS DateTime2), 0, 0.3999, N'J', N'SI3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (82, CAST(N'2024-06-11T20:23:37.6643315' AS DateTime2), 0, 0.3999, N'J', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (83, CAST(N'2024-06-11T20:23:37.6643739' AS DateTime2), 0, 0.3999, N'J', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (84, CAST(N'2024-06-11T20:23:37.6644069' AS DateTime2), 0, 0.3999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (85, CAST(N'2024-06-11T20:23:37.6645735' AS DateTime2), 0, 0.3999, N'K', N'FL', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (86, CAST(N'2024-06-11T20:23:37.6646689' AS DateTime2), 0, 0.3999, N'K', N'IF', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (87, CAST(N'2024-06-11T20:23:37.6647365' AS DateTime2), 0, 0.3999, N'K', N'VVS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (88, CAST(N'2024-06-11T20:23:37.6647761' AS DateTime2), 0, 0.3999, N'K', N'VVS2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (89, CAST(N'2024-06-11T20:23:37.6648121' AS DateTime2), 0, 0.3999, N'K', N'VS1', 7.4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (90, CAST(N'2024-06-11T20:23:37.6648976' AS DateTime2), 0, 0.3999, N'K', N'VS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (91, CAST(N'2024-06-11T20:23:37.6650053' AS DateTime2), 0, 0.3999, N'K', N'SI1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (92, CAST(N'2024-06-11T20:23:37.6650671' AS DateTime2), 0, 0.3999, N'K', N'SI2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (93, CAST(N'2024-06-11T20:23:37.6651197' AS DateTime2), 0, 0.3999, N'K', N'SI3', 4.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (94, CAST(N'2024-06-11T20:23:37.6651694' AS DateTime2), 0, 0.3999, N'K', N'I1', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (95, CAST(N'2024-06-11T20:23:37.6652811' AS DateTime2), 0, 0.3999, N'K', N'I2', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (96, CAST(N'2024-06-11T20:23:37.6653279' AS DateTime2), 0, 0.3999, N'K', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (97, CAST(N'2024-06-11T20:23:37.6653940' AS DateTime2), 0, 0.3999, N'L', N'FL', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (98, CAST(N'2024-06-11T20:23:37.6654518' AS DateTime2), 0, 0.3999, N'L', N'IF', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (99, CAST(N'2024-06-11T20:23:37.6654851' AS DateTime2), 0, 0.3999, N'L', N'VVS1', 8)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (100, CAST(N'2024-06-11T20:23:37.6655302' AS DateTime2), 0, 0.3999, N'L', N'VVS2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (101, CAST(N'2024-06-11T20:23:37.6655758' AS DateTime2), 0, 0.3999, N'L', N'VS1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (102, CAST(N'2024-06-11T20:23:37.6656111' AS DateTime2), 0, 0.3999, N'L', N'VS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (103, CAST(N'2024-06-11T20:23:37.6656400' AS DateTime2), 0, 0.3999, N'L', N'SI1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (104, CAST(N'2024-06-11T20:23:37.6656764' AS DateTime2), 0, 0.3999, N'L', N'SI2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (105, CAST(N'2024-06-11T20:23:37.6657139' AS DateTime2), 0, 0.3999, N'L', N'SI3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (106, CAST(N'2024-06-11T20:23:37.6658145' AS DateTime2), 0, 0.3999, N'L', N'I1', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (107, CAST(N'2024-06-11T20:23:37.6658688' AS DateTime2), 0, 0.3999, N'L', N'I2', 2.7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (108, CAST(N'2024-06-11T20:23:37.6659466' AS DateTime2), 0, 0.3999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (109, CAST(N'2024-06-11T20:23:37.6659953' AS DateTime2), 0, 0.3999, N'M', N'FL', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (110, CAST(N'2024-06-11T20:23:37.6660312' AS DateTime2), 0, 0.3999, N'M', N'IF', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (111, CAST(N'2024-06-11T20:23:37.6660695' AS DateTime2), 0, 0.3999, N'M', N'VVS1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (112, CAST(N'2024-06-11T20:23:37.6660987' AS DateTime2), 0, 0.3999, N'M', N'VVS2', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (113, CAST(N'2024-06-11T20:23:37.6661255' AS DateTime2), 0, 0.3999, N'M', N'VS1', 5.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (114, CAST(N'2024-06-11T20:23:37.6661528' AS DateTime2), 0, 0.3999, N'M', N'VS2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (115, CAST(N'2024-06-11T20:23:37.6662043' AS DateTime2), 0, 0.3999, N'M', N'SI1', 4.8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (116, CAST(N'2024-06-11T20:23:37.6662591' AS DateTime2), 0, 0.3999, N'M', N'SI2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (117, CAST(N'2024-06-11T20:23:37.6663070' AS DateTime2), 0, 0.3999, N'M', N'SI3', 3.1)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (118, CAST(N'2024-06-11T20:23:37.6663871' AS DateTime2), 0, 0.3999, N'M', N'I1', 2.5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (119, CAST(N'2024-06-11T20:23:37.6664735' AS DateTime2), 0, 0.3999, N'M', N'I2', 2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (120, CAST(N'2024-06-11T20:23:37.6665482' AS DateTime2), 0, 0.3999, N'M', N'I3', 1.2)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (121, CAST(N'2024-06-11T20:23:37.9255344' AS DateTime2), 0.4, 0.4999, N'D', N'FL', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (122, CAST(N'2024-06-11T20:23:37.9257039' AS DateTime2), 0.4, 0.4999, N'D', N'IF', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (123, CAST(N'2024-06-11T20:23:37.9257644' AS DateTime2), 0.4, 0.4999, N'D', N'VVS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (124, CAST(N'2024-06-11T20:23:37.9258070' AS DateTime2), 0.4, 0.4999, N'D', N'VVS2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (125, CAST(N'2024-06-11T20:23:37.9258627' AS DateTime2), 0.4, 0.4999, N'D', N'VS1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (126, CAST(N'2024-06-11T20:23:37.9262937' AS DateTime2), 0.4, 0.4999, N'D', N'VS2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (127, CAST(N'2024-06-11T20:23:37.9266486' AS DateTime2), 0.4, 0.4999, N'D', N'SI1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (128, CAST(N'2024-06-11T20:23:37.9267352' AS DateTime2), 0.4, 0.4999, N'D', N'SI2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (129, CAST(N'2024-06-11T20:23:37.9267950' AS DateTime2), 0.4, 0.4999, N'D', N'SI3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (130, CAST(N'2024-06-11T20:23:37.9268679' AS DateTime2), 0.4, 0.4999, N'D', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (131, CAST(N'2024-06-11T20:23:37.9269278' AS DateTime2), 0.4, 0.4999, N'D', N'I2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (132, CAST(N'2024-06-11T20:23:37.9269864' AS DateTime2), 0.4, 0.4999, N'D', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (133, CAST(N'2024-06-11T20:23:37.9270504' AS DateTime2), 0.4, 0.4999, N'E', N'FL', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (134, CAST(N'2024-06-11T20:23:37.9305018' AS DateTime2), 0.4, 0.4999, N'E', N'IF', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (135, CAST(N'2024-06-11T20:23:37.9313345' AS DateTime2), 0.4, 0.4999, N'E', N'VVS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (136, CAST(N'2024-06-11T20:23:37.9315722' AS DateTime2), 0.4, 0.4999, N'E', N'VVS2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (137, CAST(N'2024-06-11T20:23:37.9316654' AS DateTime2), 0.4, 0.4999, N'E', N'VS1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (138, CAST(N'2024-06-11T20:23:37.9317197' AS DateTime2), 0.4, 0.4999, N'E', N'VS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (139, CAST(N'2024-06-11T20:23:37.9317655' AS DateTime2), 0.4, 0.4999, N'E', N'SI1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (140, CAST(N'2024-06-11T20:23:37.9318137' AS DateTime2), 0.4, 0.4999, N'E', N'SI2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (141, CAST(N'2024-06-11T20:23:37.9319777' AS DateTime2), 0.4, 0.4999, N'E', N'SI3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (142, CAST(N'2024-06-11T20:23:37.9321313' AS DateTime2), 0.4, 0.4999, N'E', N'I1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (143, CAST(N'2024-06-11T20:23:37.9324366' AS DateTime2), 0.4, 0.4999, N'E', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (144, CAST(N'2024-06-11T20:23:37.9329618' AS DateTime2), 0.4, 0.4999, N'E', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (145, CAST(N'2024-06-11T20:23:37.9333575' AS DateTime2), 0.4, 0.4999, N'F', N'FL', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (146, CAST(N'2024-06-11T20:23:37.9336095' AS DateTime2), 0.4, 0.4999, N'F', N'IF', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (147, CAST(N'2024-06-11T20:23:37.9337470' AS DateTime2), 0.4, 0.4999, N'F', N'VVS1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (148, CAST(N'2024-06-11T20:23:37.9338429' AS DateTime2), 0.4, 0.4999, N'F', N'VVS2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (149, CAST(N'2024-06-11T20:23:37.9339336' AS DateTime2), 0.4, 0.4999, N'F', N'VS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (150, CAST(N'2024-06-11T20:23:37.9340233' AS DateTime2), 0.4, 0.4999, N'F', N'VS2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (151, CAST(N'2024-06-11T20:23:37.9341302' AS DateTime2), 0.4, 0.4999, N'F', N'SI1', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (152, CAST(N'2024-06-11T20:23:37.9349689' AS DateTime2), 0.4, 0.4999, N'F', N'SI2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (153, CAST(N'2024-06-11T20:23:37.9352771' AS DateTime2), 0.4, 0.4999, N'F', N'SI3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (154, CAST(N'2024-06-11T20:23:37.9354970' AS DateTime2), 0.4, 0.4999, N'F', N'I1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (155, CAST(N'2024-06-11T20:23:37.9360069' AS DateTime2), 0.4, 0.4999, N'F', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (156, CAST(N'2024-06-11T20:23:37.9361883' AS DateTime2), 0.4, 0.4999, N'F', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (157, CAST(N'2024-06-11T20:23:37.9362937' AS DateTime2), 0.4, 0.4999, N'G', N'FL', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (158, CAST(N'2024-06-11T20:23:37.9364149' AS DateTime2), 0.4, 0.4999, N'G', N'IF', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (159, CAST(N'2024-06-11T20:23:37.9364618' AS DateTime2), 0.4, 0.4999, N'G', N'VVS1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (160, CAST(N'2024-06-11T20:23:37.9365007' AS DateTime2), 0.4, 0.4999, N'G', N'VVS2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (161, CAST(N'2024-06-11T20:23:37.9365426' AS DateTime2), 0.4, 0.4999, N'G', N'VS1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (162, CAST(N'2024-06-11T20:23:37.9366840' AS DateTime2), 0.4, 0.4999, N'G', N'VS2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (163, CAST(N'2024-06-11T20:23:37.9368431' AS DateTime2), 0.4, 0.4999, N'G', N'SI1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (164, CAST(N'2024-06-11T20:23:37.9369131' AS DateTime2), 0.4, 0.4999, N'G', N'SI2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (165, CAST(N'2024-06-11T20:23:37.9369841' AS DateTime2), 0.4, 0.4999, N'G', N'SI3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (166, CAST(N'2024-06-11T20:23:37.9370193' AS DateTime2), 0.4, 0.4999, N'G', N'I1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (167, CAST(N'2024-06-11T20:23:37.9370690' AS DateTime2), 0.4, 0.4999, N'G', N'I2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (168, CAST(N'2024-06-11T20:23:37.9371021' AS DateTime2), 0.4, 0.4999, N'G', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (169, CAST(N'2024-06-11T20:23:37.9371385' AS DateTime2), 0.4, 0.4999, N'H', N'FL', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (170, CAST(N'2024-06-11T20:23:37.9371960' AS DateTime2), 0.4, 0.4999, N'H', N'IF', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (171, CAST(N'2024-06-11T20:23:37.9372487' AS DateTime2), 0.4, 0.4999, N'H', N'VVS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (172, CAST(N'2024-06-11T20:23:37.9372975' AS DateTime2), 0.4, 0.4999, N'H', N'VVS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (173, CAST(N'2024-06-11T20:23:37.9373422' AS DateTime2), 0.4, 0.4999, N'H', N'VS1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (174, CAST(N'2024-06-11T20:23:37.9374148' AS DateTime2), 0.4, 0.4999, N'H', N'VS2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (175, CAST(N'2024-06-11T20:23:37.9374632' AS DateTime2), 0.4, 0.4999, N'H', N'SI1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (176, CAST(N'2024-06-11T20:23:37.9375030' AS DateTime2), 0.4, 0.4999, N'H', N'SI2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (177, CAST(N'2024-06-11T20:23:37.9383128' AS DateTime2), 0.4, 0.4999, N'H', N'SI3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (178, CAST(N'2024-06-11T20:23:37.9386245' AS DateTime2), 0.4, 0.4999, N'H', N'I1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (179, CAST(N'2024-06-11T20:23:37.9387173' AS DateTime2), 0.4, 0.4999, N'H', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (180, CAST(N'2024-06-11T20:23:37.9387819' AS DateTime2), 0.4, 0.4999, N'H', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (181, CAST(N'2024-06-11T20:23:37.9388456' AS DateTime2), 0.4, 0.4999, N'I', N'FL', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (182, CAST(N'2024-06-11T20:23:37.9388925' AS DateTime2), 0.4, 0.4999, N'I', N'IF', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (183, CAST(N'2024-06-11T20:23:37.9389467' AS DateTime2), 0.4, 0.4999, N'I', N'VVS1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (184, CAST(N'2024-06-11T20:23:37.9389833' AS DateTime2), 0.4, 0.4999, N'I', N'VVS2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (185, CAST(N'2024-06-11T20:23:37.9390191' AS DateTime2), 0.4, 0.4999, N'I', N'VS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (186, CAST(N'2024-06-11T20:23:37.9390552' AS DateTime2), 0.4, 0.4999, N'I', N'VS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (187, CAST(N'2024-06-11T20:23:37.9391054' AS DateTime2), 0.4, 0.4999, N'I', N'SI1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (188, CAST(N'2024-06-11T20:23:37.9391526' AS DateTime2), 0.4, 0.4999, N'I', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (189, CAST(N'2024-06-11T20:23:37.9391859' AS DateTime2), 0.4, 0.4999, N'I', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (190, CAST(N'2024-06-11T20:23:37.9392183' AS DateTime2), 0.4, 0.4999, N'I', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (191, CAST(N'2024-06-11T20:23:37.9392500' AS DateTime2), 0.4, 0.4999, N'I', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (192, CAST(N'2024-06-11T20:23:37.9392807' AS DateTime2), 0.4, 0.4999, N'I', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (193, CAST(N'2024-06-11T20:23:37.9393319' AS DateTime2), 0.4, 0.4999, N'J', N'FL', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (194, CAST(N'2024-06-11T20:23:37.9393671' AS DateTime2), 0.4, 0.4999, N'J', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (195, CAST(N'2024-06-11T20:23:37.9394086' AS DateTime2), 0.4, 0.4999, N'J', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (196, CAST(N'2024-06-11T20:23:37.9394533' AS DateTime2), 0.4, 0.4999, N'J', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (197, CAST(N'2024-06-11T20:23:37.9394972' AS DateTime2), 0.4, 0.4999, N'J', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (198, CAST(N'2024-06-11T20:23:37.9395396' AS DateTime2), 0.4, 0.4999, N'J', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (199, CAST(N'2024-06-11T20:23:37.9396264' AS DateTime2), 0.4, 0.4999, N'J', N'SI1', 12)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (200, CAST(N'2024-06-11T20:23:37.9396709' AS DateTime2), 0.4, 0.4999, N'J', N'SI2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (201, CAST(N'2024-06-11T20:23:37.9397098' AS DateTime2), 0.4, 0.4999, N'J', N'SI3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (202, CAST(N'2024-06-11T20:23:37.9397462' AS DateTime2), 0.4, 0.4999, N'J', N'I1', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (203, CAST(N'2024-06-11T20:23:37.9397918' AS DateTime2), 0.4, 0.4999, N'J', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (204, CAST(N'2024-06-11T20:23:37.9398227' AS DateTime2), 0.4, 0.4999, N'J', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (205, CAST(N'2024-06-11T20:23:37.9408582' AS DateTime2), 0.4, 0.4999, N'K', N'FL', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (206, CAST(N'2024-06-11T20:23:37.9417471' AS DateTime2), 0.4, 0.4999, N'K', N'IF', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (207, CAST(N'2024-06-11T20:23:37.9419639' AS DateTime2), 0.4, 0.4999, N'K', N'VVS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (208, CAST(N'2024-06-11T20:23:37.9420691' AS DateTime2), 0.4, 0.4999, N'K', N'VVS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (209, CAST(N'2024-06-11T20:23:37.9421312' AS DateTime2), 0.4, 0.4999, N'K', N'VS1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (210, CAST(N'2024-06-11T20:23:37.9421907' AS DateTime2), 0.4, 0.4999, N'K', N'VS2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (211, CAST(N'2024-06-11T20:23:37.9422497' AS DateTime2), 0.4, 0.4999, N'K', N'SI1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (212, CAST(N'2024-06-11T20:23:37.9426641' AS DateTime2), 0.4, 0.4999, N'K', N'SI2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (213, CAST(N'2024-06-11T20:23:37.9429687' AS DateTime2), 0.4, 0.4999, N'K', N'SI3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (214, CAST(N'2024-06-11T20:23:37.9431348' AS DateTime2), 0.4, 0.4999, N'K', N'I1', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (215, CAST(N'2024-06-11T20:23:37.9432232' AS DateTime2), 0.4, 0.4999, N'K', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (216, CAST(N'2024-06-11T20:23:37.9432925' AS DateTime2), 0.4, 0.4999, N'K', N'I3', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (217, CAST(N'2024-06-11T20:23:37.9435079' AS DateTime2), 0.4, 0.4999, N'L', N'FL', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (218, CAST(N'2024-06-11T20:23:37.9441200' AS DateTime2), 0.4, 0.4999, N'L', N'IF', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (219, CAST(N'2024-06-11T20:23:37.9441902' AS DateTime2), 0.4, 0.4999, N'L', N'VVS1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (220, CAST(N'2024-06-11T20:23:37.9442350' AS DateTime2), 0.4, 0.4999, N'L', N'VVS2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (221, CAST(N'2024-06-11T20:23:37.9442834' AS DateTime2), 0.4, 0.4999, N'L', N'VS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (222, CAST(N'2024-06-11T20:23:37.9443279' AS DateTime2), 0.4, 0.4999, N'L', N'VS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (223, CAST(N'2024-06-11T20:23:37.9443658' AS DateTime2), 0.4, 0.4999, N'L', N'SI1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (224, CAST(N'2024-06-11T20:23:37.9444193' AS DateTime2), 0.4, 0.4999, N'L', N'SI2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (225, CAST(N'2024-06-11T20:23:37.9444548' AS DateTime2), 0.4, 0.4999, N'L', N'SI3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (226, CAST(N'2024-06-11T20:23:37.9444940' AS DateTime2), 0.4, 0.4999, N'L', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (227, CAST(N'2024-06-11T20:23:37.9445776' AS DateTime2), 0.4, 0.4999, N'L', N'I2', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (228, CAST(N'2024-06-11T20:23:37.9446405' AS DateTime2), 0.4, 0.4999, N'L', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (229, CAST(N'2024-06-11T20:23:37.9447429' AS DateTime2), 0.4, 0.4999, N'M', N'FL', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (230, CAST(N'2024-06-11T20:23:37.9454524' AS DateTime2), 0.4, 0.4999, N'M', N'IF', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (231, CAST(N'2024-06-11T20:23:37.9455888' AS DateTime2), 0.4, 0.4999, N'M', N'VVS1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (232, CAST(N'2024-06-11T20:23:37.9456470' AS DateTime2), 0.4, 0.4999, N'M', N'VVS2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (233, CAST(N'2024-06-11T20:23:37.9456834' AS DateTime2), 0.4, 0.4999, N'M', N'VS1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (234, CAST(N'2024-06-11T20:23:37.9457530' AS DateTime2), 0.4, 0.4999, N'M', N'VS2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (235, CAST(N'2024-06-11T20:23:37.9458111' AS DateTime2), 0.4, 0.4999, N'M', N'SI1', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (236, CAST(N'2024-06-11T20:23:37.9458481' AS DateTime2), 0.4, 0.4999, N'M', N'SI2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (237, CAST(N'2024-06-11T20:23:37.9458816' AS DateTime2), 0.4, 0.4999, N'M', N'SI3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (238, CAST(N'2024-06-11T20:23:37.9459334' AS DateTime2), 0.4, 0.4999, N'M', N'I1', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (239, CAST(N'2024-06-11T20:23:37.9459675' AS DateTime2), 0.4, 0.4999, N'M', N'I2', 4)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (240, CAST(N'2024-06-11T20:23:37.9459986' AS DateTime2), 0.4, 0.4999, N'M', N'I3', 3)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (241, CAST(N'2024-06-11T20:23:38.1824138' AS DateTime2), 0.5, 0.6999, N'D', N'FL', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (242, CAST(N'2024-06-11T20:23:38.1825627' AS DateTime2), 0.5, 0.6999, N'D', N'IF', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (243, CAST(N'2024-06-11T20:23:38.1826126' AS DateTime2), 0.5, 0.6999, N'D', N'VVS1', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (244, CAST(N'2024-06-11T20:23:38.1826458' AS DateTime2), 0.5, 0.6999, N'D', N'VVS2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (245, CAST(N'2024-06-11T20:23:38.1826745' AS DateTime2), 0.5, 0.6999, N'D', N'VS1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (246, CAST(N'2024-06-11T20:23:38.1827041' AS DateTime2), 0.5, 0.6999, N'D', N'VS2', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (247, CAST(N'2024-06-11T20:23:38.1827380' AS DateTime2), 0.5, 0.6999, N'D', N'SI1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (248, CAST(N'2024-06-11T20:23:38.1827679' AS DateTime2), 0.5, 0.6999, N'D', N'SI2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (249, CAST(N'2024-06-11T20:23:38.1827938' AS DateTime2), 0.5, 0.6999, N'D', N'SI3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (250, CAST(N'2024-06-11T20:23:38.1828194' AS DateTime2), 0.5, 0.6999, N'D', N'I1', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (251, CAST(N'2024-06-11T20:23:38.1828453' AS DateTime2), 0.5, 0.6999, N'D', N'I2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (252, CAST(N'2024-06-11T20:23:38.1828878' AS DateTime2), 0.5, 0.6999, N'D', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (253, CAST(N'2024-06-11T20:23:38.1829280' AS DateTime2), 0.5, 0.6999, N'E', N'FL', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (254, CAST(N'2024-06-11T20:23:38.1829559' AS DateTime2), 0.5, 0.6999, N'E', N'IF', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (255, CAST(N'2024-06-11T20:23:38.1830243' AS DateTime2), 0.5, 0.6999, N'E', N'VVS1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (256, CAST(N'2024-06-11T20:23:38.1832172' AS DateTime2), 0.5, 0.6999, N'E', N'VVS2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (257, CAST(N'2024-06-11T20:23:38.1832613' AS DateTime2), 0.5, 0.6999, N'E', N'VS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (258, CAST(N'2024-06-11T20:23:38.1833294' AS DateTime2), 0.5, 0.6999, N'E', N'VS2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (259, CAST(N'2024-06-11T20:23:38.1833606' AS DateTime2), 0.5, 0.6999, N'E', N'SI1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (260, CAST(N'2024-06-11T20:23:38.1833883' AS DateTime2), 0.5, 0.6999, N'E', N'SI2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (261, CAST(N'2024-06-11T20:23:38.1834121' AS DateTime2), 0.5, 0.6999, N'E', N'SI3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (262, CAST(N'2024-06-11T20:23:38.1834364' AS DateTime2), 0.5, 0.6999, N'E', N'I1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (263, CAST(N'2024-06-11T20:23:38.1834767' AS DateTime2), 0.5, 0.6999, N'E', N'I2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (264, CAST(N'2024-06-11T20:23:38.1835094' AS DateTime2), 0.5, 0.6999, N'E', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (265, CAST(N'2024-06-11T20:23:38.1836671' AS DateTime2), 0.5, 0.6999, N'F', N'FL', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (266, CAST(N'2024-06-11T20:23:38.1837132' AS DateTime2), 0.5, 0.6999, N'F', N'IF', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (267, CAST(N'2024-06-11T20:23:38.1837552' AS DateTime2), 0.5, 0.6999, N'F', N'VVS1', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (268, CAST(N'2024-06-11T20:23:38.1838057' AS DateTime2), 0.5, 0.6999, N'F', N'VVS2', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (269, CAST(N'2024-06-11T20:23:38.1838419' AS DateTime2), 0.5, 0.6999, N'F', N'VS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (270, CAST(N'2024-06-11T20:23:38.1838778' AS DateTime2), 0.5, 0.6999, N'F', N'VS2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (271, CAST(N'2024-06-11T20:23:38.1839178' AS DateTime2), 0.5, 0.6999, N'F', N'SI1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (272, CAST(N'2024-06-11T20:23:38.1839456' AS DateTime2), 0.5, 0.6999, N'F', N'SI2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (273, CAST(N'2024-06-11T20:23:38.1839721' AS DateTime2), 0.5, 0.6999, N'F', N'SI3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (274, CAST(N'2024-06-11T20:23:38.1840205' AS DateTime2), 0.5, 0.6999, N'F', N'I1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (275, CAST(N'2024-06-11T20:23:38.1840720' AS DateTime2), 0.5, 0.6999, N'F', N'I2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (276, CAST(N'2024-06-11T20:23:38.1841243' AS DateTime2), 0.5, 0.6999, N'F', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (277, CAST(N'2024-06-11T20:23:38.1841713' AS DateTime2), 0.5, 0.6999, N'G', N'FL', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (278, CAST(N'2024-06-11T20:23:38.1842099' AS DateTime2), 0.5, 0.6999, N'G', N'IF', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (279, CAST(N'2024-06-11T20:23:38.1842693' AS DateTime2), 0.5, 0.6999, N'G', N'VVS1', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (280, CAST(N'2024-06-11T20:23:38.1843074' AS DateTime2), 0.5, 0.6999, N'G', N'VVS2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (281, CAST(N'2024-06-11T20:23:38.1843399' AS DateTime2), 0.5, 0.6999, N'G', N'VS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (282, CAST(N'2024-06-11T20:23:38.1843709' AS DateTime2), 0.5, 0.6999, N'G', N'VS2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (283, CAST(N'2024-06-11T20:23:38.1844019' AS DateTime2), 0.5, 0.6999, N'G', N'SI1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (284, CAST(N'2024-06-11T20:23:38.1844414' AS DateTime2), 0.5, 0.6999, N'G', N'SI2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (285, CAST(N'2024-06-11T20:23:38.1844692' AS DateTime2), 0.5, 0.6999, N'G', N'SI3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (286, CAST(N'2024-06-11T20:23:38.1845022' AS DateTime2), 0.5, 0.6999, N'G', N'I1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (287, CAST(N'2024-06-11T20:23:38.1845289' AS DateTime2), 0.5, 0.6999, N'G', N'I2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (288, CAST(N'2024-06-11T20:23:38.1845765' AS DateTime2), 0.5, 0.6999, N'G', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (289, CAST(N'2024-06-11T20:23:38.1846427' AS DateTime2), 0.5, 0.6999, N'H', N'FL', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (290, CAST(N'2024-06-11T20:23:38.1846849' AS DateTime2), 0.5, 0.6999, N'H', N'IF', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (291, CAST(N'2024-06-11T20:23:38.1847177' AS DateTime2), 0.5, 0.6999, N'H', N'VVS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (292, CAST(N'2024-06-11T20:23:38.1847472' AS DateTime2), 0.5, 0.6999, N'H', N'VVS2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (293, CAST(N'2024-06-11T20:23:38.1847746' AS DateTime2), 0.5, 0.6999, N'H', N'VS1', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (294, CAST(N'2024-06-11T20:23:38.1848024' AS DateTime2), 0.5, 0.6999, N'H', N'VS2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (295, CAST(N'2024-06-11T20:23:38.1848451' AS DateTime2), 0.5, 0.6999, N'H', N'SI1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (296, CAST(N'2024-06-11T20:23:38.1848863' AS DateTime2), 0.5, 0.6999, N'H', N'SI2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (297, CAST(N'2024-06-11T20:23:38.1849106' AS DateTime2), 0.5, 0.6999, N'H', N'SI3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (298, CAST(N'2024-06-11T20:23:38.1849354' AS DateTime2), 0.5, 0.6999, N'H', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (299, CAST(N'2024-06-11T20:23:38.1849600' AS DateTime2), 0.5, 0.6999, N'H', N'I2', 11)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (300, CAST(N'2024-06-11T20:23:38.1850070' AS DateTime2), 0.5, 0.6999, N'H', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (301, CAST(N'2024-06-11T20:23:38.1850393' AS DateTime2), 0.5, 0.6999, N'I', N'FL', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (302, CAST(N'2024-06-11T20:23:38.1850671' AS DateTime2), 0.5, 0.6999, N'I', N'IF', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (303, CAST(N'2024-06-11T20:23:38.1851096' AS DateTime2), 0.5, 0.6999, N'I', N'VVS1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (304, CAST(N'2024-06-11T20:23:38.1854351' AS DateTime2), 0.5, 0.6999, N'I', N'VVS2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (305, CAST(N'2024-06-11T20:23:38.1855129' AS DateTime2), 0.5, 0.6999, N'I', N'VS1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (306, CAST(N'2024-06-11T20:23:38.1855541' AS DateTime2), 0.5, 0.6999, N'I', N'VS2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (307, CAST(N'2024-06-11T20:23:38.1855866' AS DateTime2), 0.5, 0.6999, N'I', N'SI1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (308, CAST(N'2024-06-11T20:23:38.1856156' AS DateTime2), 0.5, 0.6999, N'I', N'SI2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (309, CAST(N'2024-06-11T20:23:38.1856428' AS DateTime2), 0.5, 0.6999, N'I', N'SI3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (310, CAST(N'2024-06-11T20:23:38.1856863' AS DateTime2), 0.5, 0.6999, N'I', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (311, CAST(N'2024-06-11T20:23:38.1857219' AS DateTime2), 0.5, 0.6999, N'I', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (312, CAST(N'2024-06-11T20:23:38.1857505' AS DateTime2), 0.5, 0.6999, N'I', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (313, CAST(N'2024-06-11T20:23:38.1859281' AS DateTime2), 0.5, 0.6999, N'J', N'FL', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (314, CAST(N'2024-06-11T20:23:38.1860080' AS DateTime2), 0.5, 0.6999, N'J', N'IF', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (315, CAST(N'2024-06-11T20:23:38.1861103' AS DateTime2), 0.5, 0.6999, N'J', N'VVS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (316, CAST(N'2024-06-11T20:23:38.1861606' AS DateTime2), 0.5, 0.6999, N'J', N'VVS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (317, CAST(N'2024-06-11T20:23:38.1861872' AS DateTime2), 0.5, 0.6999, N'J', N'VS1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (318, CAST(N'2024-06-11T20:23:38.1862108' AS DateTime2), 0.5, 0.6999, N'J', N'VS2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (319, CAST(N'2024-06-11T20:23:38.1862343' AS DateTime2), 0.5, 0.6999, N'J', N'SI1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (320, CAST(N'2024-06-11T20:23:38.1862600' AS DateTime2), 0.5, 0.6999, N'J', N'SI2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (321, CAST(N'2024-06-11T20:23:38.1863074' AS DateTime2), 0.5, 0.6999, N'J', N'SI3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (322, CAST(N'2024-06-11T20:23:38.1863501' AS DateTime2), 0.5, 0.6999, N'J', N'I1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (323, CAST(N'2024-06-11T20:23:38.1863925' AS DateTime2), 0.5, 0.6999, N'J', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (324, CAST(N'2024-06-11T20:23:38.1864314' AS DateTime2), 0.5, 0.6999, N'J', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (325, CAST(N'2024-06-11T20:23:38.1864929' AS DateTime2), 0.5, 0.6999, N'K', N'FL', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (326, CAST(N'2024-06-11T20:23:38.1865520' AS DateTime2), 0.5, 0.6999, N'K', N'IF', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (327, CAST(N'2024-06-11T20:23:38.1865955' AS DateTime2), 0.5, 0.6999, N'K', N'VVS1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (328, CAST(N'2024-06-11T20:23:38.1866281' AS DateTime2), 0.5, 0.6999, N'K', N'VVS2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (329, CAST(N'2024-06-11T20:23:38.1866582' AS DateTime2), 0.5, 0.6999, N'K', N'VS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (330, CAST(N'2024-06-11T20:23:38.1866886' AS DateTime2), 0.5, 0.6999, N'K', N'VS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (331, CAST(N'2024-06-11T20:23:38.1867202' AS DateTime2), 0.5, 0.6999, N'K', N'SI1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (332, CAST(N'2024-06-11T20:23:38.1867672' AS DateTime2), 0.5, 0.6999, N'K', N'SI2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (333, CAST(N'2024-06-11T20:23:38.1867934' AS DateTime2), 0.5, 0.6999, N'K', N'SI3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (334, CAST(N'2024-06-11T20:23:38.1868229' AS DateTime2), 0.5, 0.6999, N'K', N'I1', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (335, CAST(N'2024-06-11T20:23:38.1868502' AS DateTime2), 0.5, 0.6999, N'K', N'I2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (336, CAST(N'2024-06-11T20:23:38.1868882' AS DateTime2), 0.5, 0.6999, N'K', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (337, CAST(N'2024-06-11T20:23:38.1869450' AS DateTime2), 0.5, 0.6999, N'L', N'FL', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (338, CAST(N'2024-06-11T20:23:38.1869814' AS DateTime2), 0.5, 0.6999, N'L', N'IF', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (339, CAST(N'2024-06-11T20:23:38.1870235' AS DateTime2), 0.5, 0.6999, N'L', N'VVS1', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (340, CAST(N'2024-06-11T20:23:38.1870576' AS DateTime2), 0.5, 0.6999, N'L', N'VVS2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (341, CAST(N'2024-06-11T20:23:38.1870884' AS DateTime2), 0.5, 0.6999, N'L', N'VS1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (342, CAST(N'2024-06-11T20:23:38.1871396' AS DateTime2), 0.5, 0.6999, N'L', N'VS2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (343, CAST(N'2024-06-11T20:23:38.1871724' AS DateTime2), 0.5, 0.6999, N'L', N'SI1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (344, CAST(N'2024-06-11T20:23:38.1872017' AS DateTime2), 0.5, 0.6999, N'L', N'SI2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (345, CAST(N'2024-06-11T20:23:38.1872266' AS DateTime2), 0.5, 0.6999, N'L', N'SI3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (346, CAST(N'2024-06-11T20:23:38.1872562' AS DateTime2), 0.5, 0.6999, N'L', N'I1', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (347, CAST(N'2024-06-11T20:23:38.1873133' AS DateTime2), 0.5, 0.6999, N'L', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (348, CAST(N'2024-06-11T20:23:38.1874038' AS DateTime2), 0.5, 0.6999, N'L', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (349, CAST(N'2024-06-11T20:23:38.1874601' AS DateTime2), 0.5, 0.6999, N'M', N'FL', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (350, CAST(N'2024-06-11T20:23:38.1875731' AS DateTime2), 0.5, 0.6999, N'M', N'IF', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (351, CAST(N'2024-06-11T20:23:38.1876117' AS DateTime2), 0.5, 0.6999, N'M', N'VVS1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (352, CAST(N'2024-06-11T20:23:38.1876370' AS DateTime2), 0.5, 0.6999, N'M', N'VVS2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (353, CAST(N'2024-06-11T20:23:38.1876859' AS DateTime2), 0.5, 0.6999, N'M', N'VS1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (354, CAST(N'2024-06-11T20:23:38.1877083' AS DateTime2), 0.5, 0.6999, N'M', N'VS2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (355, CAST(N'2024-06-11T20:23:38.1877296' AS DateTime2), 0.5, 0.6999, N'M', N'SI1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (356, CAST(N'2024-06-11T20:23:38.1877537' AS DateTime2), 0.5, 0.6999, N'M', N'SI2', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (357, CAST(N'2024-06-11T20:23:38.1877793' AS DateTime2), 0.5, 0.6999, N'M', N'SI3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (358, CAST(N'2024-06-11T20:23:38.1880389' AS DateTime2), 0.5, 0.6999, N'M', N'I1', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (359, CAST(N'2024-06-11T20:23:38.1880955' AS DateTime2), 0.5, 0.6999, N'M', N'I2', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (360, CAST(N'2024-06-11T20:23:38.1881822' AS DateTime2), 0.5, 0.6999, N'M', N'I3', 5)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (361, CAST(N'2024-06-11T20:23:38.3985393' AS DateTime2), 0.7, 0.8999, N'D', N'FL', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (362, CAST(N'2024-06-11T20:23:38.3987553' AS DateTime2), 0.7, 0.8999, N'D', N'IF', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (363, CAST(N'2024-06-11T20:23:38.3988240' AS DateTime2), 0.7, 0.8999, N'D', N'VVS1', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (364, CAST(N'2024-06-11T20:23:38.3989093' AS DateTime2), 0.7, 0.8999, N'D', N'VVS2', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (365, CAST(N'2024-06-11T20:23:38.3989482' AS DateTime2), 0.7, 0.8999, N'D', N'VS1', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (366, CAST(N'2024-06-11T20:23:38.3989755' AS DateTime2), 0.7, 0.8999, N'D', N'VS2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (367, CAST(N'2024-06-11T20:23:38.3990026' AS DateTime2), 0.7, 0.8999, N'D', N'SI1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (368, CAST(N'2024-06-11T20:23:38.3990307' AS DateTime2), 0.7, 0.8999, N'D', N'SI2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (369, CAST(N'2024-06-11T20:23:38.3990635' AS DateTime2), 0.7, 0.8999, N'D', N'SI3', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (370, CAST(N'2024-06-11T20:23:38.3990917' AS DateTime2), 0.7, 0.8999, N'D', N'I1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (371, CAST(N'2024-06-11T20:23:38.3991151' AS DateTime2), 0.7, 0.8999, N'D', N'I2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (372, CAST(N'2024-06-11T20:23:38.3991377' AS DateTime2), 0.7, 0.8999, N'D', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (373, CAST(N'2024-06-11T20:23:38.3991654' AS DateTime2), 0.7, 0.8999, N'E', N'FL', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (374, CAST(N'2024-06-11T20:23:38.3991983' AS DateTime2), 0.7, 0.8999, N'E', N'IF', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (375, CAST(N'2024-06-11T20:23:38.3992335' AS DateTime2), 0.7, 0.8999, N'E', N'VVS1', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (376, CAST(N'2024-06-11T20:23:38.3992568' AS DateTime2), 0.7, 0.8999, N'E', N'VVS2', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (377, CAST(N'2024-06-11T20:23:38.3992801' AS DateTime2), 0.7, 0.8999, N'E', N'VS1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (378, CAST(N'2024-06-11T20:23:38.3993042' AS DateTime2), 0.7, 0.8999, N'E', N'VS2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (379, CAST(N'2024-06-11T20:23:38.3993278' AS DateTime2), 0.7, 0.8999, N'E', N'SI1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (380, CAST(N'2024-06-11T20:23:38.3993564' AS DateTime2), 0.7, 0.8999, N'E', N'SI2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (381, CAST(N'2024-06-11T20:23:38.3993804' AS DateTime2), 0.7, 0.8999, N'E', N'SI3', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (382, CAST(N'2024-06-11T20:23:38.3994027' AS DateTime2), 0.7, 0.8999, N'E', N'I1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (383, CAST(N'2024-06-11T20:23:38.3994253' AS DateTime2), 0.7, 0.8999, N'E', N'I2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (384, CAST(N'2024-06-11T20:23:38.3994469' AS DateTime2), 0.7, 0.8999, N'E', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (385, CAST(N'2024-06-11T20:23:38.3994946' AS DateTime2), 0.7, 0.8999, N'F', N'FL', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (386, CAST(N'2024-06-11T20:23:38.3995260' AS DateTime2), 0.7, 0.8999, N'F', N'IF', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (387, CAST(N'2024-06-11T20:23:38.3995508' AS DateTime2), 0.7, 0.8999, N'F', N'VVS1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (388, CAST(N'2024-06-11T20:23:38.3995759' AS DateTime2), 0.7, 0.8999, N'F', N'VVS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (389, CAST(N'2024-06-11T20:23:38.3996012' AS DateTime2), 0.7, 0.8999, N'F', N'VS1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (390, CAST(N'2024-06-11T20:23:38.3996383' AS DateTime2), 0.7, 0.8999, N'F', N'VS2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (391, CAST(N'2024-06-11T20:23:38.3996663' AS DateTime2), 0.7, 0.8999, N'F', N'SI1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (392, CAST(N'2024-06-11T20:23:38.3996923' AS DateTime2), 0.7, 0.8999, N'F', N'SI2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (393, CAST(N'2024-06-11T20:23:38.3997183' AS DateTime2), 0.7, 0.8999, N'F', N'SI3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (394, CAST(N'2024-06-11T20:23:38.3997438' AS DateTime2), 0.7, 0.8999, N'F', N'I1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (395, CAST(N'2024-06-11T20:23:38.3997885' AS DateTime2), 0.7, 0.8999, N'F', N'I2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (396, CAST(N'2024-06-11T20:23:38.3998924' AS DateTime2), 0.7, 0.8999, N'F', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (397, CAST(N'2024-06-11T20:23:38.3999289' AS DateTime2), 0.7, 0.8999, N'G', N'FL', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (398, CAST(N'2024-06-11T20:23:38.3999526' AS DateTime2), 0.7, 0.8999, N'G', N'IF', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (399, CAST(N'2024-06-11T20:23:38.3999848' AS DateTime2), 0.7, 0.8999, N'G', N'VVS1', 49)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (400, CAST(N'2024-06-11T20:23:38.4000080' AS DateTime2), 0.7, 0.8999, N'G', N'VVS2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (401, CAST(N'2024-06-11T20:23:38.4000406' AS DateTime2), 0.7, 0.8999, N'G', N'VS1', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (402, CAST(N'2024-06-11T20:23:38.4000643' AS DateTime2), 0.7, 0.8999, N'G', N'VS2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (403, CAST(N'2024-06-11T20:23:38.4000860' AS DateTime2), 0.7, 0.8999, N'G', N'SI1', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (404, CAST(N'2024-06-11T20:23:38.4001080' AS DateTime2), 0.7, 0.8999, N'G', N'SI2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (405, CAST(N'2024-06-11T20:23:38.4001299' AS DateTime2), 0.7, 0.8999, N'G', N'SI3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (406, CAST(N'2024-06-11T20:23:38.4001605' AS DateTime2), 0.7, 0.8999, N'G', N'I1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (407, CAST(N'2024-06-11T20:23:38.4001836' AS DateTime2), 0.7, 0.8999, N'G', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (408, CAST(N'2024-06-11T20:23:38.4002042' AS DateTime2), 0.7, 0.8999, N'G', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (409, CAST(N'2024-06-11T20:23:38.4002279' AS DateTime2), 0.7, 0.8999, N'H', N'FL', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (410, CAST(N'2024-06-11T20:23:38.4002492' AS DateTime2), 0.7, 0.8999, N'H', N'IF', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (411, CAST(N'2024-06-11T20:23:38.4002703' AS DateTime2), 0.7, 0.8999, N'H', N'VVS1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (412, CAST(N'2024-06-11T20:23:38.4003020' AS DateTime2), 0.7, 0.8999, N'H', N'VVS2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (413, CAST(N'2024-06-11T20:23:38.4003244' AS DateTime2), 0.7, 0.8999, N'H', N'VS1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (414, CAST(N'2024-06-11T20:23:38.4003491' AS DateTime2), 0.7, 0.8999, N'H', N'VS2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (415, CAST(N'2024-06-11T20:23:38.4003777' AS DateTime2), 0.7, 0.8999, N'H', N'SI1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (416, CAST(N'2024-06-11T20:23:38.4004204' AS DateTime2), 0.7, 0.8999, N'H', N'SI2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (417, CAST(N'2024-06-11T20:23:38.4004679' AS DateTime2), 0.7, 0.8999, N'H', N'SI3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (418, CAST(N'2024-06-11T20:23:38.4004963' AS DateTime2), 0.7, 0.8999, N'H', N'I1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (419, CAST(N'2024-06-11T20:23:38.4005225' AS DateTime2), 0.7, 0.8999, N'H', N'I2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (420, CAST(N'2024-06-11T20:23:38.4005490' AS DateTime2), 0.7, 0.8999, N'H', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (421, CAST(N'2024-06-11T20:23:38.4005782' AS DateTime2), 0.7, 0.8999, N'I', N'FL', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (422, CAST(N'2024-06-11T20:23:38.4006340' AS DateTime2), 0.7, 0.8999, N'I', N'IF', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (423, CAST(N'2024-06-11T20:23:38.4006806' AS DateTime2), 0.7, 0.8999, N'I', N'VVS1', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (424, CAST(N'2024-06-11T20:23:38.4007158' AS DateTime2), 0.7, 0.8999, N'I', N'VVS2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (425, CAST(N'2024-06-11T20:23:38.4007527' AS DateTime2), 0.7, 0.8999, N'I', N'VS1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (426, CAST(N'2024-06-11T20:23:38.4007962' AS DateTime2), 0.7, 0.8999, N'I', N'VS2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (427, CAST(N'2024-06-11T20:23:38.4008361' AS DateTime2), 0.7, 0.8999, N'I', N'SI1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (428, CAST(N'2024-06-11T20:23:38.4008707' AS DateTime2), 0.7, 0.8999, N'I', N'SI2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (429, CAST(N'2024-06-11T20:23:38.4008963' AS DateTime2), 0.7, 0.8999, N'I', N'SI3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (430, CAST(N'2024-06-11T20:23:38.4009190' AS DateTime2), 0.7, 0.8999, N'I', N'I1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (431, CAST(N'2024-06-11T20:23:38.4009427' AS DateTime2), 0.7, 0.8999, N'I', N'I2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (432, CAST(N'2024-06-11T20:23:38.4009660' AS DateTime2), 0.7, 0.8999, N'I', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (433, CAST(N'2024-06-11T20:23:38.4010336' AS DateTime2), 0.7, 0.8999, N'J', N'FL', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (434, CAST(N'2024-06-11T20:23:38.4010606' AS DateTime2), 0.7, 0.8999, N'J', N'IF', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (435, CAST(N'2024-06-11T20:23:38.4010919' AS DateTime2), 0.7, 0.8999, N'J', N'VVS1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (436, CAST(N'2024-06-11T20:23:38.4011255' AS DateTime2), 0.7, 0.8999, N'J', N'VVS2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (437, CAST(N'2024-06-11T20:23:38.4011695' AS DateTime2), 0.7, 0.8999, N'J', N'VS1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (438, CAST(N'2024-06-11T20:23:38.4012042' AS DateTime2), 0.7, 0.8999, N'J', N'VS2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (439, CAST(N'2024-06-11T20:23:38.4012437' AS DateTime2), 0.7, 0.8999, N'J', N'SI1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (440, CAST(N'2024-06-11T20:23:38.4012746' AS DateTime2), 0.7, 0.8999, N'J', N'SI2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (441, CAST(N'2024-06-11T20:23:38.4013226' AS DateTime2), 0.7, 0.8999, N'J', N'SI3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (442, CAST(N'2024-06-11T20:23:38.4013652' AS DateTime2), 0.7, 0.8999, N'J', N'I1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (443, CAST(N'2024-06-11T20:23:38.4013971' AS DateTime2), 0.7, 0.8999, N'J', N'I2', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (444, CAST(N'2024-06-11T20:23:38.4014299' AS DateTime2), 0.7, 0.8999, N'J', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (445, CAST(N'2024-06-11T20:23:38.4014636' AS DateTime2), 0.7, 0.8999, N'K', N'FL', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (446, CAST(N'2024-06-11T20:23:38.4015055' AS DateTime2), 0.7, 0.8999, N'K', N'IF', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (447, CAST(N'2024-06-11T20:23:38.4015380' AS DateTime2), 0.7, 0.8999, N'K', N'VVS1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (448, CAST(N'2024-06-11T20:23:38.4015631' AS DateTime2), 0.7, 0.8999, N'K', N'VVS2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (449, CAST(N'2024-06-11T20:23:38.4015867' AS DateTime2), 0.7, 0.8999, N'K', N'VS1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (450, CAST(N'2024-06-11T20:23:38.4016298' AS DateTime2), 0.7, 0.8999, N'K', N'VS2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (451, CAST(N'2024-06-11T20:23:38.4016784' AS DateTime2), 0.7, 0.8999, N'K', N'SI1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (452, CAST(N'2024-06-11T20:23:38.4017305' AS DateTime2), 0.7, 0.8999, N'K', N'SI2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (453, CAST(N'2024-06-11T20:23:38.4017728' AS DateTime2), 0.7, 0.8999, N'K', N'SI3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (454, CAST(N'2024-06-11T20:23:38.4018002' AS DateTime2), 0.7, 0.8999, N'K', N'I1', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (455, CAST(N'2024-06-11T20:23:38.4018265' AS DateTime2), 0.7, 0.8999, N'K', N'I2', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (456, CAST(N'2024-06-11T20:23:38.4018590' AS DateTime2), 0.7, 0.8999, N'K', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (457, CAST(N'2024-06-11T20:23:38.4019198' AS DateTime2), 0.7, 0.8999, N'L', N'FL', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (458, CAST(N'2024-06-11T20:23:38.4019510' AS DateTime2), 0.7, 0.8999, N'L', N'IF', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (459, CAST(N'2024-06-11T20:23:38.4019780' AS DateTime2), 0.7, 0.8999, N'L', N'VVS1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (460, CAST(N'2024-06-11T20:23:38.4020046' AS DateTime2), 0.7, 0.8999, N'L', N'VVS2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (461, CAST(N'2024-06-11T20:23:38.4020309' AS DateTime2), 0.7, 0.8999, N'L', N'VS1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (462, CAST(N'2024-06-11T20:23:38.4020650' AS DateTime2), 0.7, 0.8999, N'L', N'VS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (463, CAST(N'2024-06-11T20:23:38.4021245' AS DateTime2), 0.7, 0.8999, N'L', N'SI1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (464, CAST(N'2024-06-11T20:23:38.4022015' AS DateTime2), 0.7, 0.8999, N'L', N'SI2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (465, CAST(N'2024-06-11T20:23:38.4022925' AS DateTime2), 0.7, 0.8999, N'L', N'SI3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (466, CAST(N'2024-06-11T20:23:38.4023282' AS DateTime2), 0.7, 0.8999, N'L', N'I1', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (467, CAST(N'2024-06-11T20:23:38.4023595' AS DateTime2), 0.7, 0.8999, N'L', N'I2', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (468, CAST(N'2024-06-11T20:23:38.4023894' AS DateTime2), 0.7, 0.8999, N'L', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (469, CAST(N'2024-06-11T20:23:38.4024453' AS DateTime2), 0.7, 0.8999, N'M', N'FL', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (470, CAST(N'2024-06-11T20:23:38.4024776' AS DateTime2), 0.7, 0.8999, N'M', N'IF', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (471, CAST(N'2024-06-11T20:23:38.4025052' AS DateTime2), 0.7, 0.8999, N'M', N'VVS1', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (472, CAST(N'2024-06-11T20:23:38.4025492' AS DateTime2), 0.7, 0.8999, N'M', N'VVS2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (473, CAST(N'2024-06-11T20:23:38.4025986' AS DateTime2), 0.7, 0.8999, N'M', N'VS1', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (474, CAST(N'2024-06-11T20:23:38.4026582' AS DateTime2), 0.7, 0.8999, N'M', N'VS2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (475, CAST(N'2024-06-11T20:23:38.4026931' AS DateTime2), 0.7, 0.8999, N'M', N'SI1', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (476, CAST(N'2024-06-11T20:23:38.4027251' AS DateTime2), 0.7, 0.8999, N'M', N'SI2', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (477, CAST(N'2024-06-11T20:23:38.4027564' AS DateTime2), 0.7, 0.8999, N'M', N'SI3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (478, CAST(N'2024-06-11T20:23:38.4027869' AS DateTime2), 0.7, 0.8999, N'M', N'I1', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (479, CAST(N'2024-06-11T20:23:38.4028252' AS DateTime2), 0.7, 0.8999, N'M', N'I2', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (480, CAST(N'2024-06-11T20:23:38.4028675' AS DateTime2), 0.7, 0.8999, N'M', N'I3', 6)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (481, CAST(N'2024-06-11T20:23:38.5599350' AS DateTime2), 0.9, 0.9999, N'D', N'FL', 128)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (482, CAST(N'2024-06-11T20:23:38.5600820' AS DateTime2), 0.9, 0.9999, N'D', N'IF', 122)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (483, CAST(N'2024-06-11T20:23:38.5601417' AS DateTime2), 0.9, 0.9999, N'D', N'VVS1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (484, CAST(N'2024-06-11T20:23:38.5601922' AS DateTime2), 0.9, 0.9999, N'D', N'VVS2', 89)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (485, CAST(N'2024-06-11T20:23:38.5602357' AS DateTime2), 0.9, 0.9999, N'D', N'VS1', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (486, CAST(N'2024-06-11T20:23:38.5602786' AS DateTime2), 0.9, 0.9999, N'D', N'VS2', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (487, CAST(N'2024-06-11T20:23:38.5603419' AS DateTime2), 0.9, 0.9999, N'D', N'SI1', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (488, CAST(N'2024-06-11T20:23:38.5603727' AS DateTime2), 0.9, 0.9999, N'D', N'SI2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (489, CAST(N'2024-06-11T20:23:38.5604029' AS DateTime2), 0.9, 0.9999, N'D', N'SI3', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (490, CAST(N'2024-06-11T20:23:38.5604268' AS DateTime2), 0.9, 0.9999, N'D', N'I1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (491, CAST(N'2024-06-11T20:23:38.5604499' AS DateTime2), 0.9, 0.9999, N'D', N'I2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (492, CAST(N'2024-06-11T20:23:38.5604795' AS DateTime2), 0.9, 0.9999, N'D', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (493, CAST(N'2024-06-11T20:23:38.5605092' AS DateTime2), 0.9, 0.9999, N'E', N'FL', 113)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (494, CAST(N'2024-06-11T20:23:38.5605361' AS DateTime2), 0.9, 0.9999, N'E', N'IF', 109)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (495, CAST(N'2024-06-11T20:23:38.5605610' AS DateTime2), 0.9, 0.9999, N'E', N'VVS1', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (496, CAST(N'2024-06-11T20:23:38.5605865' AS DateTime2), 0.9, 0.9999, N'E', N'VVS2', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (497, CAST(N'2024-06-11T20:23:38.5606302' AS DateTime2), 0.9, 0.9999, N'E', N'VS1', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (498, CAST(N'2024-06-11T20:23:38.5606584' AS DateTime2), 0.9, 0.9999, N'E', N'VS2', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (499, CAST(N'2024-06-11T20:23:38.5606825' AS DateTime2), 0.9, 0.9999, N'E', N'SI1', 48)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (500, CAST(N'2024-06-11T20:23:38.5607068' AS DateTime2), 0.9, 0.9999, N'E', N'SI2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (501, CAST(N'2024-06-11T20:23:38.5607314' AS DateTime2), 0.9, 0.9999, N'E', N'SI3', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (502, CAST(N'2024-06-11T20:23:38.5607701' AS DateTime2), 0.9, 0.9999, N'E', N'I1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (503, CAST(N'2024-06-11T20:23:38.5608082' AS DateTime2), 0.9, 0.9999, N'E', N'I2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (504, CAST(N'2024-06-11T20:23:38.5608619' AS DateTime2), 0.9, 0.9999, N'E', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (505, CAST(N'2024-06-11T20:23:38.5608959' AS DateTime2), 0.9, 0.9999, N'F', N'FL', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (506, CAST(N'2024-06-11T20:23:38.5609230' AS DateTime2), 0.9, 0.9999, N'F', N'IF', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (507, CAST(N'2024-06-11T20:23:38.5609474' AS DateTime2), 0.9, 0.9999, N'F', N'VVS1', 91)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (508, CAST(N'2024-06-11T20:23:38.5609836' AS DateTime2), 0.9, 0.9999, N'F', N'VVS2', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (509, CAST(N'2024-06-11T20:23:38.5610125' AS DateTime2), 0.9, 0.9999, N'F', N'VS1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (510, CAST(N'2024-06-11T20:23:38.5610417' AS DateTime2), 0.9, 0.9999, N'F', N'VS2', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (511, CAST(N'2024-06-11T20:23:38.5610713' AS DateTime2), 0.9, 0.9999, N'F', N'SI1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (512, CAST(N'2024-06-11T20:23:38.5611022' AS DateTime2), 0.9, 0.9999, N'F', N'SI2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (513, CAST(N'2024-06-11T20:23:38.5611510' AS DateTime2), 0.9, 0.9999, N'F', N'SI3', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (514, CAST(N'2024-06-11T20:23:38.5611964' AS DateTime2), 0.9, 0.9999, N'F', N'I1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (515, CAST(N'2024-06-11T20:23:38.5612394' AS DateTime2), 0.9, 0.9999, N'F', N'I2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (516, CAST(N'2024-06-11T20:23:38.5612729' AS DateTime2), 0.9, 0.9999, N'F', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (517, CAST(N'2024-06-11T20:23:38.5613036' AS DateTime2), 0.9, 0.9999, N'G', N'FL', 94)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (518, CAST(N'2024-06-11T20:23:38.5613397' AS DateTime2), 0.9, 0.9999, N'G', N'IF', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (519, CAST(N'2024-06-11T20:23:38.5613659' AS DateTime2), 0.9, 0.9999, N'G', N'VVS1', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (520, CAST(N'2024-06-11T20:23:38.5613914' AS DateTime2), 0.9, 0.9999, N'G', N'VVS2', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (521, CAST(N'2024-06-11T20:23:38.5614353' AS DateTime2), 0.9, 0.9999, N'G', N'VS1', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (522, CAST(N'2024-06-11T20:23:38.5614615' AS DateTime2), 0.9, 0.9999, N'G', N'VS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (523, CAST(N'2024-06-11T20:23:38.5614843' AS DateTime2), 0.9, 0.9999, N'G', N'SI1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (524, CAST(N'2024-06-11T20:23:38.5615262' AS DateTime2), 0.9, 0.9999, N'G', N'SI2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (525, CAST(N'2024-06-11T20:23:38.5615544' AS DateTime2), 0.9, 0.9999, N'G', N'SI3', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (526, CAST(N'2024-06-11T20:23:38.5615759' AS DateTime2), 0.9, 0.9999, N'G', N'I1', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (527, CAST(N'2024-06-11T20:23:38.5615967' AS DateTime2), 0.9, 0.9999, N'G', N'I2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (528, CAST(N'2024-06-11T20:23:38.5616180' AS DateTime2), 0.9, 0.9999, N'G', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (529, CAST(N'2024-06-11T20:23:38.5616571' AS DateTime2), 0.9, 0.9999, N'H', N'FL', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (530, CAST(N'2024-06-11T20:23:38.5616817' AS DateTime2), 0.9, 0.9999, N'H', N'IF', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (531, CAST(N'2024-06-11T20:23:38.5617038' AS DateTime2), 0.9, 0.9999, N'H', N'VVS1', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (532, CAST(N'2024-06-11T20:23:38.5617257' AS DateTime2), 0.9, 0.9999, N'H', N'VVS2', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (533, CAST(N'2024-06-11T20:23:38.5617466' AS DateTime2), 0.9, 0.9999, N'H', N'VS1', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (534, CAST(N'2024-06-11T20:23:38.5617859' AS DateTime2), 0.9, 0.9999, N'H', N'VS2', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (535, CAST(N'2024-06-11T20:23:38.5618109' AS DateTime2), 0.9, 0.9999, N'H', N'SI1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (536, CAST(N'2024-06-11T20:23:38.5618322' AS DateTime2), 0.9, 0.9999, N'H', N'SI2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (537, CAST(N'2024-06-11T20:23:38.5618534' AS DateTime2), 0.9, 0.9999, N'H', N'SI3', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (538, CAST(N'2024-06-11T20:23:38.5618754' AS DateTime2), 0.9, 0.9999, N'H', N'I1', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (539, CAST(N'2024-06-11T20:23:38.5619136' AS DateTime2), 0.9, 0.9999, N'H', N'I2', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (540, CAST(N'2024-06-11T20:23:38.5619434' AS DateTime2), 0.9, 0.9999, N'H', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (541, CAST(N'2024-06-11T20:23:38.5619704' AS DateTime2), 0.9, 0.9999, N'I', N'FL', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (542, CAST(N'2024-06-11T20:23:38.5620115' AS DateTime2), 0.9, 0.9999, N'I', N'IF', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (543, CAST(N'2024-06-11T20:23:38.5620455' AS DateTime2), 0.9, 0.9999, N'I', N'VVS1', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (544, CAST(N'2024-06-11T20:23:38.5620768' AS DateTime2), 0.9, 0.9999, N'I', N'VVS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (545, CAST(N'2024-06-11T20:23:38.5621100' AS DateTime2), 0.9, 0.9999, N'I', N'VS1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (546, CAST(N'2024-06-11T20:23:38.5621410' AS DateTime2), 0.9, 0.9999, N'I', N'VS2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (547, CAST(N'2024-06-11T20:23:38.5621890' AS DateTime2), 0.9, 0.9999, N'I', N'SI1', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (548, CAST(N'2024-06-11T20:23:38.5622221' AS DateTime2), 0.9, 0.9999, N'I', N'SI2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (549, CAST(N'2024-06-11T20:23:38.5622514' AS DateTime2), 0.9, 0.9999, N'I', N'SI3', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (550, CAST(N'2024-06-11T20:23:38.5622767' AS DateTime2), 0.9, 0.9999, N'I', N'I1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (551, CAST(N'2024-06-11T20:23:38.5623028' AS DateTime2), 0.9, 0.9999, N'I', N'I2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (552, CAST(N'2024-06-11T20:23:38.5623631' AS DateTime2), 0.9, 0.9999, N'I', N'I3', 11)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (553, CAST(N'2024-06-11T20:23:38.5624109' AS DateTime2), 0.9, 0.9999, N'J', N'FL', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (554, CAST(N'2024-06-11T20:23:38.5624483' AS DateTime2), 0.9, 0.9999, N'J', N'IF', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (555, CAST(N'2024-06-11T20:23:38.5624973' AS DateTime2), 0.9, 0.9999, N'J', N'VVS1', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (556, CAST(N'2024-06-11T20:23:38.5625404' AS DateTime2), 0.9, 0.9999, N'J', N'VVS2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (557, CAST(N'2024-06-11T20:23:38.5625712' AS DateTime2), 0.9, 0.9999, N'J', N'VS1', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (558, CAST(N'2024-06-11T20:23:38.5626148' AS DateTime2), 0.9, 0.9999, N'J', N'VS2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (559, CAST(N'2024-06-11T20:23:38.5626555' AS DateTime2), 0.9, 0.9999, N'J', N'SI1', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (560, CAST(N'2024-06-11T20:23:38.5626890' AS DateTime2), 0.9, 0.9999, N'J', N'SI2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (561, CAST(N'2024-06-11T20:23:38.5627132' AS DateTime2), 0.9, 0.9999, N'J', N'SI3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (562, CAST(N'2024-06-11T20:23:38.5627373' AS DateTime2), 0.9, 0.9999, N'J', N'I1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (563, CAST(N'2024-06-11T20:23:38.5627691' AS DateTime2), 0.9, 0.9999, N'J', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (564, CAST(N'2024-06-11T20:23:38.5628018' AS DateTime2), 0.9, 0.9999, N'J', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (565, CAST(N'2024-06-11T20:23:38.5628294' AS DateTime2), 0.9, 0.9999, N'K', N'FL', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (566, CAST(N'2024-06-11T20:23:38.5628537' AS DateTime2), 0.9, 0.9999, N'K', N'IF', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (567, CAST(N'2024-06-11T20:23:38.5628776' AS DateTime2), 0.9, 0.9999, N'K', N'VVS1', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (568, CAST(N'2024-06-11T20:23:38.5629085' AS DateTime2), 0.9, 0.9999, N'K', N'VVS2', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (569, CAST(N'2024-06-11T20:23:38.5629341' AS DateTime2), 0.9, 0.9999, N'K', N'VS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (570, CAST(N'2024-06-11T20:23:38.5629578' AS DateTime2), 0.9, 0.9999, N'K', N'VS2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (571, CAST(N'2024-06-11T20:23:38.5629813' AS DateTime2), 0.9, 0.9999, N'K', N'SI1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (572, CAST(N'2024-06-11T20:23:38.5630053' AS DateTime2), 0.9, 0.9999, N'K', N'SI2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (573, CAST(N'2024-06-11T20:23:38.5630272' AS DateTime2), 0.9, 0.9999, N'K', N'SI3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (574, CAST(N'2024-06-11T20:23:38.5630596' AS DateTime2), 0.9, 0.9999, N'K', N'I1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (575, CAST(N'2024-06-11T20:23:38.5630831' AS DateTime2), 0.9, 0.9999, N'K', N'I2', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (576, CAST(N'2024-06-11T20:23:38.5631123' AS DateTime2), 0.9, 0.9999, N'K', N'I3', 9)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (577, CAST(N'2024-06-11T20:23:38.5631608' AS DateTime2), 0.9, 0.9999, N'L', N'FL', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (578, CAST(N'2024-06-11T20:23:38.5631977' AS DateTime2), 0.9, 0.9999, N'L', N'IF', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (579, CAST(N'2024-06-11T20:23:38.5632383' AS DateTime2), 0.9, 0.9999, N'L', N'VVS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (580, CAST(N'2024-06-11T20:23:38.5632710' AS DateTime2), 0.9, 0.9999, N'L', N'VVS2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (581, CAST(N'2024-06-11T20:23:38.5633138' AS DateTime2), 0.9, 0.9999, N'L', N'VS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (582, CAST(N'2024-06-11T20:23:38.5633587' AS DateTime2), 0.9, 0.9999, N'L', N'VS2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (583, CAST(N'2024-06-11T20:23:38.5634033' AS DateTime2), 0.9, 0.9999, N'L', N'SI1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (584, CAST(N'2024-06-11T20:23:38.5634577' AS DateTime2), 0.9, 0.9999, N'L', N'SI2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (585, CAST(N'2024-06-11T20:23:38.5635045' AS DateTime2), 0.9, 0.9999, N'L', N'SI3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (586, CAST(N'2024-06-11T20:23:38.5635432' AS DateTime2), 0.9, 0.9999, N'L', N'I1', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (587, CAST(N'2024-06-11T20:23:38.5635730' AS DateTime2), 0.9, 0.9999, N'L', N'I2', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (588, CAST(N'2024-06-11T20:23:38.5636028' AS DateTime2), 0.9, 0.9999, N'L', N'I3', 8)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (589, CAST(N'2024-06-11T20:23:38.5636647' AS DateTime2), 0.9, 0.9999, N'M', N'FL', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (590, CAST(N'2024-06-11T20:23:38.5637223' AS DateTime2), 0.9, 0.9999, N'M', N'IF', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (591, CAST(N'2024-06-11T20:23:38.5637644' AS DateTime2), 0.9, 0.9999, N'M', N'VVS1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (592, CAST(N'2024-06-11T20:23:38.5637970' AS DateTime2), 0.9, 0.9999, N'M', N'VVS2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (593, CAST(N'2024-06-11T20:23:38.5638279' AS DateTime2), 0.9, 0.9999, N'M', N'VS1', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (594, CAST(N'2024-06-11T20:23:38.5638641' AS DateTime2), 0.9, 0.9999, N'M', N'VS2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (595, CAST(N'2024-06-11T20:23:38.5639096' AS DateTime2), 0.9, 0.9999, N'M', N'SI1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (596, CAST(N'2024-06-11T20:23:38.5639525' AS DateTime2), 0.9, 0.9999, N'M', N'SI2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (597, CAST(N'2024-06-11T20:23:38.5640040' AS DateTime2), 0.9, 0.9999, N'M', N'SI3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (598, CAST(N'2024-06-11T20:23:38.5640539' AS DateTime2), 0.9, 0.9999, N'M', N'I1', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (599, CAST(N'2024-06-11T20:23:38.5640963' AS DateTime2), 0.9, 0.9999, N'M', N'I2', 11)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (600, CAST(N'2024-06-11T20:23:38.5641457' AS DateTime2), 0.9, 0.9999, N'M', N'I3', 7)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (601, CAST(N'2024-06-11T20:23:38.8255166' AS DateTime2), 1, 1.4999, N'D', N'FL', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (602, CAST(N'2024-06-11T20:23:38.8260554' AS DateTime2), 1, 1.4999, N'D', N'IF', 194)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (603, CAST(N'2024-06-11T20:23:38.8264050' AS DateTime2), 1, 1.4999, N'D', N'VVS1', 147)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (604, CAST(N'2024-06-11T20:23:38.8265377' AS DateTime2), 1, 1.4999, N'D', N'VVS2', 124)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (605, CAST(N'2024-06-11T20:23:38.8266131' AS DateTime2), 1, 1.4999, N'D', N'VS1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (606, CAST(N'2024-06-11T20:23:38.8266640' AS DateTime2), 1, 1.4999, N'D', N'VS2', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (607, CAST(N'2024-06-11T20:23:38.8267947' AS DateTime2), 1, 1.4999, N'D', N'SI1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (608, CAST(N'2024-06-11T20:23:38.8268480' AS DateTime2), 1, 1.4999, N'D', N'SI2', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (609, CAST(N'2024-06-11T20:23:38.8268865' AS DateTime2), 1, 1.4999, N'D', N'SI3', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (610, CAST(N'2024-06-11T20:23:38.8269277' AS DateTime2), 1, 1.4999, N'D', N'I1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (611, CAST(N'2024-06-11T20:23:38.8271361' AS DateTime2), 1, 1.4999, N'D', N'I2', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (612, CAST(N'2024-06-11T20:23:38.8276252' AS DateTime2), 1, 1.4999, N'D', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (613, CAST(N'2024-06-11T20:23:38.8282346' AS DateTime2), 1, 1.4999, N'E', N'FL', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (614, CAST(N'2024-06-11T20:23:38.8293173' AS DateTime2), 1, 1.4999, N'E', N'IF', 144)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (615, CAST(N'2024-06-11T20:23:38.8294330' AS DateTime2), 1, 1.4999, N'E', N'VVS1', 127)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (616, CAST(N'2024-06-11T20:23:38.8295066' AS DateTime2), 1, 1.4999, N'E', N'VVS2', 112)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (617, CAST(N'2024-06-11T20:23:38.8295748' AS DateTime2), 1, 1.4999, N'E', N'VS1', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (618, CAST(N'2024-06-11T20:23:38.8296292' AS DateTime2), 1, 1.4999, N'E', N'VS2', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (619, CAST(N'2024-06-11T20:23:38.8296793' AS DateTime2), 1, 1.4999, N'E', N'SI1', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (620, CAST(N'2024-06-11T20:23:38.8297113' AS DateTime2), 1, 1.4999, N'E', N'SI2', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (621, CAST(N'2024-06-11T20:23:38.8297395' AS DateTime2), 1, 1.4999, N'E', N'SI3', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (622, CAST(N'2024-06-11T20:23:38.8297671' AS DateTime2), 1, 1.4999, N'E', N'I1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (623, CAST(N'2024-06-11T20:23:38.8298084' AS DateTime2), 1, 1.4999, N'E', N'I2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (624, CAST(N'2024-06-11T20:23:38.8298370' AS DateTime2), 1, 1.4999, N'E', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (625, CAST(N'2024-06-11T20:23:38.8298691' AS DateTime2), 1, 1.4999, N'F', N'FL', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (626, CAST(N'2024-06-11T20:23:38.8298966' AS DateTime2), 1, 1.4999, N'F', N'IF', 126)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (627, CAST(N'2024-06-11T20:23:38.8299384' AS DateTime2), 1, 1.4999, N'F', N'VVS1', 114)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (628, CAST(N'2024-06-11T20:23:38.8299756' AS DateTime2), 1, 1.4999, N'F', N'VVS2', 103)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (629, CAST(N'2024-06-11T20:23:38.8300007' AS DateTime2), 1, 1.4999, N'F', N'VS1', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (630, CAST(N'2024-06-11T20:23:38.8300238' AS DateTime2), 1, 1.4999, N'F', N'VS2', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (631, CAST(N'2024-06-11T20:23:38.8300476' AS DateTime2), 1, 1.4999, N'F', N'SI1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (632, CAST(N'2024-06-11T20:23:38.8300710' AS DateTime2), 1, 1.4999, N'F', N'SI2', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (633, CAST(N'2024-06-11T20:23:38.8301134' AS DateTime2), 1, 1.4999, N'F', N'SI3', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (634, CAST(N'2024-06-11T20:23:38.8301375' AS DateTime2), 1, 1.4999, N'F', N'I1', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (635, CAST(N'2024-06-11T20:23:38.8301600' AS DateTime2), 1, 1.4999, N'F', N'I2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (636, CAST(N'2024-06-11T20:23:38.8301821' AS DateTime2), 1, 1.4999, N'F', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (637, CAST(N'2024-06-11T20:23:38.8302087' AS DateTime2), 1, 1.4999, N'G', N'FL', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (638, CAST(N'2024-06-11T20:23:38.8302317' AS DateTime2), 1, 1.4999, N'G', N'IF', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (639, CAST(N'2024-06-11T20:23:38.8302639' AS DateTime2), 1, 1.4999, N'G', N'VVS1', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (640, CAST(N'2024-06-11T20:23:38.8302874' AS DateTime2), 1, 1.4999, N'G', N'VVS2', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (641, CAST(N'2024-06-11T20:23:38.8303100' AS DateTime2), 1, 1.4999, N'G', N'VS1', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (642, CAST(N'2024-06-11T20:23:38.8303333' AS DateTime2), 1, 1.4999, N'G', N'VS2', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (643, CAST(N'2024-06-11T20:23:38.8303559' AS DateTime2), 1, 1.4999, N'G', N'SI1', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (644, CAST(N'2024-06-11T20:23:38.8303871' AS DateTime2), 1, 1.4999, N'G', N'SI2', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (645, CAST(N'2024-06-11T20:23:38.8304189' AS DateTime2), 1, 1.4999, N'G', N'SI3', 40)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (646, CAST(N'2024-06-11T20:23:38.8304442' AS DateTime2), 1, 1.4999, N'G', N'I1', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (647, CAST(N'2024-06-11T20:23:38.8306080' AS DateTime2), 1, 1.4999, N'G', N'I2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (648, CAST(N'2024-06-11T20:23:38.8306619' AS DateTime2), 1, 1.4999, N'G', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (649, CAST(N'2024-06-11T20:23:38.8307342' AS DateTime2), 1, 1.4999, N'H', N'FL', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (650, CAST(N'2024-06-11T20:23:38.8308059' AS DateTime2), 1, 1.4999, N'H', N'IF', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (651, CAST(N'2024-06-11T20:23:38.8308365' AS DateTime2), 1, 1.4999, N'H', N'VVS1', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (652, CAST(N'2024-06-11T20:23:38.8309851' AS DateTime2), 1, 1.4999, N'H', N'VVS2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (653, CAST(N'2024-06-11T20:23:38.8310482' AS DateTime2), 1, 1.4999, N'H', N'VS1', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (654, CAST(N'2024-06-11T20:23:38.8311275' AS DateTime2), 1, 1.4999, N'H', N'VS2', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (655, CAST(N'2024-06-11T20:23:38.8312140' AS DateTime2), 1, 1.4999, N'H', N'SI1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (656, CAST(N'2024-06-11T20:23:38.8313043' AS DateTime2), 1, 1.4999, N'H', N'SI2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (657, CAST(N'2024-06-11T20:23:38.8313625' AS DateTime2), 1, 1.4999, N'H', N'SI3', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (658, CAST(N'2024-06-11T20:23:38.8313983' AS DateTime2), 1, 1.4999, N'H', N'I1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (659, CAST(N'2024-06-11T20:23:38.8314602' AS DateTime2), 1, 1.4999, N'H', N'I2', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (660, CAST(N'2024-06-11T20:23:38.8315185' AS DateTime2), 1, 1.4999, N'H', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (661, CAST(N'2024-06-11T20:23:38.8315703' AS DateTime2), 1, 1.4999, N'I', N'FL', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (662, CAST(N'2024-06-11T20:23:38.8316158' AS DateTime2), 1, 1.4999, N'I', N'IF', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (663, CAST(N'2024-06-11T20:23:38.8316583' AS DateTime2), 1, 1.4999, N'I', N'VVS1', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (664, CAST(N'2024-06-11T20:23:38.8317126' AS DateTime2), 1, 1.4999, N'I', N'VVS2', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (665, CAST(N'2024-06-11T20:23:38.8317698' AS DateTime2), 1, 1.4999, N'I', N'VS1', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (666, CAST(N'2024-06-11T20:23:38.8318038' AS DateTime2), 1, 1.4999, N'I', N'VS2', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (667, CAST(N'2024-06-11T20:23:38.8318304' AS DateTime2), 1, 1.4999, N'I', N'SI1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (668, CAST(N'2024-06-11T20:23:38.8318567' AS DateTime2), 1, 1.4999, N'I', N'SI2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (669, CAST(N'2024-06-11T20:23:38.8318821' AS DateTime2), 1, 1.4999, N'I', N'SI3', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (670, CAST(N'2024-06-11T20:23:38.8319210' AS DateTime2), 1, 1.4999, N'I', N'I1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (671, CAST(N'2024-06-11T20:23:38.8319513' AS DateTime2), 1, 1.4999, N'I', N'I2', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (672, CAST(N'2024-06-11T20:23:38.8319770' AS DateTime2), 1, 1.4999, N'I', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (673, CAST(N'2024-06-11T20:23:38.8320018' AS DateTime2), 1, 1.4999, N'J', N'FL', 70)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (674, CAST(N'2024-06-11T20:23:38.8320219' AS DateTime2), 1, 1.4999, N'J', N'IF', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (675, CAST(N'2024-06-11T20:23:38.8320522' AS DateTime2), 1, 1.4999, N'J', N'VVS1', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (676, CAST(N'2024-06-11T20:23:38.8320849' AS DateTime2), 1, 1.4999, N'J', N'VVS2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (677, CAST(N'2024-06-11T20:23:38.8321136' AS DateTime2), 1, 1.4999, N'J', N'VS1', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (678, CAST(N'2024-06-11T20:23:38.8321593' AS DateTime2), 1, 1.4999, N'J', N'VS2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (679, CAST(N'2024-06-11T20:23:38.8321964' AS DateTime2), 1, 1.4999, N'J', N'SI1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (680, CAST(N'2024-06-11T20:23:38.8322654' AS DateTime2), 1, 1.4999, N'J', N'SI2', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (681, CAST(N'2024-06-11T20:23:38.8323018' AS DateTime2), 1, 1.4999, N'J', N'SI3', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (682, CAST(N'2024-06-11T20:23:38.8323351' AS DateTime2), 1, 1.4999, N'J', N'I1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (683, CAST(N'2024-06-11T20:23:38.8323601' AS DateTime2), 1, 1.4999, N'J', N'I2', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (684, CAST(N'2024-06-11T20:23:38.8323860' AS DateTime2), 1, 1.4999, N'J', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (685, CAST(N'2024-06-11T20:23:38.8324258' AS DateTime2), 1, 1.4999, N'K', N'FL', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (686, CAST(N'2024-06-11T20:23:38.8324508' AS DateTime2), 1, 1.4999, N'K', N'IF', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (687, CAST(N'2024-06-11T20:23:38.8324816' AS DateTime2), 1, 1.4999, N'K', N'VVS1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (688, CAST(N'2024-06-11T20:23:38.8325252' AS DateTime2), 1, 1.4999, N'K', N'VVS2', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (689, CAST(N'2024-06-11T20:23:38.8325712' AS DateTime2), 1, 1.4999, N'K', N'VS1', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (690, CAST(N'2024-06-11T20:23:38.8326226' AS DateTime2), 1, 1.4999, N'K', N'VS2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (691, CAST(N'2024-06-11T20:23:38.8326745' AS DateTime2), 1, 1.4999, N'K', N'SI1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (692, CAST(N'2024-06-11T20:23:38.8327113' AS DateTime2), 1, 1.4999, N'K', N'SI2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (693, CAST(N'2024-06-11T20:23:38.8327383' AS DateTime2), 1, 1.4999, N'K', N'SI3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (694, CAST(N'2024-06-11T20:23:38.8327633' AS DateTime2), 1, 1.4999, N'K', N'I1', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (695, CAST(N'2024-06-11T20:23:38.8327964' AS DateTime2), 1, 1.4999, N'K', N'I2', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (696, CAST(N'2024-06-11T20:23:38.8328232' AS DateTime2), 1, 1.4999, N'K', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (697, CAST(N'2024-06-11T20:23:38.8328504' AS DateTime2), 1, 1.4999, N'L', N'FL', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (698, CAST(N'2024-06-11T20:23:38.8328741' AS DateTime2), 1, 1.4999, N'L', N'IF', 40)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (699, CAST(N'2024-06-11T20:23:38.8328966' AS DateTime2), 1, 1.4999, N'L', N'VVS1', 37)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (700, CAST(N'2024-06-11T20:23:38.8329270' AS DateTime2), 1, 1.4999, N'L', N'VVS2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (701, CAST(N'2024-06-11T20:23:38.8329616' AS DateTime2), 1, 1.4999, N'L', N'VS1', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (702, CAST(N'2024-06-11T20:23:38.8329906' AS DateTime2), 1, 1.4999, N'L', N'VS2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (703, CAST(N'2024-06-11T20:23:38.8330188' AS DateTime2), 1, 1.4999, N'L', N'SI1', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (704, CAST(N'2024-06-11T20:23:38.8330624' AS DateTime2), 1, 1.4999, N'L', N'SI2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (705, CAST(N'2024-06-11T20:23:38.8330947' AS DateTime2), 1, 1.4999, N'L', N'SI3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (706, CAST(N'2024-06-11T20:23:38.8331454' AS DateTime2), 1, 1.4999, N'L', N'I1', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (707, CAST(N'2024-06-11T20:23:38.8331937' AS DateTime2), 1, 1.4999, N'L', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (708, CAST(N'2024-06-11T20:23:38.8332242' AS DateTime2), 1, 1.4999, N'L', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (709, CAST(N'2024-06-11T20:23:38.8332600' AS DateTime2), 1, 1.4999, N'M', N'FL', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (710, CAST(N'2024-06-11T20:23:38.8332921' AS DateTime2), 1, 1.4999, N'M', N'IF', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (711, CAST(N'2024-06-11T20:23:38.8333356' AS DateTime2), 1, 1.4999, N'M', N'VVS1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (712, CAST(N'2024-06-11T20:23:38.8333697' AS DateTime2), 1, 1.4999, N'M', N'VVS2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (713, CAST(N'2024-06-11T20:23:38.8334126' AS DateTime2), 1, 1.4999, N'M', N'VS1', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (714, CAST(N'2024-06-11T20:23:38.8334628' AS DateTime2), 1, 1.4999, N'M', N'VS2', 28)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (715, CAST(N'2024-06-11T20:23:38.8335110' AS DateTime2), 1, 1.4999, N'M', N'SI1', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (716, CAST(N'2024-06-11T20:23:38.8335584' AS DateTime2), 1, 1.4999, N'M', N'SI2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (717, CAST(N'2024-06-11T20:23:38.8336024' AS DateTime2), 1, 1.4999, N'M', N'SI3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (718, CAST(N'2024-06-11T20:23:38.8336307' AS DateTime2), 1, 1.4999, N'M', N'I1', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (719, CAST(N'2024-06-11T20:23:38.8336548' AS DateTime2), 1, 1.4999, N'M', N'I2', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (720, CAST(N'2024-06-11T20:23:38.8336785' AS DateTime2), 1, 1.4999, N'M', N'I3', 10)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (721, CAST(N'2024-06-11T20:23:39.3224688' AS DateTime2), 1.5, 1.9999, N'D', N'FL', 268)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (722, CAST(N'2024-06-11T20:23:39.3225985' AS DateTime2), 1.5, 1.9999, N'D', N'IF', 243)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (723, CAST(N'2024-06-11T20:23:39.3226464' AS DateTime2), 1.5, 1.9999, N'D', N'VVS1', 212)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (724, CAST(N'2024-06-11T20:23:39.3226831' AS DateTime2), 1.5, 1.9999, N'D', N'VVS2', 174)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (725, CAST(N'2024-06-11T20:23:39.3227163' AS DateTime2), 1.5, 1.9999, N'D', N'VS1', 146)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (726, CAST(N'2024-06-11T20:23:39.3227482' AS DateTime2), 1.5, 1.9999, N'D', N'VS2', 126)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (727, CAST(N'2024-06-11T20:23:39.3260672' AS DateTime2), 1.5, 1.9999, N'D', N'SI1', 101)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (728, CAST(N'2024-06-11T20:23:39.3263880' AS DateTime2), 1.5, 1.9999, N'D', N'SI2', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (729, CAST(N'2024-06-11T20:23:39.3264645' AS DateTime2), 1.5, 1.9999, N'D', N'SI3', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (730, CAST(N'2024-06-11T20:23:39.3265250' AS DateTime2), 1.5, 1.9999, N'D', N'I1', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (731, CAST(N'2024-06-11T20:23:39.3265829' AS DateTime2), 1.5, 1.9999, N'D', N'I2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (732, CAST(N'2024-06-11T20:23:39.3269104' AS DateTime2), 1.5, 1.9999, N'D', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (733, CAST(N'2024-06-11T20:23:39.3287574' AS DateTime2), 1.5, 1.9999, N'E', N'FL', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (734, CAST(N'2024-06-11T20:23:39.3289186' AS DateTime2), 1.5, 1.9999, N'E', N'IF', 209)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (735, CAST(N'2024-06-11T20:23:39.3289704' AS DateTime2), 1.5, 1.9999, N'E', N'VVS1', 193)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (736, CAST(N'2024-06-11T20:23:39.3290014' AS DateTime2), 1.5, 1.9999, N'E', N'VVS2', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (737, CAST(N'2024-06-11T20:23:39.3290441' AS DateTime2), 1.5, 1.9999, N'E', N'VS1', 133)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (738, CAST(N'2024-06-11T20:23:39.3290749' AS DateTime2), 1.5, 1.9999, N'E', N'VS2', 116)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (739, CAST(N'2024-06-11T20:23:39.3291035' AS DateTime2), 1.5, 1.9999, N'E', N'SI1', 94)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (740, CAST(N'2024-06-11T20:23:39.3291531' AS DateTime2), 1.5, 1.9999, N'E', N'SI2', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (741, CAST(N'2024-06-11T20:23:39.3291900' AS DateTime2), 1.5, 1.9999, N'E', N'SI3', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (742, CAST(N'2024-06-11T20:23:39.3292365' AS DateTime2), 1.5, 1.9999, N'E', N'I1', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (743, CAST(N'2024-06-11T20:23:39.3292731' AS DateTime2), 1.5, 1.9999, N'E', N'I2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (744, CAST(N'2024-06-11T20:23:39.3293593' AS DateTime2), 1.5, 1.9999, N'E', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (745, CAST(N'2024-06-11T20:23:39.3294734' AS DateTime2), 1.5, 1.9999, N'F', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (746, CAST(N'2024-06-11T20:23:39.3295645' AS DateTime2), 1.5, 1.9999, N'F', N'IF', 183)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (747, CAST(N'2024-06-11T20:23:39.3296260' AS DateTime2), 1.5, 1.9999, N'F', N'VVS1', 171)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (748, CAST(N'2024-06-11T20:23:39.3296586' AS DateTime2), 1.5, 1.9999, N'F', N'VVS2', 148)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (749, CAST(N'2024-06-11T20:23:39.3296831' AS DateTime2), 1.5, 1.9999, N'F', N'VS1', 122)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (750, CAST(N'2024-06-11T20:23:39.3297070' AS DateTime2), 1.5, 1.9999, N'F', N'VS2', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (751, CAST(N'2024-06-11T20:23:39.3297303' AS DateTime2), 1.5, 1.9999, N'F', N'SI1', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (752, CAST(N'2024-06-11T20:23:39.3297535' AS DateTime2), 1.5, 1.9999, N'F', N'SI2', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (753, CAST(N'2024-06-11T20:23:39.3297865' AS DateTime2), 1.5, 1.9999, N'F', N'SI3', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (754, CAST(N'2024-06-11T20:23:39.3298104' AS DateTime2), 1.5, 1.9999, N'F', N'I1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (755, CAST(N'2024-06-11T20:23:39.3298330' AS DateTime2), 1.5, 1.9999, N'F', N'I2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (756, CAST(N'2024-06-11T20:23:39.3300295' AS DateTime2), 1.5, 1.9999, N'F', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (757, CAST(N'2024-06-11T20:23:39.3301056' AS DateTime2), 1.5, 1.9999, N'G', N'FL', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (758, CAST(N'2024-06-11T20:23:39.3301602' AS DateTime2), 1.5, 1.9999, N'G', N'IF', 151)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (759, CAST(N'2024-06-11T20:23:39.3302021' AS DateTime2), 1.5, 1.9999, N'G', N'VVS1', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (760, CAST(N'2024-06-11T20:23:39.3302352' AS DateTime2), 1.5, 1.9999, N'G', N'VVS2', 126)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (761, CAST(N'2024-06-11T20:23:39.3302663' AS DateTime2), 1.5, 1.9999, N'G', N'VS1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (762, CAST(N'2024-06-11T20:23:39.3302973' AS DateTime2), 1.5, 1.9999, N'G', N'VS2', 97)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (763, CAST(N'2024-06-11T20:23:39.3303364' AS DateTime2), 1.5, 1.9999, N'G', N'SI1', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (764, CAST(N'2024-06-11T20:23:39.3303934' AS DateTime2), 1.5, 1.9999, N'G', N'SI2', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (765, CAST(N'2024-06-11T20:23:39.3304532' AS DateTime2), 1.5, 1.9999, N'G', N'SI3', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (766, CAST(N'2024-06-11T20:23:39.3305239' AS DateTime2), 1.5, 1.9999, N'G', N'I1', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (767, CAST(N'2024-06-11T20:23:39.3305805' AS DateTime2), 1.5, 1.9999, N'G', N'I2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (768, CAST(N'2024-06-11T20:23:39.3306140' AS DateTime2), 1.5, 1.9999, N'G', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (769, CAST(N'2024-06-11T20:23:39.3306683' AS DateTime2), 1.5, 1.9999, N'H', N'FL', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (770, CAST(N'2024-06-11T20:23:39.3307243' AS DateTime2), 1.5, 1.9999, N'H', N'IF', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (771, CAST(N'2024-06-11T20:23:39.3312749' AS DateTime2), 1.5, 1.9999, N'H', N'VVS1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (772, CAST(N'2024-06-11T20:23:39.3313911' AS DateTime2), 1.5, 1.9999, N'H', N'VVS2', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (773, CAST(N'2024-06-11T20:23:39.3314325' AS DateTime2), 1.5, 1.9999, N'H', N'VS1', 94)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (774, CAST(N'2024-06-11T20:23:39.3315689' AS DateTime2), 1.5, 1.9999, N'H', N'VS2', 85)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (775, CAST(N'2024-06-11T20:23:39.3317815' AS DateTime2), 1.5, 1.9999, N'H', N'SI1', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (776, CAST(N'2024-06-11T20:23:39.3318860' AS DateTime2), 1.5, 1.9999, N'H', N'SI2', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (777, CAST(N'2024-06-11T20:23:39.3320072' AS DateTime2), 1.5, 1.9999, N'H', N'SI3', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (778, CAST(N'2024-06-11T20:23:39.3320981' AS DateTime2), 1.5, 1.9999, N'H', N'I1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (779, CAST(N'2024-06-11T20:23:39.3321715' AS DateTime2), 1.5, 1.9999, N'H', N'I2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (780, CAST(N'2024-06-11T20:23:39.3322267' AS DateTime2), 1.5, 1.9999, N'H', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (781, CAST(N'2024-06-11T20:23:39.3322840' AS DateTime2), 1.5, 1.9999, N'I', N'FL', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (782, CAST(N'2024-06-11T20:23:39.3323245' AS DateTime2), 1.5, 1.9999, N'I', N'IF', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (783, CAST(N'2024-06-11T20:23:39.3323691' AS DateTime2), 1.5, 1.9999, N'I', N'VVS1', 96)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (784, CAST(N'2024-06-11T20:23:39.3324155' AS DateTime2), 1.5, 1.9999, N'I', N'VVS2', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (785, CAST(N'2024-06-11T20:23:39.3324493' AS DateTime2), 1.5, 1.9999, N'I', N'VS1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (786, CAST(N'2024-06-11T20:23:39.3324801' AS DateTime2), 1.5, 1.9999, N'I', N'VS2', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (787, CAST(N'2024-06-11T20:23:39.3325106' AS DateTime2), 1.5, 1.9999, N'I', N'SI1', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (788, CAST(N'2024-06-11T20:23:39.3325412' AS DateTime2), 1.5, 1.9999, N'I', N'SI2', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (789, CAST(N'2024-06-11T20:23:39.3325696' AS DateTime2), 1.5, 1.9999, N'I', N'SI3', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (790, CAST(N'2024-06-11T20:23:39.3326232' AS DateTime2), 1.5, 1.9999, N'I', N'I1', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (791, CAST(N'2024-06-11T20:23:39.3326699' AS DateTime2), 1.5, 1.9999, N'I', N'I2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (792, CAST(N'2024-06-11T20:23:39.3327821' AS DateTime2), 1.5, 1.9999, N'I', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (793, CAST(N'2024-06-11T20:23:39.3328443' AS DateTime2), 1.5, 1.9999, N'J', N'FL', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (794, CAST(N'2024-06-11T20:23:39.3328928' AS DateTime2), 1.5, 1.9999, N'J', N'IF', 85)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (795, CAST(N'2024-06-11T20:23:39.3329463' AS DateTime2), 1.5, 1.9999, N'J', N'VVS1', 78)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (796, CAST(N'2024-06-11T20:23:39.3329810' AS DateTime2), 1.5, 1.9999, N'J', N'VVS2', 72)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (797, CAST(N'2024-06-11T20:23:39.3330121' AS DateTime2), 1.5, 1.9999, N'J', N'VS1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (798, CAST(N'2024-06-11T20:23:39.3330420' AS DateTime2), 1.5, 1.9999, N'J', N'VS2', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (799, CAST(N'2024-06-11T20:23:39.3330718' AS DateTime2), 1.5, 1.9999, N'J', N'SI1', 55)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (800, CAST(N'2024-06-11T20:23:39.3331071' AS DateTime2), 1.5, 1.9999, N'J', N'SI2', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (801, CAST(N'2024-06-11T20:23:39.3331353' AS DateTime2), 1.5, 1.9999, N'J', N'SI3', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (802, CAST(N'2024-06-11T20:23:39.3331835' AS DateTime2), 1.5, 1.9999, N'J', N'I1', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (803, CAST(N'2024-06-11T20:23:39.3332919' AS DateTime2), 1.5, 1.9999, N'J', N'I2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (804, CAST(N'2024-06-11T20:23:39.3333494' AS DateTime2), 1.5, 1.9999, N'J', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (805, CAST(N'2024-06-11T20:23:39.3334290' AS DateTime2), 1.5, 1.9999, N'K', N'FL', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (806, CAST(N'2024-06-11T20:23:39.3334737' AS DateTime2), 1.5, 1.9999, N'K', N'IF', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (807, CAST(N'2024-06-11T20:23:39.3335139' AS DateTime2), 1.5, 1.9999, N'K', N'VVS1', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (808, CAST(N'2024-06-11T20:23:39.3335473' AS DateTime2), 1.5, 1.9999, N'K', N'VVS2', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (809, CAST(N'2024-06-11T20:23:39.3335973' AS DateTime2), 1.5, 1.9999, N'K', N'VS1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (810, CAST(N'2024-06-11T20:23:39.3336300' AS DateTime2), 1.5, 1.9999, N'K', N'VS2', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (811, CAST(N'2024-06-11T20:23:39.3336608' AS DateTime2), 1.5, 1.9999, N'K', N'SI1', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (812, CAST(N'2024-06-11T20:23:39.3336890' AS DateTime2), 1.5, 1.9999, N'K', N'SI2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (813, CAST(N'2024-06-11T20:23:39.3337135' AS DateTime2), 1.5, 1.9999, N'K', N'SI3', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (814, CAST(N'2024-06-11T20:23:39.3337611' AS DateTime2), 1.5, 1.9999, N'K', N'I1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (815, CAST(N'2024-06-11T20:23:39.3338720' AS DateTime2), 1.5, 1.9999, N'K', N'I2', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (816, CAST(N'2024-06-11T20:23:39.3339313' AS DateTime2), 1.5, 1.9999, N'K', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (817, CAST(N'2024-06-11T20:23:39.3339956' AS DateTime2), 1.5, 1.9999, N'L', N'FL', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (818, CAST(N'2024-06-11T20:23:39.3340424' AS DateTime2), 1.5, 1.9999, N'L', N'IF', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (819, CAST(N'2024-06-11T20:23:39.3341036' AS DateTime2), 1.5, 1.9999, N'L', N'VVS1', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (820, CAST(N'2024-06-11T20:23:39.3341420' AS DateTime2), 1.5, 1.9999, N'L', N'VVS2', 53)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (821, CAST(N'2024-06-11T20:23:39.3341731' AS DateTime2), 1.5, 1.9999, N'L', N'VS1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (822, CAST(N'2024-06-11T20:23:39.3342040' AS DateTime2), 1.5, 1.9999, N'L', N'VS2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (823, CAST(N'2024-06-11T20:23:39.3342352' AS DateTime2), 1.5, 1.9999, N'L', N'SI1', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (824, CAST(N'2024-06-11T20:23:39.3342599' AS DateTime2), 1.5, 1.9999, N'L', N'SI2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (825, CAST(N'2024-06-11T20:23:39.3343097' AS DateTime2), 1.5, 1.9999, N'L', N'SI3', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (826, CAST(N'2024-06-11T20:23:39.3344078' AS DateTime2), 1.5, 1.9999, N'L', N'I1', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (827, CAST(N'2024-06-11T20:23:39.3346922' AS DateTime2), 1.5, 1.9999, N'L', N'I2', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (828, CAST(N'2024-06-11T20:23:39.3347548' AS DateTime2), 1.5, 1.9999, N'L', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (829, CAST(N'2024-06-11T20:23:39.3347915' AS DateTime2), 1.5, 1.9999, N'M', N'FL', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (830, CAST(N'2024-06-11T20:23:39.3348350' AS DateTime2), 1.5, 1.9999, N'M', N'IF', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (831, CAST(N'2024-06-11T20:23:39.3348615' AS DateTime2), 1.5, 1.9999, N'M', N'VVS1', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (832, CAST(N'2024-06-11T20:23:39.3348865' AS DateTime2), 1.5, 1.9999, N'M', N'VVS2', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (833, CAST(N'2024-06-11T20:23:39.3349095' AS DateTime2), 1.5, 1.9999, N'M', N'VS1', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (834, CAST(N'2024-06-11T20:23:39.3349317' AS DateTime2), 1.5, 1.9999, N'M', N'VS2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (835, CAST(N'2024-06-11T20:23:39.3349634' AS DateTime2), 1.5, 1.9999, N'M', N'SI1', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (836, CAST(N'2024-06-11T20:23:39.3349877' AS DateTime2), 1.5, 1.9999, N'M', N'SI2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (837, CAST(N'2024-06-11T20:23:39.3350109' AS DateTime2), 1.5, 1.9999, N'M', N'SI3', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (838, CAST(N'2024-06-11T20:23:39.3350340' AS DateTime2), 1.5, 1.9999, N'M', N'I1', 32)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (839, CAST(N'2024-06-11T20:23:39.3350581' AS DateTime2), 1.5, 1.9999, N'M', N'I2', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (840, CAST(N'2024-06-11T20:23:39.3350803' AS DateTime2), 1.5, 1.9999, N'M', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (841, CAST(N'2024-06-11T20:23:39.5787320' AS DateTime2), 2, 2.9999, N'D', N'FL', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (842, CAST(N'2024-06-11T20:23:39.5791264' AS DateTime2), 2, 2.9999, N'D', N'IF', 390)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (843, CAST(N'2024-06-11T20:23:39.5791986' AS DateTime2), 2, 2.9999, N'D', N'VVS1', 320)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (844, CAST(N'2024-06-11T20:23:39.5792545' AS DateTime2), 2, 2.9999, N'D', N'VVS2', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (845, CAST(N'2024-06-11T20:23:39.5792876' AS DateTime2), 2, 2.9999, N'D', N'VS1', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (846, CAST(N'2024-06-11T20:23:39.5793188' AS DateTime2), 2, 2.9999, N'D', N'VS2', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (847, CAST(N'2024-06-11T20:23:39.5793497' AS DateTime2), 2, 2.9999, N'D', N'SI1', 147)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (848, CAST(N'2024-06-11T20:23:39.5793801' AS DateTime2), 2, 2.9999, N'D', N'SI2', 118)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (849, CAST(N'2024-06-11T20:23:39.5794211' AS DateTime2), 2, 2.9999, N'D', N'SI3', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (850, CAST(N'2024-06-11T20:23:39.5794526' AS DateTime2), 2, 2.9999, N'D', N'I1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (851, CAST(N'2024-06-11T20:23:39.5794822' AS DateTime2), 2, 2.9999, N'D', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (852, CAST(N'2024-06-11T20:23:39.5795127' AS DateTime2), 2, 2.9999, N'D', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (853, CAST(N'2024-06-11T20:23:39.5795475' AS DateTime2), 2, 2.9999, N'E', N'FL', 350)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (854, CAST(N'2024-06-11T20:23:39.5804647' AS DateTime2), 2, 2.9999, N'E', N'IF', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (855, CAST(N'2024-06-11T20:23:39.5806729' AS DateTime2), 2, 2.9999, N'E', N'VVS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (856, CAST(N'2024-06-11T20:23:39.5807843' AS DateTime2), 2, 2.9999, N'E', N'VVS2', 240)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (857, CAST(N'2024-06-11T20:23:39.5808500' AS DateTime2), 2, 2.9999, N'E', N'VS1', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (858, CAST(N'2024-06-11T20:23:39.5809498' AS DateTime2), 2, 2.9999, N'E', N'VS2', 175)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (859, CAST(N'2024-06-11T20:23:39.5810467' AS DateTime2), 2, 2.9999, N'E', N'SI1', 138)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (860, CAST(N'2024-06-11T20:23:39.5811125' AS DateTime2), 2, 2.9999, N'E', N'SI2', 109)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (861, CAST(N'2024-06-11T20:23:39.5811666' AS DateTime2), 2, 2.9999, N'E', N'SI3', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (862, CAST(N'2024-06-11T20:23:39.5812186' AS DateTime2), 2, 2.9999, N'E', N'I1', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (863, CAST(N'2024-06-11T20:23:39.5812749' AS DateTime2), 2, 2.9999, N'E', N'I2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (864, CAST(N'2024-06-11T20:23:39.5813312' AS DateTime2), 2, 2.9999, N'E', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (865, CAST(N'2024-06-11T20:23:39.5814322' AS DateTime2), 2, 2.9999, N'F', N'FL', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (866, CAST(N'2024-06-11T20:23:39.5814758' AS DateTime2), 2, 2.9999, N'F', N'IF', 265)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (867, CAST(N'2024-06-11T20:23:39.5815026' AS DateTime2), 2, 2.9999, N'F', N'VVS1', 245)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (868, CAST(N'2024-06-11T20:23:39.5815296' AS DateTime2), 2, 2.9999, N'F', N'VVS2', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (869, CAST(N'2024-06-11T20:23:39.5815555' AS DateTime2), 2, 2.9999, N'F', N'VS1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (870, CAST(N'2024-06-11T20:23:39.5815919' AS DateTime2), 2, 2.9999, N'F', N'VS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (871, CAST(N'2024-06-11T20:23:39.5816200' AS DateTime2), 2, 2.9999, N'F', N'SI1', 128)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (872, CAST(N'2024-06-11T20:23:39.5816462' AS DateTime2), 2, 2.9999, N'F', N'SI2', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (873, CAST(N'2024-06-11T20:23:39.5816717' AS DateTime2), 2, 2.9999, N'F', N'SI3', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (874, CAST(N'2024-06-11T20:23:39.5816969' AS DateTime2), 2, 2.9999, N'F', N'I1', 72)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (875, CAST(N'2024-06-11T20:23:39.5817286' AS DateTime2), 2, 2.9999, N'F', N'I2', 36)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (876, CAST(N'2024-06-11T20:23:39.5817556' AS DateTime2), 2, 2.9999, N'F', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (877, CAST(N'2024-06-11T20:23:39.5817836' AS DateTime2), 2, 2.9999, N'G', N'FL', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (878, CAST(N'2024-06-11T20:23:39.5831387' AS DateTime2), 2, 2.9999, N'G', N'IF', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (879, CAST(N'2024-06-11T20:23:39.5833311' AS DateTime2), 2, 2.9999, N'G', N'VVS1', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (880, CAST(N'2024-06-11T20:23:39.5834806' AS DateTime2), 2, 2.9999, N'G', N'VVS2', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (881, CAST(N'2024-06-11T20:23:39.5835763' AS DateTime2), 2, 2.9999, N'G', N'VS1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (882, CAST(N'2024-06-11T20:23:39.5836652' AS DateTime2), 2, 2.9999, N'G', N'VS2', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (883, CAST(N'2024-06-11T20:23:39.5837483' AS DateTime2), 2, 2.9999, N'G', N'SI1', 117)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (884, CAST(N'2024-06-11T20:23:39.5838307' AS DateTime2), 2, 2.9999, N'G', N'SI2', 96)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (885, CAST(N'2024-06-11T20:23:39.5839779' AS DateTime2), 2, 2.9999, N'G', N'SI3', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (886, CAST(N'2024-06-11T20:23:39.5840902' AS DateTime2), 2, 2.9999, N'G', N'I1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (887, CAST(N'2024-06-11T20:23:39.5841503' AS DateTime2), 2, 2.9999, N'G', N'I2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (888, CAST(N'2024-06-11T20:23:39.5841885' AS DateTime2), 2, 2.9999, N'G', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (889, CAST(N'2024-06-11T20:23:39.5842223' AS DateTime2), 2, 2.9999, N'H', N'FL', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (890, CAST(N'2024-06-11T20:23:39.5842486' AS DateTime2), 2, 2.9999, N'H', N'IF', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (891, CAST(N'2024-06-11T20:23:39.5842981' AS DateTime2), 2, 2.9999, N'H', N'VVS1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (892, CAST(N'2024-06-11T20:23:39.5843351' AS DateTime2), 2, 2.9999, N'H', N'VVS2', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (893, CAST(N'2024-06-11T20:23:39.5843673' AS DateTime2), 2, 2.9999, N'H', N'VS1', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (894, CAST(N'2024-06-11T20:23:39.5844001' AS DateTime2), 2, 2.9999, N'H', N'VS2', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (895, CAST(N'2024-06-11T20:23:39.5844307' AS DateTime2), 2, 2.9999, N'H', N'SI1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (896, CAST(N'2024-06-11T20:23:39.5844704' AS DateTime2), 2, 2.9999, N'H', N'SI2', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (897, CAST(N'2024-06-11T20:23:39.5845023' AS DateTime2), 2, 2.9999, N'H', N'SI3', 74)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (898, CAST(N'2024-06-11T20:23:39.5845272' AS DateTime2), 2, 2.9999, N'H', N'I1', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (899, CAST(N'2024-06-11T20:23:39.5845531' AS DateTime2), 2, 2.9999, N'H', N'I2', 33)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (900, CAST(N'2024-06-11T20:23:39.5846302' AS DateTime2), 2, 2.9999, N'H', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (901, CAST(N'2024-06-11T20:23:39.5853545' AS DateTime2), 2, 2.9999, N'I', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (902, CAST(N'2024-06-11T20:23:39.5856321' AS DateTime2), 2, 2.9999, N'I', N'IF', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (903, CAST(N'2024-06-11T20:23:39.5857358' AS DateTime2), 2, 2.9999, N'I', N'VVS1', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (904, CAST(N'2024-06-11T20:23:39.5858395' AS DateTime2), 2, 2.9999, N'I', N'VVS2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (905, CAST(N'2024-06-11T20:23:39.5860220' AS DateTime2), 2, 2.9999, N'I', N'VS1', 113)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (906, CAST(N'2024-06-11T20:23:39.5861209' AS DateTime2), 2, 2.9999, N'I', N'VS2', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (907, CAST(N'2024-06-11T20:23:39.5862624' AS DateTime2), 2, 2.9999, N'I', N'SI1', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (908, CAST(N'2024-06-11T20:23:39.5863131' AS DateTime2), 2, 2.9999, N'I', N'SI2', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (909, CAST(N'2024-06-11T20:23:39.5863541' AS DateTime2), 2, 2.9999, N'I', N'SI3', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (910, CAST(N'2024-06-11T20:23:39.5864193' AS DateTime2), 2, 2.9999, N'I', N'I1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (911, CAST(N'2024-06-11T20:23:39.5865044' AS DateTime2), 2, 2.9999, N'I', N'I2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (912, CAST(N'2024-06-11T20:23:39.5865857' AS DateTime2), 2, 2.9999, N'I', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (913, CAST(N'2024-06-11T20:23:39.5866552' AS DateTime2), 2, 2.9999, N'J', N'FL', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (914, CAST(N'2024-06-11T20:23:39.5866947' AS DateTime2), 2, 2.9999, N'J', N'IF', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (915, CAST(N'2024-06-11T20:23:39.5867260' AS DateTime2), 2, 2.9999, N'J', N'VVS1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (916, CAST(N'2024-06-11T20:23:39.5867601' AS DateTime2), 2, 2.9999, N'J', N'VVS2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (917, CAST(N'2024-06-11T20:23:39.5868167' AS DateTime2), 2, 2.9999, N'J', N'VS1', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (918, CAST(N'2024-06-11T20:23:39.5868477' AS DateTime2), 2, 2.9999, N'J', N'VS2', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (919, CAST(N'2024-06-11T20:23:39.5868723' AS DateTime2), 2, 2.9999, N'J', N'SI1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (920, CAST(N'2024-06-11T20:23:39.5868991' AS DateTime2), 2, 2.9999, N'J', N'SI2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (921, CAST(N'2024-06-11T20:23:39.5869933' AS DateTime2), 2, 2.9999, N'J', N'SI3', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (922, CAST(N'2024-06-11T20:23:39.5871022' AS DateTime2), 2, 2.9999, N'J', N'I1', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (923, CAST(N'2024-06-11T20:23:39.5877188' AS DateTime2), 2, 2.9999, N'J', N'I2', 29)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (924, CAST(N'2024-06-11T20:23:39.5878271' AS DateTime2), 2, 2.9999, N'J', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (925, CAST(N'2024-06-11T20:23:39.5879571' AS DateTime2), 2, 2.9999, N'K', N'FL', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (926, CAST(N'2024-06-11T20:23:39.5880198' AS DateTime2), 2, 2.9999, N'K', N'IF', 102)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (927, CAST(N'2024-06-11T20:23:39.5880667' AS DateTime2), 2, 2.9999, N'K', N'VVS1', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (928, CAST(N'2024-06-11T20:23:39.5884472' AS DateTime2), 2, 2.9999, N'K', N'VVS2', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (929, CAST(N'2024-06-11T20:23:39.5885250' AS DateTime2), 2, 2.9999, N'K', N'VS1', 79)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (930, CAST(N'2024-06-11T20:23:39.5886831' AS DateTime2), 2, 2.9999, N'K', N'VS2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (931, CAST(N'2024-06-11T20:23:39.5888117' AS DateTime2), 2, 2.9999, N'K', N'SI1', 68)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (932, CAST(N'2024-06-11T20:23:39.5888757' AS DateTime2), 2, 2.9999, N'K', N'SI2', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (933, CAST(N'2024-06-11T20:23:39.5889828' AS DateTime2), 2, 2.9999, N'K', N'SI3', 56)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (934, CAST(N'2024-06-11T20:23:39.5890647' AS DateTime2), 2, 2.9999, N'K', N'I1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (935, CAST(N'2024-06-11T20:23:39.5891216' AS DateTime2), 2, 2.9999, N'K', N'I2', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (936, CAST(N'2024-06-11T20:23:39.5891732' AS DateTime2), 2, 2.9999, N'K', N'I3', 12)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (937, CAST(N'2024-06-11T20:23:39.5892272' AS DateTime2), 2, 2.9999, N'L', N'FL', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (938, CAST(N'2024-06-11T20:23:39.5892947' AS DateTime2), 2, 2.9999, N'L', N'IF', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (939, CAST(N'2024-06-11T20:23:39.5893517' AS DateTime2), 2, 2.9999, N'L', N'VVS1', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (940, CAST(N'2024-06-11T20:23:39.5917508' AS DateTime2), 2, 2.9999, N'L', N'VVS2', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (941, CAST(N'2024-06-11T20:23:39.5919719' AS DateTime2), 2, 2.9999, N'L', N'VS1', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (942, CAST(N'2024-06-11T20:23:39.5920832' AS DateTime2), 2, 2.9999, N'L', N'VS2', 64)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (943, CAST(N'2024-06-11T20:23:39.5921376' AS DateTime2), 2, 2.9999, N'L', N'SI1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (944, CAST(N'2024-06-11T20:23:39.5929705' AS DateTime2), 2, 2.9999, N'L', N'SI2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (945, CAST(N'2024-06-11T20:23:39.5934156' AS DateTime2), 2, 2.9999, N'L', N'SI3', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (946, CAST(N'2024-06-11T20:23:39.5936485' AS DateTime2), 2, 2.9999, N'L', N'I1', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (947, CAST(N'2024-06-11T20:23:39.5937142' AS DateTime2), 2, 2.9999, N'L', N'I2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (948, CAST(N'2024-06-11T20:23:39.5937480' AS DateTime2), 2, 2.9999, N'L', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (949, CAST(N'2024-06-11T20:23:39.5938042' AS DateTime2), 2, 2.9999, N'M', N'FL', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (950, CAST(N'2024-06-11T20:23:39.5938685' AS DateTime2), 2, 2.9999, N'M', N'IF', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (951, CAST(N'2024-06-11T20:23:39.5940753' AS DateTime2), 2, 2.9999, N'M', N'VVS1', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (952, CAST(N'2024-06-11T20:23:39.5942117' AS DateTime2), 2, 2.9999, N'M', N'VVS2', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (953, CAST(N'2024-06-11T20:23:39.6019712' AS DateTime2), 2, 2.9999, N'M', N'VS1', 61)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (954, CAST(N'2024-06-11T20:23:39.6021371' AS DateTime2), 2, 2.9999, N'M', N'VS2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (955, CAST(N'2024-06-11T20:23:39.6022371' AS DateTime2), 2, 2.9999, N'M', N'SI1', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (956, CAST(N'2024-06-11T20:23:39.6023068' AS DateTime2), 2, 2.9999, N'M', N'SI2', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (957, CAST(N'2024-06-11T20:23:39.6024062' AS DateTime2), 2, 2.9999, N'M', N'SI3', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (958, CAST(N'2024-06-11T20:23:39.6030896' AS DateTime2), 2, 2.9999, N'M', N'I1', 42)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (959, CAST(N'2024-06-11T20:23:39.6033417' AS DateTime2), 2, 2.9999, N'M', N'I2', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (960, CAST(N'2024-06-11T20:23:39.6035016' AS DateTime2), 2, 2.9999, N'M', N'I3', 13)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (961, CAST(N'2024-06-11T20:23:39.8333178' AS DateTime2), 3, 3.9999, N'D', N'FL', 680)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (962, CAST(N'2024-06-11T20:23:39.8334874' AS DateTime2), 3, 3.9999, N'D', N'IF', 640)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (963, CAST(N'2024-06-11T20:23:39.8335372' AS DateTime2), 3, 3.9999, N'D', N'VVS1', 545)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (964, CAST(N'2024-06-11T20:23:39.8335723' AS DateTime2), 3, 3.9999, N'D', N'VVS2', 465)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (965, CAST(N'2024-06-11T20:23:39.8336445' AS DateTime2), 3, 3.9999, N'D', N'VS1', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (966, CAST(N'2024-06-11T20:23:39.8336838' AS DateTime2), 3, 3.9999, N'D', N'VS2', 330)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (967, CAST(N'2024-06-11T20:23:39.8337316' AS DateTime2), 3, 3.9999, N'D', N'SI1', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (968, CAST(N'2024-06-11T20:23:39.8337685' AS DateTime2), 3, 3.9999, N'D', N'SI2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (969, CAST(N'2024-06-11T20:23:39.8338050' AS DateTime2), 3, 3.9999, N'D', N'SI3', 139)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (970, CAST(N'2024-06-11T20:23:39.8338555' AS DateTime2), 3, 3.9999, N'D', N'I1', 103)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (971, CAST(N'2024-06-11T20:23:39.8338924' AS DateTime2), 3, 3.9999, N'D', N'I2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (972, CAST(N'2024-06-11T20:23:39.8339261' AS DateTime2), 3, 3.9999, N'D', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (973, CAST(N'2024-06-11T20:23:39.8339604' AS DateTime2), 3, 3.9999, N'E', N'FL', 550)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (974, CAST(N'2024-06-11T20:23:39.8339935' AS DateTime2), 3, 3.9999, N'E', N'IF', 515)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (975, CAST(N'2024-06-11T20:23:39.8340345' AS DateTime2), 3, 3.9999, N'E', N'VVS1', 485)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (976, CAST(N'2024-06-11T20:23:39.8340862' AS DateTime2), 3, 3.9999, N'E', N'VVS2', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (977, CAST(N'2024-06-11T20:23:39.8341247' AS DateTime2), 3, 3.9999, N'E', N'VS1', 365)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (978, CAST(N'2024-06-11T20:23:39.8342292' AS DateTime2), 3, 3.9999, N'E', N'VS2', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (979, CAST(N'2024-06-11T20:23:39.8342807' AS DateTime2), 3, 3.9999, N'E', N'SI1', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (980, CAST(N'2024-06-11T20:23:39.8343222' AS DateTime2), 3, 3.9999, N'E', N'SI2', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (981, CAST(N'2024-06-11T20:23:39.8343877' AS DateTime2), 3, 3.9999, N'E', N'SI3', 131)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (982, CAST(N'2024-06-11T20:23:39.8344492' AS DateTime2), 3, 3.9999, N'E', N'I1', 98)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (983, CAST(N'2024-06-11T20:23:39.8344818' AS DateTime2), 3, 3.9999, N'E', N'I2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (984, CAST(N'2024-06-11T20:23:39.8345152' AS DateTime2), 3, 3.9999, N'E', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (985, CAST(N'2024-06-11T20:23:39.8345459' AS DateTime2), 3, 3.9999, N'F', N'FL', 500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (986, CAST(N'2024-06-11T20:23:39.8345824' AS DateTime2), 3, 3.9999, N'F', N'IF', 450)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (987, CAST(N'2024-06-11T20:23:39.8346418' AS DateTime2), 3, 3.9999, N'F', N'VVS1', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (988, CAST(N'2024-06-11T20:23:39.8347273' AS DateTime2), 3, 3.9999, N'F', N'VVS2', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (989, CAST(N'2024-06-11T20:23:39.8347976' AS DateTime2), 3, 3.9999, N'F', N'VS1', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (990, CAST(N'2024-06-11T20:23:39.8348679' AS DateTime2), 3, 3.9999, N'F', N'VS2', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (991, CAST(N'2024-06-11T20:23:39.8349164' AS DateTime2), 3, 3.9999, N'F', N'SI1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (992, CAST(N'2024-06-11T20:23:39.8349801' AS DateTime2), 3, 3.9999, N'F', N'SI2', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (993, CAST(N'2024-06-11T20:23:39.8350302' AS DateTime2), 3, 3.9999, N'F', N'SI3', 124)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (994, CAST(N'2024-06-11T20:23:39.8350744' AS DateTime2), 3, 3.9999, N'F', N'I1', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (995, CAST(N'2024-06-11T20:23:39.8351139' AS DateTime2), 3, 3.9999, N'F', N'I2', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (996, CAST(N'2024-06-11T20:23:39.8351830' AS DateTime2), 3, 3.9999, N'F', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (997, CAST(N'2024-06-11T20:23:39.8352519' AS DateTime2), 3, 3.9999, N'G', N'FL', 420)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (998, CAST(N'2024-06-11T20:23:39.8352919' AS DateTime2), 3, 3.9999, N'G', N'IF', 380)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (999, CAST(N'2024-06-11T20:23:39.8353223' AS DateTime2), 3, 3.9999, N'G', N'VVS1', 355)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1000, CAST(N'2024-06-11T20:23:39.8353592' AS DateTime2), 3, 3.9999, N'G', N'VVS2', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1001, CAST(N'2024-06-11T20:23:39.8354009' AS DateTime2), 3, 3.9999, N'G', N'VS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1002, CAST(N'2024-06-11T20:23:39.8354307' AS DateTime2), 3, 3.9999, N'G', N'VS2', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1003, CAST(N'2024-06-11T20:23:39.8354765' AS DateTime2), 3, 3.9999, N'G', N'SI1', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1004, CAST(N'2024-06-11T20:23:39.8355087' AS DateTime2), 3, 3.9999, N'G', N'SI2', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1005, CAST(N'2024-06-11T20:23:39.8355357' AS DateTime2), 3, 3.9999, N'G', N'SI3', 112)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1006, CAST(N'2024-06-11T20:23:39.8355598' AS DateTime2), 3, 3.9999, N'G', N'I1', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1007, CAST(N'2024-06-11T20:23:39.8355832' AS DateTime2), 3, 3.9999, N'G', N'I2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1008, CAST(N'2024-06-11T20:23:39.8356152' AS DateTime2), 3, 3.9999, N'G', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1009, CAST(N'2024-06-11T20:23:39.8356433' AS DateTime2), 3, 3.9999, N'H', N'FL', 330)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1010, CAST(N'2024-06-11T20:23:39.8356668' AS DateTime2), 3, 3.9999, N'H', N'IF', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1011, CAST(N'2024-06-11T20:23:39.8356922' AS DateTime2), 3, 3.9999, N'H', N'VVS1', 280)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1012, CAST(N'2024-06-11T20:23:39.8357172' AS DateTime2), 3, 3.9999, N'H', N'VVS2', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1013, CAST(N'2024-06-11T20:23:39.8357603' AS DateTime2), 3, 3.9999, N'H', N'VS1', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1014, CAST(N'2024-06-11T20:23:39.8359758' AS DateTime2), 3, 3.9999, N'H', N'VS2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1015, CAST(N'2024-06-11T20:23:39.8360201' AS DateTime2), 3, 3.9999, N'H', N'SI1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1016, CAST(N'2024-06-11T20:23:39.8360529' AS DateTime2), 3, 3.9999, N'H', N'SI2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1017, CAST(N'2024-06-11T20:23:39.8360812' AS DateTime2), 3, 3.9999, N'H', N'SI3', 101)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1018, CAST(N'2024-06-11T20:23:39.8361101' AS DateTime2), 3, 3.9999, N'H', N'I1', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1019, CAST(N'2024-06-11T20:23:39.8361461' AS DateTime2), 3, 3.9999, N'H', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1020, CAST(N'2024-06-11T20:23:39.8361717' AS DateTime2), 3, 3.9999, N'H', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1021, CAST(N'2024-06-11T20:23:39.8361996' AS DateTime2), 3, 3.9999, N'I', N'FL', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1022, CAST(N'2024-06-11T20:23:39.8362289' AS DateTime2), 3, 3.9999, N'I', N'IF', 245)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1023, CAST(N'2024-06-11T20:23:39.8362583' AS DateTime2), 3, 3.9999, N'I', N'VVS1', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1024, CAST(N'2024-06-11T20:23:39.8363047' AS DateTime2), 3, 3.9999, N'I', N'VVS2', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1025, CAST(N'2024-06-11T20:23:39.8363631' AS DateTime2), 3, 3.9999, N'I', N'VS1', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1026, CAST(N'2024-06-11T20:23:39.8363949' AS DateTime2), 3, 3.9999, N'I', N'VS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1027, CAST(N'2024-06-11T20:23:39.8364223' AS DateTime2), 3, 3.9999, N'I', N'SI1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1028, CAST(N'2024-06-11T20:23:39.8364509' AS DateTime2), 3, 3.9999, N'I', N'SI2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1029, CAST(N'2024-06-11T20:23:39.8364917' AS DateTime2), 3, 3.9999, N'I', N'SI3', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1030, CAST(N'2024-06-11T20:23:39.8365216' AS DateTime2), 3, 3.9999, N'I', N'I1', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1031, CAST(N'2024-06-11T20:23:39.8365498' AS DateTime2), 3, 3.9999, N'I', N'I2', 38)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1032, CAST(N'2024-06-11T20:23:39.8365774' AS DateTime2), 3, 3.9999, N'I', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1033, CAST(N'2024-06-11T20:23:39.8366084' AS DateTime2), 3, 3.9999, N'J', N'FL', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1034, CAST(N'2024-06-11T20:23:39.8366458' AS DateTime2), 3, 3.9999, N'J', N'IF', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1035, CAST(N'2024-06-11T20:23:39.8366729' AS DateTime2), 3, 3.9999, N'J', N'VVS1', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1036, CAST(N'2024-06-11T20:23:39.8367022' AS DateTime2), 3, 3.9999, N'J', N'VVS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1037, CAST(N'2024-06-11T20:23:39.8367302' AS DateTime2), 3, 3.9999, N'J', N'VS1', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1038, CAST(N'2024-06-11T20:23:39.8367588' AS DateTime2), 3, 3.9999, N'J', N'VS2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1039, CAST(N'2024-06-11T20:23:39.8367866' AS DateTime2), 3, 3.9999, N'J', N'SI1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1040, CAST(N'2024-06-11T20:23:39.8368231' AS DateTime2), 3, 3.9999, N'J', N'SI2', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1041, CAST(N'2024-06-11T20:23:39.8368514' AS DateTime2), 3, 3.9999, N'J', N'SI3', 84)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1042, CAST(N'2024-06-11T20:23:39.8368782' AS DateTime2), 3, 3.9999, N'J', N'I1', 71)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1043, CAST(N'2024-06-11T20:23:39.8369055' AS DateTime2), 3, 3.9999, N'J', N'I2', 35)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1044, CAST(N'2024-06-11T20:23:39.8369334' AS DateTime2), 3, 3.9999, N'J', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1045, CAST(N'2024-06-11T20:23:39.8369729' AS DateTime2), 3, 3.9999, N'K', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1046, CAST(N'2024-06-11T20:23:39.8370030' AS DateTime2), 3, 3.9999, N'K', N'IF', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1047, CAST(N'2024-06-11T20:23:39.8370287' AS DateTime2), 3, 3.9999, N'K', N'VVS1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1048, CAST(N'2024-06-11T20:23:39.8370530' AS DateTime2), 3, 3.9999, N'K', N'VVS2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1049, CAST(N'2024-06-11T20:23:39.8370804' AS DateTime2), 3, 3.9999, N'K', N'VS1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1050, CAST(N'2024-06-11T20:23:39.8371160' AS DateTime2), 3, 3.9999, N'K', N'VS2', 117)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1051, CAST(N'2024-06-11T20:23:39.8371447' AS DateTime2), 3, 3.9999, N'K', N'SI1', 107)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1052, CAST(N'2024-06-11T20:23:39.8371729' AS DateTime2), 3, 3.9999, N'K', N'SI2', 97)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1053, CAST(N'2024-06-11T20:23:39.8372017' AS DateTime2), 3, 3.9999, N'K', N'SI3', 76)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1054, CAST(N'2024-06-11T20:23:39.8372294' AS DateTime2), 3, 3.9999, N'K', N'I1', 62)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1055, CAST(N'2024-06-11T20:23:39.8372648' AS DateTime2), 3, 3.9999, N'K', N'I2', 33)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1056, CAST(N'2024-06-11T20:23:39.8372938' AS DateTime2), 3, 3.9999, N'K', N'I3', 15)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1057, CAST(N'2024-06-11T20:23:39.8373244' AS DateTime2), 3, 3.9999, N'L', N'FL', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1058, CAST(N'2024-06-11T20:23:39.8373576' AS DateTime2), 3, 3.9999, N'L', N'IF', 128)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1059, CAST(N'2024-06-11T20:23:39.8375207' AS DateTime2), 3, 3.9999, N'L', N'VVS1', 121)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1060, CAST(N'2024-06-11T20:23:39.8375552' AS DateTime2), 3, 3.9999, N'L', N'VVS2', 114)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1061, CAST(N'2024-06-11T20:23:39.8376589' AS DateTime2), 3, 3.9999, N'L', N'VS1', 108)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1062, CAST(N'2024-06-11T20:23:39.8377069' AS DateTime2), 3, 3.9999, N'L', N'VS2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1063, CAST(N'2024-06-11T20:23:39.8377458' AS DateTime2), 3, 3.9999, N'L', N'SI1', 92)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1064, CAST(N'2024-06-11T20:23:39.8377737' AS DateTime2), 3, 3.9999, N'L', N'SI2', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1065, CAST(N'2024-06-11T20:23:39.8377994' AS DateTime2), 3, 3.9999, N'L', N'SI3', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1066, CAST(N'2024-06-11T20:23:39.8378366' AS DateTime2), 3, 3.9999, N'L', N'I1', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1067, CAST(N'2024-06-11T20:23:39.8378638' AS DateTime2), 3, 3.9999, N'L', N'I2', 31)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1068, CAST(N'2024-06-11T20:23:39.8378866' AS DateTime2), 3, 3.9999, N'L', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1069, CAST(N'2024-06-11T20:23:39.8380831' AS DateTime2), 3, 3.9999, N'M', N'FL', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1070, CAST(N'2024-06-11T20:23:39.8381628' AS DateTime2), 3, 3.9999, N'M', N'IF', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1071, CAST(N'2024-06-11T20:23:39.8384197' AS DateTime2), 3, 3.9999, N'M', N'VVS1', 99)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1072, CAST(N'2024-06-11T20:23:39.8384832' AS DateTime2), 3, 3.9999, N'M', N'VVS2', 93)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1073, CAST(N'2024-06-11T20:23:39.8385184' AS DateTime2), 3, 3.9999, N'M', N'VS1', 87)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1074, CAST(N'2024-06-11T20:23:39.8385495' AS DateTime2), 3, 3.9999, N'M', N'VS2', 82)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1075, CAST(N'2024-06-11T20:23:39.8385900' AS DateTime2), 3, 3.9999, N'M', N'SI1', 77)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1076, CAST(N'2024-06-11T20:23:39.8386329' AS DateTime2), 3, 3.9999, N'M', N'SI2', 67)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1077, CAST(N'2024-06-11T20:23:39.8387639' AS DateTime2), 3, 3.9999, N'M', N'SI3', 58)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1078, CAST(N'2024-06-11T20:23:39.8388092' AS DateTime2), 3, 3.9999, N'M', N'I1', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1079, CAST(N'2024-06-11T20:23:39.8388515' AS DateTime2), 3, 3.9999, N'M', N'I2', 30)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1080, CAST(N'2024-06-11T20:23:39.8388819' AS DateTime2), 3, 3.9999, N'M', N'I3', 14)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1081, CAST(N'2024-06-11T20:23:40.2210551' AS DateTime2), 4, 4.9999, N'D', N'FL', 840)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1082, CAST(N'2024-06-11T20:23:40.2212091' AS DateTime2), 4, 4.9999, N'D', N'IF', 810)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1083, CAST(N'2024-06-11T20:23:40.2212727' AS DateTime2), 4, 4.9999, N'D', N'VVS1', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1084, CAST(N'2024-06-11T20:23:40.2213113' AS DateTime2), 4, 4.9999, N'D', N'VVS2', 635)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1085, CAST(N'2024-06-11T20:23:40.2213469' AS DateTime2), 4, 4.9999, N'D', N'VS1', 535)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1086, CAST(N'2024-06-11T20:23:40.2214156' AS DateTime2), 4, 4.9999, N'D', N'VS2', 440)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1087, CAST(N'2024-06-11T20:23:40.2214494' AS DateTime2), 4, 4.9999, N'D', N'SI1', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1088, CAST(N'2024-06-11T20:23:40.2214872' AS DateTime2), 4, 4.9999, N'D', N'SI2', 255)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1089, CAST(N'2024-06-11T20:23:40.2215212' AS DateTime2), 4, 4.9999, N'D', N'SI3', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1090, CAST(N'2024-06-11T20:23:40.2215553' AS DateTime2), 4, 4.9999, N'D', N'I1', 111)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1091, CAST(N'2024-06-11T20:23:40.2215999' AS DateTime2), 4, 4.9999, N'D', N'I2', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1092, CAST(N'2024-06-11T20:23:40.2216362' AS DateTime2), 4, 4.9999, N'D', N'I3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1093, CAST(N'2024-06-11T20:23:40.2216723' AS DateTime2), 4, 4.9999, N'E', N'FL', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1094, CAST(N'2024-06-11T20:23:40.2217024' AS DateTime2), 4, 4.9999, N'E', N'IF', 680)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1095, CAST(N'2024-06-11T20:23:40.2217419' AS DateTime2), 4, 4.9999, N'E', N'VVS1', 615)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1096, CAST(N'2024-06-11T20:23:40.2217971' AS DateTime2), 4, 4.9999, N'E', N'VVS2', 550)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1097, CAST(N'2024-06-11T20:23:40.2218367' AS DateTime2), 4, 4.9999, N'E', N'VS1', 490)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1098, CAST(N'2024-06-11T20:23:40.2218711' AS DateTime2), 4, 4.9999, N'E', N'VS2', 410)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1099, CAST(N'2024-06-11T20:23:40.2219051' AS DateTime2), 4, 4.9999, N'E', N'SI1', 295)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1100, CAST(N'2024-06-11T20:23:40.2219370' AS DateTime2), 4, 4.9999, N'E', N'SI2', 240)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1101, CAST(N'2024-06-11T20:23:40.2219774' AS DateTime2), 4, 4.9999, N'E', N'SI3', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1102, CAST(N'2024-06-11T20:23:40.2220316' AS DateTime2), 4, 4.9999, N'E', N'I1', 106)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1103, CAST(N'2024-06-11T20:23:40.2220696' AS DateTime2), 4, 4.9999, N'E', N'I2', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1104, CAST(N'2024-06-11T20:23:40.2221132' AS DateTime2), 4, 4.9999, N'E', N'I3', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1105, CAST(N'2024-06-11T20:23:40.2221505' AS DateTime2), 4, 4.9999, N'F', N'FL', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1106, CAST(N'2024-06-11T20:23:40.2221929' AS DateTime2), 4, 4.9999, N'F', N'IF', 580)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1107, CAST(N'2024-06-11T20:23:40.2222355' AS DateTime2), 4, 4.9999, N'F', N'VVS1', 535)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1108, CAST(N'2024-06-11T20:23:40.2222638' AS DateTime2), 4, 4.9999, N'F', N'VVS2', 490)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1109, CAST(N'2024-06-11T20:23:40.2222899' AS DateTime2), 4, 4.9999, N'F', N'VS1', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1110, CAST(N'2024-06-11T20:23:40.2223160' AS DateTime2), 4, 4.9999, N'F', N'VS2', 365)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1111, CAST(N'2024-06-11T20:23:40.2223415' AS DateTime2), 4, 4.9999, N'F', N'SI1', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1112, CAST(N'2024-06-11T20:23:40.2223761' AS DateTime2), 4, 4.9999, N'F', N'SI2', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1113, CAST(N'2024-06-11T20:23:40.2224100' AS DateTime2), 4, 4.9999, N'F', N'SI3', 138)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1114, CAST(N'2024-06-11T20:23:40.2224376' AS DateTime2), 4, 4.9999, N'F', N'I1', 101)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1115, CAST(N'2024-06-11T20:23:40.2224634' AS DateTime2), 4, 4.9999, N'F', N'I2', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1116, CAST(N'2024-06-11T20:23:40.2224886' AS DateTime2), 4, 4.9999, N'F', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1117, CAST(N'2024-06-11T20:23:40.2225256' AS DateTime2), 4, 4.9999, N'G', N'FL', 500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1118, CAST(N'2024-06-11T20:23:40.2225775' AS DateTime2), 4, 4.9999, N'G', N'IF', 480)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1119, CAST(N'2024-06-11T20:23:40.2232646' AS DateTime2), 4, 4.9999, N'G', N'VVS1', 445)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1120, CAST(N'2024-06-11T20:23:40.2237426' AS DateTime2), 4, 4.9999, N'G', N'VVS2', 405)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1121, CAST(N'2024-06-11T20:23:40.2238473' AS DateTime2), 4, 4.9999, N'G', N'VS1', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1122, CAST(N'2024-06-11T20:23:40.2238967' AS DateTime2), 4, 4.9999, N'G', N'VS2', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1123, CAST(N'2024-06-11T20:23:40.2239639' AS DateTime2), 4, 4.9999, N'G', N'SI1', 245)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1124, CAST(N'2024-06-11T20:23:40.2240040' AS DateTime2), 4, 4.9999, N'G', N'SI2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1125, CAST(N'2024-06-11T20:23:40.2240373' AS DateTime2), 4, 4.9999, N'G', N'SI3', 127)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1126, CAST(N'2024-06-11T20:23:40.2240759' AS DateTime2), 4, 4.9999, N'G', N'I1', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1127, CAST(N'2024-06-11T20:23:40.2241219' AS DateTime2), 4, 4.9999, N'G', N'I2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1128, CAST(N'2024-06-11T20:23:40.2241836' AS DateTime2), 4, 4.9999, N'G', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1129, CAST(N'2024-06-11T20:23:40.2242230' AS DateTime2), 4, 4.9999, N'H', N'FL', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1130, CAST(N'2024-06-11T20:23:40.2242513' AS DateTime2), 4, 4.9999, N'H', N'IF', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1131, CAST(N'2024-06-11T20:23:40.2242775' AS DateTime2), 4, 4.9999, N'H', N'VVS1', 345)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1132, CAST(N'2024-06-11T20:23:40.2243031' AS DateTime2), 4, 4.9999, N'H', N'VVS2', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1133, CAST(N'2024-06-11T20:23:40.2243389' AS DateTime2), 4, 4.9999, N'H', N'VS1', 305)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1134, CAST(N'2024-06-11T20:23:40.2243663' AS DateTime2), 4, 4.9999, N'H', N'VS2', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1135, CAST(N'2024-06-11T20:23:40.2243911' AS DateTime2), 4, 4.9999, N'H', N'SI1', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1136, CAST(N'2024-06-11T20:23:40.2244251' AS DateTime2), 4, 4.9999, N'H', N'SI2', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1137, CAST(N'2024-06-11T20:23:40.2244528' AS DateTime2), 4, 4.9999, N'H', N'SI3', 114)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1138, CAST(N'2024-06-11T20:23:40.2244779' AS DateTime2), 4, 4.9999, N'H', N'I1', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1139, CAST(N'2024-06-11T20:23:40.2245136' AS DateTime2), 4, 4.9999, N'H', N'I2', 44)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1140, CAST(N'2024-06-11T20:23:40.2245375' AS DateTime2), 4, 4.9999, N'H', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1141, CAST(N'2024-06-11T20:23:40.2245656' AS DateTime2), 4, 4.9999, N'I', N'FL', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1142, CAST(N'2024-06-11T20:23:40.2245909' AS DateTime2), 4, 4.9999, N'I', N'IF', 290)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1143, CAST(N'2024-06-11T20:23:40.2246212' AS DateTime2), 4, 4.9999, N'I', N'VVS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1144, CAST(N'2024-06-11T20:23:40.2249092' AS DateTime2), 4, 4.9999, N'I', N'VVS2', 255)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1145, CAST(N'2024-06-11T20:23:40.2249936' AS DateTime2), 4, 4.9999, N'I', N'VS1', 240)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1146, CAST(N'2024-06-11T20:23:40.2250242' AS DateTime2), 4, 4.9999, N'I', N'VS2', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1147, CAST(N'2024-06-11T20:23:40.2254396' AS DateTime2), 4, 4.9999, N'I', N'SI1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1148, CAST(N'2024-06-11T20:23:40.2255457' AS DateTime2), 4, 4.9999, N'I', N'SI2', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1149, CAST(N'2024-06-11T20:23:40.2259859' AS DateTime2), 4, 4.9999, N'I', N'SI3', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1150, CAST(N'2024-06-11T20:23:40.2260914' AS DateTime2), 4, 4.9999, N'I', N'I1', 86)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1151, CAST(N'2024-06-11T20:23:40.2261520' AS DateTime2), 4, 4.9999, N'I', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1152, CAST(N'2024-06-11T20:23:40.2261831' AS DateTime2), 4, 4.9999, N'I', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1153, CAST(N'2024-06-11T20:23:40.2262132' AS DateTime2), 4, 4.9999, N'J', N'FL', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1154, CAST(N'2024-06-11T20:23:40.2262618' AS DateTime2), 4, 4.9999, N'J', N'IF', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1155, CAST(N'2024-06-11T20:23:40.2262883' AS DateTime2), 4, 4.9999, N'J', N'VVS1', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1156, CAST(N'2024-06-11T20:23:40.2263128' AS DateTime2), 4, 4.9999, N'J', N'VVS2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1157, CAST(N'2024-06-11T20:23:40.2263372' AS DateTime2), 4, 4.9999, N'J', N'VS1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1158, CAST(N'2024-06-11T20:23:40.2263607' AS DateTime2), 4, 4.9999, N'J', N'VS2', 175)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1159, CAST(N'2024-06-11T20:23:40.2264018' AS DateTime2), 4, 4.9999, N'J', N'SI1', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1160, CAST(N'2024-06-11T20:23:40.2265335' AS DateTime2), 4, 4.9999, N'J', N'SI2', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1161, CAST(N'2024-06-11T20:23:40.2265788' AS DateTime2), 4, 4.9999, N'J', N'SI3', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1162, CAST(N'2024-06-11T20:23:40.2266841' AS DateTime2), 4, 4.9999, N'J', N'I1', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1163, CAST(N'2024-06-11T20:23:40.2267352' AS DateTime2), 4, 4.9999, N'J', N'I2', 39)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1164, CAST(N'2024-06-11T20:23:40.2267815' AS DateTime2), 4, 4.9999, N'J', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1165, CAST(N'2024-06-11T20:23:40.2268948' AS DateTime2), 4, 4.9999, N'K', N'FL', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1166, CAST(N'2024-06-11T20:23:40.2290568' AS DateTime2), 4, 4.9999, N'K', N'IF', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1167, CAST(N'2024-06-11T20:23:40.2293003' AS DateTime2), 4, 4.9999, N'K', N'VVS1', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1168, CAST(N'2024-06-11T20:23:40.2293941' AS DateTime2), 4, 4.9999, N'K', N'VVS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1169, CAST(N'2024-06-11T20:23:40.2294488' AS DateTime2), 4, 4.9999, N'K', N'VS1', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1170, CAST(N'2024-06-11T20:23:40.2295018' AS DateTime2), 4, 4.9999, N'K', N'VS2', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1171, CAST(N'2024-06-11T20:23:40.2295369' AS DateTime2), 4, 4.9999, N'K', N'SI1', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1172, CAST(N'2024-06-11T20:23:40.2295641' AS DateTime2), 4, 4.9999, N'K', N'SI2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1173, CAST(N'2024-06-11T20:23:40.2295873' AS DateTime2), 4, 4.9999, N'K', N'SI3', 83)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1174, CAST(N'2024-06-11T20:23:40.2296095' AS DateTime2), 4, 4.9999, N'K', N'I1', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1175, CAST(N'2024-06-11T20:23:40.2296407' AS DateTime2), 4, 4.9999, N'K', N'I2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1176, CAST(N'2024-06-11T20:23:40.2296663' AS DateTime2), 4, 4.9999, N'K', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1177, CAST(N'2024-06-11T20:23:40.2296922' AS DateTime2), 4, 4.9999, N'L', N'FL', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1178, CAST(N'2024-06-11T20:23:40.2297160' AS DateTime2), 4, 4.9999, N'L', N'IF', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1179, CAST(N'2024-06-11T20:23:40.2297407' AS DateTime2), 4, 4.9999, N'L', N'VVS1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1180, CAST(N'2024-06-11T20:23:40.2297717' AS DateTime2), 4, 4.9999, N'L', N'VVS2', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1181, CAST(N'2024-06-11T20:23:40.2297967' AS DateTime2), 4, 4.9999, N'L', N'VS1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1182, CAST(N'2024-06-11T20:23:40.2298194' AS DateTime2), 4, 4.9999, N'L', N'VS2', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1183, CAST(N'2024-06-11T20:23:40.2298426' AS DateTime2), 4, 4.9999, N'L', N'SI1', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1184, CAST(N'2024-06-11T20:23:40.2298665' AS DateTime2), 4, 4.9999, N'L', N'SI2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1185, CAST(N'2024-06-11T20:23:40.2298894' AS DateTime2), 4, 4.9999, N'L', N'SI3', 73)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1186, CAST(N'2024-06-11T20:23:40.2299196' AS DateTime2), 4, 4.9999, N'L', N'I1', 59)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1187, CAST(N'2024-06-11T20:23:40.2299426' AS DateTime2), 4, 4.9999, N'L', N'I2', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1188, CAST(N'2024-06-11T20:23:40.2299652' AS DateTime2), 4, 4.9999, N'L', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1189, CAST(N'2024-06-11T20:23:40.2299915' AS DateTime2), 4, 4.9999, N'M', N'FL', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1190, CAST(N'2024-06-11T20:23:40.2300367' AS DateTime2), 4, 4.9999, N'M', N'IF', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1191, CAST(N'2024-06-11T20:23:40.2300836' AS DateTime2), 4, 4.9999, N'M', N'VVS1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1192, CAST(N'2024-06-11T20:23:40.2301093' AS DateTime2), 4, 4.9999, N'M', N'VVS2', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1193, CAST(N'2024-06-11T20:23:40.2301326' AS DateTime2), 4, 4.9999, N'M', N'VS1', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1194, CAST(N'2024-06-11T20:23:40.2301564' AS DateTime2), 4, 4.9999, N'M', N'VS2', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1195, CAST(N'2024-06-11T20:23:40.2301790' AS DateTime2), 4, 4.9999, N'M', N'SI1', 90)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1196, CAST(N'2024-06-11T20:23:40.2302133' AS DateTime2), 4, 4.9999, N'M', N'SI2', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1197, CAST(N'2024-06-11T20:23:40.2302377' AS DateTime2), 4, 4.9999, N'M', N'SI3', 65)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1198, CAST(N'2024-06-11T20:23:40.2302608' AS DateTime2), 4, 4.9999, N'M', N'I1', 50)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1199, CAST(N'2024-06-11T20:23:40.2302843' AS DateTime2), 4, 4.9999, N'M', N'I2', 32)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1200, CAST(N'2024-06-11T20:23:40.2303078' AS DateTime2), 4, 4.9999, N'M', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1201, CAST(N'2024-06-11T20:23:40.6290116' AS DateTime2), 5, 5.9999, N'D', N'FL', 1200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1202, CAST(N'2024-06-11T20:23:40.6291961' AS DateTime2), 5, 5.9999, N'D', N'IF', 1130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1203, CAST(N'2024-06-11T20:23:40.6292521' AS DateTime2), 5, 5.9999, N'D', N'VVS1', 970)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1204, CAST(N'2024-06-11T20:23:40.6292774' AS DateTime2), 5, 5.9999, N'D', N'VVS2', 835)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1205, CAST(N'2024-06-11T20:23:40.6292962' AS DateTime2), 5, 5.9999, N'D', N'VS1', 745)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1206, CAST(N'2024-06-11T20:23:40.6293192' AS DateTime2), 5, 5.9999, N'D', N'VS2', 615)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1207, CAST(N'2024-06-11T20:23:40.6293462' AS DateTime2), 5, 5.9999, N'D', N'SI1', 430)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1208, CAST(N'2024-06-11T20:23:40.6293633' AS DateTime2), 5, 5.9999, N'D', N'SI2', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1209, CAST(N'2024-06-11T20:23:40.6293833' AS DateTime2), 5, 5.9999, N'D', N'SI3', 175)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1210, CAST(N'2024-06-11T20:23:40.6294064' AS DateTime2), 5, 5.9999, N'D', N'I1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1211, CAST(N'2024-06-11T20:23:40.6294503' AS DateTime2), 5, 5.9999, N'D', N'I2', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1212, CAST(N'2024-06-11T20:23:40.6294709' AS DateTime2), 5, 5.9999, N'D', N'I3', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1213, CAST(N'2024-06-11T20:23:40.6294961' AS DateTime2), 5, 5.9999, N'E', N'FL', 1000)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1214, CAST(N'2024-06-11T20:23:40.6295157' AS DateTime2), 5, 5.9999, N'E', N'IF', 905)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1215, CAST(N'2024-06-11T20:23:40.6295344' AS DateTime2), 5, 5.9999, N'E', N'VVS1', 825)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1216, CAST(N'2024-06-11T20:23:40.6295601' AS DateTime2), 5, 5.9999, N'E', N'VVS2', 730)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1217, CAST(N'2024-06-11T20:23:40.6295784' AS DateTime2), 5, 5.9999, N'E', N'VS1', 650)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1218, CAST(N'2024-06-11T20:23:40.6295983' AS DateTime2), 5, 5.9999, N'E', N'VS2', 555)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1219, CAST(N'2024-06-11T20:23:40.6296218' AS DateTime2), 5, 5.9999, N'E', N'SI1', 395)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1220, CAST(N'2024-06-11T20:23:40.6296413' AS DateTime2), 5, 5.9999, N'E', N'SI2', 295)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1221, CAST(N'2024-06-11T20:23:40.6296588' AS DateTime2), 5, 5.9999, N'E', N'SI3', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1222, CAST(N'2024-06-11T20:23:40.6296760' AS DateTime2), 5, 5.9999, N'E', N'I1', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1223, CAST(N'2024-06-11T20:23:40.6296956' AS DateTime2), 5, 5.9999, N'E', N'I2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1224, CAST(N'2024-06-11T20:23:40.6297135' AS DateTime2), 5, 5.9999, N'E', N'I3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1225, CAST(N'2024-06-11T20:23:40.6297336' AS DateTime2), 5, 5.9999, N'F', N'FL', 800)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1226, CAST(N'2024-06-11T20:23:40.6297512' AS DateTime2), 5, 5.9999, N'F', N'IF', 775)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1227, CAST(N'2024-06-11T20:23:40.6297694' AS DateTime2), 5, 5.9999, N'F', N'VVS1', 715)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1228, CAST(N'2024-06-11T20:23:40.6297953' AS DateTime2), 5, 5.9999, N'F', N'VVS2', 630)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1229, CAST(N'2024-06-11T20:23:40.6298315' AS DateTime2), 5, 5.9999, N'F', N'VS1', 565)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1230, CAST(N'2024-06-11T20:23:40.6298552' AS DateTime2), 5, 5.9999, N'F', N'VS2', 490)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1231, CAST(N'2024-06-11T20:23:40.6298768' AS DateTime2), 5, 5.9999, N'F', N'SI1', 360)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1232, CAST(N'2024-06-11T20:23:40.6299189' AS DateTime2), 5, 5.9999, N'F', N'SI2', 280)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1233, CAST(N'2024-06-11T20:23:40.6299519' AS DateTime2), 5, 5.9999, N'F', N'SI3', 160)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1234, CAST(N'2024-06-11T20:23:40.6299705' AS DateTime2), 5, 5.9999, N'F', N'I1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1235, CAST(N'2024-06-11T20:23:40.6299885' AS DateTime2), 5, 5.9999, N'F', N'I2', 54)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1236, CAST(N'2024-06-11T20:23:40.6300153' AS DateTime2), 5, 5.9999, N'F', N'I3', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1237, CAST(N'2024-06-11T20:23:40.6300577' AS DateTime2), 5, 5.9999, N'G', N'FL', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1238, CAST(N'2024-06-11T20:23:40.6301454' AS DateTime2), 5, 5.9999, N'G', N'IF', 645)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1239, CAST(N'2024-06-11T20:23:40.6302665' AS DateTime2), 5, 5.9999, N'G', N'VVS1', 595)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1240, CAST(N'2024-06-11T20:23:40.6303098' AS DateTime2), 5, 5.9999, N'G', N'VVS2', 540)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1241, CAST(N'2024-06-11T20:23:40.6303472' AS DateTime2), 5, 5.9999, N'G', N'VS1', 485)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1242, CAST(N'2024-06-11T20:23:40.6303785' AS DateTime2), 5, 5.9999, N'G', N'VS2', 420)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1243, CAST(N'2024-06-11T20:23:40.6304184' AS DateTime2), 5, 5.9999, N'G', N'SI1', 320)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1244, CAST(N'2024-06-11T20:23:40.6304457' AS DateTime2), 5, 5.9999, N'G', N'SI2', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1245, CAST(N'2024-06-11T20:23:40.6304772' AS DateTime2), 5, 5.9999, N'G', N'SI3', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1246, CAST(N'2024-06-11T20:23:40.6305049' AS DateTime2), 5, 5.9999, N'G', N'I1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1247, CAST(N'2024-06-11T20:23:40.6305916' AS DateTime2), 5, 5.9999, N'G', N'I2', 51)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1248, CAST(N'2024-06-11T20:23:40.6306407' AS DateTime2), 5, 5.9999, N'G', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1249, CAST(N'2024-06-11T20:23:40.6306748' AS DateTime2), 5, 5.9999, N'H', N'FL', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1250, CAST(N'2024-06-11T20:23:40.6306973' AS DateTime2), 5, 5.9999, N'H', N'IF', 505)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1251, CAST(N'2024-06-11T20:23:40.6307184' AS DateTime2), 5, 5.9999, N'H', N'VVS1', 475)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1252, CAST(N'2024-06-11T20:23:40.6307401' AS DateTime2), 5, 5.9999, N'H', N'VVS2', 425)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1253, CAST(N'2024-06-11T20:23:40.6307650' AS DateTime2), 5, 5.9999, N'H', N'VS1', 385)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1254, CAST(N'2024-06-11T20:23:40.6307931' AS DateTime2), 5, 5.9999, N'H', N'VS2', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1255, CAST(N'2024-06-11T20:23:40.6308229' AS DateTime2), 5, 5.9999, N'H', N'SI1', 265)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1256, CAST(N'2024-06-11T20:23:40.6309257' AS DateTime2), 5, 5.9999, N'H', N'SI2', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1257, CAST(N'2024-06-11T20:23:40.6309713' AS DateTime2), 5, 5.9999, N'H', N'SI3', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1258, CAST(N'2024-06-11T20:23:40.6309981' AS DateTime2), 5, 5.9999, N'H', N'I1', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1259, CAST(N'2024-06-11T20:23:40.6310223' AS DateTime2), 5, 5.9999, N'H', N'I2', 48)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1260, CAST(N'2024-06-11T20:23:40.6310505' AS DateTime2), 5, 5.9999, N'H', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1261, CAST(N'2024-06-11T20:23:40.6310785' AS DateTime2), 5, 5.9999, N'I', N'FL', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1262, CAST(N'2024-06-11T20:23:40.6311032' AS DateTime2), 5, 5.9999, N'I', N'IF', 385)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1263, CAST(N'2024-06-11T20:23:40.6311231' AS DateTime2), 5, 5.9999, N'I', N'VVS1', 360)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1264, CAST(N'2024-06-11T20:23:40.6311434' AS DateTime2), 5, 5.9999, N'I', N'VVS2', 330)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1265, CAST(N'2024-06-11T20:23:40.6311770' AS DateTime2), 5, 5.9999, N'I', N'VS1', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1266, CAST(N'2024-06-11T20:23:40.6312108' AS DateTime2), 5, 5.9999, N'I', N'VS2', 265)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1267, CAST(N'2024-06-11T20:23:40.6312369' AS DateTime2), 5, 5.9999, N'I', N'SI1', 225)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1268, CAST(N'2024-06-11T20:23:40.6312756' AS DateTime2), 5, 5.9999, N'I', N'SI2', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1269, CAST(N'2024-06-11T20:23:40.6313430' AS DateTime2), 5, 5.9999, N'I', N'SI3', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1270, CAST(N'2024-06-11T20:23:40.6313804' AS DateTime2), 5, 5.9999, N'I', N'I1', 95)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1271, CAST(N'2024-06-11T20:23:40.6314155' AS DateTime2), 5, 5.9999, N'I', N'I2', 46)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1272, CAST(N'2024-06-11T20:23:40.6314343' AS DateTime2), 5, 5.9999, N'I', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1273, CAST(N'2024-06-11T20:23:40.6314556' AS DateTime2), 5, 5.9999, N'J', N'FL', 320)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1274, CAST(N'2024-06-11T20:23:40.6314742' AS DateTime2), 5, 5.9999, N'J', N'IF', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1275, CAST(N'2024-06-11T20:23:40.6314929' AS DateTime2), 5, 5.9999, N'J', N'VVS1', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1276, CAST(N'2024-06-11T20:23:40.6315257' AS DateTime2), 5, 5.9999, N'J', N'VVS2', 255)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1277, CAST(N'2024-06-11T20:23:40.6315567' AS DateTime2), 5, 5.9999, N'J', N'VS1', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1278, CAST(N'2024-06-11T20:23:40.6315752' AS DateTime2), 5, 5.9999, N'J', N'VS2', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1279, CAST(N'2024-06-11T20:23:40.6316081' AS DateTime2), 5, 5.9999, N'J', N'SI1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1280, CAST(N'2024-06-11T20:23:40.6316329' AS DateTime2), 5, 5.9999, N'J', N'SI2', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1281, CAST(N'2024-06-11T20:23:40.6316527' AS DateTime2), 5, 5.9999, N'J', N'SI3', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1282, CAST(N'2024-06-11T20:23:40.6316704' AS DateTime2), 5, 5.9999, N'J', N'I1', 88)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1283, CAST(N'2024-06-11T20:23:40.6316888' AS DateTime2), 5, 5.9999, N'J', N'I2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1284, CAST(N'2024-06-11T20:23:40.6317067' AS DateTime2), 5, 5.9999, N'J', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1285, CAST(N'2024-06-11T20:23:40.6317279' AS DateTime2), 5, 5.9999, N'K', N'FL', 260)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1286, CAST(N'2024-06-11T20:23:40.6317969' AS DateTime2), 5, 5.9999, N'K', N'IF', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1287, CAST(N'2024-06-11T20:23:40.6318512' AS DateTime2), 5, 5.9999, N'K', N'VVS1', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1288, CAST(N'2024-06-11T20:23:40.6318739' AS DateTime2), 5, 5.9999, N'K', N'VVS2', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1289, CAST(N'2024-06-11T20:23:40.6318922' AS DateTime2), 5, 5.9999, N'K', N'VS1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1290, CAST(N'2024-06-11T20:23:40.6319260' AS DateTime2), 5, 5.9999, N'K', N'VS2', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1291, CAST(N'2024-06-11T20:23:40.6319558' AS DateTime2), 5, 5.9999, N'K', N'SI1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1292, CAST(N'2024-06-11T20:23:40.6319852' AS DateTime2), 5, 5.9999, N'K', N'SI2', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1293, CAST(N'2024-06-11T20:23:40.6320151' AS DateTime2), 5, 5.9999, N'K', N'SI3', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1294, CAST(N'2024-06-11T20:23:40.6320446' AS DateTime2), 5, 5.9999, N'K', N'I1', 81)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1295, CAST(N'2024-06-11T20:23:40.6320796' AS DateTime2), 5, 5.9999, N'K', N'I2', 41)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1296, CAST(N'2024-06-11T20:23:40.6321078' AS DateTime2), 5, 5.9999, N'K', N'I3', 18)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1297, CAST(N'2024-06-11T20:23:40.6321363' AS DateTime2), 5, 5.9999, N'L', N'FL', 210)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1298, CAST(N'2024-06-11T20:23:40.6321628' AS DateTime2), 5, 5.9999, N'L', N'IF', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1299, CAST(N'2024-06-11T20:23:40.6321977' AS DateTime2), 5, 5.9999, N'L', N'VVS1', 175)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1300, CAST(N'2024-06-11T20:23:40.6322266' AS DateTime2), 5, 5.9999, N'L', N'VVS2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1301, CAST(N'2024-06-11T20:23:40.6322510' AS DateTime2), 5, 5.9999, N'L', N'VS1', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1302, CAST(N'2024-06-11T20:23:40.6322892' AS DateTime2), 5, 5.9999, N'L', N'VS2', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1303, CAST(N'2024-06-11T20:23:40.6323313' AS DateTime2), 5, 5.9999, N'L', N'SI1', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1304, CAST(N'2024-06-11T20:23:40.6323692' AS DateTime2), 5, 5.9999, N'L', N'SI2', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1305, CAST(N'2024-06-11T20:23:40.6324275' AS DateTime2), 5, 5.9999, N'L', N'SI3', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1306, CAST(N'2024-06-11T20:23:40.6324572' AS DateTime2), 5, 5.9999, N'L', N'I1', 69)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1307, CAST(N'2024-06-11T20:23:40.6324943' AS DateTime2), 5, 5.9999, N'L', N'I2', 37)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1308, CAST(N'2024-06-11T20:23:40.6325316' AS DateTime2), 5, 5.9999, N'L', N'I3', 17)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1309, CAST(N'2024-06-11T20:23:40.6325695' AS DateTime2), 5, 5.9999, N'M', N'FL', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1310, CAST(N'2024-06-11T20:23:40.6326065' AS DateTime2), 5, 5.9999, N'M', N'IF', 155)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1311, CAST(N'2024-06-11T20:23:40.6326317' AS DateTime2), 5, 5.9999, N'M', N'VVS1', 145)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1312, CAST(N'2024-06-11T20:23:40.6326717' AS DateTime2), 5, 5.9999, N'M', N'VVS2', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1313, CAST(N'2024-06-11T20:23:40.6327272' AS DateTime2), 5, 5.9999, N'M', N'VS1', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1314, CAST(N'2024-06-11T20:23:40.6327662' AS DateTime2), 5, 5.9999, N'M', N'VS2', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1315, CAST(N'2024-06-11T20:23:40.6327999' AS DateTime2), 5, 5.9999, N'M', N'SI1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1316, CAST(N'2024-06-11T20:23:40.6328363' AS DateTime2), 5, 5.9999, N'M', N'SI2', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1317, CAST(N'2024-06-11T20:23:40.6328663' AS DateTime2), 5, 5.9999, N'M', N'SI3', 80)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1318, CAST(N'2024-06-11T20:23:40.6328948' AS DateTime2), 5, 5.9999, N'M', N'I1', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1319, CAST(N'2024-06-11T20:23:40.6329222' AS DateTime2), 5, 5.9999, N'M', N'I2', 34)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1320, CAST(N'2024-06-11T20:23:40.6329517' AS DateTime2), 5, 5.9999, N'M', N'I3', 16)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1321, CAST(N'2024-06-11T20:23:40.8889072' AS DateTime2), 6, 7.9999, N'D', N'FL', 1700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1322, CAST(N'2024-06-11T20:23:40.8893882' AS DateTime2), 6, 7.9999, N'D', N'IF', 1600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1323, CAST(N'2024-06-11T20:23:40.8894281' AS DateTime2), 6, 7.9999, N'D', N'VVS1', 1480)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1324, CAST(N'2024-06-11T20:23:40.8894497' AS DateTime2), 6, 7.9999, N'D', N'VVS2', 1300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1325, CAST(N'2024-06-11T20:23:40.8894657' AS DateTime2), 6, 7.9999, N'D', N'VS1', 1150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1326, CAST(N'2024-06-11T20:23:40.8894797' AS DateTime2), 6, 7.9999, N'D', N'VS2', 965)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1327, CAST(N'2024-06-11T20:23:40.8894939' AS DateTime2), 6, 7.9999, N'D', N'SI1', 635)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1328, CAST(N'2024-06-11T20:23:40.8895087' AS DateTime2), 6, 7.9999, N'D', N'SI2', 465)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1329, CAST(N'2024-06-11T20:23:40.8895243' AS DateTime2), 6, 7.9999, N'D', N'SI3', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1330, CAST(N'2024-06-11T20:23:40.8895378' AS DateTime2), 6, 7.9999, N'D', N'I1', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1331, CAST(N'2024-06-11T20:23:40.8895513' AS DateTime2), 6, 7.9999, N'D', N'I2', 66)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1332, CAST(N'2024-06-11T20:23:40.8895638' AS DateTime2), 6, 7.9999, N'D', N'I3', 27)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1333, CAST(N'2024-06-11T20:23:40.8895809' AS DateTime2), 6, 7.9999, N'E', N'FL', 1500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1334, CAST(N'2024-06-11T20:23:40.8895967' AS DateTime2), 6, 7.9999, N'E', N'IF', 1380)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1335, CAST(N'2024-06-11T20:23:40.8896108' AS DateTime2), 6, 7.9999, N'E', N'VVS1', 1275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1336, CAST(N'2024-06-11T20:23:40.8896240' AS DateTime2), 6, 7.9999, N'E', N'VVS2', 1130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1337, CAST(N'2024-06-11T20:23:40.8896371' AS DateTime2), 6, 7.9999, N'E', N'VS1', 1015)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1338, CAST(N'2024-06-11T20:23:40.8896501' AS DateTime2), 6, 7.9999, N'E', N'VS2', 875)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1339, CAST(N'2024-06-11T20:23:40.8896637' AS DateTime2), 6, 7.9999, N'E', N'SI1', 585)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1340, CAST(N'2024-06-11T20:23:40.8896800' AS DateTime2), 6, 7.9999, N'E', N'SI2', 430)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1341, CAST(N'2024-06-11T20:23:40.8896950' AS DateTime2), 6, 7.9999, N'E', N'SI3', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1342, CAST(N'2024-06-11T20:23:40.8897077' AS DateTime2), 6, 7.9999, N'E', N'I1', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1343, CAST(N'2024-06-11T20:23:40.8897232' AS DateTime2), 6, 7.9999, N'E', N'I2', 63)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1344, CAST(N'2024-06-11T20:23:40.8897386' AS DateTime2), 6, 7.9999, N'E', N'I3', 26)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1345, CAST(N'2024-06-11T20:23:40.8897646' AS DateTime2), 6, 7.9999, N'F', N'FL', 1200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1346, CAST(N'2024-06-11T20:23:40.8897845' AS DateTime2), 6, 7.9999, N'F', N'IF', 1180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1347, CAST(N'2024-06-11T20:23:40.8897983' AS DateTime2), 6, 7.9999, N'F', N'VVS1', 1110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1348, CAST(N'2024-06-11T20:23:40.8898195' AS DateTime2), 6, 7.9999, N'F', N'VVS2', 985)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1349, CAST(N'2024-06-11T20:23:40.8898387' AS DateTime2), 6, 7.9999, N'F', N'VS1', 875)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1350, CAST(N'2024-06-11T20:23:40.8898555' AS DateTime2), 6, 7.9999, N'F', N'VS2', 755)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1351, CAST(N'2024-06-11T20:23:40.8898843' AS DateTime2), 6, 7.9999, N'F', N'SI1', 535)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1352, CAST(N'2024-06-11T20:23:40.8899019' AS DateTime2), 6, 7.9999, N'F', N'SI2', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1353, CAST(N'2024-06-11T20:23:40.8899214' AS DateTime2), 6, 7.9999, N'F', N'SI3', 220)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1354, CAST(N'2024-06-11T20:23:40.8899365' AS DateTime2), 6, 7.9999, N'F', N'I1', 130)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1355, CAST(N'2024-06-11T20:23:40.8899519' AS DateTime2), 6, 7.9999, N'F', N'I2', 60)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1356, CAST(N'2024-06-11T20:23:40.8899792' AS DateTime2), 6, 7.9999, N'F', N'I3', 25)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1357, CAST(N'2024-06-11T20:23:40.8900198' AS DateTime2), 6, 7.9999, N'G', N'FL', 1000)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1358, CAST(N'2024-06-11T20:23:40.8900422' AS DateTime2), 6, 7.9999, N'G', N'IF', 990)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1359, CAST(N'2024-06-11T20:23:40.8900590' AS DateTime2), 6, 7.9999, N'G', N'VVS1', 930)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1360, CAST(N'2024-06-11T20:23:40.8900762' AS DateTime2), 6, 7.9999, N'G', N'VVS2', 840)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1361, CAST(N'2024-06-11T20:23:40.8900908' AS DateTime2), 6, 7.9999, N'G', N'VS1', 755)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1362, CAST(N'2024-06-11T20:23:40.8901021' AS DateTime2), 6, 7.9999, N'G', N'VS2', 650)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1363, CAST(N'2024-06-11T20:23:40.8901153' AS DateTime2), 6, 7.9999, N'G', N'SI1', 485)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1364, CAST(N'2024-06-11T20:23:40.8901281' AS DateTime2), 6, 7.9999, N'G', N'SI2', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1365, CAST(N'2024-06-11T20:23:40.8901407' AS DateTime2), 6, 7.9999, N'G', N'SI3', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1366, CAST(N'2024-06-11T20:23:40.8901588' AS DateTime2), 6, 7.9999, N'G', N'I1', 125)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1367, CAST(N'2024-06-11T20:23:40.8901767' AS DateTime2), 6, 7.9999, N'G', N'I2', 57)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1368, CAST(N'2024-06-11T20:23:40.8901954' AS DateTime2), 6, 7.9999, N'G', N'I3', 24)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1369, CAST(N'2024-06-11T20:23:40.8902143' AS DateTime2), 6, 7.9999, N'H', N'FL', 820)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1370, CAST(N'2024-06-11T20:23:40.8902364' AS DateTime2), 6, 7.9999, N'H', N'IF', 790)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1371, CAST(N'2024-06-11T20:23:40.8902535' AS DateTime2), 6, 7.9999, N'H', N'VVS1', 740)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1372, CAST(N'2024-06-11T20:23:40.8902722' AS DateTime2), 6, 7.9999, N'H', N'VVS2', 670)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1373, CAST(N'2024-06-11T20:23:40.8902925' AS DateTime2), 6, 7.9999, N'H', N'VS1', 605)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1374, CAST(N'2024-06-11T20:23:40.8903113' AS DateTime2), 6, 7.9999, N'H', N'VS2', 525)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1375, CAST(N'2024-06-11T20:23:40.8903292' AS DateTime2), 6, 7.9999, N'H', N'SI1', 405)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1376, CAST(N'2024-06-11T20:23:40.8903549' AS DateTime2), 6, 7.9999, N'H', N'SI2', 325)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1377, CAST(N'2024-06-11T20:23:40.8903793' AS DateTime2), 6, 7.9999, N'H', N'SI3', 185)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1378, CAST(N'2024-06-11T20:23:40.8904064' AS DateTime2), 6, 7.9999, N'H', N'I1', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1379, CAST(N'2024-06-11T20:23:40.8904244' AS DateTime2), 6, 7.9999, N'H', N'I2', 55)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1380, CAST(N'2024-06-11T20:23:40.8904495' AS DateTime2), 6, 7.9999, N'H', N'I3', 23)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1381, CAST(N'2024-06-11T20:23:40.8904795' AS DateTime2), 6, 7.9999, N'I', N'FL', 700)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1382, CAST(N'2024-06-11T20:23:40.8904977' AS DateTime2), 6, 7.9999, N'I', N'IF', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1383, CAST(N'2024-06-11T20:23:40.8905098' AS DateTime2), 6, 7.9999, N'I', N'VVS1', 560)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1384, CAST(N'2024-06-11T20:23:40.8905216' AS DateTime2), 6, 7.9999, N'I', N'VVS2', 520)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1385, CAST(N'2024-06-11T20:23:40.8905335' AS DateTime2), 6, 7.9999, N'I', N'VS1', 480)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1386, CAST(N'2024-06-11T20:23:40.8905566' AS DateTime2), 6, 7.9999, N'I', N'VS2', 420)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1387, CAST(N'2024-06-11T20:23:40.8905814' AS DateTime2), 6, 7.9999, N'I', N'SI1', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1388, CAST(N'2024-06-11T20:23:40.8905971' AS DateTime2), 6, 7.9999, N'I', N'SI2', 275)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1389, CAST(N'2024-06-11T20:23:40.8906116' AS DateTime2), 6, 7.9999, N'I', N'SI3', 170)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1390, CAST(N'2024-06-11T20:23:40.8906267' AS DateTime2), 6, 7.9999, N'I', N'I1', 115)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1391, CAST(N'2024-06-11T20:23:40.8906464' AS DateTime2), 6, 7.9999, N'I', N'I2', 52)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1392, CAST(N'2024-06-11T20:23:40.8906645' AS DateTime2), 6, 7.9999, N'I', N'I3', 22)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1393, CAST(N'2024-06-11T20:23:40.8906872' AS DateTime2), 6, 7.9999, N'J', N'FL', 600)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1394, CAST(N'2024-06-11T20:23:40.8907053' AS DateTime2), 6, 7.9999, N'J', N'IF', 470)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1395, CAST(N'2024-06-11T20:23:40.8907224' AS DateTime2), 6, 7.9999, N'J', N'VVS1', 430)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1396, CAST(N'2024-06-11T20:23:40.8907401' AS DateTime2), 6, 7.9999, N'J', N'VVS2', 400)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1397, CAST(N'2024-06-11T20:23:40.8907596' AS DateTime2), 6, 7.9999, N'J', N'VS1', 370)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1398, CAST(N'2024-06-11T20:23:40.8907800' AS DateTime2), 6, 7.9999, N'J', N'VS2', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1399, CAST(N'2024-06-11T20:23:40.8907988' AS DateTime2), 6, 7.9999, N'J', N'SI1', 285)
GO
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1400, CAST(N'2024-06-11T20:23:40.8908232' AS DateTime2), 6, 7.9999, N'J', N'SI2', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1401, CAST(N'2024-06-11T20:23:40.8908411' AS DateTime2), 6, 7.9999, N'J', N'SI3', 150)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1402, CAST(N'2024-06-11T20:23:40.8908539' AS DateTime2), 6, 7.9999, N'J', N'I1', 110)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1403, CAST(N'2024-06-11T20:23:40.8908808' AS DateTime2), 6, 7.9999, N'J', N'I2', 49)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1404, CAST(N'2024-06-11T20:23:40.8908984' AS DateTime2), 6, 7.9999, N'J', N'I3', 21)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1405, CAST(N'2024-06-11T20:23:40.8909278' AS DateTime2), 6, 7.9999, N'K', N'FL', 500)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1406, CAST(N'2024-06-11T20:23:40.8909565' AS DateTime2), 6, 7.9999, N'K', N'IF', 360)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1407, CAST(N'2024-06-11T20:23:40.8909754' AS DateTime2), 6, 7.9999, N'K', N'VVS1', 340)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1408, CAST(N'2024-06-11T20:23:40.8909974' AS DateTime2), 6, 7.9999, N'K', N'VVS2', 315)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1409, CAST(N'2024-06-11T20:23:40.8910109' AS DateTime2), 6, 7.9999, N'K', N'VS1', 290)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1410, CAST(N'2024-06-11T20:23:40.8910221' AS DateTime2), 6, 7.9999, N'K', N'VS2', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1411, CAST(N'2024-06-11T20:23:40.8910467' AS DateTime2), 6, 7.9999, N'K', N'SI1', 235)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1412, CAST(N'2024-06-11T20:23:40.8910678' AS DateTime2), 6, 7.9999, N'K', N'SI2', 200)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1413, CAST(N'2024-06-11T20:23:40.8910938' AS DateTime2), 6, 7.9999, N'K', N'SI3', 135)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1414, CAST(N'2024-06-11T20:23:40.8911111' AS DateTime2), 6, 7.9999, N'K', N'I1', 100)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1415, CAST(N'2024-06-11T20:23:40.8911237' AS DateTime2), 6, 7.9999, N'K', N'I2', 47)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1416, CAST(N'2024-06-11T20:23:40.8911354' AS DateTime2), 6, 7.9999, N'K', N'I3', 20)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1417, CAST(N'2024-06-11T20:23:40.8911497' AS DateTime2), 6, 7.9999, N'L', N'FL', 300)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1418, CAST(N'2024-06-11T20:23:40.8911763' AS DateTime2), 6, 7.9999, N'L', N'IF', 285)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1419, CAST(N'2024-06-11T20:23:40.8911977' AS DateTime2), 6, 7.9999, N'L', N'VVS1', 270)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1420, CAST(N'2024-06-11T20:23:40.8912142' AS DateTime2), 6, 7.9999, N'L', N'VVS2', 250)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1421, CAST(N'2024-06-11T20:23:40.8912345' AS DateTime2), 6, 7.9999, N'L', N'VS1', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1422, CAST(N'2024-06-11T20:23:40.8912527' AS DateTime2), 6, 7.9999, N'L', N'VS2', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1423, CAST(N'2024-06-11T20:23:40.8912702' AS DateTime2), 6, 7.9999, N'L', N'SI1', 195)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1424, CAST(N'2024-06-11T20:23:40.8912911' AS DateTime2), 6, 7.9999, N'L', N'SI2', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1425, CAST(N'2024-06-11T20:23:40.8913064' AS DateTime2), 6, 7.9999, N'L', N'SI3', 120)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1426, CAST(N'2024-06-11T20:23:40.8913225' AS DateTime2), 6, 7.9999, N'L', N'I1', 85)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1427, CAST(N'2024-06-11T20:23:40.8913381' AS DateTime2), 6, 7.9999, N'L', N'I2', 45)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1428, CAST(N'2024-06-11T20:23:40.8913568' AS DateTime2), 6, 7.9999, N'L', N'I3', 19)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1429, CAST(N'2024-06-11T20:23:40.8913775' AS DateTime2), 6, 7.9999, N'M', N'FL', 280)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1430, CAST(N'2024-06-11T20:23:40.8914014' AS DateTime2), 6, 7.9999, N'M', N'IF', 230)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1431, CAST(N'2024-06-11T20:23:40.8914243' AS DateTime2), 6, 7.9999, N'M', N'VVS1', 215)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1432, CAST(N'2024-06-11T20:23:40.8914391' AS DateTime2), 6, 7.9999, N'M', N'VVS2', 205)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1433, CAST(N'2024-06-11T20:23:40.8914514' AS DateTime2), 6, 7.9999, N'M', N'VS1', 190)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1434, CAST(N'2024-06-11T20:23:40.8914637' AS DateTime2), 6, 7.9999, N'M', N'VS2', 180)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1435, CAST(N'2024-06-11T20:23:40.8914779' AS DateTime2), 6, 7.9999, N'M', N'SI1', 165)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1436, CAST(N'2024-06-11T20:23:40.8915006' AS DateTime2), 6, 7.9999, N'M', N'SI2', 140)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1437, CAST(N'2024-06-11T20:23:40.8915256' AS DateTime2), 6, 7.9999, N'M', N'SI3', 105)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1438, CAST(N'2024-06-11T20:23:40.8915448' AS DateTime2), 6, 7.9999, N'M', N'I1', 75)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1439, CAST(N'2024-06-11T20:23:40.8915598' AS DateTime2), 6, 7.9999, N'M', N'I2', 43)
INSERT [dbo].[diamond_price] ([diamond_price_id], [eff_time], [min_carat_eff], [max_carat_eff], [color], [clarity], [unit_price]) VALUES (1440, CAST(N'2024-06-11T20:23:40.8915807' AS DateTime2), 6, 7.9999, N'M', N'I3', 18)
SET IDENTITY_INSERT [dbo].[diamond_price] OFF
GO
SET IDENTITY_INSERT [dbo].[material_price] ON 

INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (1, 18, CAST(N'2024-06-11T20:23:41.1074017' AS DateTime2), 75.75)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (2, 18, CAST(N'2024-06-11T20:23:41.1264832' AS DateTime2), 78)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (3, 18, CAST(N'2024-06-11T20:23:41.1265310' AS DateTime2), 73.300003051757812)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (4, 18, CAST(N'2024-06-11T20:23:41.1265400' AS DateTime2), 71.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (5, 18, CAST(N'2024-06-11T20:23:41.1265532' AS DateTime2), 72.4000015258789)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (6, 18, CAST(N'2024-06-11T20:23:41.1265592' AS DateTime2), 77.949996948242188)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (7, 18, CAST(N'2024-06-11T20:23:41.1265651' AS DateTime2), 80.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (8, 18, CAST(N'2024-06-11T20:23:41.1265712' AS DateTime2), 81.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (9, 24, CAST(N'2024-06-11T20:23:41.1265787' AS DateTime2), 83.75)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (10, 24, CAST(N'2024-06-11T20:23:41.1265871' AS DateTime2), 87.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (11, 24, CAST(N'2024-06-11T20:23:41.1265934' AS DateTime2), 86.300003051757812)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (12, 24, CAST(N'2024-06-11T20:23:41.1265992' AS DateTime2), 85.5)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (13, 24, CAST(N'2024-06-11T20:23:41.1266054' AS DateTime2), 89.4000015258789)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (14, 24, CAST(N'2024-06-11T20:23:41.1266109' AS DateTime2), 90.449996948242188)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (15, 24, CAST(N'2024-06-11T20:23:41.1266180' AS DateTime2), 88.0999984741211)
INSERT [dbo].[material_price] ([material_price_id], [karat], [eff_time], [unit_price]) VALUES (16, 24, CAST(N'2024-06-11T20:23:41.1266241' AS DateTime2), 88.5)
SET IDENTITY_INSERT [dbo].[material_price] OFF
GO
INSERT [dbo].[merchant] ([Id], [MerchantName], [MerchantWebLink], [MerchentIpnUrl], [MerchantReturnUrl], [SecretKey], [IsActive], [CreatedBy], [CreatedAt], [LastUpdatedBy], [LastUpdateAt]) VALUES (N'MER0001', N'DatJ', N'http://localhost:3000', N'http://localhost:8080/api/payment/vnpay-ipn', N'http://localhost:3000/', NULL, 1, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[PaymentDestination] ([Id], [DesLogo], [DesShortName], [DesName], [DesSortIndex], [DesParentId], [IsActive], [CreatedBy], [CreatedAt], [LastUpdatedBy], [LastUpdateAt]) VALUES (N'VNPAY', N'VNPAY', N'VNPAY', N'VNPAY', 1, NULL, 1, N'Admin', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[price_rate] ON 

INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (1, 5, 1.0575, CAST(N'2024-06-11T20:23:37.5430175' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (2, 5, 1.001, CAST(N'2024-06-11T20:23:37.5771311' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (3, 5, 1.063, CAST(N'2024-06-11T20:23:37.5797487' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (4, 5, 1.035, CAST(N'2024-06-11T20:23:37.5831977' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (5, 5, 1.094, CAST(N'2024-06-11T20:23:37.5863329' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (6, 5, 1.1545, CAST(N'2024-06-11T20:23:37.5897824' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (7, 5, 1.081, CAST(N'2024-06-11T20:23:37.5968966' AS DateTime2))
INSERT [dbo].[price_rate] ([price_rate_id], [account_id], [percent], [created_at]) VALUES (8, 5, 1.185, CAST(N'2024-06-11T20:23:37.6005737' AS DateTime2))
SET IDENTITY_INSERT [dbo].[price_rate] OFF
GO
SET IDENTITY_INSERT [dbo].[rank] ON 

INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (1, N'Diamond', 0.15, 2500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (2, N'Emerald', 0.125, 2000)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (3, N'Platinum', 0.1, 1500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (4, N'Gold', 0.075, 1000)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (5, N'Silver', 0.05, 500)
INSERT [dbo].[rank] ([rank_id], [rank_name], [discount], [reward_point]) VALUES (6, N'Bronze', 0, 0)
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
/****** Object:  Index [IX_accessory_accessory_type_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_accessory_type_id] ON [dbo].[accessory]
(
	[accessory_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_shape_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_shape_id] ON [dbo].[accessory]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_accessory_image_accessory_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_accessory_image_accessory_id] ON [dbo].[accessory_image]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_rank_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_account_rank_id] ON [dbo].[account]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_blog_author_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_blog_author_id] ON [dbo].[blog]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_diamond_shape_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_diamond_shape_id] ON [dbo].[diamond]
(
	[shape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_accessory_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_accessory_id] ON [dbo].[feedback]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_order_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_order_id] ON [dbo].[feedback]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_customer_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_customer_id] ON [dbo].[order]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_delivery_staff_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_delivery_staff_id] ON [dbo].[order]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_price_rate_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_price_rate_id] ON [dbo].[order]
(
	[price_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_promotion_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_promotion_id] ON [dbo].[order]
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_rank_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_rank_id] ON [dbo].[order]
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_sale_staff_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_sale_staff_id] ON [dbo].[order]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_accessory_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_accessory_id] ON [dbo].[order_detail]
(
	[accessory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_order_detail_diamond_id] ON [dbo].[order_detail]
(
	[diamond_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_diamond_price_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_diamond_price_id] ON [dbo].[order_detail]
(
	[diamond_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_material_price_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_material_price_id] ON [dbo].[order_detail]
(
	[material_price_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_detail_order_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_detail_order_id] ON [dbo].[order_detail]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_MerchantId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_payment_MerchantId] ON [dbo].[payment]
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_payment_PaymentDestinationId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_payment_PaymentDestinationId] ON [dbo].[payment]
(
	[PaymentDestinationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PaymentDestination_DesParentId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentDestination_DesParentId] ON [dbo].[PaymentDestination]
(
	[DesParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentNotification_NotiMerchantId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_paymentNotification_NotiMerchantId] ON [dbo].[paymentNotification]
(
	[NotiMerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentNotification_NotiPaymentId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_paymentNotification_NotiPaymentId] ON [dbo].[paymentNotification]
(
	[NotiPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentSignature_PaymentId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_paymentSignature_PaymentId] ON [dbo].[paymentSignature]
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_paymentTransaction_AccountId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_paymentTransaction_AccountId] ON [dbo].[paymentTransaction]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_paymentTransaction_PaymentId]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_paymentTransaction_PaymentId] ON [dbo].[paymentTransaction]
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_price_rate_account_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_price_rate_account_id] ON [dbo].[price_rate]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_transaction_order_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_transaction_order_id] ON [dbo].[transaction]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_card_order_detail_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_warranty_card_order_detail_id] ON [dbo].[warranty_card]
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_customer_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_customer_id] ON [dbo].[warranty_request]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_delivery_staff_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_delivery_staff_id] ON [dbo].[warranty_request]
(
	[delivery_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_sale_staff_id]    Script Date: 6/11/2024 8:31:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_warranty_request_sale_staff_id] ON [dbo].[warranty_request]
(
	[sale_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_warranty_request_warranty_card_id]    Script Date: 6/11/2024 8:31:56 PM ******/
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
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_merchant_MerchantId] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[merchant] ([Id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_merchant_MerchantId]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_PaymentDestination_PaymentDestinationId] FOREIGN KEY([PaymentDestinationId])
REFERENCES [dbo].[PaymentDestination] ([Id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_PaymentDestination_PaymentDestinationId]
GO
ALTER TABLE [dbo].[PaymentDestination]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDestination_PaymentDestination_DesParentId] FOREIGN KEY([DesParentId])
REFERENCES [dbo].[PaymentDestination] ([Id])
GO
ALTER TABLE [dbo].[PaymentDestination] CHECK CONSTRAINT [FK_PaymentDestination_PaymentDestination_DesParentId]
GO
ALTER TABLE [dbo].[paymentNotification]  WITH CHECK ADD  CONSTRAINT [FK_paymentNotification_merchant_NotiMerchantId] FOREIGN KEY([NotiMerchantId])
REFERENCES [dbo].[merchant] ([Id])
GO
ALTER TABLE [dbo].[paymentNotification] CHECK CONSTRAINT [FK_paymentNotification_merchant_NotiMerchantId]
GO
ALTER TABLE [dbo].[paymentNotification]  WITH CHECK ADD  CONSTRAINT [FK_paymentNotification_payment_NotiPaymentId] FOREIGN KEY([NotiPaymentId])
REFERENCES [dbo].[payment] ([Id])
GO
ALTER TABLE [dbo].[paymentNotification] CHECK CONSTRAINT [FK_paymentNotification_payment_NotiPaymentId]
GO
ALTER TABLE [dbo].[paymentSignature]  WITH CHECK ADD  CONSTRAINT [FK_paymentSignature_payment_PaymentId] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[payment] ([Id])
GO
ALTER TABLE [dbo].[paymentSignature] CHECK CONSTRAINT [FK_paymentSignature_payment_PaymentId]
GO
ALTER TABLE [dbo].[paymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_paymentTransaction_account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[paymentTransaction] CHECK CONSTRAINT [FK_paymentTransaction_account_AccountId]
GO
ALTER TABLE [dbo].[paymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_paymentTransaction_payment_PaymentId] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[payment] ([Id])
GO
ALTER TABLE [dbo].[paymentTransaction] CHECK CONSTRAINT [FK_paymentTransaction_payment_PaymentId]
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
ON DELETE CASCADE
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
