USE [master]
GO
/****** Object:  Database [stroyinvest]    Script Date: 08.06.2024 14:59:50 ******/
CREATE DATABASE [stroyinvest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'stroyinvest', FILENAME = N'C:\Users\norek\stroyinvest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'stroyinvest_log', FILENAME = N'C:\Users\norek\stroyinvest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [stroyinvest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stroyinvest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stroyinvest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stroyinvest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stroyinvest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stroyinvest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stroyinvest] SET ARITHABORT OFF 
GO
ALTER DATABASE [stroyinvest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stroyinvest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stroyinvest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stroyinvest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stroyinvest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stroyinvest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stroyinvest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stroyinvest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stroyinvest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stroyinvest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [stroyinvest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stroyinvest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stroyinvest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stroyinvest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stroyinvest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stroyinvest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stroyinvest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stroyinvest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [stroyinvest] SET  MULTI_USER 
GO
ALTER DATABASE [stroyinvest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stroyinvest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stroyinvest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stroyinvest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [stroyinvest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [stroyinvest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [stroyinvest] SET QUERY_STORE = OFF
GO
USE [stroyinvest]
GO
/****** Object:  Table [dbo].[Objects]    Script Date: 08.06.2024 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objects](
	[IdObject] [int] IDENTITY(1,1) NOT NULL,
	[ObjectName] [nvarchar](max) NOT NULL,
	[ObjectDescription] [nvarchar](max) NULL,
	[ObjectPrice] [int] NOT NULL,
	[ObjectTypeId] [int] NOT NULL,
	[ObjectRoomCount] [int] NOT NULL,
	[ObjectSquare] [int] NOT NULL,
	[ObjectAddress] [nvarchar](max) NULL,
	[ObjectPhotoPath] [nvarchar](max) NULL,
	[ObjectBuilderId] [int] NOT NULL,
	[ObjectStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[IdObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectStatuses]    Script Date: 08.06.2024 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectStatuses](
	[IdObjectStatus] [int] IDENTITY(1,1) NOT NULL,
	[ObjectStatusName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ObjectStatuses] PRIMARY KEY CLUSTERED 
(
	[IdObjectStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectTypes]    Script Date: 08.06.2024 14:59:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectTypes](
	[IdObjectType] [int] IDENTITY(1,1) NOT NULL,
	[ObjectTypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ObjectTypes] PRIMARY KEY CLUSTERED 
(
	[IdObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08.06.2024 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[OrderUserId] [int] NOT NULL,
	[OrderObjectId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 08.06.2024 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[IdOrderStatus] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[IdOrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 08.06.2024 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[IdReport] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeId] [int] NOT NULL,
	[ReportDate] [date] NOT NULL,
	[ReportDescription] [nvarchar](max) NULL,
	[ReportOrderId] [int] NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[IdReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportTypes]    Script Date: 08.06.2024 14:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTypes](
	[IdReportType] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ReportTypes] PRIMARY KEY CLUSTERED 
(
	[IdReportType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 08.06.2024 14:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[IdUserRole] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[IdUserRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08.06.2024 14:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[UserFirstName] [nvarchar](max) NOT NULL,
	[UserLastName] [nvarchar](max) NOT NULL,
	[UserPatronymicName] [nvarchar](max) NULL,
	[UserEmail] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](20) NOT NULL,
	[UserBuilderName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Objects] ON 

INSERT [dbo].[Objects] ([IdObject], [ObjectName], [ObjectDescription], [ObjectPrice], [ObjectTypeId], [ObjectRoomCount], [ObjectSquare], [ObjectAddress], [ObjectPhotoPath], [ObjectBuilderId], [ObjectStatusId]) VALUES (1, N'NotNullPointerException', N'NNPE - Лучший выбор ЖК для молодой семьи! С нами вы сможете ьпвдлаподлва', 4562500, 1, 3, 76, N'г. Екатернибург, ул. Хохрякова, 17', N'https://i.ibb.co/cFDpjGw/ekbnpe.jpg', 4, 2)
INSERT [dbo].[Objects] ([IdObject], [ObjectName], [ObjectDescription], [ObjectPrice], [ObjectTypeId], [ObjectRoomCount], [ObjectSquare], [ObjectAddress], [ObjectPhotoPath], [ObjectBuilderId], [ObjectStatusId]) VALUES (1002, N'Квартирный вопрос', N'Прекрасное место для тихой жизни недалеко от центра города!', 1356873, 1, 2, 58, N'г. Екатеринбург ул. Советская 7к5', N'https://i.ibb.co/v4wV4yR/shikanokonokonokonokoshitantan.png', 1007, 3)
INSERT [dbo].[Objects] ([IdObject], [ObjectName], [ObjectDescription], [ObjectPrice], [ObjectTypeId], [ObjectRoomCount], [ObjectSquare], [ObjectAddress], [ObjectPhotoPath], [ObjectBuilderId], [ObjectStatusId]) VALUES (1003, N'Сердце Урала', N'Уютное место в самом сердце столицы Урала', 15356, 3, 1, 13, N'г. Екатеринбург ул. Сакко и Ванцетти, 111А', N'https://i.ibb.co/TBNPDJB/XATA.png', 1008, 4)
SET IDENTITY_INSERT [dbo].[Objects] OFF
GO
SET IDENTITY_INSERT [dbo].[ObjectStatuses] ON 

INSERT [dbo].[ObjectStatuses] ([IdObjectStatus], [ObjectStatusName]) VALUES (1, N'Продаётся')
INSERT [dbo].[ObjectStatuses] ([IdObjectStatus], [ObjectStatusName]) VALUES (2, N'Продан')
INSERT [dbo].[ObjectStatuses] ([IdObjectStatus], [ObjectStatusName]) VALUES (3, N'Забронирован')
INSERT [dbo].[ObjectStatuses] ([IdObjectStatus], [ObjectStatusName]) VALUES (4, N'В процессе строительства')
SET IDENTITY_INSERT [dbo].[ObjectStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[ObjectTypes] ON 

INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (1, N'Квартира')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (2, N'Дом')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (3, N'Комната')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (4, N'Ком. Недвиж')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (5, N'Земельный участок')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (6, N'Гараж')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (7, N'Дачный участок')
INSERT [dbo].[ObjectTypes] ([IdObjectType], [ObjectTypeName]) VALUES (8, N'Таунхаус')
SET IDENTITY_INSERT [dbo].[ObjectTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([IdUserRole], [UserRoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[UserRoles] ([IdUserRole], [UserRoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[UserRoles] ([IdUserRole], [UserRoleName]) VALUES (3, N'Пользователь')
INSERT [dbo].[UserRoles] ([IdUserRole], [UserRoleName]) VALUES (4, N'Застройщик')
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (1, 1, N'Админ', N'Админ', N'Админ', N'admin', N'admin', N'TEST')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (4, 4, N'Застройщик', N'Застройщик', N'Застройщик', N'builder', N'builder', N'ЖК "Аксиома"')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (1007, 4, N'Застройщик', N'Застройщик', N'', N'some@mail.cr', N'Some', N'Eleven')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (1008, 4, N'Застройщик', N'Застройщик', N'', N'GreenHouse', N'green', N'ГринХаус')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (1009, 4, N'kjgkjykh', N'hjjvjh', N'', N'hjgkuyg', N'ukgoiughiu', N'kjghyfuoih')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2004, 1, N'Иван', N'Иванов', NULL, N'ivan.ivanov@example.com', N'password123', NULL)
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2005, 1, N'Иван', N'Иванов', NULL, N'ivan.ivanov@example.com', N'password123', NULL)
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2006, 1, N'Иван', N'Иванов', N'Иванович', N'ivan.ivanov@example.com', N'password123', N'')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2007, 1, N'Иван', N'Иванов', N'', N'ivan.ivanov@example.com', N'password123', N'Стройком')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2008, 1, N'Иван', N'Иванов', N'Иванович', N'ivan.ivanov@example.com', N'password123', N'Стройком')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2009, 1, N'Иван', N'Иванов', NULL, N'ivan.ivanov@example.com', N'password123', NULL)
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2010, 1, N'Иван', N'Иванов', N'Иванович', N'ivan.ivanov@example.com', N'password123', N'')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2011, 1, N'Иван', N'Иванов', N'', N'ivan.ivanov@example.com', N'password123', N'Стройком')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2012, 1, N'Иван', N'Иванов', N'Иванович', N'ivan.ivanov@example.com', N'password123', N'Стройком')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2013, 1, N'Иван', N'Иванов', NULL, N'ivan.ivanov@example.com', N'password123', NULL)
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2014, 1, N'Иван', N'Иванов', N'Иванович', N'ivan.ivanov@example.com', N'password123', N'')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2015, 1, N'Иван', N'Иванов', N'', N'ivan.ivanov@example.com', N'password123', N'Стройком')
INSERT [dbo].[Users] ([IdUser], [UserRoleId], [UserFirstName], [UserLastName], [UserPatronymicName], [UserEmail], [UserPassword], [UserBuilderName]) VALUES (2016, 1, N'Иван', N'Иванов', N'Иванович', N'ivan.ivanov@example.com', N'password123', N'Стройком')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_ObjectStatuses] FOREIGN KEY([ObjectStatusId])
REFERENCES [dbo].[ObjectStatuses] ([IdObjectStatus])
GO
ALTER TABLE [dbo].[Objects] CHECK CONSTRAINT [FK_Objects_ObjectStatuses]
GO
ALTER TABLE [dbo].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_ObjectTypes] FOREIGN KEY([ObjectTypeId])
REFERENCES [dbo].[ObjectTypes] ([IdObjectType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Objects] CHECK CONSTRAINT [FK_Objects_ObjectTypes]
GO
ALTER TABLE [dbo].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_Users] FOREIGN KEY([ObjectBuilderId])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Objects] CHECK CONSTRAINT [FK_Objects_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Objects] FOREIGN KEY([OrderObjectId])
REFERENCES [dbo].[Objects] ([IdObject])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Objects]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([IdOrderStatus])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([OrderUserId])
REFERENCES [dbo].[Users] ([IdUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Orders] FOREIGN KEY([ReportOrderId])
REFERENCES [dbo].[Orders] ([IdOrder])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Orders]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_ReportTypes] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportTypes] ([IdReportType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_ReportTypes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[UserRoles] ([IdUserRole])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRoles]
GO
USE [master]
GO
ALTER DATABASE [stroyinvest] SET  READ_WRITE 
GO
