USE [master]
GO
/****** Object:  Database [Clinica_Actividad]    Script Date: 26/9/2018 10:26:32 ******/
CREATE DATABASE [Clinica_Actividad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica_Actividad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSTANDARD\MSSQL\DATA\Clinica_Actividad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Clinica_Actividad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSTANDARD\MSSQL\DATA\Clinica_Actividad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Clinica_Actividad] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica_Actividad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica_Actividad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica_Actividad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica_Actividad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica_Actividad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica_Actividad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET RECOVERY FULL 
GO
ALTER DATABASE [Clinica_Actividad] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica_Actividad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica_Actividad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica_Actividad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica_Actividad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clinica_Actividad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clinica_Actividad] SET QUERY_STORE = OFF
GO
USE [Clinica_Actividad]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Clinica_Actividad]
GO
/****** Object:  Table [dbo].[enfermera]    Script Date: 26/9/2018 10:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enfermera](
	[id_enfermera] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Area] [varchar](50) NULL,
	[id_medico] [int] NULL,
 CONSTRAINT [PK_enfermera] PRIMARY KEY CLUSTERED 
(
	[id_enfermera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 26/9/2018 10:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[id_medico] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Especialidad] [varchar](50) NULL,
	[Edad] [int] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[id_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 26/9/2018 10:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[id_paciente] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Edad] [int] NULL,
	[id_med] [int] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[enfermera]  WITH CHECK ADD  CONSTRAINT [FK_enfermera_Medico] FOREIGN KEY([id_medico])
REFERENCES [dbo].[Medico] ([id_medico])
GO
ALTER TABLE [dbo].[enfermera] CHECK CONSTRAINT [FK_enfermera_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Medico] FOREIGN KEY([id_med])
REFERENCES [dbo].[Medico] ([id_medico])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Medico]
GO
USE [master]
GO
ALTER DATABASE [Clinica_Actividad] SET  READ_WRITE 
GO
