USE [master]
GO
/****** Object:  Database [iCream]    Script Date: 3/17/2023 1:23:21 AM ******/
CREATE DATABASE [iCream]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iCream', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\iCream.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'iCream_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\iCream_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [iCream] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iCream].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iCream] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iCream] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iCream] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iCream] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iCream] SET ARITHABORT OFF 
GO
ALTER DATABASE [iCream] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iCream] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iCream] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iCream] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iCream] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iCream] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iCream] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iCream] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iCream] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iCream] SET  DISABLE_BROKER 
GO
ALTER DATABASE [iCream] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iCream] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iCream] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iCream] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iCream] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iCream] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iCream] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iCream] SET RECOVERY FULL 
GO
ALTER DATABASE [iCream] SET  MULTI_USER 
GO
ALTER DATABASE [iCream] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iCream] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iCream] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iCream] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [iCream] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [iCream] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'iCream', N'ON'
GO
ALTER DATABASE [iCream] SET QUERY_STORE = ON
GO
ALTER DATABASE [iCream] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [iCream]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [varchar](50) NOT NULL,
	[admin_pass] [varchar](16) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [int] NOT NULL,
	[book_name] [varchar](50) NULL,
	[book_discount] [varchar](50) NULL,
	[book_price] [int] NULL,
	[book_quantity] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Recipe]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Recipe](
	[category_name] [varchar](50) NOT NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Category_Recipe] PRIMARY KEY CLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](50) NULL,
	[customer_pass] [varchar](16) NULL,
	[customer_phone] [varchar](50) NULL,
	[customer_email] [varchar](50) NULL,
	[customer_type] [int] NULL,
	[customer_birthday] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[feedback_name] [varchar](50) NULL,
	[feedback_email] [varchar](50) NULL,
	[feedback_phone] [varchar](50) NULL,
	[feedback_type] [int] NULL,
	[feedback_text] [varchar](1000) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Book]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Book](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NULL,
	[payment_id] [int] NULL,
	[order_name] [varchar](50) NULL,
	[order_price] [int] NULL,
	[order_address] [varchar](50) NULL,
	[order_email] [varchar](50) NULL,
	[order_contactDetails] [int] NULL,
	[order_paymentOptions] [int] NULL,
	[order_status] [int] NULL,
 CONSTRAINT [PK_Order_Book] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Deital]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Deital](
	[orderDeital_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[book_name] [varchar](50) NULL,
	[book_price] [int] NULL,
	[book_quantity] [int] NULL,
	[order_price] [int] NULL,
 CONSTRAINT [PK_Order_Deital] PRIMARY KEY CLUSTERED 
(
	[orderDeital_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_numberCode] [varchar](16) NULL,
	[payment_nameView] [varchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[recipe_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[caterory_name] [varchar](50) NULL,
	[recipe_name] [varchar](50) NULL,
	[recipe_status] [int] NULL,
	[recipe_price] [int] NULL,
	[recipe_img] [varchar](50) NULL,
	[recipe_text] [varchar](1000) NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe_Viewer]    Script Date: 3/17/2023 1:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe_Viewer](
	[recipeV_id] [int] IDENTITY(1,1) NOT NULL,
	[caterory_name] [varchar](50) NULL,
	[recipeV_nameViewer] [varchar](50) NULL,
	[recipeV_name] [varchar](50) NULL,
	[recipeV_price] [int] NULL,
	[recipeV_img] [varchar](50) NULL,
	[recipe_status] [int] NULL,
	[recipeV_text] [varchar](1000) NULL,
 CONSTRAINT [PK_Recipe_Viewer] PRIMARY KEY CLUSTERED 
(
	[recipeV_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order_Book]  WITH CHECK ADD  CONSTRAINT [FK_Order_Book_Book] FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Order_Book] CHECK CONSTRAINT [FK_Order_Book_Book]
GO
ALTER TABLE [dbo].[Order_Book]  WITH CHECK ADD  CONSTRAINT [FK_Order_Book_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order_Book] CHECK CONSTRAINT [FK_Order_Book_Payment]
GO
ALTER TABLE [dbo].[Order_Deital]  WITH CHECK ADD  CONSTRAINT [FK_Order_Deital_Order_Book] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_Book] ([order_id])
GO
ALTER TABLE [dbo].[Order_Deital] CHECK CONSTRAINT [FK_Order_Deital_Order_Book]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Category_Recipe] FOREIGN KEY([caterory_name])
REFERENCES [dbo].[Category_Recipe] ([category_name])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Category_Recipe]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Customer]
GO
ALTER TABLE [dbo].[Recipe_Viewer]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Viewer_Category_Recipe] FOREIGN KEY([caterory_name])
REFERENCES [dbo].[Category_Recipe] ([category_name])
GO
ALTER TABLE [dbo].[Recipe_Viewer] CHECK CONSTRAINT [FK_Recipe_Viewer_Category_Recipe]
GO
USE [master]
GO
ALTER DATABASE [iCream] SET  READ_WRITE 
GO
