USE [iCream]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/21/2023 7:43:00 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 3/21/2023 7:43:00 PM ******/
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
	[book_img] [varchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Recipe]    Script Date: 3/21/2023 7:43:00 PM ******/
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
/****** Object:  Table [dbo].[Customer_1]    Script Date: 3/21/2023 7:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_1](
	[customer_id] [varchar](50) NOT NULL,
	[customer_name] [varchar](50) NULL,
	[customer_pass] [varchar](20) NULL,
	[customer_repass] [varchar](50) NULL,
	[customer_email] [varchar](50) NULL,
	[customer_birthday] [date] NULL,
	[customer_status] [int] NULL,
	[customer_cardNumber] [int] NULL,
	[customer_cardsName] [varchar](50) NULL,
	[customer_cardCVV] [int] NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaQ]    Script Date: 3/21/2023 7:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaQ](
	[faq_id] [int] IDENTITY(1,1) NOT NULL,
	[faq_type] [int] NULL,
	[faq_nameViewer] [varchar](50) NULL,
	[faq_email] [varchar](50) NULL,
	[faq_phone] [int] NULL,
	[faq_text] [varchar](1000) NULL,
 CONSTRAINT [PK_FaQ] PRIMARY KEY CLUSTERED 
(
	[faq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/21/2023 7:43:00 PM ******/
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
/****** Object:  Table [dbo].[Recipe_Viewer]    Script Date: 3/21/2023 7:43:00 PM ******/
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
INSERT [dbo].[Admin] ([admin_id], [admin_pass]) VALUES (N'Admin', N'123456789')
GO
INSERT [dbo].[Book] ([book_id], [book_name], [book_discount], [book_price], [book_quantity], [book_img]) VALUES (1, N'Ice Cream Book 1', N'20%', 80, 15, N'cream.jpg')
INSERT [dbo].[Book] ([book_id], [book_name], [book_discount], [book_price], [book_quantity], [book_img]) VALUES (2, N'Book 2', N'10%', 80, 15, N'icecream.jpg')
INSERT [dbo].[Book] ([book_id], [book_name], [book_discount], [book_price], [book_quantity], [book_img]) VALUES (3, N'Ice Cream Book 2', N'20%', 100, 20, N'ice.jpg')
INSERT [dbo].[Book] ([book_id], [book_name], [book_discount], [book_price], [book_quantity], [book_img]) VALUES (4, N'Book Store', N'20%', 120, 1, N'images.jpg')
INSERT [dbo].[Book] ([book_id], [book_name], [book_discount], [book_price], [book_quantity], [book_img]) VALUES (5, N'Recipe Book', N'5%', 50, 10, N'books.jpg')
INSERT [dbo].[Book] ([book_id], [book_name], [book_discount], [book_price], [book_quantity], [book_img]) VALUES (6, N'Recipe Ice Cream Book ', N'10%', 78, 5, N'book.jpg')
GO
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'Banana', 5)
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'Chocolate', 1)
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'Coffee', 4)
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'kiwi', 7)
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'Mango', 6)
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'Strawberry', 2)
INSERT [dbo].[Category_Recipe] ([category_name], [category_id]) VALUES (N'Vani', 3)
GO
INSERT [dbo].[Customer_1] ([customer_id], [customer_name], [customer_pass], [customer_repass], [customer_email], [customer_birthday], [customer_status], [customer_cardNumber], [customer_cardsName], [customer_cardCVV]) VALUES (N'Duc', N'AnhDuc', N'123', N'123', N'duc@gmail.com', CAST(N'2001-01-01' AS Date), 1, 1234567, N'Duc', 123)
INSERT [dbo].[Customer_1] ([customer_id], [customer_name], [customer_pass], [customer_repass], [customer_email], [customer_birthday], [customer_status], [customer_cardNumber], [customer_cardsName], [customer_cardCVV]) VALUES (N'Khoa2001', N'Ngo Minh Khoa', N'Khoa2001', N'Khoa2001', N'lananh@gmail.com', CAST(N'2001-01-01' AS Date), 1, 129121212, N'Ngo Minh Khoa', 211)
INSERT [dbo].[Customer_1] ([customer_id], [customer_name], [customer_pass], [customer_repass], [customer_email], [customer_birthday], [customer_status], [customer_cardNumber], [customer_cardsName], [customer_cardCVV]) VALUES (N'LanAnh', N'Lan Anh', N'123', N'123', N'lananh@gmail.com', CAST(N'2001-01-01' AS Date), -1, 1211212, N'Lan Anh', 433)
GO
SET IDENTITY_INSERT [dbo].[FaQ] ON 

