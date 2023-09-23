USE [master]
GO
/****** Object:  Database [SampleVinithDB]    Script Date: 9/23/2023 4:50:47 PM ******/
CREATE DATABASE [SampleVinithDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SampleVinithDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DELLSERVER\MSSQL\DATA\SampleVinithDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TutionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DELLSERVER\MSSQL\DATA\SampleVinithDB.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SampleVinithDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SampleVinithDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SampleVinithDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SampleVinithDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SampleVinithDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SampleVinithDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SampleVinithDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SampleVinithDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SampleVinithDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SampleVinithDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SampleVinithDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SampleVinithDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SampleVinithDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SampleVinithDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SampleVinithDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SampleVinithDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SampleVinithDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SampleVinithDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SampleVinithDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SampleVinithDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SampleVinithDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SampleVinithDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SampleVinithDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SampleVinithDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SampleVinithDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SampleVinithDB] SET  MULTI_USER 
GO
ALTER DATABASE [SampleVinithDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SampleVinithDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SampleVinithDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SampleVinithDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SampleVinithDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TutionDB', N'ON'
GO
USE [SampleVinithDB]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 9/23/2023 4:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Pincode] [int] NULL,
	[Created_On] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[students]    Script Date: 9/23/2023 4:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

GO
INSERT [dbo].[Districts] ([Id], [Name], [Pincode], [Created_On]) VALUES (1, N'Karur', 639110, CAST(N'2023-09-23 15:11:16.753' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteDistrictById]    Script Date: 9/23/2023 4:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDistrictById]
@Id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Districts WHERE Id=@Id

END


GO
/****** Object:  StoredProcedure [dbo].[GetDistrict]    Script Date: 9/23/2023 4:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDistrict]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Name,Pincode,Convert(VARCHAR,Created_On,106) [Created_On] FROM Districts

END

GO
/****** Object:  StoredProcedure [dbo].[GetDistrictById]    Script Date: 9/23/2023 4:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDistrictById]
@Id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Districts WHERE Id=@Id

END


GO
/****** Object:  StoredProcedure [dbo].[InsertDistrict]    Script Date: 9/23/2023 4:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertDistrict]
(
	-- Add the parameters for the stored procedure here
	@Id INT,
	@Name VARCHAR(100),
	@Pincode INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 IF (@Id = 0)  
	 BEGIN
			INSERT INTO Districts (Name,Pincode,Created_On) VALUES (@Name,@Pincode,GETDATE())
			SELECT 'Inserted Successfully' [Message]
	 END
	 ELSE IF EXISTS (SELECT TOP 1 1 FROM Districts WHERE Id=@Id)
	 BEGIN
		 UPDATE Districts SET Name=@Name,Pincode=@Pincode WHERE Id=@Id
		 SELECT 'Updated Successfully' [Message]
	 END
	 ELSE
	 BEGIN
		 SELECT 'Error' [Message]
	 END
END

GO
USE [master]
GO
ALTER DATABASE [SampleVinithDB] SET  READ_WRITE 
GO
