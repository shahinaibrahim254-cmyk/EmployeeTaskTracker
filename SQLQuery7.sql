USE [master]
GO
/****** Object:  Database [EmployeeTaskTrackerDB]    Script Date: 09-02-2026 16:31:49 ******/
CREATE DATABASE [EmployeeTaskTrackerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeTaskTrackerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\EmployeeTaskTrackerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeTaskTrackerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\EmployeeTaskTrackerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeTaskTrackerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EmployeeTaskTrackerDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
	[AssignedEmployeeId] [int] NOT NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Email], [Username], [Password]) VALUES (1, N'Arun MA', N'Arun12@gmail.com', N'Arun', N'Arun123')
GO
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Email], [Username], [Password]) VALUES (4, N'varun kumar', N'Varun@gmail.com', N'varun', N'varun123')
GO
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Email], [Username], [Password]) VALUES (8, N'Ansil A', N'Ansil@gmail.com', N'Ansil', N'Ansil123')
GO
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Email], [Username], [Password]) VALUES (10, N'Anna', N'Anna@gmail.com', N'anna', N'anna123')
GO
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Email], [Username], [Password]) VALUES (11, N'Mariya', N'mariyaa@gmail.com', N'mariya', N'mariya123')
GO
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Email], [Username], [Password]) VALUES (14, N'Nandana', N'nadu@gmail.com', N'nandana', N'nadana1234')
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (1, N'API Configuration', N'Configure the API for Airline project', 1, N'Completed')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (2, N'Design Front End', N'Design Front End for the Airline project', 1, N'Completed')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (3, N'Create Database', N'Create database for ecommerce project', 1, N'Completed')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (4, N'Testing', N'Test the delivery app project', 1, N'Pending')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (5, N'Requirement', N'collect requirement for mobile app', 1, N'Completed')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (6, N'Update Software', N'Perform software updates', 1, N'Completed')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (7, N'Technical documentation', N'Documenting API integrations, database schema changes, and system architecture.', 4, N'Pending')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (8, N'Create Database', N'Create Database for the Airline project', 1, N'Completed')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (9, N'create database', N'create the database for the airline project', 10, N'Pending')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (10, N'Create Database', N'Create database for ecommerce project', 10, N'Pending')
GO
INSERT [dbo].[Tasks] ([TaskId], [Title], [Description], [AssignedEmployeeId], [Status]) VALUES (11, N'Create Database', N'Create Database for the Airline project', 14, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__536C85E4768A585C]    Script Date: 09-02-2026 16:31:49 ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__A9D10534B911A543]    Script Date: 09-02-2026 16:31:49 ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tasks] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Employees] FOREIGN KEY([AssignedEmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Employees]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddEmployee]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddEmployee]
@Name varchar(100),
@Email varchar(100),
@Username varchar(50),
@Password varchar(50)
as
begin 
insert into Employees values (@Name, @Email, @Username, @Password)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTask]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddTask]
@Title VARCHAR(100),
@Description VARCHAR(500),
@EmployeeId INT
AS
BEGIN
INSERT INTO Tasks (Title, Description, AssignedEmployeeId) VALUES (@Title, @Description, @EmployeeId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEmployee]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteEmployee]
@EmployeeId int
as
begin
delete from Employees where EmployeeId = @EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EmployeeLogin]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EmployeeLogin]
@Username varchar(50),
@Password varchar(50)
as
begin
select EmployeeId, Name from Employees where Username = @Username AND Password = @Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployees]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetEmployees]
as
begin
select * from Employees
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Getemployeetasks]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Getemployeetasks]
@EmployeeId int
as
begin
select
t.TaskId,t.Title,t.Description,t.Status FROM Tasks t WHERE t.AssignedEmployeeId = @EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_gettasksbyemployee]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_gettasksbyemployee]
@EmployeeId int
as
begin
 select * from Tasks where AssignedEmployeeId = @EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchEmployees]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SearchEmployees]
@SearchText varchar(100)
as
begin
select * from Employees where Name LIKE '%' + @SearchText + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmployee]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateEmployee]
@EmployeeId int,
@Name varchar(100),
@Email varchar(100)
as
begin
update Employees set Name = @Name,Email = @Email where EmployeeId = @EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTaskStatus]    Script Date: 09-02-2026 16:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateTaskStatus]
@TaskId int,
@Status varchar(20)
as
begin
update Tasks set Status = @Status where TaskId = @TaskId
end
GO
USE [master]
GO
ALTER DATABASE [EmployeeTaskTrackerDB] SET  READ_WRITE 
GO