INSERT [dbo].[FaQ] ([faq_id], [faq_type], [faq_nameViewer], [faq_email], [faq_phone], [faq_text]) VALUES (1, 1, N'Ngo Minh Khoa', N'ngominhkhoa@gmail.com', 129311313, N'123321313sdasdadadqwqeqeqeqewqeadsaddqdqadsdadadadadadadqww')
INSERT [dbo].[FaQ] ([faq_id], [faq_type], [faq_nameViewer], [faq_email], [faq_phone], [faq_text]) VALUES (2, 1, N'Ngo Minh Khoa', N'ngominhkhoa@gmail.com', 1111111111, N'123321313sdasdadadqwqeqeqeqewqeadsaddqdqadsdadadadadadadqww')
SET IDENTITY_INSERT [dbo].[FaQ] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedback_id], [feedback_name], [feedback_email], [feedback_phone], [feedback_type], [feedback_text]) VALUES (1, N'Question', N'ngominhkhoa2020@gmail.com', N'09123312131', 1, N'qweqweqeqeqeqeqeqewqeqeqeqweqsdasdadadadad')
INSERT [dbo].[Feedback] ([feedback_id], [feedback_name], [feedback_email], [feedback_phone], [feedback_type], [feedback_text]) VALUES (2, N'Cau Hoi ve Lam Banh', N'ngominhkhoa2020@gmail.com', N'09123312131', 1, N'qweqweqeqeqeqeqeqewqeqeqeqweqsdasdadadadad')
INSERT [dbo].[Feedback] ([feedback_id], [feedback_name], [feedback_email], [feedback_phone], [feedback_type], [feedback_text]) VALUES (3, N'Cau hoi Lam Kem', N'ngominhkhoa2020@gmail.com', N'09123312131', 1, N'qweqweqeqeqeqeqeqewqeqeqeqweqsdasdadadadadd?dadadadadadadadadadaddadada')
INSERT [dbo].[Feedback] ([feedback_id], [feedback_name], [feedback_email], [feedback_phone], [feedback_type], [feedback_text]) VALUES (4, N'Cau hoi Lam Kem', N'ngominhkhoa2020@gmail.com', N'09123312131', 1, N'qweqweqeqeqeqeqeqewqeqeqeqweqsdasdadadadadd?dadadadadadadadadadaddadadaáddadadadadad')
INSERT [dbo].[Feedback] ([feedback_id], [feedback_name], [feedback_email], [feedback_phone], [feedback_type], [feedback_text]) VALUES (5, N'Question', N'ngominhkhoa2020@gmail.com', N'09123312131', 1, N'qweqweqeqeqeqeqeqewqeqeqeqweqsdasdadadadadd?dadadadadadadadadadaddadada')
INSERT [dbo].[Feedback] ([feedback_id], [feedback_name], [feedback_email], [feedback_phone], [feedback_type], [feedback_text]) VALUES (6, N'Question', N'ngominhkhoa2020@gmail.com', N'09123312131', 1, N'qweqweqeqeqeqeqeqewqeqeqeqweqsdasdadadadadd?dadadadadadadadadadaddadadaáddadadadadad')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe_Viewer] ON 

INSERT [dbo].[Recipe_Viewer] ([recipeV_id], [caterory_name], [recipeV_nameViewer], [recipeV_name], [recipeV_price], [recipeV_img], [recipe_status], [recipeV_text]) VALUES (7, N'Chocolate', N'Khoa', N'Chocolate Ice Cream', 10, N'chocolate.jpg', 1, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
INSERT [dbo].[Recipe_Viewer] ([recipeV_id], [caterory_name], [recipeV_nameViewer], [recipeV_name], [recipeV_price], [recipeV_img], [recipe_status], [recipeV_text]) VALUES (8, N'Coffee', N'Lan Anh', N'Coffee Ice Cream', 12, N'coffee1.jpg', 1, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
INSERT [dbo].[Recipe_Viewer] ([recipeV_id], [caterory_name], [recipeV_nameViewer], [recipeV_name], [recipeV_price], [recipeV_img], [recipe_status], [recipeV_text]) VALUES (9, N'Strawberry', N'Manh Duc', N'Strawberry', 20, N'strawberry.jpg', 1, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
INSERT [dbo].[Recipe_Viewer] ([recipeV_id], [caterory_name], [recipeV_nameViewer], [recipeV_name], [recipeV_price], [recipeV_img], [recipe_status], [recipeV_text]) VALUES (10, N'Banana', N'Lan Anh', N'Mango', NULL, N'mango ice.jpg', NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
INSERT [dbo].[Recipe_Viewer] ([recipeV_id], [caterory_name], [recipeV_nameViewer], [recipeV_name], [recipeV_price], [recipeV_img], [recipe_status], [recipeV_text]) VALUES (11, N'Coffee', N'Manh Duc', N'Coffee Ice Cream', NULL, N'coffee1.jpg', NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
INSERT [dbo].[Recipe_Viewer] ([recipeV_id], [caterory_name], [recipeV_nameViewer], [recipeV_name], [recipeV_price], [recipeV_img], [recipe_status], [recipeV_text]) VALUES (12, N'Banana', N'Khoa', N'Banana Ice Cream', NULL, N'banana.jpg', NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
SET IDENTITY_INSERT [dbo].[Recipe_Viewer] OFF
GO
ALTER TABLE [dbo].[Recipe_Viewer]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Viewer_Category_Recipe] FOREIGN KEY([caterory_name])
REFERENCES [dbo].[Category_Recipe] ([category_name])
GO
ALTER TABLE [dbo].[Recipe_Viewer] CHECK CONSTRAINT [FK_Recipe_Viewer_Category_Recipe]
GO
